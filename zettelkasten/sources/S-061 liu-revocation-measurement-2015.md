---
id: S-061
title: End-to-End Measurement of Certificate Revocation (Liu et al.)
type: source
maturity: seed
tags: [topic/format, prov/external]
citekey: liu_revocation_2015
sources: ["https://doi.org/10.1145/2815675.2815685"]
related: ["[[S-060 durumeric-https-ecosystem-2013]]", "[[S-054 clark-vanoorschot-sok-ssl-2013]]", "[[C-045 design-error-status-revocation-propagation]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-07-17
---

**Liu, Tome, Zhang, Choffnes, Levin, Maggs, Mislove, Schulman, Wilson, 2015, ACM IMC.**
The definitive empirical study of the revocation failure class: about 8% of served certificates are revoked, yet browsers (especially mobile) frequently never check, so revocation stands as a systemically broken design point.

## Verified metadata (2026-07-17)
- Title: An End-to-End Measurement of Certificate Revocation in the Web's PKI
- Authors: Yabing Liu, Will Tome, Liang Zhang, David Choffnes, Dave Levin, Bruce M. Maggs, Alan Mislove, Aaron Schulman, Christo Wilson
- Venue: ACM Internet Measurement Conference (IMC 2015), pp. 183-196
- Year: 2015
- Locator: https://doi.org/10.1145/2815675.2815685
- Verification evidence: the CrossRef record for the DOI and DBLP record conf/imc/LiuTZCLMMSW15 match title, authors, IMC 2015, and pages 183-196 (trivial author-name-form variants only).
- Verdict: CONFIRMED

## Target use
RQ0. The definitive empirical account of the revocation/status failure class, which has the most direct VC analog (status lists, revocation registries); needed for that taxonomy row and to support anticipating status-infrastructure design errors. Must-cite item (axis d).

## Honesty flags
Peer-reviewed conference paper (ACM IMC). Web-PKI-only, like the whole axis-d corpus (axis_d.md, "What exists, what is thin"); it measures revocation in the web's TLS PKI.

## Links
- [[S-060 durumeric-https-ecosystem-2013]]: the companion ecosystem-scale measurement of the certificate population.
- [[S-054 clark-vanoorschot-sok-ssl-2013]]: the systematization naming revocation as a design weakness.
- [[C-045 design-error-status-revocation-propagation]]: the revocation/status failure as a taxonomy class (this note is its X.509 precedent carrier).
- [[M-004 novelty-and-positioning]]: the revocation/status error class in the relevance argument.

## Source
Proto-SLR corpus, candidates.json (axis d).
