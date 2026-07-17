---
id: S-067
title: S/MINE, Collecting and Analyzing S/MIME Certificates at Scale (Öndarö et al., peer-reviewed)
type: source
maturity: seed
tags: [topic/governance, prov/external]
citekey: oendaroe_smime_2025
sources: ["https://www.usenix.org/conference/usenixsecurity25/presentation/oendaroe"]
related: ["[[C-044 design-error-issuance-schema-binding]]", "[[S-068 poddebniak-efail-2018]]", "[[S-069 mueller-johnny-signature-spoofing-2019]]", "[[S-070 clark-securing-email-sok-2021]]", "[[M-015 design-error-taxonomy]]"]
created: 2026-07-17
---

**Öndarö, Kaspereit, Umezulike, Saatjohann, Ising, Schinzel, 2025, USENIX Security Symposium.**
Non-web-PKI carrier for the issuance / schema-binding class: the first large-scale S/MIME certificate ecosystem measurement (over 38M certs from LDAP; 15.5M untrusted, 14.9M non-validatable, 71k vulnerable keys), documenting mass non-compliance and that Outlook-Windows accepts certificates lacking any email address, enabling sender spoofing.

## Verified metadata (2026-07-17)
- Title: S/MINE: Collecting and Analyzing S/MIME Certificates at Scale
- Authors: Gurur Öndarö, Jonas Kaspereit, Samson Umezulike, Christoph Saatjohann, Fabian Ising, Sebastian Schinzel
- Venue: 34th USENIX Security Symposium (USENIX Security 25), pp. 6737-6756
- Year: 2025
- Locator: https://www.usenix.org/conference/usenixsecurity25/presentation/oendaroe
- Verification evidence: existence spot-checked live in AF01 WS2 (USENIX Security 25 PDF resolves). No DOI (USENIX policy). Relevance is index/metadata plus abstract-derived.
- Verdict: CONFIRMED

## Target use
TAX. Non-web-PKI carrier for the issuance / schema-binding design-error class ([[C-044 design-error-issuance-schema-binding]]), extending the taxonomy into S/MIME certificate issuance at ecosystem scale.

## Honesty flags
Peer-reviewed conference paper. The title reads "S/MINE" in the verified record (preserved verbatim; the mine/MIME wordplay is the authors', not an import error). The verdict is an existence confirmation: relevance is derived from index metadata and the abstract, not from a full-text read (no full-text pull in the WS2 non-web-PKI arm). USENIX papers carry no DOI; the stable USENIX URL is the locator.

## Links
- [[C-044 design-error-issuance-schema-binding]]: the design-error class this source carries into the S/MIME setting.
- [[S-068 poddebniak-efail-2018]]: sibling S/MIME carrier (payload-processing expressiveness-gap).
- [[S-069 mueller-johnny-signature-spoofing-2019]]: sibling S/MIME carrier (spec-ambiguity signature spoofing).
- [[S-070 clark-securing-email-sok-2021]]: sibling S/MIME carrier (governance-conflict systematization).
- [[M-015 design-error-taxonomy]]: the taxonomy this carrier grounds.

## Source
AF01 WS2 non-web-PKI arm (smime / issuance); candidates.json.
