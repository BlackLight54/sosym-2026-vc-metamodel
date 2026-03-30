---
id: "PA-H1"
short: "predicate-corrections"
title: "Fix shadow predicate misclassification and predicate count in Sec 04"
status: pending
priority: medium
depends_on: []
binding_claims: [3]
target: "sections/04_approach.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Two factual corrections in `sections/04_approach.md` that the mathematician reviewer will catch.

## Fix 1 — Shadow predicate misclassification (H1)

At approximately line 54-60, the prose describes `credential_statement` and `Root_cred_entity` as "shadow predicates." In the Refinery model (`models/csok.problem`), both are defined as plain `pred` (derived predicates), not `shadow pred`. The distinction matters: shadow predicates propagate uncertainty, plain predicates do not.

**Action:** Read the relevant passage in `sections/04_approach.md` around lines 54-60. Change "shadow predicates" to "derived predicates" (or whatever term accurately describes their `pred` status in Refinery). Verify by reading `models/csok.problem` to confirm their actual declaration.

## Fix 2 — Predicate count error (H2)

At approximately line 70, the prose claims "five predicates" but only four are described in the subsequent text.

**Action:** Read lines 65-80 of `sections/04_approach.md`. Count the predicates actually described. Either describe the missing fifth predicate, or change "five" to the correct count.

## Acceptance criteria

- [ ] `credential_statement` and `Root_cred_entity` correctly classified in prose
- [ ] Predicate count matches the number actually described
