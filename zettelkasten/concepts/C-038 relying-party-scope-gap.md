---
id: C-038
title: Relying-party scope gap (threat to applicability)
type: concept
maturity: developing
tags: [topic/governance, topic/eidas, layer/cross]
sources: ["https://eur-lex.europa.eu/eli/reg_impl/2025/848/oj/eng", "sections/07_conclusion.md"]
related: ["[[C-037 relying-party-registration-regime]]", "[[S-035 cir-2025-848-rp-registration]]", "[[C-001 three-layer-metamodel-overview]]", "[[M-009 threats-to-applicability]]", "[[K-010 necessity-of-multilayer-modeling]]", "[[D-013 verifier-scope-issuer-remit]]", "[[C-040 verifier-side-extension-sketch]]"]
created: 2026-06-18
---

The metamodel's three layers (DCL/CSL/FSL) are **issuer- and credential-structure-centric**: they formalize what facts exist, how they are packaged into credentials, and which formats can carry them. The EU framework also imposes governance on the **verifier** side and on the ecosystem around the credential: relying-party registration and per-intended-use attribute declaration ([[C-037 relying-party-registration-regime]]), access entitlements/certificates, cross-border identity matching (CIR 2025/846), breach notification (2025/847), certified-wallet listing (2025/849), trust lists, and revocation/status governance. An issuer-side metamodel does not naturally express these. This is a genuine boundary, not a defect. **Resolved by [[D-013 verifier-scope-issuer-remit]] (2026-07-04):** the paper scopes itself to issuer-side credential design and names verifier-side governance as the adjacent extension of the same cross-layer-constraint method ([[C-040 verifier-side-extension-sketch]]), citing CIR 2025/848 as breadth evidence. The current draft (sections 05, 07) still leaves the verifier axis silent; the committed §5.3 external-validity paragraph is the outstanding writing task (O-EUTHREAT).

## Links
- [[D-013 verifier-scope-issuer-remit]] — the committed scoping decision.
- [[C-040 verifier-side-extension-sketch]] — what the named extension would take.
- [[C-037 relying-party-registration-regime]] — the concrete regime outside the model's reach.
- [[C-001 three-layer-metamodel-overview]] — the layers whose scope this bounds.
- [[K-010 necessity-of-multilayer-modeling]] — the prerequisite claim this qualifies.
- [[M-009 threats-to-applicability]] — the threat map this is the head of.

## Source
Deep-research synthesis 2026-06-18; CIR (EU) 2025/848; local check of sections/05, 07.
