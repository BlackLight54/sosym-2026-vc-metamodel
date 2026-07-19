---
id: C-048
title: Specification-ambiguity design-error class
type: concept
maturity: developing
tags: [topic/format, kind/result, layer/cross]
sources: ["context/slr/axis_d.md", "context/slr/corpus_map.md", "zettelkasten/claims/K-016 design-error-taxonomy.md"]
related: ["[[K-016 design-error-taxonomy]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-012 error-predicate]]", "[[S-059 brubaker-frankencerts-2014]]", "[[S-054 clark-vanoorschot-sok-ssl-2013]]"]
created: 2026-07-17
---

**`[proposed]` (AF01/K-016).** Design-error class: an ambiguous or underspecified format or profile admits divergent conformant implementations, so credentials that each pass their own reading of the specification fail to interoperate or silently weaken a security property. The VC-ecosystem analogue of PKI **specification ambiguity**, the class of failures that arise not from a wrong implementation but from a specification that permits incompatible correct ones.

- **Layer scope:** FSL, with CSL to FSL where the ambiguity concerns how schema-level facts must be represented.
- **Detection instrument:** `error` predicate; the VCDM-conformance constraint C7 ([[C-013 cross-layer-constraint-taxonomy-c1-c9]]) is the in-model check that pins one reading; residual ambiguity outside a pinned profile is flagged rather than resolved.
- **X.509 precedent carrier:** [[S-059 brubaker-frankencerts-2014]] (Frankencerts, adversarially generated certificates exposing divergent validation from an ambiguous specification); [[S-054 clark-vanoorschot-sok-ssl-2013]] (systematization of past SSL/HTTPS challenges, many rooted in specification ambiguity).
- **VC instance:** VCDM-conformance disagreements at the format layer; a corpus-verified VC-world instance is a target of the AF01 non-web-PKI arm.

## Links
- [[K-016 design-error-taxonomy]]: the taxonomy this class belongs to.
- [[C-013 cross-layer-constraint-taxonomy-c1-c9]]: C7 conformance is the in-model instrument.
- [[C-012 error-predicate]]: the predicate kind.

## Source
AF01 WS1 synthesis; corpus axis d (spec-ambiguity carriers); K-016.
