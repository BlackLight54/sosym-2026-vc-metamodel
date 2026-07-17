---
id: C-049
title: Single-point-of-trust / root-governance design-error class (out-of-model)
type: concept
maturity: developing
tags: [topic/governance, kind/result, prov/external]
sources: ["context/slr/axis_d.md", "context/slr/corpus_map.md", "zettelkasten/claims/K-016 design-error-taxonomy.md"]
related: ["[[K-016 design-error-taxonomy]]", "[[S-062 foxit-diginotar-black-tulip-2012]]", "[[S-048 ellison-schneier-pki-risks-2000]]", "[[S-049 serrano-pki-incidents-2019]]"]
created: 2026-07-17
---

**`[proposed]` (AF01/K-016).** Design-error class: trust is concentrated in a single root or trusted-list authority whose compromise or misgovernance breaks the whole ecosystem at once. The VC-ecosystem analogue of PKI **single-point-of-trust compromise**, the class the DigiNotar breach exemplifies.

- **Layer scope:** **out-of-model.** The metamodel captures design-time structural constraints across DCL, CSL and FSL; single-point-of-trust failure is a runtime trust-management and operational-governance property, not a structural relation among credential facts, so it is named explicitly as out-of-model rather than forced onto a layer. This honesty move (per AF01 step 2) keeps the taxonomy systematic without overclaiming metamodel coverage.
- **Detection instrument:** none in-model; the class is documented for completeness and to scope the metamodel's reach.
- **X.509 precedent carrier:** [[S-062 foxit-diginotar-black-tulip-2012]] (Black Tulip, the DigiNotar forensic record); [[S-048 ellison-schneier-pki-risks-2000]] (root-trust and CA-basis risks enumerated pre-deployment); [[S-049 serrano-pki-incidents-2019]] (governance and business-practice failures dominate the incident record).
- **VC instance:** the trusted-list governance error class (Termont/Esteves 2026, corpus axis b) is the closest VC-world analogue; it too sits outside the design-time metamodel.

## Links
- [[K-016 design-error-taxonomy]]: the taxonomy this class belongs to; this is its explicitly out-of-model class.
- [[S-062 foxit-diginotar-black-tulip-2012]]: the canonical single-point-of-trust failure.

## Source
AF01 WS1 synthesis; corpus axis d (single-point-of-trust carriers); K-016.
