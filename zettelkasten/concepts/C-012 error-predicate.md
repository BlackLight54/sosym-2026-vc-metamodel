---
id: C-012
title: Error predicate
type: concept
maturity: permanent
tags: [topic/refinery, kind/predicate]
sources: ["sections/02_background.md §2.3", "sections/04_approach.md", "sections/05_evaluation.md §5.1.4"]
related: ["[[C-007 graph-predicate-formalization]]", "[[C-025 governance-conflict-vertical]]", "[[C-029 anti-pattern-catalog]]"]
created: 2026-06-16
---

An error predicate flags a structural flaw that no refinement can repair: when it evaluates to *must*,
the partial model is contradictory. Error predicates are how the metamodel performs **error
identification** — returning `NOT_OK(predicate(args))`, naming the violating elements.

Single-layer error predicates: `non_connected` (DCL, orphaned entity), `cyclic` (DCL), `no_empty_cred`
(CSL), `root_ent_doesnt_have_cred` (CSL). The decisive cross-layer error predicate is
`governance_conflict` (FSL), whose two disjunctive clauses encode that no format can satisfy eIDAS
(C5), privacy (C6), and VCDM (C7) simultaneously.

## Links
- [[C-007 graph-predicate-formalization]] — predicate roles.
- [[C-025 governance-conflict-vertical]] — the `governance_conflict` headline.
- [[C-029 anti-pattern-catalog]] — error predicates as anti-pattern detectors.

## Source
`sections/02_background.md §2.3`; `sections/04_approach.md`; `sections/05_evaluation.md §5.1.4`.
