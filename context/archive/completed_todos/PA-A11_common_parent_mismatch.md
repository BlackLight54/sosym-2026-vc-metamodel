---
id: "PA-A11"
short: "common-parent-mismatch"
title: "common_parent location mismatch (prose says supplementary, model has it)"
status: done
priority: low
depends_on: []
binding_claims: []
target: "sections/04_approach.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

At 04_approach.md:148 (approximate), the prose says `common_parent` is "in supplementary material." The predicate actually exists in the main Refinery model (`models/csok.problem`).

## Acceptable risk rationale

Low reviewer impact — a minor location mismatch for a supporting predicate. No reviewer will cross-check supplementary material references against the model at review time.

## Action if addressed

Change "in supplementary material" to the correct location, or remove the location qualifier entirely if the predicate is described inline.
