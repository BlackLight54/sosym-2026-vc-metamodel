---
id: "PA-A9"
short: "four-vs-three-valued"
title: "Four-valued vs. three-valued Refinery characterization"
status: done
priority: low
depends_on: []
binding_claims: []
target: "sections/02_background.md, context/VENUE.md"
pipeline: "audit_2026-03-30"
assigned: "martin"
created: "2026-03-30"
---

## Goal

Sec 02 cites Belnap and describes four-valued logic. VENUE.md references "Refinery's 3-valued semantics." Both may be correct (Refinery extends three-valued partial models with a fourth "error" value from Belnap's lattice), but the inconsistency between the paper and project metadata could cause confusion.

## Acceptable risk rationale

The paper's description (four-valued, citing Belnap) is the technically precise one. VENUE.md is internal project metadata, not submitted text. If a reviewer raises this, the rebuttal can clarify the relationship between three-valued partial models and Belnap's four-valued extension.

## Action if addressed

Update VENUE.md to say "four-valued" instead of "three-valued," or add a clarifying sentence in Sec 02.3 explaining the relationship: "Refinery extends the classical three-valued partial model semantics with Belnap's fourth value (error/inconsistency)."
