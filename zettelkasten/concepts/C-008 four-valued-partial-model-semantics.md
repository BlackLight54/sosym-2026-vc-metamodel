---
id: C-008
title: Four-valued partial-model semantics
type: concept
maturity: permanent
tags: [topic/refinery, kind/formal]
sources: ["sections/02_background.md §2.3", ".claude/memory/feedback_notation_introduction.md"]
related: ["[[C-006 partial-graph-modeling-refinery]]", "[[C-007 graph-predicate-formalization]]", "[[S-006 famelis-partial-models-2012]]"]
created: 2026-06-16
---

A partial model assigns every node, edge, and attribute one of four truth values (Belnap logic):
**true** (must hold), **false** (must not hold), **unknown** (possibly either), **error** (both
required and forbidden — a contradiction). Diagrams render true as solid lines, unknown as dashed,
false as absence. A model with no remaining unknown values is *concrete*.

Refinement is the partial order that formalizes monotonic narrowing of design alternatives: model A
refines B if every true/false assignment in B is preserved in A, while unknown values in B may be
committed either way in A. This is what lets the framework reason over designs that are still
incomplete — essential when governance constraints arrive incrementally.

## Links
- [[C-006 partial-graph-modeling-refinery]] — where the semantics live.
- [[C-007 graph-predicate-formalization]] — predicate evaluation over the four values.
- [[S-006 famelis-partial-models-2012]] — antecedent partial-model framework.

## Source
`sections/02_background.md §2.3`; notation-introduction feedback.
