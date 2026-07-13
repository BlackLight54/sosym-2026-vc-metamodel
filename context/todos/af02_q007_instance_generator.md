---
id: "AF02"
short: "q007-generator"
title: "Richer scalability instance generator + measurement re-run (Q-007)"
status: pending
priority: high
depends_on: []
binding_claims: [4]
target: "models/ (generator), sections/05_evaluation.md (scalability results), A-005 harness"
pipeline: "advisor-2026-07-06"
assigned: "claude"
created: "2026-07-13"
---

Implement Q-007, ruled into journal scope by D-021 (2026-07-13); risk R9 is closed.

Context (self-contained). Current scalability instances grow by adding credentials with
uniform structure (one property, shared subject). The interactive-time claim (sublinear to
N=30) rests on those uniform instances only. Q-007 (zettelkasten/questions/Q-007
scalability-deeper-hierarchies.md) defines the missing instance classes: deeper claim
hierarchies and multi-subject credentials, which stress different metamodel elements and may
degrade solver performance. K-004's M-011 row lists this as the scheduled journal open item.

Steps:
1. `git submodule update --init models` (the submodule is not checked out by default).
2. Extend the instance generation in the evaluation harness (A-005) with two structural axes:
   claim-hierarchy depth (nested claim properties) and subject count per credential.
3. Re-run the scalability measurements (C-030 extension) across both axes crossed with N.
4. Update F3 (fig_scalability) data and the evaluation section prose; the claim wording
   follows the numbers: if diverse instances degrade performance, the claim narrows, it never
   inflates (M-013 discipline).

Acceptance: generator code in models/, measurement data regenerated, K-004's M-011 Open cell
cleared or re-scoped with the new numbers, F3 updated or a follow-up figure todo filed.
