---
id: C-010
title: Propagation rules and negative elimination
type: concept
maturity: permanent
tags: [topic/refinery, kind/predicate]
sources: ["sections/02_background.md §2.3", "sections/04_approach.md §4.4"]
related: ["[[C-007 graph-predicate-formalization]]", "[[C-014 trace-reference]]", "[[C-017 capability-driven-format-elimination]]"]
created: 2026-06-16
---

Propagation rules derive new facts during refinement: when the precondition pattern matches with all
elements committed (must), the consequent is applied to a fixpoint. A **positive** consequent infers
new class memberships or edges (e.g. classify an entity with no incoming value reference as a
`Subject`). **Negative elimination** is the dual: a negated consequent removes design choices that
would necessarily violate a constraint, setting them to *must not*.

Negative elimination is the workhorse for cross-layer pruning. Trace consistency (`prop_t`/`prop_s`)
forbids a claim from targeting a credential entity whose trace is inconsistent with the domain value.
Format-capability propagation eliminates incompatible format classes when a governance annotation
demands a capability — requiring `supports_predicate_proof` on IncomeCred excludes all formats except
AnonCreds.

## Links
- [[C-007 graph-predicate-formalization]] — predicate roles.
- [[C-014 trace-reference]] — trace consistency via negative elimination.
- [[C-017 capability-driven-format-elimination]] — format-space narrowing.

## Source
`sections/02_background.md §2.3`; `sections/04_approach.md §4.4`.
