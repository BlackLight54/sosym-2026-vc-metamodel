---
id: C-037
title: Relying-party registration regime (verifier-side attribute governance)
type: concept
maturity: developing
tags: [topic/eidas, topic/governance, topic/gdpr]
sources: ["https://eur-lex.europa.eu/eli/reg_impl/2025/848/oj/eng"]
related: ["[[S-035 cir-2025-848-rp-registration]]", "[[C-038 relying-party-scope-gap]]", "[[C-023 gdpr-data-minimization]]", "[[C-018 governance-annotations]]", "[[C-024 two-tier-governance-framing]]", "[[C-040 verifier-side-extension-sketch]]", "[[S-030 eidas2-regulation-2024-1183]]"]
created: 2026-06-18
---

eIDAS 2 governs verifiers, not only issuers. Under Art. 5b of Reg. (EU) 910/2014 and CIR (EU) 2025/848, a wallet-relying party must register with a national registrar and declare, **per intended use**, the specific attestations and attributes it will request, a typed entitlement (Service_Provider, PID_Provider, QEAA_Provider, Non_Q_EAA_Provider, PUB_EAA_Provider), and its competent DPA. Data minimization is enforced at the registration boundary: an RP may not request data beyond what it registered (Art. 5b(3)), over-asking grounds suspension (CIR 2025/848 Art. 9(2)(c)), and access is mediated by access certificates from an Access Certificate Authority rather than a Trusted List. This is a constraint on *who may ask for what*, orthogonal to issuer-side credential structure and format.

## Links
- [[S-035 cir-2025-848-rp-registration]] — the instrument.
- [[C-038 relying-party-scope-gap]] — why this is a threat to the metamodel's reach.
- [[C-040 verifier-side-extension-sketch]] — the model elements expressing this regime would take.
- [[C-023 gdpr-data-minimization]] — minimization here bound at registration, not at format.
- [[C-018 governance-annotations]] — the issuer-side analogue the metamodel already models.

## Source
Deep-research synthesis 2026-06-18; CIR (EU) 2025/848; Reg. (EU) 910/2014 Art. 5b.
