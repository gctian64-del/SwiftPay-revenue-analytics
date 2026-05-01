# 🔍 Root Cause Analysis — SwiftPay Global Revenue Leakage

**Analyst:** Pavithra Panneerselvam  
**Date:** 2026  
**Method:** 5-Why Analysis + Data Evidence

---

## Finding 1 — Preventable Terminations: "AH Not Responding"

**Observation:** Largest single termination reason across all regions.

**5-Why Analysis:**
- Why did the customer terminate? → Account holder stopped responding
- Why did they stop responding? → No proactive outreach after failed collection
- Why was there no outreach? → No alert system triggered on 1st failure
- Why no alert? → CRM only flagged after 2nd consecutive failure
- Why was the threshold 2 failures? → No documented collection intervention policy

**Root Cause:** Absence of a 1st-failure intervention protocol in the CRM.

**Data Evidence:**
- Pattern: 2 consecutive failed collections consistently precede termination
- "AH no responding, no FFT" appears as top termination reason across EMEA and APAC

**Recommendation:** Implement automated CRM alert at 1st collection failure. Assign CSM to contact within 48 hours.

---

## Finding 2 — Handover Process Gap

**Observation:** Multiple active customers show "Ready for handover" status with no completion date.

**5-Why Analysis:**
- Why wasn't the handover completed? → No deadline defined
- Why no deadline? → No SLA exists for BD → CSM handover
- Why no SLA? → Process assumed to be informal, rep-driven
- Why informal? → No PM ownership of handover stage
- Why no ownership? → Revenue ops function underdeveloped

**Root Cause:** No SLA or accountability mechanism for the handover stage.

**Data Evidence:**
- Customers stuck at "Ready for handover" across EMEA, APAC, LATAM
- CSM manager column blank for many "Ready" customers
- MRR at risk from pending handovers is significant

**Recommendation:** Define 14-day handover SLA. Auto-escalate to Regional Manager at Day 15.

---

## Finding 3 — Block by Risk Team (Systemic)

**Observation:** "Block by risk" appears as a recurring termination reason — particularly in EMEA IS (Inside Sales) segment.

**5-Why Analysis:**
- Why was the customer blocked by risk? → Transaction patterns flagged
- Why flagged? → Customer volume didn't match expected monthly volume declared at signup
- Why mismatch? → Volume expectations set during acquisition were inflated
- Why inflated? → BD reps incentivised on new signups, not volume accuracy
- Why misaligned incentives? → No volume validation step during onboarding

**Root Cause:** Acquisition incentive structure rewards signups over quality, leading to volume misrepresentation at onboarding.

**Data Evidence:**
- Multiple EMEA IS customers terminated with "Block by risk"
- Several terminated customers had high expected volume but low/zero actual collection amounts

**Recommendation:** Add volume validation checkpoint at 30-day mark post-signup. Flag mismatches to Risk team proactively.

---

## Finding 4 — Silver Tier Silent Churn Risk

**Observation:** Silver tier ($100/month) customers show low collection amounts and early churn signals.

**5-Why Analysis:**
- Why are Silver customers churning silently? → Low fee = low priority for CSM
- Why low priority? → CSM capacity focused on Max/Premium accounts
- Why no Silver-specific strategy? → Package tier not differentiated in CSM playbook
- Why no differentiation? → One-size-fits-all CSM model
- Why one model? → No segmentation strategy defined

**Root Cause:** No tiered CSM strategy — Silver customers receive same (low) attention as enterprise accounts.

**Data Evidence:**
- Silver customers frequently appear in "2 last months failed collections" pattern
- Low expected monthly volumes (under $30,000) correlate with early termination

**Recommendation:** Create a lightweight self-serve CSM model for Silver tier. Trigger human outreach only at failure signal.

---

## Finding 5 — Seasonal / Volume Mismatch Churn

**Observation:** Some LATAM and EMEA customers terminated with reason "Seasonal business, no use in the package."

**5-Why Analysis:**
- Why did the customer leave? → Business is seasonal; package provides no value off-season
- Why sold a full-year package? → BD rep sold on peak volume projection
- Why no seasonal adjustment? → No flexible or seasonal package option available
- Why no flexible option? → Product team not looped in to sales feedback
- Why no feedback loop? → Sales → Product pipeline not formalised

**Root Cause:** Product-market fit gap for seasonal businesses. No flexible package designed for irregular volume businesses.

**Data Evidence:**
- Termination reason: "Seasonal business, no use in the package"
- LATAM region shows this pattern

**Recommendation:** Design a seasonal package pause feature or introduce a quarterly billing option for irregular-volume businesses.

---

## Summary Table

| Finding | Root Cause | Impact | Priority |
|---|---|---|---|
| AH Not Responding | No 1st-failure intervention | High | 🔴 Critical |
| Handover Gap | No SLA defined | High | 🔴 Critical |
| Risk Block | Volume misrepresentation at onboarding | Medium | 🟡 High |
| Silver Churn | No tiered CSM model | Medium | 🟡 High |
| Seasonal Churn | No flexible package | Low-Medium | 🟢 Medium |

---

*Root Cause Analysis v1.0 | SwiftPay Global Analytics Project | Pavithra Panneerselvam | 2026*
