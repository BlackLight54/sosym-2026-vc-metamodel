---
id: K-016
title: Design-error taxonomy for VC ecosystems (X.509-grounded)
type: claim
maturity: developing
tags: [topic/ssi, topic/governance, kind/result, prov/external]
status: partial
sources: ["zettelkasten/decisions/D-020 rq0-relevance-and-error-taxonomy.md", "context/slr/corpus_map.md", "context/slr/axis_d.md", "context/todos/af01_design_error_taxonomy.md"]
related: ["[[D-020 rq0-relevance-and-error-taxonomy]]", "[[C-044 design-error-issuance-schema-binding]]", "[[C-045 design-error-status-revocation-propagation]]", "[[C-046 design-error-cross-framework-governance-conflict]]", "[[C-047 design-error-cross-credential-expressiveness-gap]]", "[[C-048 design-error-specification-ambiguity]]", "[[C-049 design-error-single-point-of-trust]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[C-029 anti-pattern-catalog]]", "[[C-025 governance-conflict-vertical]]", "[[C-026 cross-credential-predicate-gap-horizontal]]", "[[M-011 claim-delivery-matrix]]", "[[M-012 journal-extension-delta]]"]
created: 2026-07-17
---

**Status: `[proposed]`** (D-020; wording and class set pending Martin's approval, per AF01). No prose promises the taxonomy until then.

The paper closes with a **design-error taxonomy for VC-based B2B/B2G credential ecosystems**, grounded in the documented X.509/PKI error history rather than in the paper's own examples. It classifies the design errors such an ecosystem can be expected to face into six classes; each class is mapped to the metamodel layer or layer-pair the error spans (DCL, CSL, FSL, and their cross-layer combinations), carries at least one documented PKI precedent or one corpus-verified VC-world instance, and names the detection instrument (an error, propagation, or shadow predicate, and where applicable a C1-C9 constraint or a C-029 anti-pattern). Classes that the metamodel cannot express are named **out-of-model** rather than forced into a layer. The paper's two headline results each instantiate exactly one class: the vertical income-governance conflict is a *cross-framework governance conflict*, the horizontal floor-area gap is a *cross-credential expressiveness gap*.

The taxonomy is the deliverable that converts RQ0's closing arc from a mandate into a claim: if VC ecosystems emerge as hypothesized, their design errors are foreseeable from the current deployment spectrum and the error history of the predecessor infrastructure.

## Evidence
- Grounding corpus: axis d (X.509/PKI design-error, misuse, and failure taxonomies), `context/slr/corpus_map.md` and `context/slr/axis_d.md`, 13 adversarially verified sources spanning a 25-year arc (anticipation, design critique, systematization, empirical measurement, incident taxonomization, forensic record, governance analysis).
- Class carriers: see the six class C-notes; each cites a verified PKI precedent, most already S-noted ([[S-048 ellison-schneier-pki-risks-2000]], [[S-049 serrano-pki-incidents-2019]], [[S-045 kumar-zlint-misissuance-2018]], [[S-050 gruener-ssi-threat-modeling-2023]]) with the remaining axis-d must-cite carriers imported as S-054..S-063 (AF01 WS4).
- Sync with the metamodel results: [[C-025 governance-conflict-vertical]] (C8) and [[C-026 cross-credential-predicate-gap-horizontal]] (C9) place uniquely into classes [[C-046 design-error-cross-framework-governance-conflict]] and [[C-047 design-error-cross-credential-expressiveness-gap]].

## Relation to the two existing taxonomies (not a replacement)
This is an **outer classification** keyed to externally documented error phenomena. It references, and does not supersede, the two internal schemes:
- [[C-013 cross-layer-constraint-taxonomy-c1-c9]] supplies the *constraint instruments* (C1-C9) that detect or prevent a class in the running example.
- [[C-029 anti-pattern-catalog]] supplies the *detected structural signatures* inside the partial model.
Each class C-note names its instrument and signature where one exists, so "each headline lands in exactly one class" is checkable via the wikilinks.

## Honesty flags (recorded on the claim; both bind the wording)
- **Grounding is no longer web-PKI-only (PARTIAL).** The AF01 non-web-PKI arm (WS2) verified 10 carriers from the closer B2B/B2G relatives, 0 unverifiable, giving **every one of the six classes** a non-web-PKI carrier: eIDAS-1 qualified certificates ([[S-064 entschew-qwac-2022]] QWAC, [[S-065 parsovs-estonian-eid-2020]], [[S-066 valtna-dvorak-roca-estonia-2021]] ROCA), S/MIME ([[S-067 oendaroe-smime-scale-2025]], [[S-068 poddebniak-efail-2018]], [[S-069 mueller-johnny-signature-spoofing-2019]], [[S-070 clark-securing-email-sok-2021]]), and enterprise/code-signing PKI ([[S-071 schroeder-christensen-adcs-certified-preowned-2021]] AD CS, [[S-072 kim-certified-malware-2017]], [[S-073 kim-broken-shield-revocation-2018]]). The claim can now generalize beyond web PKI to the relatives; residual honest gaps (record in prose): no documented TSL/trusted-list governance incident was found, the QWAC record is dominated by the Article 45 policy controversy rather than realized misissuance, and the eIDAS-1 evidence is Estonia-concentrated. See [[M-015 design-error-taxonomy]] and `context/slr/axis_d_nonweb.md`.
- **No single citable PKI design-error taxonomy exists.** The grounding is a *documented synthesis* across the axis-d corpus; [[S-049 serrano-pki-incidents-2019]] is the closest analog, cited-and-differentiated. WS3 confirmed this verbatim from full text: Serrano self-describes a "taxonomy of the different types of incidents and their causes" and a "taxonomy of failures" from a business-practices lens, not a design-error taxonomy.

## Open
- `[proposed]` class set and wording pending Martin's approval (D-020).
- WS2 non-web-PKI arm: **done** (10 carriers, PARTIAL generalization; see honesty flag). Residual: no TSL/trusted-list incident found; QWAC record policy-dominated; eIDAS-1 evidence Estonia-heavy.
- WS3 full-text pulls: Bochnia and Serrano **confirmed verbatim**; Schmidt "ill-defined" is verbatim in the abstract but the full-text pull is still bot-blocked (manual IEEE pull to freeze); Sroor "visual" supported, "informal" is our framing (manual ScienceDirect pull to freeze, do not attribute the sibling thesis to the Procedia paper). Hadan's dimensions (code, cryptography, organizational, human) and the expert-vs-incident divergence are verbatim-confirmed and already correct in [[S-055 hadan-pki-failures-2021]]; the "technical, economic, legal, social" framing is Lopez 2005's, correctly attributed in the corpus, and must not be pinned on Hadan.
- No dedicated section yet; placement via the spine (`skills/plan_spine`).

## Links
- [[D-020 rq0-relevance-and-error-taxonomy]]: the decision that mandates the taxonomy as closing element, X.509-motivated.
- [[M-012 journal-extension-delta]]: the taxonomy is a §4 delta closing element.
- The six class C-notes C-044..C-049.

## Source
AF01 (`context/todos/af01_design_error_taxonomy.md`); proto-SLR corpus axis d; D-020.
