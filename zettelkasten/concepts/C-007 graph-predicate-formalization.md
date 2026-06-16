---
id: C-007
title: Graph predicates as a constraint language
type: concept
maturity: permanent
tags: [topic/refinery, kind/predicate, kind/formal]
sources: ["sections/02_background.md §2.3"]
related: ["[[C-006 partial-graph-modeling-refinery]]", "[[C-010 propagation-rule-and-negative-elimination]]", "[[C-011 shadow-predicate]]", "[[C-012 error-predicate]]", "[[C-009 cross-layer-constraint]]"]
created: 2026-06-16
---

A graph predicate defines a structural constraint or derived property as a graph pattern, evaluated
over the partial interpretation under four-valued semantics. A model *satisfies* a predicate when it
evaluates to true for all variable bindings; a conjunction takes the least committed value among its
operands (unknown if any operand is unknown, false if any is false, error if an element is
simultaneously required and forbidden). Negation and transitive closure extend evaluation to richer
structural queries.

Three predicate roles recur throughout the metamodel and are the vocabulary for all constraints:
**propagation rules** (derive facts / eliminate choices during refinement), **shadow predicates**
(record derived information for inspection without constraining generation), and **error predicates**
(flag contradictions a refinement cannot repair).

## Links
- [[C-006 partial-graph-modeling-refinery]] — the framework.
- [[C-010 propagation-rule-and-negative-elimination]], [[C-011 shadow-predicate]], [[C-012 error-predicate]] — the three roles.
- [[C-009 cross-layer-constraint]] — predicates whose variables span layers.

## Source
`sections/02_background.md §2.3`.
