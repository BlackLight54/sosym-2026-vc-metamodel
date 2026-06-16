---
id: C-020
title: Three usage modes (check / error-id / DSE)
type: concept
maturity: permanent
tags: [topic/dse, kind/method]
sources: ["sections/03_overview.md §3.2", "sections/04_approach.md §4.4", ".claude/memory/decision_error_detection_vs_dse.md"]
related: ["[[C-019 soundness-completeness-guarantee]]", "[[C-025 governance-conflict-vertical]]", "[[C-030 scalability-measurement]]", "[[K-004 automated-consistency-checking]]"]
created: 2026-06-16
---

The framework supports three usage modes over a designer-supplied *partial design*:

1. **Consistency checking** — confirms a complete design satisfies all constraints (returns OK).
2. **Error identification** — pinpoints which constraints conflict and where (returns
   `NOT_OK(predicate)`), e.g. naming the IncomeCred conflict site.
3. **Design space exploration (DSE)** — when choices are left open, generates diverse valid completions
   or proves none exist (UNVIABLE).

A typical workflow chains them: run error identification to discover the income conflict, restructure
the income claim as a pre-computed boolean, then run DSE to search for valid format assignments. Error
identification and DSE are deliberately treated as **two distinct Refinery modalities**, not one.

## Links
- [[C-019 soundness-completeness-guarantee]] — what makes the verdicts trustworthy.
- [[C-025 governance-conflict-vertical]] — the conflict surfaced by error identification.
- [[C-030 scalability-measurement]] — the three solver operations benchmarked (check, check -k, generate).
- [[K-004 automated-consistency-checking]] — the binding claim.

## Source
`sections/03_overview.md §3.2`; error-detection-vs-dse decision.
