---
id: S-069
title: Johnny You Are Fired, Spoofing OpenPGP and S/MIME Signatures (Müller et al., peer-reviewed)
type: source
maturity: seed
tags: [topic/format, prov/external]
citekey: mueller_signature-spoofing_2019
sources: ["https://doi.org/10.5281/zenodo.3610263"]
related: ["[[C-048 design-error-specification-ambiguity]]", "[[S-067 oendaroe-smime-scale-2025]]", "[[S-068 poddebniak-efail-2018]]", "[[S-070 clark-securing-email-sok-2021]]", "[[M-015 design-error-taxonomy]]"]
created: 2026-07-17
---

**Müller, Brinkmann, Poddebniak, Böck, Schinzel, Somorovsky, Schwenk, 2019, USENIX Security Symposium.**
Non-web-PKI carrier for the specification-ambiguity class: forged valid-looking S/MIME signatures in 15 of 22 tested clients by abusing edge cases in S/MIME's container format and the MIME-wrapping of partially signed messages, evidencing signature-validation failures rooted in spec ambiguity rather than broken crypto.

## Verified metadata (2026-07-17)
- Title: "Johnny, you are fired!" Spoofing OpenPGP and S/MIME Signatures in Emails
- Authors: Jens Müller, Marcus Brinkmann, Damian Poddebniak, Hanno Böck, Sebastian Schinzel, Juraj Somorovsky, Jörg Schwenk
- Venue: 28th USENIX Security Symposium (USENIX Security 19), pp. 1011-1028
- Year: 2019
- Locator: https://doi.org/10.5281/zenodo.3610263
- Verification evidence: existence corroborable by resolving the Zenodo DOI 10.5281/zenodo.3610263 and via the DBLP/USENIX record. Relevance is index/metadata plus abstract-derived.
- Verdict: CONFIRMED

## Target use
TAX. Non-web-PKI carrier for the specification-ambiguity design-error class ([[C-048 design-error-specification-ambiguity]]), extending the taxonomy into S/MIME signature-validation ambiguity.

## Honesty flags
Peer-reviewed conference paper. The verdict is an existence confirmation: relevance is derived from index metadata and the abstract, not from a full-text read (no full-text pull in the WS2 non-web-PKI arm). USENIX carries no DOI for the paper; the Zenodo DOI is used as the locator.

## Links
- [[C-048 design-error-specification-ambiguity]]: the design-error class this source carries into the S/MIME setting.
- [[S-067 oendaroe-smime-scale-2025]]: sibling S/MIME carrier (issuance at scale).
- [[S-068 poddebniak-efail-2018]]: sibling S/MIME carrier (payload-processing expressiveness-gap).
- [[S-070 clark-securing-email-sok-2021]]: sibling S/MIME carrier (governance-conflict systematization).
- [[M-015 design-error-taxonomy]]: the taxonomy this carrier grounds.

## Source
AF01 WS2 non-web-PKI arm (smime / spec-ambiguity); candidates.json.
