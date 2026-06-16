---
id: C-006
title: Partial graph modeling with Refinery
type: concept
maturity: permanent
tags: [topic/refinery, kind/formal]
sources: ["sections/02_background.md §2.3", ".claude/memory/decision_novel_tooling_justification.md"]
related: ["[[C-007 graph-predicate-formalization]]", "[[C-008 four-valued-partial-model-semantics]]", "[[C-019 soundness-completeness-guarantee]]", "[[S-002 marussy-refinery-2024]]", "[[K-003 cross-layer-constraints-as-predicates]]"]
created: 2026-06-16
---

Refinery is a modeling methodology in which design specifications are expressed as **partial models**
and graph predicates serve as a first-class constraint language. Nodes are objects (instances of
metamodel classes), edges are typed references, class membership is a unary relation. A *signature*
defines the vocabulary (unary class names, binary reference names); a *partial model* assigns each
class membership and reference one of four truth values.

Refinery is the right tool because credential requirements arrive incrementally from independent
governance sources, so the designer must reason over **incomplete** specifications. Refinery evaluates
constraints *during* refinement, pruning inconsistent choices before they propagate — unlike bounded
model finders (Alloy) or OCL, which assume fully concrete instances and re-encode the whole problem
per candidate.

## Links
- [[C-008 four-valued-partial-model-semantics]] — the truth values and refinement order.
- [[C-007 graph-predicate-formalization]] — the constraint language.
- [[C-019 soundness-completeness-guarantee]] — what generation guarantees.
- [[S-002 marussy-refinery-2024]] — the tool paper.
- [[K-003 cross-layer-constraints-as-predicates]] — the claim it supports.

## Source
`sections/02_background.md §2.3`; novel-tooling-justification decision.
