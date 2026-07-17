---
id: S-070
title: SoK Securing Email, A Stakeholder-Based Analysis (Clark et al., peer-reviewed)
type: source
maturity: seed
tags: [topic/governance, prov/external]
citekey: clark_securing-email_2021
sources: ["https://doi.org/10.1007/978-3-662-64322-8_18"]
related: ["[[C-046 design-error-cross-framework-governance-conflict]]", "[[S-067 oendaroe-smime-scale-2025]]", "[[S-068 poddebniak-efail-2018]]", "[[S-069 mueller-johnny-signature-spoofing-2019]]", "[[M-015 design-error-taxonomy]]"]
created: 2026-07-17
---

**Clark, van Oorschot, Ruoti, Seamons, Zappala, 2021, Financial Cryptography and Data Security (FC 2021, LNCS 12674).**
Non-web-PKI carrier for the cross-framework governance-conflict class: a systematization tracing how stakeholder tussles produced a fragmented, non-interoperable secure-email PKI, documenting the structural key-management and trust-establishment weaknesses that account for S/MIME's failure to deliver ubiquitous authenticity.

## Verified metadata (2026-07-17)
- Title: SoK: Securing Email - A Stakeholder-Based Analysis
- Authors: Jeremy Clark, Paul C. van Oorschot, Scott Ruoti, Kent E. Seamons, Daniel Zappala
- Venue: Financial Cryptography and Data Security (FC 2021), LNCS 12674, pp. 360-390
- Year: 2021
- Locator: https://doi.org/10.1007/978-3-662-64322-8_18
- Verification evidence: existence corroborable by resolving the Springer DOI 10.1007/978-3-662-64322-8_18. Distinct from the corpus SSL/TLS SoK by Clark and van Oorschot (S-054): this is the secure-email systematization, genuinely non-web-PKI. Relevance is index/metadata plus abstract-derived.
- Verdict: CONFIRMED

## Target use
TAX. Non-web-PKI carrier for the cross-framework governance-conflict design-error class ([[C-046 design-error-cross-framework-governance-conflict]]), extending the taxonomy into secure-email (S/MIME) governance and stakeholder-conflict failures.

## Honesty flags
Peer-reviewed conference paper (Springer LNCS). The verdict is an existence confirmation: relevance is derived from index metadata and the abstract, not from a full-text read (no full-text pull in the WS2 non-web-PKI arm). Title punctuation was normalized in the finder to remove an em dash (rendered here with a hyphen). Not to be confused with the SSL/TLS SoK ([[S-054 clark-vanoorschot-sok-ssl-2013]]).

## Links
- [[C-046 design-error-cross-framework-governance-conflict]]: the design-error class this source carries into the secure-email setting.
- [[S-067 oendaroe-smime-scale-2025]]: sibling S/MIME carrier (issuance at scale).
- [[S-068 poddebniak-efail-2018]]: sibling S/MIME carrier (payload-processing expressiveness-gap).
- [[S-069 mueller-johnny-signature-spoofing-2019]]: sibling S/MIME carrier (spec-ambiguity signature spoofing).
- [[M-015 design-error-taxonomy]]: the taxonomy this carrier grounds.

## Source
AF01 WS2 non-web-PKI arm (smime / governance-conflict); candidates.json.
