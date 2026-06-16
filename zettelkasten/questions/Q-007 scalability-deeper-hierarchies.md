---
id: Q-007
title: Does scalability hold for deeper claim hierarchies and multi-subject credentials?
type: question
maturity: developing
tags: [topic/evaluation, topic/refinery, prov/self]
sources: ["sections/05_evaluation.md §5.2, §5 limitations"]
related: ["[[C-030 scalability-measurement]]", "[[K-004 automated-consistency-checking]]"]
created: 2026-06-16
---

Scalability instances grow by adding credentials with **uniform** structure (one property, shared
subject). Do deeper claim hierarchies or multi-subject credentials stress different metamodel elements
and degrade solver performance?

## Why it matters
The interactive-time claim (sublinear to N=30) rests on uniform instances; a journal version should test
structurally diverse instances to make the scalability claim robust.

## Status
Only uniform instances measured. Needs a richer instance generator.

## Links
- [[C-030 scalability-measurement]] — the measurement to extend.
- [[K-004 automated-consistency-checking]] — the claim relying on it.

## Source
§5.2 and §5 limitations.
