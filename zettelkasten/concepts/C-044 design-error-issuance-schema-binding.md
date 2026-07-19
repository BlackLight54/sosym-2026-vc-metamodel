---
id: C-044
title: Issuance / schema-binding design-error class
type: concept
maturity: developing
tags: [topic/governance, kind/result, layer/cross]
sources: ["context/slr/axis_d.md", "context/slr/corpus_map.md", "zettelkasten/claims/K-016 design-error-taxonomy.md"]
related: ["[[K-016 design-error-taxonomy]]", "[[C-029 anti-pattern-catalog]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-012 error-predicate]]", "[[S-045 kumar-zlint-misissuance-2018]]", "[[S-058 georgiev-dangerous-code-2012]]"]
created: 2026-07-17
---

**`[proposed]` (AF01/K-016).** Design-error class: an issuer binds facts into a credential it is not authoritative for, or the schema partitions domain facts into credentials incorrectly, so a structurally valid credential asserts claims that do not hold at the domain layer. The VC-ecosystem analogue of PKI **misissuance**: a certificate (credential) issued with wrong, unauthorized, or misbound attributes.

- **Layer scope:** CSL, with the DCL to CSL trace (a fact is placed in a credential without a valid domain-graph backing).
- **Detection instrument:** `error` predicate; the entity-alignment and trace-consistency constraints C1/C2 ([[C-013 cross-layer-constraint-taxonomy-c1-c9]]); the trace-misalignment anti-pattern in [[C-029 anti-pattern-catalog]].
- **X.509 precedent carrier:** [[S-045 kumar-zlint-misissuance-2018]] (ZLint, misissuance made machine-checkable); [[S-058 georgiev-dangerous-code-2012]] (validation code accepts malformed/misbound certificates).
- **VC instance:** the trace-misalignment anti-pattern (`prop_t`/`prop_s`), a CSL credential whose claims do not trace to a well-formed DCL fact.

## Links
- [[K-016 design-error-taxonomy]]: the taxonomy this class belongs to.
- [[C-029 anti-pattern-catalog]]: the detected signature (trace misalignment).
- [[C-012 error-predicate]]: the predicate kind.

## Source
AF01 WS1 synthesis; corpus axis d (misissuance carriers); K-016.
