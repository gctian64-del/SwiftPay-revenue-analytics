-- ============================================================
-- SwiftPay Global Revenue Operations Analytics
-- SQL Analysis File 01: Active vs Terminated by Region
-- Analyst: Pavithra Panneerselvam | 2026
-- ============================================================

-- Query 1A: Customer count by region and status
SELECT 
  UPPER(region) AS region,
  package_status,
  COUNT(*) AS customer_count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY UPPER(region)), 2) AS pct_of_region
FROM swiftpay_customers
GROUP BY UPPER(region), package_status
ORDER BY region, package_status;

-- Query 1B: Overall termination rate
SELECT
  COUNT(*) AS total_customers,
  SUM(CASE WHEN package_status = 'Non active' THEN 1 ELSE 0 END) AS terminated,
  SUM(CASE WHEN package_status = 'Active' THEN 1 ELSE 0 END) AS active,
  ROUND(SUM(CASE WHEN package_status = 'Non active' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS termination_rate_pct
FROM swiftpay_customers;

-- ============================================================
-- SQL Analysis File 02: Rep Performance — Collection Success Rate
-- ============================================================

-- Query 2A: Rep-wise collection success rate
SELECT
  sale_rep_name,
  UPPER(region) AS region,
  gtm_team,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN collection_status_comment LIKE '%successfully collected%' THEN 1 ELSE 0 END) AS successful_collections,
  SUM(CASE WHEN collection_status_comment LIKE '%failed collections%' THEN 1 ELSE 0 END) AS failed_collections,
  ROUND(
    SUM(CASE WHEN collection_status_comment LIKE '%successfully collected%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
    2
  ) AS success_rate_pct
FROM swiftpay_customers
WHERE package_status = 'Active'
GROUP BY sale_rep_name, UPPER(region), gtm_team
ORDER BY success_rate_pct DESC;

-- Query 2B: Top 10 reps by active customer count
SELECT
  sale_rep_name,
  UPPER(region) AS region,
  COUNT(*) AS active_customers,
  COUNT(DISTINCT lob) AS lob_diversity
FROM swiftpay_customers
WHERE package_status = 'Active'
GROUP BY sale_rep_name, UPPER(region)
ORDER BY active_customers DESC
LIMIT 10;

-- ============================================================
-- SQL Analysis File 03: Termination Root Cause Analysis
-- ============================================================

-- Query 3A: Termination reason breakdown
SELECT
  termination_reason,
  COUNT(*) AS terminated_count,
  ROUND(COUNT(*) * 100.0 / (
    SELECT COUNT(*) FROM swiftpay_customers WHERE package_status = 'Non active'
  ), 2) AS pct_of_terminated
FROM swiftpay_customers
WHERE package_status = 'Non active'
  AND termination_reason IS NOT NULL
  AND termination_reason != ''
GROUP BY termination_reason
ORDER BY terminated_count DESC;

-- Query 3B: Termination by region and reason
SELECT
  UPPER(region) AS region,
  termination_reason,
  COUNT(*) AS count
FROM swiftpay_customers
WHERE package_status = 'Non active'
GROUP BY UPPER(region), termination_reason
ORDER BY region, count DESC;

-- Query 3C: Termination by month (churn timeline)
SELECT
  termination_month,
  COUNT(*) AS terminated_count
FROM swiftpay_customers
WHERE package_status = 'Non active'
  AND termination_month IS NOT NULL
GROUP BY termination_month
ORDER BY termination_month;

-- ============================================================
-- SQL Analysis File 04: Package Revenue Mix
-- ============================================================

-- Query 4A: Revenue by package tier
SELECT
  package_name,
  COUNT(*) AS customer_count,
  ROUND(AVG(final_charge_amount_usd), 2) AS avg_revenue_usd,
  SUM(final_charge_amount_usd) AS total_mrr_usd,
  ROUND(SUM(final_charge_amount_usd) * 100.0 / SUM(SUM(final_charge_amount_usd)) OVER (), 2) AS pct_of_total_mrr
FROM swiftpay_customers
WHERE package_status = 'Active'
GROUP BY package_name
ORDER BY total_mrr_usd DESC;

-- Query 4B: Package distribution by region
SELECT
  UPPER(region) AS region,
  package_name,
  COUNT(*) AS customer_count
FROM swiftpay_customers
WHERE package_status = 'Active'
GROUP BY UPPER(region), package_name
ORDER BY region, customer_count DESC;

-- Query 4C: Customers paying higher than standard fee (upsell signal)
SELECT
  customer_id,
  customer_name,
  package_name,
  monthly_fee_usd AS standard_fee,
  higher_fees_for_charge AS custom_fee,
  final_charge_amount_usd,
  sale_rep_name,
  UPPER(region) AS region
FROM swiftpay_customers
WHERE higher_fees_for_charge IS NOT NULL
  AND higher_fees_for_charge > monthly_fee_usd
  AND package_status = 'Active'
ORDER BY custom_fee DESC;

-- ============================================================
-- SQL Analysis File 05: Monthly Collection Trend
-- ============================================================

-- Query 5A: Total collected per month
SELECT
  month,
  SUM(collection_amount) AS total_collected_usd,
  COUNT(CASE WHEN collection_amount > 0 THEN 1 END) AS paying_customers,
  COUNT(CASE WHEN collection_amount = 0 THEN 1 END) AS non_paying_customers,
  ROUND(
    COUNT(CASE WHEN collection_amount > 0 THEN 1 END) * 100.0 / COUNT(*), 
    2
  ) AS payment_rate_pct
FROM swiftpay_monthly_collections
GROUP BY month
ORDER BY month;

-- Query 5B: MoM collection growth rate
WITH monthly_totals AS (
  SELECT
    month,
    SUM(collection_amount) AS total_collected
  FROM swiftpay_monthly_collections
  GROUP BY month
)
SELECT
  month,
  total_collected,
  LAG(total_collected) OVER (ORDER BY month) AS prev_month_collected,
  ROUND(
    (total_collected - LAG(total_collected) OVER (ORDER BY month)) * 100.0 /
    NULLIF(LAG(total_collected) OVER (ORDER BY month), 0),
    2
  ) AS mom_growth_pct
FROM monthly_totals
ORDER BY month;

-- Query 5C: Customers with zero collection 3+ months (high churn risk)
SELECT
  c.customer_id,
  c.customer_name,
  c.sale_rep_name,
  UPPER(c.region) AS region,
  c.package_name,
  COUNT(CASE WHEN m.collection_amount = 0 THEN 1 END) AS zero_collection_months
FROM swiftpay_customers c
JOIN swiftpay_monthly_collections m ON c.customer_id = m.customer_id
WHERE c.package_status = 'Active'
GROUP BY c.customer_id, c.customer_name, c.sale_rep_name, UPPER(c.region), c.package_name
HAVING COUNT(CASE WHEN m.collection_amount = 0 THEN 1 END) >= 3
ORDER BY zero_collection_months DESC;

-- ============================================================
-- SQL Analysis File 06: Handover SLA Analysis
-- ============================================================

-- Query 6A: Handover status breakdown
SELECT
  handed_over,
  COUNT(*) AS customer_count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM swiftpay_customers
WHERE package_status = 'Active'
GROUP BY handed_over;

-- Query 6B: Customers stuck in handover (Ready but not done)
SELECT
  customer_id,
  customer_name,
  sale_rep_name,
  UPPER(region) AS region,
  package_name,
  days_till_handover,
  csm_manager_name
FROM swiftpay_customers
WHERE package_status = 'Active'
  AND handed_over = 'No'
  AND days_till_handover LIKE '%Ready%'
ORDER BY region;

-- Query 6C: Handover completion rate by CSM manager
SELECT
  csm_manager_name,
  COUNT(*) AS assigned_customers,
  SUM(CASE WHEN handed_over = 'Yes' THEN 1 ELSE 0 END) AS completed_handovers,
  ROUND(
    SUM(CASE WHEN handed_over = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS handover_completion_rate_pct
FROM swiftpay_customers
WHERE package_status = 'Active'
  AND csm_manager_name IS NOT NULL
GROUP BY csm_manager_name
ORDER BY handover_completion_rate_pct DESC;

-- Query 6D: Revenue at risk due to incomplete handovers
SELECT
  UPPER(region) AS region,
  COUNT(*) AS customers_pending_handover,
  SUM(final_charge_amount_usd) AS mrr_at_risk_usd
FROM swiftpay_customers
WHERE package_status = 'Active'
  AND handed_over = 'No'
GROUP BY UPPER(region)
ORDER BY mrr_at_risk_usd DESC;
