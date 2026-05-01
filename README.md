# 📊 SwiftPay Global — Revenue Operations Analytics

> **A end-to-end PM + Data Analytics project simulating a real B2B SaaS revenue operations transformation.**  
> Built to demonstrate Project Management, SQL Analysis, Dashboard Design, and Business Insight generation skills.



## 🏢 Company Context (Fictional)

**SwiftPay Global** is a B2B cross-border payment solutions company operating across **EMEA, APAC, and LATAM** regions.  
The company manages **388 enterprise customers** across multiple package tiers — Silver, Gold, Premium, Max, and Max Plus.

**My Role:** Revenue Operations Analyst & Project Manager  
**Project Duration:** 12 Weeks (Simulated)  
**Tools Used:** SQL · Excel · Google Looker Studio · GitHub



## ❗ Business Problem

SwiftPay Global's CRO identified three critical revenue leakage points:

| Problem | Business Impact |
|---|---|
| Untracked package terminations | ~15% customer base lost with no root cause documentation |
| Failed payment collections with no intervention | 2 consecutive failures before any action taken |
| Delayed BD → CSM handovers | Customers in limbo = churn risk window |

**Estimated Revenue at Risk:** 18–22% of Monthly Recurring Revenue (MRR)



## 🎯 Project Objectives

- Reduce termination rate by **15%** within 6 months
- Improve collection success rate to **85%+**
- Achieve **100% handover completion** within 14-day SLA
- Build a **live dashboard** for real-time revenue visibility



## 📁 Repository Structure

```
swiftpay-revenue-analytics/
│
├── README.md                          ← You are here
├── PROJECT_CHARTER.md                 ← Full project charter + RACI
│
├── 01_data/
│   ├── raw/
│   │   └── swiftpay_raw.csv           ← Original dataset (anonymised)
│   ├── cleaned/
│   │   └── swiftpay_cleaned.csv       ← Post-cleaning dataset
│   └── data_dictionary.md             ← Column definitions + data types
│
├── 02_sql/
│   ├── 01_active_vs_terminated.sql    ← Status breakdown by region
│   ├── 02_rep_performance.sql         ← Rep-wise collection success rate
│   ├── 03_termination_analysis.sql    ← Root cause of terminations
│   ├── 04_package_revenue_mix.sql     ← Revenue by package tier
│   ├── 05_monthly_collection_trend.sql← Month-on-month collection trends
│   └── 06_handover_analysis.sql       ← Handover SLA compliance
│
├── 03_analysis/
│   ├── root_cause_analysis.md         ← 5 key findings with evidence
│   ├── stakeholder_raci.md            ← RACI matrix + influence map
│   └── risk_register.md               ← Project risk log
│
├── 04_dashboard/
│   ├── excel_dashboard_guide.md       ← Excel pivot setup instructions
│   └── looker_studio_link.md          ← Live dashboard link
│
├── 05_recommendations/
│   ├── executive_summary.md           ← 1-page CRO-ready summary
│   └── implementation_roadmap.md      ← 3-point revenue protection plan
│
└── 06_presentation/
    └── swiftpay_executive_deck.md     ← 5-slide executive presentation
```


## 🔍 Key Findings

### Finding 1 — Termination Pattern
- **~15% of 388 customers** are Non-active (Package Terminated)
- Top 3 termination reasons:
  - `AH not responding + no FFT` — most common, preventable
  - `Block by Risk team` — systemic issue
  - `Handover between BDs` — internal process gap

### Finding 2 — Regional Risk Profile

| Region | Active % | Risk Level |
|---|---|---|
| EMEA | ~83% | 🔴 High — highest termination volume |
| APAC | ~91% | 🟡 Medium — newer, collection gaps |
| LATAM | ~87% | 🟡 Medium — seasonal churn signals |

### Finding 3 — Collection Leakage
- Pattern: **2 consecutive failed collections → termination**
- No early warning trigger exists currently
- Intervention at **1st failure** could prevent majority of churn

