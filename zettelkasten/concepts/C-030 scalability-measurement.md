---
id: C-030
title: Scalability measurement
type: concept
maturity: permanent
tags: [topic/evaluation, topic/refinery, kind/result]
sources: ["sections/05_evaluation.md §5.2", ".claude/memory/decision_evaluation_measurement_schema.md"]
related: ["[[C-020 three-usage-modes]]", "[[C-025 governance-conflict-vertical]]", "[[Q-007 scalability-deeper-hierarchies]]", "[[K-004 automated-consistency-checking]]"]
created: 2026-06-16
---

Quantitative complement to the elaboration. Three Refinery solver operations are benchmarked:
consistency checking (`check`), concretizability checking (`check -k`, the operation that detects
governance conflicts), and model generation (`generate`). Synthetic instances scale N=1→30 credentials
(11→272 nodes), each with a SAT and UNSAT variant; Hyperfine, 10 runs, cold-JVM overhead (~3.9 s)
subtracted.

Results: concretizability checking scales sublinearly to 1.09 s at N=30; SAT and UNSAT timings are
comparable (unsatisfiability detection is not more expensive); generation reaches 1.85 s — all within
interactive use and beyond current EU-wallet ecosystem sizes. A constraint-sensitivity sub-experiment
(N=3, G0–G7) confirms only the full conjunction G7 is unsatisfiable. Script, instances, and metamodel
source are supplementary for reproduction.

## Links
- [[C-020 three-usage-modes]] — the operations correspond to the modes.
- [[C-025 governance-conflict-vertical]] — G0–G7 confirms the Headline 1 finding.
- [[Q-007 scalability-deeper-hierarchies]] — limitation: uniform-structure instances.
- [[K-004 automated-consistency-checking]] — the claim it supports.

## Source
`sections/05_evaluation.md §5.2`; evaluation-measurement-schema decision.
