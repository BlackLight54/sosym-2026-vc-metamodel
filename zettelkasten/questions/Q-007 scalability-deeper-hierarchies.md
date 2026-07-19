---
id: Q-007
title: Does scalability hold for deeper claim hierarchies and multi-subject credentials?
type: question
maturity: permanent
tags: [topic/evaluation, topic/refinery, prov/self]
sources: ["sections/05_evaluation.md §5.2, §5 limitations"]
related: ["[[C-030 scalability-measurement]]", "[[K-004 automated-consistency-checking]]", "[[D-021 q007-structurally-diverse-instances]]", "[[A-005 evaluation-harness]]"]
created: 2026-06-16
---

Scalability instances grow by adding credentials with **uniform** structure (one property, shared
subject). Do deeper claim hierarchies or multi-subject credentials stress different metamodel elements
and degrade solver performance?

## Why it matters
The interactive-time claim (sublinear to N=30) rests on uniform instances; a journal version should test
structurally diverse instances to make the scalability claim robust.

## Status
Answered 2026-07-17 (AF02). A chained-credential generator (`generate_chain_instance`) realized
deeper claim hierarchies (chain depth) and multi-subject credentials (distinct subject per chain
level). Experiment ED measured a depth sweep (depth 1–12 at fixed N=12) and a depth-four N-sweep.
Finding: structural diversity does **not** degrade solver performance — concretizability time is flat
across depth and at or below the uniform figures across N (1.27 s vs 1.48 s at N=30). The uniform
star is in fact the harder case (shared subject aligns every credential pair). The interactive-time
claim holds beyond uniform instances; §5.2 wording broadened accordingly.

## Links
- [[C-030 scalability-measurement]] — the measurement to extend.
- [[K-004 automated-consistency-checking]] — the claim relying on it.

## Source
§5.2 and §5 limitations.