### Finding 4 — Handover Gap
- Multiple customers stuck at **"Ready for handover"** — never completed
- Average delay: **untracked** (no SLA defined)
- Each delayed day = active churn risk window

### Finding 5 — Package Revenue Concentration Risk
- **Max Plus** = highest revenue per customer, lowest volume → fragile
- **Gold tier** = highest volume, mid revenue → most stable
- **Silver tier** = low revenue + early churn signals → watch list



## 💡 Recommendations — 3-Point Revenue Protection Plan

### 1. 🚨 Early Warning System
> Flag any customer with **1 failed collection** immediately to CSM.  
> Do not wait for the 2nd failure. Implement automated alert within CRM.  
> **Expected impact:** Reduce preventable churn by 30–40%

### 2. 📋 Handover SLA Policy
> Maximum **14 days** from BD to CSM handover.  
> Beyond 14 days → auto-escalate to Regional Manager.  
> **Expected impact:** Eliminate "stuck in handover" churn category

### 3. 📦 Package Right-Sizing Review
> Silver tier customers with low transaction volume → proactive downgrade conversation before silent churn.  
> Max Plus customers → dedicated QBR (Quarterly Business Review) protocol.  
> **Expected impact:** Improve retention by 10–15% in 6 months



## 📊 Dashboard Preview

| Dashboard | Tool | Access |
|---|---|---|
| Revenue Operations Overview | Google Looker Studio | [Link →](looker_studio_link) |
| Rep Scorecard | Excel / Google Sheets | See `04_dashboard/` |
| Monthly Collection Tracker | Excel | See `04_dashboard/` |



## 🗓️ Project Timeline (12 Weeks)

```
Week 1-2   │ Discovery — Stakeholder interviews, data audit, baseline metrics
Week 3-4   │ Analysis — SQL queries, root cause analysis
Week 5-6   │ Insight Generation — Collection trends, rep benchmarking
Week 7-8   │ Dashboard Build — Looker Studio, Excel scorecard
Week 9-10  │ Recommendations — Early warning system, SLA policy design
Week 11-12 │ Presentation — Executive deck, ROI projection, roadmap
```


## ⚙️ Tools & Technologies

| Category | Tool | Purpose |
|---|---|---|
| Data Cleaning | Excel / Google Sheets | Standardise raw data |
| SQL Analysis | DB Fiddle / BigQuery | Query and aggregate |
| Visualisation | Google Looker Studio | Live interactive dashboard |
| Documentation | Markdown / GitHub | Version-controlled project docs |
| Presentation | PowerPoint / Canva | Executive stakeholder deck |

## 📈 Skills Demonstrated

- ✅ Project Management (Charter, RACI, Risk Register, Timeline)
- ✅ SQL — Window functions, CTEs, aggregations, trend analysis
- ✅ Data Cleaning — Standardisation, null handling, currency normalisation
- ✅ Business Analysis — Root cause analysis, KPI framework design
- ✅ Dashboard Design — Looker Studio, Excel pivot
- ✅ Stakeholder Communication — Executive summary, recommendations deck
- ✅ GitHub — Version control, structured documentation



## 👤 About the Analyst

**Pavithra Panneerselvam**  
Data & Insights Analyst | Revenue Operations | B2B SaaS  
📍 Coimbatore → Bangalore  
🔗 [LinkedIn](https://www.linkedin.com/in/ps-p-322700240/) · [GitHub](https://github.com/gctian64-del)

> *"This project was built using anonymised, restructured real-world B2B data to simulate a complete revenue operations analytics engagement — from project charter to executive recommendation."*


## ⚠️ Disclaimer

> All company names, customer identities, and representative names in this project are **fictional or anonymised**.  
> This project is built purely for **portfolio and learning purposes**.  
> No confidential or proprietary data has been used or disclosed.
