---
id: C-019
title: Generation soundness and bounded completeness
type: concept
maturity: permanent
tags: [topic/refinery, kind/formal]
sources: ["sections/02_background.md §2.3", ".claude/memory/decision_soundness_completeness.md"]
related: ["[[C-006 partial-graph-modeling-refinery]]", "[[C-020 three-usage-modes]]", "[[S-003 semerath-derived-features-2017]]", "[[K-004 automated-consistency-checking]]"]
created: 2026-06-16
---

Refinery generation is refinement-based and inherits two guarantees, established by Semeráth et al. for
partial graph specifications: **soundness** — every generated instance satisfies all metamodel
constraints and graph predicates; **bounded completeness** — if no valid model exists within the
declared scope, the solver reports unsatisfiability. Because the multi-layer metamodel and cross-layer
predicates are expressed as standard Refinery specifications, generated credential ecosystem models
inherit both guarantees.

These are the core correctness claims of the approach: an invalid design is *truly* invalid (the tool
does not miss it within scope), and a generated design *does* satisfy the constraints. They are what
makes "the tool found no conflict" and "the tool proved no configuration exists" trustworthy
statements rather than heuristics.

## Links
- [[C-006 partial-graph-modeling-refinery]] — the framework providing the guarantees.
- [[C-020 three-usage-modes]] — guarantees underpin all three modes.
- [[S-003 semerath-derived-features-2017]] — where the properties are proved.
- [[K-004 automated-consistency-checking]] — the claim relying on them.

## Source
`sections/02_background.md §2.3`; soundness-completeness decision.
