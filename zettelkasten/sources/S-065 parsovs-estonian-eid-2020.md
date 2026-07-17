---
id: S-065
title: Estonian Electronic Identity Card, Security Flaws in Key Management (Parsovs, peer-reviewed)
type: source
maturity: seed
tags: [topic/governance, prov/external]
citekey: parsovs_estonian-eid_2020
sources: ["https://www.usenix.org/conference/usenixsecurity20/presentation/parsovs"]
related: ["[[C-044 design-error-issuance-schema-binding]]", "[[S-066 valtna-dvorak-roca-estonia-2021]]", "[[S-064 entschew-qwac-2022]]", "[[M-015 design-error-taxonomy]]"]
created: 2026-07-17
---

**Parsovs, 2020, USENIX Security Symposium.**
Non-web-PKI carrier for the issuance / schema-binding class: documents qualified-certificate issuance failures on Estonia's national eID, where private keys were generated off-chip contrary to requirements, identical private keys were imported into different cardholders' cards enabling mutual impersonation, and corrupted RSA moduli appeared in issued certificates (one case allowing full private-key recovery).

## Verified metadata (2026-07-17)
- Title: Estonian Electronic Identity Card: Security Flaws in Key Management
- Authors: Arnis Parsovs
- Venue: 29th USENIX Security Symposium (USENIX Security 20)
- Year: 2020
- Locator: https://www.usenix.org/conference/usenixsecurity20/presentation/parsovs
- Verification evidence: existence corroborable via the stable USENIX presentation page and DBLP record. No DOI (USENIX policy). Relevance is index/metadata plus abstract-derived.
- Verdict: CONFIRMED

## Target use
TAX. Non-web-PKI carrier for the issuance / schema-binding design-error class ([[C-044 design-error-issuance-schema-binding]]), extending the taxonomy from web-PKI misissuance into national eIDAS qualified-certificate issuance.

## Honesty flags
Peer-reviewed conference paper. The verdict is an existence confirmation: relevance is derived from index metadata and the abstract, not from a full-text read (no full-text pull in the WS2 non-web-PKI arm). USENIX papers carry no DOI; the stable USENIX URL is the locator.

## Links
- [[C-044 design-error-issuance-schema-binding]]: the design-error class this source carries into the eIDAS-QC setting.
- [[S-066 valtna-dvorak-roca-estonia-2021]]: sibling Estonian eID carrier (status-revocation crisis on the same scheme).
- [[S-064 entschew-qwac-2022]]: sibling eIDAS-QC carrier (expressiveness-gap).
- [[M-015 design-error-taxonomy]]: the taxonomy this carrier grounds.

## Source
AF01 WS2 non-web-PKI arm (eidas1-qc / issuance); candidates.json.
