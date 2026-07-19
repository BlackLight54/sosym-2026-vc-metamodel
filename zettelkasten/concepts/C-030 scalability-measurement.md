---
id: C-030
title: Scalability measurement
type: concept
maturity: permanent
tags: [topic/evaluation, topic/refinery, kind/result]
sources: ["sections/05_evaluation.md §5.2", ".claude/memory/decision_evaluation_measurement_schema.md"]
related: ["[[C-020 three-usage-modes]]", "[[C-025 governance-conflict-vertical]]", "[[Q-007 scalability-deeper-hierarchies]]", "[[K-004 automated-consistency-checking]]", "[[A-005 evaluation-harness]]", "[[D-021 q007-structurally-diverse-instances]]"]
created: 2026-06-16
---

Quantitative complement to the elaboration. Three Refinery solver operations are benchmarked:
consistency checking (`check`), concretizability checking (`check -k`, the operation that detects
governance conflicts), and model generation (`generate`). Synthetic instances scale N=1→30 credentials
(11→272 nodes), each with a SAT and UNSAT variant; Hyperfine, 10 runs, cold-container overhead
(~4.1 s) subtracted.

Results (re-measured 2026-07-17, T12): concretizability checking scales sublinearly to 1.48 s at N=30;
SAT and UNSAT timings are comparable (unsatisfiability detection is not more expensive); generation
reaches 2.50 s. All are within interactive use and beyond current EU-wallet ecosystem sizes. Plain
`check` returns SAT on every instance including the UNSAT variants, since it does not enforce error
predicates; only `check -k` distinguishes them, and consistency runs cheaper at scale (1.11 s at
N=30). A constraint-sensitivity sub-experiment (N=3, G0–G7) confirms only the full conjunction G7 is
unsatisfiable, with timing flat across all eight configurations. Structurally diverse chained
instances (experiment ED, [[Q-007 scalability-deeper-hierarchies]]) scale at or below the uniform
figures, so the result is not an artifact of uniform instance shape. Script, instances, and metamodel
source are supplementary for reproduction.

## Links
- [[C-020 three-usage-modes]] — the operations correspond to the modes.
- [[C-025 governance-conflict-vertical]] — G0–G7 confirms the Headline 1 finding.
- [[Q-007 scalability-deeper-hierarchies]] — answered 2026-07-17 (AF02): diverse instances measured, scaling holds.
- [[K-004 automated-consistency-checking]] — the claim it supports.

## Source
`sections/05_evaluation.md §5.2`; evaluation-measurement-schema decision.
