# 📖 Data Dictionary - SwiftPay Global

## Table: swiftpay_customers

| Column Name | Data Type | Description | Example Values |
|---|---|---|---|
| customer_id | VARCHAR | Unique customer identifier | CUST-0001 |
| package_status | VARCHAR | Current package status | Active, Non active |
| gtm_team | VARCHAR | Go-to-market team name | EMEA BD, India BD, LATAM |
| role | VARCHAR | Team function | Acquisitions, Retention |
| region | VARCHAR | Geographic region | EMEA, APAC, LATAM |
| sale_rep_name | VARCHAR | Assigned sales representative | Eliran Israeli |
| eligible_for_management | VARCHAR | Package management eligibility | AEM, CSM, Package terminated |
| days_till_handover | VARCHAR | Days remaining for handover | 63 days left, Ready for handover, Handover done |
| handed_over | VARCHAR | Handover completion flag | Yes, No |
| csm_manager_name | VARCHAR | Assigned CSM manager | Anastasia Kreynits, Yulia Geva |
| customer_name | VARCHAR | Anonymised customer name | Customer 0001 |
| lob | VARCHAR | Line of business | B2B goods, B2B service, Amazon seller, Ecommerce |
| multi_entity | VARCHAR | Multi-entity customer flag | Yes, No |
| expected_monthly_volume | INTEGER | Expected monthly transaction volume (USD) | 50000, 600000 |
| working_capital | VARCHAR | Working capital flag | Yes, No |
| wfm | VARCHAR | Workforce management flag | Yes, No |
| effective_date | DATE | Package effective start date | Dates masked in raw data |
| contract_signature_date | DATE | Contract signed date | Dates masked in raw data |
| signed_contract | VARCHAR | Contract signed flag | Yes, No |
| package_name | VARCHAR | Subscribed package tier | Silver, Gold, Premium, Max, Max Plus |
| monthly_fee_usd | DECIMAL | Standard monthly fee in USD | 100, 250, 500, 1500, 8000 |
| higher_fees_for_charge | DECIMAL | Custom higher fee if applicable | NULL or custom amount |
| currency | VARCHAR | Billing currency | USD, EUR, GBP, AUD |
| final_charge_amount | DECIMAL | Actual charge in billing currency | 500, 212.5, 1275 |
| first_billing_date | DATE | First billing date | 11/1/25, 3/1/26 |
| collection_status_comment | VARCHAR | Collection health indicator | 2 last months successfully collected, 2 last months failed collections |
| risk_distribution | VARCHAR | Risk flag | NULL or risk note |
| termination_month | VARCHAR | Month of termination if applicable | 3.2026, 10.2025 |
| termination_reason | VARCHAR | Reason for package termination | AH no responding no FFT, Block by risk, Handover btw BDs |


## Table: swiftpay_monthly_collections

| Column Name | Data Type | Description | Example Values |
|---|---|---|---|
| customer_id | VARCHAR | Foreign key to swiftpay_customers | CUST-0001 |
| month | VARCHAR | Collection month | 07.2025, 08.2025 ... 04.2026 |
| collection_amount | DECIMAL | Amount collected that month | 0, 250, 1500 |

## Data Quality Notes

| Issue | Column Affected | Fix Applied |
|---|---|---|
| Inconsistent region casing | region | Standardised to UPPER - EMEA, APAC, LATAM |
| Mixed Active/Non active casing | package_status | Standardised to Title Case |
| Currency mix | currency | All amounts normalised to USD equivalent |
| Missing termination reasons | termination_reason | Flagged as NULL - excluded from reason analysis |
| Scientific notation in volume | expected_monthly_volume | Converted 1E+07 → 10000000 |
| Blank CSM manager rows | csm_manager_name | Filled NULL where handover not done |

## Package Tier Reference

| Package | Standard Monthly Fee (USD) | Target Customer Profile |
|---|---|---|
| Silver | $100 | Low volume, early stage |
| Gold | $250 | Mid volume, stable |
| Premium | $500 | High volume, growing |
| Max | $1,500 | Enterprise, high transaction |
| Max Plus | $8,000+ | Strategic accounts |


*Data Dictionary v1.0 | SwiftPay Global Analytics Project | Pavithra Panneerselvam | 2026*
