---
id: M-003
title: MOC — cross-layer constraints and the Refinery formalism
type: moc
maturity: permanent
tags: [layer/cross, kind/predicate, prov/self]
sources: ["sections/02_background.md §2.3", "sections/04_approach.md §4.4"]
related: ["[[M-001 journal-paper-outline]]", "[[M-002 three-layer-metamodel]]", "[[M-005 evaluation]]"]
created: 2026-06-16
---

The formal core: how constraints are expressed and why cross-layer ones are the contribution.

## The formalism
- [[C-006 partial-graph-modeling-refinery]] — partial models, why Refinery.
- [[C-008 four-valued-partial-model-semantics]] — true/false/unknown/error and refinement.
- [[C-007 graph-predicate-formalization]] — predicates as the constraint language.
- [[C-019 soundness-completeness-guarantee]] — the inherited guarantees.

## Predicate roles
- [[C-010 propagation-rule-and-negative-elimination]] — derive facts / prune choices.
- [[C-011 shadow-predicate]] — record without constraining.
- [[C-012 error-predicate]] — flag unrepairable contradictions.

## Cross-layer constraints
- [[C-009 cross-layer-constraint]] — the general device (variables span layers).
- [[C-013 cross-layer-constraint-taxonomy-c1-c9]] — the C1–C9 catalog.
- [[C-031 emergent-constraint-interactions]] — why joint checking is required.

## Candidate catalogue extensions (journal, from the precursor)
- [[C-035 dependent-claim-bundling]] — dependent claims must be co-located (blocks false-claim atomization).
- [[C-036 static-dynamic-revocation-mismatch]] — claims with mismatched revocation lifespans must be separated.

## Source
`sections/02_background.md §2.3`; `sections/04_approach.md §4.4`.
