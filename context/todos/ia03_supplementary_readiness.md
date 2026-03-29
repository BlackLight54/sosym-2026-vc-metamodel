---
id: "IA03"
short: "supplementary-ready"
title: "Verify supplementary material is complete and anonymized"
status: pending
priority: high
depends_on: []
binding_claims: [3, 4]
target: "supplementary material"
pipeline: "integrity-audit"
assigned: "martin"
created: "2026-03-28"
---

The paper makes 8+ references to "the supplementary material" for:
- Complete Refinery encoding (DCL, CSL, FSL class declarations)
- Full propagation rule definitions
- Full constraint definitions
- Full eIDAS ARF constraint analysis (8 constraints)
- Instance definitions and Refinery encodings for scalability measurement
- Measurement script

If the supplementary material is not uploaded, the paper's formal claims are unsupported. If it contains Refinery repository metadata (git history, author comments, institutional paths), it deanonymizes.

**Acceptance criteria:**
1. All referenced supplementary artifacts exist and are consistent with the paper's claims.
2. No author-identifying metadata in supplementary files (git history stripped, no institutional paths, no author names in comments).
3. Supplementary material is uploaded alongside the paper.
