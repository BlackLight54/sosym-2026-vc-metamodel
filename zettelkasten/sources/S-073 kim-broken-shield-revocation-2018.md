---
id: S-073
title: The Broken Shield, Measuring Revocation Effectiveness in the Windows Code-Signing PKI (Kim et al., peer-reviewed)
type: source
maturity: seed
tags: [topic/format, prov/external]
citekey: kim_broken-shield_2018
sources: ["https://www.usenix.org/conference/usenixsecurity18/presentation/kim"]
related: ["[[C-045 design-error-status-revocation-propagation]]", "[[S-072 kim-certified-malware-2017]]", "[[S-071 schroeder-christensen-adcs-certified-preowned-2021]]", "[[S-066 valtna-dvorak-roca-estonia-2021]]", "[[M-015 design-error-taxonomy]]"]
created: 2026-07-17
---

**Kim, Kwon, Kozák, Gates, Dumitraș, 2018, USENIX Security Symposium.**
Non-web-PKI carrier for the status-revocation propagation class: empirically shows that revocation of abused code-signing certificates is frequently mis-dated, ineffective, or unpropagated, so previously trusted signed software remains valid long after compromise, documenting a status and revocation design failure.

## Verified metadata (2026-07-17)
- Title: The Broken Shield: Measuring Revocation Effectiveness in the Windows Code-Signing PKI
- Authors: Doowon Kim, Bum Jun Kwon, Kristián Kozák, Christopher Gates, Tudor Dumitraș
- Venue: 27th USENIX Security Symposium (USENIX Security 2018)
- Year: 2018
- Locator: https://www.usenix.org/conference/usenixsecurity18/presentation/kim
- Verification evidence: existence corroborable via the stable USENIX presentation page and the DBLP record. No DOI (USENIX policy). Relevance is index/metadata plus abstract-derived.
- Verdict: CONFIRMED

## Target use
TAX. Non-web-PKI carrier for the status-revocation propagation design-error class ([[C-045 design-error-status-revocation-propagation]]), extending the taxonomy into code-signing revocation propagation.

## Honesty flags
Peer-reviewed conference paper. The verdict is an existence confirmation: relevance is derived from index metadata and the abstract, not from a full-text read (no full-text pull in the WS2 non-web-PKI arm). USENIX papers carry no DOI; the stable USENIX URL is the locator.

## Links
- [[C-045 design-error-status-revocation-propagation]]: the design-error class this source carries into the code-signing setting.
- [[S-072 kim-certified-malware-2017]]: sibling code-signing carrier (single-point-of-trust), overlapping author team.
- [[S-071 schroeder-christensen-adcs-certified-preowned-2021]]: sibling enterprise-PKI carrier (issuance).
- [[S-066 valtna-dvorak-roca-estonia-2021]]: sibling status-revocation carrier (eIDAS-QC).
- [[M-015 design-error-taxonomy]]: the taxonomy this carrier grounds.

## Source
AF01 WS2 non-web-PKI arm (code-signing / status-revocation); candidates.json.
