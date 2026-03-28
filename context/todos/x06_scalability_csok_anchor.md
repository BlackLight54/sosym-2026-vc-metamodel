---
id: "X06"
short: "scalability-csok"
title: "Anchor scalability instances to CSOK running example"
status: pending
priority: low
depends_on: []
binding_claims: []
target: "sections/05_evaluation.md"
pipeline: "x-crosscutting"
assigned: "claude"
created: "2026-03-28"
---

## Problem

Sec 5.2 uses synthetic instances for scalability measurement without noting that the N=3 instance corresponds to the CSOK running example's structure (3 credentials: income, family status, floor area). The running example threads through Sections 1-5.1.3 but drops entirely in 5.2. A one-sentence anchor would maintain continuity.

Additionally, Sec 3.1 footnote mentions "additional credentials required in practice (tax clearance, criminal record check) are omitted" but the scalability section scales to N=30 without connecting back to this real-world grounding.

## Source

- X01 (Argument Coherence): Running Example continuity analysis

## Goal

Add one sentence in Sec 5.2's instance description noting: "The smallest instance (N=3, one property per credential, shared subject) corresponds to the structure of the housing subsidy running example from \autoref{sec:motivation}."

## Acceptance criteria

- Sec 5.2 contains an explicit link to the running example for the N=3 case
- The sentence is factual and brief (1 sentence, no elaboration)
