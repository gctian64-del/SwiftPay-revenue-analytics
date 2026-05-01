# 📋 Project Charter - SwiftPay Global Revenue Operations Analytics

## Project Overview

| Field | Detail |
|---|---|
| **Project Name** | SwiftPay Revenue Operations Transformation |
| **Project Sponsor** | Chief Revenue Officer (CRO) |
| **Project Manager** | Pavithra Panneerselvam |
| **Start Date** | January 2026 |
| **End Date** | March 2026 |
| **Duration** | 12 Weeks |
| **Status** | Completed |


## Problem Statement

SwiftPay Global manages 388 B2B customers across EMEA, APAC, and LATAM. Despite strong acquisition numbers, the company is experiencing 18–22% MRR leakage due to:

- No early intervention on failed payment collections
- Unstructured BD-to-CSM handover process
- No root cause tracking for package terminations

## Objectives

1. Identify and quantify revenue leakage by region and rep
2. Build a real-time revenue operations dashboard
3. Deliver 3 actionable recommendations to CRO
4. Establish KPI baseline for future tracking


## Scope

**In Scope:**
- 388 customer records across all regions
- Monthly collection data (Jul 2025 - Apr 2026)
- Package tier analysis
- Rep performance benchmarking
- Handover SLA analysis

**Out of Scope:**
- Product-level analysis
- Customer satisfaction / NPS
- Marketing attribution


## RACI Matrix

| Activity | PM (You) | BD Managers | CSM Managers | Finance | Risk Team |
|---|---|---|---|---|---|
| Data Collection | R | C | C | C | I |
| Data Cleaning | R | I | I | I | I |
| SQL Analysis | R | I | I | C | I |
| Dashboard Build | R | I | C | I | I |
| Root Cause Analysis | R | C | C | I | C |
| Recommendations | R | C | C | I | C |
| Executive Presentation | R | I | I | I | I |
| Final Sign-off | I | I | I | I | I |

*R=Responsible, A=Accountable, C=Consulted, I=Informed*

---

## Stakeholder Influence Map

| Stakeholder | Power | Interest | Strategy |
|---|---|---|---|
| CRO | High | High | Manage Closely |
| BD Head | High | High | Manage Closely |
| CSM Head | High | Medium | Keep Satisfied |
| Finance | Medium | Low | Keep Satisfied |
| Sales Reps | Low | High | Keep Informed |
| Risk Team | Medium | Medium | Keep Informed |

---

## KPI Framework

### Leading Indicators (Weekly)
- Handover completion rate
- New collection failure count
- Days since last customer contact

### Lagging Indicators (Monthly)
- MRR retained
- Churn rate by region
- Rep collection success rate trend

---

## Risk Register

| Risk | Probability | Impact | Mitigation |
|---|---|---|---|
| Data quality issues | High | High | Cleaning protocol - Week 1 |
| Rep adoption resistance | Medium | High | CSM manager buy-in first |
| Incomplete handover records | High | Medium | Manual audit fallback |
| Currency conversion errors | Medium | Medium | Normalise all to USD |
| Stakeholder unavailability | Low | Medium | Async updates via Slack |

---

## Deliverables

| # | Deliverable | Status |
|---|---|---|
| 1 | Project Charter | ✅ Done |
| 2 | Data Dictionary | ✅ Done |
| 3 | Cleaned Dataset | ✅ Done |
| 4 | SQL Analysis (6 queries) | ✅ Done |
| 5 | Root Cause Analysis | ✅ Done |
| 6 | Excel Dashboard | ✅ Done |
| 7 | Looker Studio Dashboard | ✅ Done |
| 8 | Executive Summary | ✅ Done |
| 9 | Implementation Roadmap | ✅ Done |

---

*Project Manager: Pavithra Panneerselvam | SwiftPay Global Analytics Project | 2026*
