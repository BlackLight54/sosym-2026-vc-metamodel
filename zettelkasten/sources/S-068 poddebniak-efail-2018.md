---
id: S-068
title: Efail, Breaking S/MIME and OpenPGP Email Encryption (Poddebniak et al., peer-reviewed)
type: source
maturity: seed
tags: [topic/format, prov/external]
citekey: poddebniak_efail_2018
sources: ["https://www.usenix.org/conference/usenixsecurity18/presentation/poddebniak"]
related: ["[[C-047 design-error-cross-credential-expressiveness-gap]]", "[[S-067 oendaroe-smime-scale-2025]]", "[[S-069 mueller-johnny-signature-spoofing-2019]]", "[[S-064 entschew-qwac-2022]]", "[[M-015 design-error-taxonomy]]"]
created: 2026-07-17
---

**Poddebniak, Dresen, Müller, Ising, Schinzel, Friedberger, Somorovsky, Schwenk, 2018, USENIX Security Symposium.**
Non-web-PKI carrier for the cross-credential expressiveness-gap class: a landmark demonstration that the S/MIME message-format and client-rendering design (CBC/CFB malleability gadgets plus HTML/MIME backchannels) leaks the plaintext of encrypted mail, a standards-level design error in how the credential-protected payload is processed.

## Verified metadata (2026-07-17)
- Title: Efail: Breaking S/MIME and OpenPGP Email Encryption using Exfiltration Channels
- Authors: Damian Poddebniak, Christian Dresen, Jens Müller, Fabian Ising, Sebastian Schinzel, Simon Friedberger, Juraj Somorovsky, Jörg Schwenk
- Venue: 27th USENIX Security Symposium (USENIX Security 18), pp. 549-566
- Year: 2018
- Locator: https://www.usenix.org/conference/usenixsecurity18/presentation/poddebniak
- Verification evidence: no DOI (USENIX policy); the stable USENIX URL and DBLP record confirm existence. Relevance is index/metadata plus abstract-derived.
- Verdict: CONFIRMED

## Target use
TAX. Non-web-PKI carrier for the cross-credential expressiveness-gap design-error class ([[C-047 design-error-cross-credential-expressiveness-gap]]), extending the taxonomy into S/MIME payload-processing design errors.

## Honesty flags
Peer-reviewed conference paper. The verdict is an existence confirmation: relevance is derived from index metadata and the abstract, not from a full-text read (no full-text pull in the WS2 non-web-PKI arm). USENIX papers carry no DOI; the stable USENIX URL is the locator.

## Links
- [[C-047 design-error-cross-credential-expressiveness-gap]]: the design-error class this source carries into the S/MIME setting.
- [[S-067 oendaroe-smime-scale-2025]]: sibling S/MIME carrier (issuance at scale).
- [[S-069 mueller-johnny-signature-spoofing-2019]]: sibling S/MIME carrier (spec-ambiguity signature spoofing).
- [[S-064 entschew-qwac-2022]]: sibling expressiveness-gap carrier (eIDAS-QC).
- [[M-015 design-error-taxonomy]]: the taxonomy this carrier grounds.

## Source
AF01 WS2 non-web-PKI arm (smime / expressiveness-gap); candidates.json.
