---
id: "PA-B3"
short: "capability-table-fix"
title: "Fix capability table vs. Refinery model discrepancies"
status: pending
priority: high
depends_on: []
binding_claims: [8]
target: "sections/04_approach.md, models/csok.problem"
pipeline: "audit_2026-03-30"
assigned: "martin"
created: "2026-03-30"
---

## Goal

Resolve two discrepancies between the format-capability table in `sections/04_approach.md` and the Refinery model. These affect the governance conflict logic (Claim #8, headline result 1).

## Discrepancies

1. **`conforms_vcdm`**: Prose table (04_approach.md:84) says mdoc = NO. Refinery model (csok.problem) says mdoc = YES. Determine ground truth from the W3C/ISO specifications and fix whichever is wrong.

2. **`supports_offline_verification`**: Prose table (04_approach.md:86) says mdoc-only. Refinery model (csok.problem) includes AnonCreds and JSON-LD as well. Determine ground truth and fix whichever is wrong.

## Why this blocks

The governance conflict analysis (headline 1) depends on which formats have which capabilities. If the table is wrong, the conflict may not hold as stated. If the model is wrong, the Refinery-generated results are unsound. Either way, the mathematician reviewer will cross-check.

## Steps

1. Check W3C VCDM 2.0 spec: does mdoc (ISO 18013-5) conform to VCDM 2.0? (Answer is likely NO — mdoc predates VCDM 2.0 and uses CBOR, not JSON-LD.)
2. Check offline verification: which formats support it? AnonCreds uses ZKP (offline-capable), JSON-LD BBS+ (offline-capable), mdoc (NFC/offline-capable).
3. Update the table OR the model to match ground truth. If the model changes, re-run the Refinery solver to confirm headline results still hold.

## Acceptance criteria

- [ ] Both values match between prose table and Refinery model
- [ ] Ground truth source cited or noted
- [ ] If model changed, headline result 1 re-verified
