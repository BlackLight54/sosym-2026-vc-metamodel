---
id: C-027
title: Multi-layer invisibility of cross-layer errors
type: concept
maturity: permanent
tags: [layer/cross, kind/method]
sources: ["sections/01_introduction.md", "sections/05_evaluation.md §5.1.4-5.1.5", ".claude/memory/claim_09_multilayer_invisibility.md"]
related: ["[[C-009 cross-layer-constraint]]", "[[C-029 anti-pattern-catalog]]", "[[C-031 emergent-constraint-interactions]]", "[[K-009 multilayer-invisibility]]", "[[K-010 necessity-of-multilayer-modeling]]"]
created: 2026-06-16
---

The central argument: a credential design can be well-formed at every layer in isolation yet violate a
cross-layer constraint that links domain-level claim semantics to format-specific capabilities.
Inspected alone, each layer passes its own validation; only joint checking reveals the conflict. Both
headline results exhibit this — vertical (income conflict) and horizontal (floor-area gap) — and the
anti-pattern catalog shows **graduated visibility**: intra-layer errors → cross-layer trace
inconsistencies → ecosystem-level capability gaps.

The baseline comparison sharpens it: single-layer metamodeling (UML+OCL per layer) detects intra-layer
violations but **cannot express** cross-layer trace predicates or capability checks. The advantage is
partly definitional (single-layer tools cannot state the constraint) and partly systematic (the
integrated model detects all five anti-pattern categories).

## Links
- [[C-009 cross-layer-constraint]] — the device that makes errors expressible.
- [[C-029 anti-pattern-catalog]] — graduated visibility.
- [[C-031 emergent-constraint-interactions]] — why the errors are not predictable per-layer.
- [[K-009 multilayer-invisibility]], [[K-010 necessity-of-multilayer-modeling]] — the binding claims.

## Source
`sections/01_introduction.md`; `sections/05_evaluation.md §5.1.4–5.1.5`; claim_09.
