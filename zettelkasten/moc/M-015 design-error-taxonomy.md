---
id: M-015
title: Design-error taxonomy MOC (X.509-grounded, VC-ecosystem)
type: moc
maturity: developing
tags: [kind/method, topic/governance, prov/external]
sources: ["zettelkasten/decisions/D-020 rq0-relevance-and-error-taxonomy.md", "context/slr/corpus_map.md", "context/slr/axis_d.md", "context/todos/af01_design_error_taxonomy.md"]
related: ["[[K-016 design-error-taxonomy]]", "[[M-011 claim-delivery-matrix]]", "[[M-012 journal-extension-delta]]", "[[M-004 novelty-and-positioning]]", "[[D-020 rq0-relevance-and-error-taxonomy]]"]
created: 2026-07-17
---

The paper's closing element: a design-error taxonomy for VC-based B2B/B2G credential ecosystems, grounded in the documented X.509/PKI error history (D-020, AF01). Status **`[proposed]`** until Martin approves the class set and wording. The claim is [[K-016 design-error-taxonomy]]; this map holds the classes, their layer mapping, and their carriers.

## Classes (each mapped to the metamodel layer it spans)

| Class | Layer scope | Predicate / instrument | X.509 carrier(s) | VC instance |
|---|---|---|---|---|
| [[C-044 design-error-issuance-schema-binding]] | CSL (DCL to CSL) | error; C1/C2; trace-misalignment anti-pattern | [[S-045 kumar-zlint-misissuance-2018]], [[S-058 georgiev-dangerous-code-2012]] | trace-misalignment anti-pattern |
| [[C-045 design-error-status-revocation-propagation]] | CSL to FSL | propagation | [[S-061 liu-revocation-measurement-2015]] | [[C-036 static-dynamic-revocation-mismatch]] |
| [[C-046 design-error-cross-framework-governance-conflict]] | FSL (roots DCL to FSL, CSL to FSL) | error; **C8** | [[S-057 lopez-why-pki-failed-2005]], [[S-063 grindal-webpki-governance-2025]], [[S-056 gutmann-pki-not-dead-2002]] | **[[C-025 governance-conflict-vertical]]** (headline 1) |
| [[C-047 design-error-cross-credential-expressiveness-gap]] | DCL to FSL | shadow; **C9** | [[S-058 georgiev-dangerous-code-2012]], [[S-059 brubaker-frankencerts-2014]] | **[[C-026 cross-credential-predicate-gap-horizontal]]** (headline 2) |
| [[C-048 design-error-specification-ambiguity]] | FSL (CSL to FSL) | error; C7 conformance | [[S-059 brubaker-frankencerts-2014]], [[S-054 clark-vanoorschot-sok-ssl-2013]] | VCDM-conformance gap |
| [[C-049 design-error-single-point-of-trust]] | **out-of-model** | none in-model | [[S-062 foxit-diginotar-black-tulip-2012]], [[S-048 ellison-schneier-pki-risks-2000]] | [[S-079 sovrin-foundation-dissolution-2025]] (Sovrin collapse); trusted-list governance (Termont/Esteves 2026) |
| [[C-050 design-error-governance-regime-failure]] | **out-of-model** | none in-model | [[S-077 ec-eidas-evaluation-swd-2021]], [[S-076 enisa-trust-services-incidents-2024]], [[S-080 weigl-ssi-construction-governance-2023]] | EU trusted-list regime + SSI trust-framework governance |

Five classes are in-model (mapped to a layer); two are named **out-of-model** (C-049, C-050), runtime and institutional failures the metamodel does not detect but the taxonomy records for completeness. Added C-050 on advisor review (2026-07-17) to stop the governance-arm regime carriers from blurring the in-model formal C8 class C-046.

## Grounding corpus (axis d carriers)

Anticipation and design critique: [[S-048 ellison-schneier-pki-risks-2000]], [[S-056 gutmann-pki-not-dead-2002]], [[S-057 lopez-why-pki-failed-2005]], [[S-054 clark-vanoorschot-sok-ssl-2013]]. Verifier-side and spec ambiguity: [[S-058 georgiev-dangerous-code-2012]], [[S-059 brubaker-frankencerts-2014]]. Measurement: [[S-060 durumeric-https-ecosystem-2013]], [[S-061 liu-revocation-measurement-2015]]. Incident and forensic record: [[S-049 serrano-pki-incidents-2019]], [[S-055 hadan-pki-failures-2021]], [[S-062 foxit-diginotar-black-tulip-2012]]. Governance: [[S-063 grindal-webpki-governance-2025]]. SSI threat neighbor: [[S-050 gruener-ssi-threat-modeling-2023]].

## Non-web-PKI carriers (AF01 WS2, PARTIAL generalization)

