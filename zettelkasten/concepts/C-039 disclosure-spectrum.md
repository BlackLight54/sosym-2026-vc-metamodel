---
id: C-039
title: Disclosure spectrum (four tiers, three trade-off axes)
type: concept
maturity: developing
tags: [topic/format, layer/fsl, prov/notion]
sources: ["inbox/notion/09-thesis-map.md", "inbox/notion/08-outline-overarching-example.md"]
related: ["[[C-016 format-capability-matrix]]", "[[C-034 statutory-unlinkability-gap]]", "[[S-038 eudiw-zkp-ts13-ts14]]", "[[Q-003 range-proof-semantics]]", "[[Q-005 claim-granularity-privacy-annotations]]"]
created: 2026-07-04
---

Credential disclosure capabilities form an ordered spectrum of four tiers, by decreasing disclosure and
increasing privacy: (1) **full credential presentation** (JWT-VC: the verifier sees everything);
(2) **field-level selective disclosure** (SD-JWT VC `_sd`, mdoc MSO: chosen fields revealed, the rest as
salted hashes — disclosed salts are stable across presentations, hence cross-verifier linkable);
(3) **predicate proofs** (a boolean over a hidden value, BBS/CL-based); (4) **general zero-knowledge**
(arbitrary-circuit proofs, can hide even the issuer signature). Three axes traverse the spectrum:
*expressivity* rises tier by tier, *ecosystem support* falls, *development cost* rises — sharply at
tier 4.

The FSL capability predicates (`supports_selective_disclosure`, `supports_predicate_proof`,
`supports_zkp`) are point samples of this spectrum. The ordering explains the paper's central capability
facts in one structure: the mandated EU baseline sits at tier 2, the GDPR operationalization (C6)
demands tier 3, and the published-but-non-mandated TS13/TS14 specs occupy tiers 3–4. A refined FSL
capability hierarchy (range proofs, claim-granularity annotations) would be a refinement of this
spectrum. Candidate table or figure for the journal's background or FSL elaboration.

## Links
- [[C-016 format-capability-matrix]] — the point-sampled capabilities this orders.
- [[C-034 statutory-unlinkability-gap]] — tier 2 vs tier 3–4 is exactly the statutory gap.
- [[S-038 eudiw-zkp-ts13-ts14]] — the EU specs at tiers 3–4.
- [[Q-003 range-proof-semantics]], [[Q-005 claim-granularity-privacy-annotations]] — refinements the
  spectrum would organize.

## Source
Notion thesis map and lecture outline (inbox pages 08, 09), distilled 2026-07-04.
