---
id: C-002
title: Domain Concept Layer (DCL)
type: concept
maturity: permanent
tags: [layer/dcl, kind/metamodel]
sources: ["sections/04_approach.md §4.1"]
related: ["[[C-001 three-layer-metamodel-overview]]", "[[C-014 trace-reference]]", "[[C-012 error-predicate]]", "[[C-021 csok-running-example]]"]
created: 2026-06-16
---

The first layer models domain-level facts as a typed, directed, acyclic **information graph**. The
abstract metaclass `Entity` has two concrete subclasses, `Subject` and `Value`, connected by `Prop`
instances; each `Prop` holds exactly one `Value` and carries a trace link to the CSL. The
Subject/Value distinction is inferred structurally: a propagation rule classifies any `Entity` with no
incoming value reference as a `Subject` (a root of the property tree, hence a candidate credential
subject at the CSL).

Four predicates constrain the DCL: `statement(s,p,v)` (ternary well-formedness, `s≠v`),
`non_connected` (error: an entity not reachable through `neighbours` is a domain fact no credential
path connects to the subject), `no_self_loop` (propagation: forbids an entity owning a property whose
value is itself), and `cyclic` (error: acyclicity via transitive closure). Together they ensure every
DCL instance is a connected DAG with clear subject→value directionality.

## Links
- [[C-001 three-layer-metamodel-overview]] — parent structure.
- [[C-014 trace-reference]] — how CSL derives from DCL.
- [[C-012 error-predicate]] — `non_connected`, `cyclic`.
- [[C-021 csok-running-example]] — the three property edges (children, area, income).

## Source
`sections/04_approach.md §4.1`.
