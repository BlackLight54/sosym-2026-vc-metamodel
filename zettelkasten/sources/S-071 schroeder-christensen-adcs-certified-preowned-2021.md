---
id: S-071
title: Certified Pre-Owned, Abusing Active Directory Certificate Services (Schroeder & Christensen, report/whitepaper)
type: source
maturity: seed
tags: [topic/governance, prov/external]
citekey: schroeder_certified-preowned_2021
sources: ["https://specterops.io/wp-content/uploads/sites/3/2022/06/Certified_Pre-Owned.pdf"]
related: ["[[C-044 design-error-issuance-schema-binding]]", "[[S-072 kim-certified-malware-2017]]", "[[S-073 kim-broken-shield-revocation-2018]]", "[[M-015 design-error-taxonomy]]"]
created: 2026-07-17
---

**Schroeder, Christensen, 2021, SpecterOps (technical whitepaper).**
Non-web-PKI carrier for the issuance / schema-binding class: catalogs the ESC1 to ESC8 class of AD CS design and deployment errors in which certificate-template misconfigurations let a low-privileged enrollee obtain a certificate asserting a high-privileged identity, escalating to domain compromise across nearly every enterprise network the authors analyzed.

## Verified metadata (2026-07-17)
- Title: Certified Pre-Owned: Abusing Active Directory Certificate Services
- Authors: Will Schroeder, Lee Christensen
- Venue: SpecterOps (technical whitepaper), Version 1.0.1
- Year: 2021
- Locator: https://specterops.io/wp-content/uploads/sites/3/2022/06/Certified_Pre-Owned.pdf
- Verification evidence: verified against locally extracted full text (the publisher-hosted SpecterOps PDF); this is the one WS2 non-web-PKI item read in full text rather than metadata-only.
- Verdict: CONFIRMED

## Target use
TAX. Non-web-PKI carrier for the issuance / schema-binding design-error class ([[C-044 design-error-issuance-schema-binding]]), extending the taxonomy into enterprise PKI (AD CS) template-misconfiguration issuance errors.

## Honesty flags
Grey literature: a practitioner whitepaper (kind=report), not a peer-reviewed publication. The WS2 finder noted that peer-reviewed academic literature on AD CS deployment errors is thin, so the authoritative documented-error catalog (ESC1 to ESC8) is this grey source. Unlike the other nine carriers, its relevance was confirmed against locally extracted full text.

## Links
- [[C-044 design-error-issuance-schema-binding]]: the design-error class this source carries into the enterprise-PKI setting.
- [[S-072 kim-certified-malware-2017]]: sibling enterprise/code-signing carrier (single-point-of-trust).
- [[S-073 kim-broken-shield-revocation-2018]]: sibling code-signing carrier (status-revocation).
- [[M-015 design-error-taxonomy]]: the taxonomy this carrier grounds.

## Source
AF01 WS2 non-web-PKI arm (enterprise-pki / issuance); candidates.json.