The non-web-PKI arm verified 10 carriers (0 unverifiable), one or more per class, from the closer B2B/B2G relatives. See `context/slr/axis_d_nonweb.md`.
- Issuance: [[S-065 parsovs-estonian-eid-2020]] (eID off-chip keys, corrupted moduli), [[S-067 oendaroe-smime-scale-2025]] (S/MIME mass non-compliance), [[S-071 schroeder-christensen-adcs-certified-preowned-2021]] (AD CS ESC1-ESC8).
- Status/revocation: [[S-066 valtna-dvorak-roca-estonia-2021]] (ROCA, ~750k qualified certs revoked), [[S-073 kim-broken-shield-revocation-2018]] (code-signing revocation ineffective).
- Governance conflict: [[S-070 clark-securing-email-sok-2021]] (secure-email stakeholder tussle, fragmented PKI).
- Expressiveness gap: [[S-064 entschew-qwac-2022]] (QWAC attribute-display failure), [[S-068 poddebniak-efail-2018]] (Efail payload-processing leak).
- Spec ambiguity: [[S-069 mueller-johnny-signature-spoofing-2019]] (S/MIME signature spoofing, 15 of 22 clients).
- Single-point-of-trust: [[S-072 kim-certified-malware-2017]] (111 compromised code-signing certificates).

## Governance carriers (AF01 governance arm, 2026-07-17)

A follow-on arm strengthened the two out-of-model governance-facing classes (TSL-gap verdict PARTIAL, see `context/slr/axis_d_nonweb.md`). These are institutional and runtime failures, so per advisor review (2026-07-17) they attach to the out-of-model classes, not to the in-model formal C8 class C-046.
- Governance-regime failure (C-050, out-of-model): [[S-077 ec-eidas-evaluation-swd-2021]] (Commission eIDAS evaluation, supervisory fragmentation), [[S-076 enisa-trust-services-incidents-2024]] (ENISA trust-service incident aggregation), [[S-080 weigl-ssi-construction-governance-2023]] (GIQ, SSI self-sovereignty-versus-institution tension).
- Single-point-of-trust (C-049, out-of-model): [[S-079 sovrin-foundation-dissolution-2025]] (Sovrin Foundation collapse, MainNet read-only on one operator, a deployed-SSI instance, fetched and read directly 2026-07-17), [[S-078 krul-sok-trusting-ssi-2024]] (SoK on where SSI trust re-concentrates).

## Honesty obligations (bind the wording)

- **Grounding is PARTIAL, no longer web-PKI-only.** Every class now carries a non-web-PKI relative (above), and the two governance-facing classes gained EU trusted-list-regime and SSI trust-framework carriers. Residual gaps to state in prose: no carrier documents a Trusted-List-as-artifact failure (only the governance regime behind the lists); the QWAC error record is dominated by the Article 45 policy controversy rather than realized misissuance; the eIDAS-1 evidence is Estonia-concentrated. Krul 2024 ([[S-078 krul-sok-trusting-ssi-2024]]) was earlier abstract-level-dropped for drawing no PKI-failure lessons; it is re-included only for its SSI trust-model analysis, not as a PKI lesson.
- **No single citable PKI design-error taxonomy exists.** The grounding is a documented synthesis; [[S-049 serrano-pki-incidents-2019]] is the closest analog, cited-and-differentiated (WS3 confirmed verbatim: a "taxonomy of incidents and causes" / "taxonomy of failures" from a business-practice lens, not a design-error taxonomy).
- **CONFIRMED means existence, not full-text (verification depth).** The 0-unverifiable count means every carrier's existence and bibliographic fields were corroborated, but for most newer and grey items the full text was bot-blocked (IEEE, USENIX, EUR-Lex, ScienceDirect, SSRN 403s), so relevance was read from abstracts, indexes, and snippets. Only a few were read in full: Bochnia and Serrano (WS3 quote pulls), Certified Pre-Owned ([[S-071 schroeder-christensen-adcs-certified-preowned-2021]]), and the Sovrin notice ([[S-079 sovrin-foundation-dissolution-2025]], fetched 2026-07-17). Before Martin enters Zotero and any quote or specific figure is frozen, the snippet-only rows need a real full-text read; each S-note's honesty flag records its own depth.

## Links
- [[K-016 design-error-taxonomy]]: the binding claim.
- [[D-020 rq0-relevance-and-error-taxonomy]]: the mandate.
- [[M-012 journal-extension-delta]]: the taxonomy as a delta closing element.
- [[M-004 novelty-and-positioning]]: where the X.509 carriers position against related work.

## Source
AF01 (`context/todos/af01_design_error_taxonomy.md`); proto-SLR corpus axis d; D-020.
