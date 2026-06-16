---
id: C-009
title: Cross-layer constraint
type: concept
maturity: permanent
tags: [layer/cross, kind/predicate]
sources: ["sections/04_approach.md §4.4", ".claude/memory/claim_03_cross_layer_constraints.md"]
related: ["[[C-001 three-layer-metamodel-overview]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-027 multilayer-invisibility]]", "[[C-031 emergent-constraint-interactions]]", "[[K-003 cross-layer-constraints-as-predicates]]"]
created: 2026-06-16
---

A cross-layer constraint is a predicate whose variables reference elements from **more than one**
metamodel layer; it captures design requirements that no single-layer check can express. This is the
paper's core formal device: it lets constraints originating from independently enacted governance
sources (W3C VCDM, eIDAS ARF, GDPR, format specs) be checked jointly, so contradictions between them
become detectable.

Cross-layer predicates fall into the same three roles as any Refinery predicate (propagation rule,
shadow predicate, error predicate) but bind variables across layers — e.g. `prop_t`/`prop_s` (trace
consistency, DCL↔CSL), `aligned` (cross-authority subject identity, DCL↔CSL), `cross_cred_predicate_gap`
(DCL↔FSL), `governance_conflict` (FSL, fed by C5+C6+C7).

## Links
- [[C-013 cross-layer-constraint-taxonomy-c1-c9]] — the C1–C9 catalog.
- [[C-027 multilayer-invisibility]] — why these errors escape single-layer inspection.
- [[C-031 emergent-constraint-interactions]] — why joint analysis is required.
- [[K-003 cross-layer-constraints-as-predicates]] — the binding claim.

## Source
`sections/04_approach.md §4.4`; claim_03.
