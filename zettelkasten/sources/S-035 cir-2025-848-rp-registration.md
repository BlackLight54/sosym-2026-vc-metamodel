---
id: S-035
title: CIR (EU) 2025/848 — wallet-relying-party registration
type: source
maturity: developing
tags: [topic/eidas, topic/governance, topic/gdpr, prov/external]
citekey:
sources: ["https://eur-lex.europa.eu/eli/reg_impl/2025/848/oj/eng", "https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/discussion-topics/x-rr-relying-party-registration.md"]
related: ["[[C-037 relying-party-registration-regime]]", "[[C-038 relying-party-scope-gap]]", "[[S-036 eidas2-implementing-acts-timeline]]", "[[C-023 gdpr-data-minimization]]", "[[M-009 threats-to-applicability]]"]
created: 2026-06-18
---

**Commission Implementing Regulation (EU) 2025/848, adopted 6 May 2025, published 7 May 2025, applicable from 24 Dec 2026.** Legal basis Art. 5b(11) of Reg. (EU) No 910/2014 (Art. 5b inserted by eIDAS 2 / Reg. (EU) 2024/1183). Verified primary (EUR-Lex + EC repo, 3-0 vote).

The instrument that governs **verifiers**. A wallet-relying party must register, **for each intended use**, a description of that use and the specific attestations/attributes it intends to request (Annex I point 9: "For each intended use, a list of the data, including attestations and attributes, that the relying party intends to request"), with a typed entitlement and its competent DPA. Data minimization is bound at registration: **Art. 5b(3)** of Reg. 910/2014, "Relying parties shall not request users to provide any data other than that indicated pursuant to paragraph 2, point (c)"; over-asking is a ground for suspension/cancellation (CIR 2025/848 Art. 9(2)(c), where an RP "is requesting more attributes than they have registered"). Entitlement **types** (Service_Provider, PID_Provider, QEAA_Provider, Non_Q_EAA_Provider, PUB_EAA_Provider) are set by CIR 2025/848 Annex I; their normative URIs live in ETSI TS 119 475. Per ARF v2.9.0 there is no Trusted List for relying parties; an RP holds **access certificate(s)** from an Access Certificate Authority.

## Relation to this work
This is the **strongest threat to applicability** ([[C-038 relying-party-scope-gap]]): a substantial verifier-side attribute-governance regime that the issuer-centric DCL/CSL/FSL layers do not naturally express. It also operationalizes GDPR minimization ([[C-023 gdpr-data-minimization]]) at registration rather than at format level. **Caveats:** RP registration *certificates* were made optional (April 2025 comitology); cite the "registration record" for the mandatory backstop. The minimization duty attaches to Art. 5b(3), not to ETSI TS6 text. **Refuted (do not assert):** runtime wallet comparison of request-vs-registration as a settled format-orthogonal enforcement mechanism is a discussion-topic proposal, not in force (0-3 vote).

## Links
- [[C-037 relying-party-registration-regime]] — what the regime binds.
- [[C-038 relying-party-scope-gap]] — why it is a threat to the metamodel.
- [[S-036 eidas2-implementing-acts-timeline]] — the batch it belongs to.

## Source
Deep-research synthesis 2026-06-18; cite CIR (EU) 2025/848 and Reg. (EU) 910/2014 Art. 5b.
