---
id: Q-003
title: How to capture range-proof semantics in FSL capabilities?
type: question
maturity: developing
tags: [topic/format, prov/self]
sources: ["sections/05_evaluation.md §5 future work", ".claude/memory/decision_range_proofs_future_work.md"]
related: ["[[D-010 range-proofs-future-work]]", "[[C-016 format-capability-matrix]]"]
created: 2026-06-16
---

How should the FSL capability predicates distinguish **range proofs** (value in an interval, undisclosed)
from the coarser predicate-proof capability?

## Why it matters
Range proofs are common in real eligibility checks (income brackets, age ranges). Capturing them would
let the metamodel express finer privacy requirements and detect a new class of cross-layer gap.

## Status
Out of scope, named as future work. Needs a capability sub-hierarchy under `supports_predicate_proof`.

## Links
- [[D-010 range-proofs-future-work]] — the scoping decision.
- [[C-016 format-capability-matrix]] — where the capability would slot in.

## Source
§5 future work; range-proofs decision.
