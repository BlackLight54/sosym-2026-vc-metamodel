---
id: D-008
title: Error detection and DSE are two distinct modalities
type: decision
maturity: permanent
tags: [topic/dse, kind/method, prov/self]
sources: [".claude/memory/decision_error_detection_vs_dse.md"]
related: ["[[C-020 three-usage-modes]]", "[[C-017 capability-driven-format-elimination]]"]
created: 2026-06-16
---

Treat error identification and design space exploration as two distinct Refinery modalities, alongside
consistency checking — three usage modes, not one conflated "checking" capability.

## Rationale
They answer different questions: error identification names a violation in a given design; DSE generates
valid completions or proves none exist. Conflating them obscures the workflow (find conflict →
restructure → search) and the distinct solver operations (`check -k` vs `generate`) benchmarked in §5.

## Links
- [[C-020 three-usage-modes]] — the three modes.
- [[C-017 capability-driven-format-elimination]] — DSE underpinned by elimination.

## Source
error-detection-vs-dse decision.
