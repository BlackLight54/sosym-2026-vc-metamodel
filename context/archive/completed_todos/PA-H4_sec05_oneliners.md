---
id: "PA-H4"
short: "eval-oneliners"
title: "Add range proofs future work + CORE-DISC Realistic acknowledgment in Sec 05"
status: done
priority: medium
depends_on: []
binding_claims: []
target: "sections/05_evaluation.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Two one-sentence additions to `sections/05_evaluation.md` that close decision compliance gaps.

## Fix 1 — Range proofs future work (H4)

Decision `decision_range_proofs_future_work` requires mentioning range proofs (as distinct from predicate proofs) as out of scope / future work. Currently zero mentions exist anywhere in the paper — this is the only outright non-compliant decision.

**Action:** Add one sentence to Sec 05.4 (Limitations and Future Work, around lines 127-131) noting that range proofs are out of scope. Example direction: "The current formalization addresses predicate proofs but does not model range proofs, which constrain numeric claim values to intervals without revealing exact values; extending the FSL to capture range proof semantics is future work."

## Fix 2 — CORE-DISC Realistic acknowledgment (H6)

Decision `decision_core_disc_properties` maps the approach to Refinery's CORE-DISC properties: Consistency (primary), Diverse (show design space), Scalable (scale evaluation), Realistic (out of scope). The "Realistic" property is never acknowledged as out of scope.

**Action:** Add one sentence to Sec 05.3 (Threats to Validity) or Sec 05.4 (Limitations) acknowledging that generated model instances are structurally valid but not calibrated for realism (i.e., the Refinery "Realistic" property is out of scope). Example direction: "Generated instances satisfy all metamodel constraints but are not calibrated against real-world credential ecosystem deployments; assessing instance realism is out of scope."

## Acceptance criteria

- [ ] Range proofs mentioned as future work in Sec 05.4
- [ ] CORE-DISC Realistic acknowledged as out of scope in Sec 05.3 or 05.4
