---
id: K-004
title: Automated consistency checking via DSE
type: claim
maturity: permanent
tags: [topic/dse, prov/self]
status: delivered
sources: [".claude/memory/claim_04_automated_checking.md", "sections/05_evaluation.md §5.2"]
related: ["[[C-020 three-usage-modes]]", "[[C-019 soundness-completeness-guarantee]]", "[[C-030 scalability-measurement]]", "[[A-005 evaluation-harness]]", "[[Q-007 scalability-deeper-hierarchies]]", "[[D-021 q007-structurally-diverse-instances]]"]
created: 2026-06-16
---

The formalization enables automated consistency checking through design space exploration.

## Evidence
Three usage modes defined (§3.2); §4.4 traces all three on the constraint taxonomy; §5.2 benchmarks
three Refinery solver operations (check, check -k, generate) over N=1–30 plus the G0–G7 sensitivity
analysis. No gaps.

The journal open item (richer instances, [[Q-007 scalability-deeper-hierarchies]]) is closed by
T12+AF02 (2026-07-17): plain `check` is now measured alongside `check -k` and `generate` (plain
`check` returns SAT on every instance including UNSAT variants; only `check -k` distinguishes them),
and structurally diverse instances — deeper claim hierarchies and multi-subject credentials, realized
as chained credentials — scale at or below the uniform figures. The interactive-time claim therefore
holds beyond uniform instances, not only for them. Measurements re-run on the same CPU under WSL2
(see [[D-021 q007-structurally-diverse-instances]]).

## Links
- [[C-020 three-usage-modes]] — the modes.
- [[C-019 soundness-completeness-guarantee]] — what makes verdicts trustworthy.
- [[C-030 scalability-measurement]] — the benchmark.

## Source
claim_04.
