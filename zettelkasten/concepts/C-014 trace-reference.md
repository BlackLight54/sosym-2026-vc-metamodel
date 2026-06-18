---
id: C-014
title: Trace reference (DCL→CSL derivation)
type: concept
maturity: permanent
tags: [layer/cross, kind/metamodel]
sources: ["sections/04_approach.md §4.2, §4.4"]
related: ["[[C-002 domain-concept-layer]]", "[[C-003 credential-schema-layer]]", "[[C-010 propagation-rule-and-negative-elimination]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]"]
created: 2026-06-16
---

Every CSL element carries a mandatory `trace` reference to its DCL origin. Traces do two things: they
let the metamodel check whether a credential faithfully represents what it claims (a broken trace names
a specific design error), and combined with propagation rules they **actively derive** CSL structure
from the DCL during generation, so credential-layer types are consequences of domain origin, not free
choices.

Trace consistency (C2) is enforced by negative elimination: `prop_t` excludes any credential entity
whose trace is inconsistent with the domain-layer value, `prop_s` is dual. A claim that connects to a
credential entity tracing to the wrong domain entity is a silent design error — each layer is
well-formed individually, but the cross-layer mapping is broken. Entity alignment (C1) is the shadow
predicate `aligned`: two credential entities are aligned when they trace to the same domain entity.

## Links
- [[C-002 domain-concept-layer]], [[C-003 credential-schema-layer]] — the layers traces connect.
- [[C-010 propagation-rule-and-negative-elimination]] — the enforcement mechanism.
- [[C-013 cross-layer-constraint-taxonomy-c1-c9]] — C1, C2.

## Source
`sections/04_approach.md §4.2, §4.4`.
