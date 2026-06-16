---
id: C-011
title: Shadow predicate
type: concept
maturity: permanent
tags: [topic/refinery, kind/predicate]
sources: ["sections/02_background.md §2.3", "sections/04_approach.md §4.4"]
related: ["[[C-007 graph-predicate-formalization]]", "[[C-026 cross-credential-predicate-gap-horizontal]]", "[[C-029 anti-pattern-catalog]]"]
created: 2026-06-16
---

A shadow predicate records derived information for inspection **without constraining generation**. It
marks structure the designer wants to query but does not want to force. Example: the `DCL` shadow
predicate marks all entities and properties as belonging to the domain concept layer.

Two cross-layer shadow predicates are load-bearing for the headline results. `aligned(c_e1, c_e2)`
holds when two distinct credential entities trace to the same domain entity — formalizing
cross-authority subject identity. `cross_cred_predicate_gap(c1, c2)` fires when two credentials have
aligned subjects but at least one format lacks multi-credential proof support, making a structural
limitation of the format space visible.

## Links
- [[C-007 graph-predicate-formalization]] — predicate roles.
- [[C-026 cross-credential-predicate-gap-horizontal]] — the headline result built on `cross_cred_predicate_gap`.
- [[C-029 anti-pattern-catalog]] — where `aligned` and the gap feed.

## Source
`sections/02_background.md §2.3`; `sections/04_approach.md §4.4`.
