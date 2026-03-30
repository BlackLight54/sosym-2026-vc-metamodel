---
id: "PA-A7"
short: "ocl-comparison"
title: "OCL comparison too compressed in Related Work"
status: pending
priority: low
depends_on: []
binding_claims: []
target: "sections/06_related_work.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

The OCL comparison in Sec 06.3 is one sentence for the primary competing constraint language in MDE. It does not explain why graph predicates are structurally preferable to OCL constraints.

## Acceptable risk rationale

One sentence is present; expanding risks page budget. The adversarial reviewer (competing formalism advocate) would want more, but the paper's contribution is the metamodel + cross-layer constraints, not a tool/language comparison.

## Action if addressed

Add 1-2 sentences after the existing OCL mention explaining the structural advantage: graph predicates operate on partial models with unknown values (Refinery's four-valued semantics), while OCL constraints require fully instantiated models. This is the key differentiator.
