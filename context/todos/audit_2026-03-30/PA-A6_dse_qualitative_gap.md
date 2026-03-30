---
id: "PA-A6"
short: "dse-qualitative-gap"
title: "DSE usage mode qualitative evaluation lives in approach, not evaluation"
status: pending
priority: low
depends_on: []
binding_claims: [4]
target: "sections/05_evaluation.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

The approach (Sec 04) narrates a DSE workflow and the evaluation (Sec 05.2) measures generation time, but no qualitative DSE result (generated alternatives, UNVIABLE proof) appears in the evaluation itself.

## Acceptable risk rationale

Architectural choice — the approach demonstrates the workflow, the evaluation quantifies performance. A qualitative DSE example would strengthen the paper but risks page budget. The scalability measurement in Sec 05.2 covers the quantitative angle.

## Action if addressed

Add 2-3 sentences to Sec 05.2 showing one concrete DSE result: e.g., "For the CSOK instance, Refinery generates N structurally distinct valid configurations, demonstrating that the design space contains alternatives beyond the manually specified instance." Requires Refinery output data from Martin.
