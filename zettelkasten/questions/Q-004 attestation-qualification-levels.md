---
id: Q-004
title: Should the metamodel distinguish attestation qualification levels (PID/QEAA/EAA)?
type: question
maturity: developing
tags: [topic/eidas, layer/csl, prov/self]
sources: ["sections/05_evaluation.md §5.1.2"]
related: ["[[K-006 expressiveness-validation]]", "[[C-022 eidas-arf-format-mandate]]"]
created: 2026-06-16
---

Three of the five *partially expressible* eIDAS ARF constraints (ARF-C2, C3, C6) condition format
eligibility on attestation qualification level (PID, QEAA, non-qualified EAA), which the metamodel does
not yet distinguish. Should it?

## Why it matters
Closing this gap moves three constraints from partially to fully expressible, directly strengthening the
expressiveness claim (K-006, the highest-risk claim).

## Status
Identified root cause; closable by extending the metaclass hierarchy with attestation subtypes, without
changing the constraint formalization approach.

## Links
- [[K-006 expressiveness-validation]] — the claim it strengthens.
- [[C-022 eidas-arf-format-mandate]] — the ARF source.

## Source
§5.1.2.
