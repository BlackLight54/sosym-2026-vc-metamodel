---
id: D-010
title: Range proofs are future work, not in scope
type: decision
maturity: permanent
tags: [topic/format, kind/method, prov/self]
sources: [".claude/memory/decision_range_proofs_future_work.md"]
related: ["[[C-016 format-capability-matrix]]", "[[Q-003 range-proof-semantics]]"]
created: 2026-06-16
---

The formalization addresses predicate proofs but does **not** distinguish range proofs (constraining a
numeric value to an interval without revealing it). Range-proof semantics in the FSL capability
predicates are explicitly future work, mentioned in the conclusion.

## Rationale
Range proofs are a refinement of the predicate-proof capability; adding them now would expand the FSL
without changing the cross-layer contribution. Scoping them out keeps the headline results focused.

## Links
- [[C-016 format-capability-matrix]] — where range-proof capability would extend.
- [[Q-003 range-proof-semantics]] — the future-work question.

## Source
range-proofs-future-work decision.
