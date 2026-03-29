---
id: "IA02"
short: "headline1-demo"
title: "Resolve Headline 1 Refinery demonstration gap"
status: pending
priority: high
depends_on: []
binding_claims: [4, 8]
target: "sections/05_evaluation.md"
pipeline: "integrity-audit"
assigned: "martin"
created: "2026-03-28"
---

`sections/05_evaluation.md:60-62` contains a block todo: "After Refinery formalization (Pass 2) — show the error predicates firing and the model generator producing no valid instance."

The paper claims at `sections/04_approach.md:147` that "the framework returns NOT_OK(governance_conflict(IncomeCred, income_format))" but never demonstrates this actually happening. The Headline 1 result is argued analytically but not demonstrated via the tool.

**Options:**
1. Show the Refinery output (preferred — directly supports binding claim 4).
2. Soften the claim language from "the framework returns..." to "the formalization identifies..." (fallback).
3. Remove the todo annotation and rely on the analytical argument (minimum — but the todo annotation must not appear in the PDF).

**Acceptance criteria:** The todo annotation is resolved and the paper's claims about framework behavior match what has been demonstrated.
