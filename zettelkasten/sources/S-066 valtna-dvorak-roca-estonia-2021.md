---
id: S-066
title: Vulnerability of State-Provided Electronic Identification, The Case of ROCA in Estonia (Valtna-Dvořák et al., peer-reviewed)
type: source
maturity: seed
tags: [topic/format, prov/external]
citekey: valtna-dvorak_roca_2021
sources: ["https://doi.org/10.1007/978-3-030-86611-2_6"]
related: ["[[C-045 design-error-status-revocation-propagation]]", "[[S-065 parsovs-estonian-eid-2020]]", "[[S-064 entschew-qwac-2022]]", "[[M-015 design-error-taxonomy]]"]
created: 2026-07-17
---

**Valtna-Dvořák, Lips, Tsap, Ottis, Priisalu, Draheim, 2021, EGOVIS (LNCS 12926, Springer).**
Non-web-PKI carrier for the status-revocation propagation class: documents the 2017 ROCA crisis in which roughly 750,000 Estonian eID qualified certificates were suspended and later revoked because Infineon chips generated factorable RSA keys, evidencing a mass status-revocation and crisis-governance failure in a fully deployed eIDAS qualified-certificate scheme.

## Verified metadata (2026-07-17)
- Title: Vulnerability of State-Provided Electronic Identification: The Case of ROCA in Estonia
- Authors: Astrid Valtna-Dvořák, Silvia Lips, Valentyna Tsap, Rain Ottis, Jaan Priisalu, Dirk Draheim
- Venue: EGOVIS 2021, Electronic Government and the Information Systems Perspective, LNCS 12926, Springer, pp. 73-85
- Year: 2021
- Locator: https://doi.org/10.1007/978-3-030-86611-2_6
- Verification evidence: existence corroborable by resolving the Springer DOI 10.1007/978-3-030-86611-2_6. Relevance is index/metadata plus abstract-derived.
- Verdict: CONFIRMED

## Target use
TAX. Non-web-PKI carrier for the status-revocation propagation design-error class ([[C-045 design-error-status-revocation-propagation]]), extending the taxonomy from web-PKI revocation into national eIDAS qualified-certificate revocation at scale.

## Honesty flags
Peer-reviewed conference paper (Springer LNCS). The verdict is an existence confirmation: relevance is derived from index metadata and the abstract, not from a full-text read (no full-text pull in the WS2 non-web-PKI arm). This and Parsovs are both Estonia; they carry distinct classes (status-revocation vs issuance), and the WS2 finder flagged that breadth across other member states was not exhaustively surveyed.

## Links
- [[C-045 design-error-status-revocation-propagation]]: the design-error class this source carries into the eIDAS-QC setting.
- [[S-065 parsovs-estonian-eid-2020]]: sibling Estonian eID carrier (issuance-side failures on the same scheme).
- [[S-064 entschew-qwac-2022]]: sibling eIDAS-QC carrier (expressiveness-gap).
- [[M-015 design-error-taxonomy]]: the taxonomy this carrier grounds.

## Source
AF01 WS2 non-web-PKI arm (eidas1-qc / status-revocation); candidates.json.
