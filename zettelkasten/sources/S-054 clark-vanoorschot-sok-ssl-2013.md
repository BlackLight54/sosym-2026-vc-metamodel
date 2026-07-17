---
id: S-054
title: "SoK: SSL and HTTPS (Clark and van Oorschot)"
type: source
maturity: seed
tags: [topic/format, prov/external]
citekey: clark_sok-ssl_2013
sources: ["https://www.ieee-security.org/TC/SP2013/papers/4977a511.pdf", "https://doi.org/10.1109/SP.2013.41"]
related: ["[[S-060 durumeric-https-ecosystem-2013]]", "[[S-061 liu-revocation-measurement-2015]]", "[[S-055 hadan-pki-failures-2021]]", "[[C-044 design-error-issuance-schema-binding]]", "[[C-045 design-error-status-revocation-propagation]]", "[[C-049 design-error-single-point-of-trust]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-07-17
---

**Clark, van Oorschot, 2013, IEEE S&P.**
The canonical systematization of the X.509 web PKI's design weaknesses (trust anchoring, certification, revocation, and UI) and of the proposed fixes; the standard citation for the claim that PKI has a documented, systematized error history.

## Verified metadata (2026-07-17)
- Title: SoK: SSL and HTTPS: Revisiting Past Challenges and Evaluating Certificate Trust Model Enhancements
- Authors: Jeremy Clark, Paul C. van Oorschot
- Venue: IEEE Symposium on Security and Privacy (S&P 2013), pp. 511-525
- Year: 2013
- Locator: https://www.ieee-security.org/TC/SP2013/papers/4977a511.pdf (DOI 10.1109/SP.2013.41)
- Verification evidence: the conference-site PDF (title and authors on page 1) and DBLP record conf/sp/ClarkO13 concur on all four fields and page range 511-525.
- Verdict: CONFIRMED

## Target use
TAX and RQ0. TAX: the canonical systematization of X.509 design weaknesses, the standard anchor for "PKI has a documented, systematized error history" that grounds the design-error taxonomy. RQ0: establishes that PKI design errors were catalogued and evaluated as a class before the paper's argument, and documents CA proliferation with declining issuance diligence. Must-cite item (axis d).

## Honesty flags
Peer-reviewed (top-venue IEEE S&P). Web-PKI-only: like the whole axis-d corpus, it concerns the TLS/HTTPS web PKI, not qualified certificates, S/MIME, code signing, or enterprise PKI, so the analogy to B2B/B2G VC ecosystems rests on the web PKI alone (axis_d.md, "What exists, what is thin").

## Links
- [[S-060 durumeric-https-ecosystem-2013]]: the ecosystem-scale empirical study that instantiates this systematization.
- [[S-061 liu-revocation-measurement-2015]]: the revocation weakness measured end to end.
- [[S-055 hadan-pki-failures-2021]]: incident-grounded failure analysis over the same ecosystem.
- [[C-044 design-error-issuance-schema-binding]]: the certification/issuance weakness as a taxonomy class.
- [[C-045 design-error-status-revocation-propagation]]: the revocation weakness as a taxonomy class.
- [[C-049 design-error-single-point-of-trust]]: the trust-anchoring weakness as a taxonomy class.
- [[M-004 novelty-and-positioning]]: the systematized PKI error history that grounds the relevance argument.

## Source
Proto-SLR corpus, candidates.json (axis d).
