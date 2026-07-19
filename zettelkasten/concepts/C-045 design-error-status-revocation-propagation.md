---
id: C-045
title: Status / revocation-propagation design-error class
type: concept
maturity: developing
tags: [topic/format, kind/result, layer/cross]
sources: ["context/slr/axis_d.md", "context/slr/corpus_map.md", "zettelkasten/claims/K-016 design-error-taxonomy.md"]
related: ["[[K-016 design-error-taxonomy]]", "[[C-036 static-dynamic-revocation-mismatch]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-010 propagation-rule-and-negative-elimination]]", "[[S-061 liu-revocation-measurement-2015]]"]
created: 2026-07-17
---

**`[proposed]` (AF01/K-016).** Design-error class: credential status semantics (validity, suspension, revocation) fail to propagate consistently across the schema and format layers, so a credential that is revoked or suspended at the domain or schema layer can still be presented and accepted at the format layer. The VC-ecosystem analogue of PKI **revocation and status failure**: the gap between issuing a revocation and its being observed at verification time.

- **Layer scope:** CSL to FSL (the status fact and its format-level representation diverge).
- **Detection instrument:** `propagation` predicate ([[C-010 propagation-rule-and-negative-elimination]]); surfaces as a static-versus-dynamic status mismatch rather than a single-layer violation.
- **X.509 precedent carrier:** [[S-061 liu-revocation-measurement-2015]] (end-to-end measurement showing revocation is widely unenforced in practice).
- **VC instance:** [[C-036 static-dynamic-revocation-mismatch]], the format-versus-status-model mismatch already in the corpus.

## Links
- [[K-016 design-error-taxonomy]]: the taxonomy this class belongs to.
- [[C-036 static-dynamic-revocation-mismatch]]: the corpus-verified VC instance.
- [[C-010 propagation-rule-and-negative-elimination]]: the predicate kind.

## Source
AF01 WS1 synthesis; corpus axis d (revocation carrier); K-016.
