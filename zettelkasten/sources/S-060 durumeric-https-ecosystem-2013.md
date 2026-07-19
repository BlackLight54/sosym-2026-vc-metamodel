---
id: S-060
title: Analysis of the HTTPS Certificate Ecosystem (Durumeric et al.)
type: source
maturity: seed
tags: [topic/format, prov/external]
citekey: durumeric_https-ecosystem_2013
sources: ["https://doi.org/10.1145/2504730.2504755"]
related: ["[[S-054 clark-vanoorschot-sok-ssl-2013]]", "[[S-061 liu-revocation-measurement-2015]]", "[[S-045 kumar-zlint-misissuance-2018]]", "[[C-044 design-error-issuance-schema-binding]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-07-17
---

**Durumeric, Kasten, Bailey, Halderman, 2013, ACM IMC.**
The defining ecosystem-scale empirical study of the deployed X.509 PKI: CA population, intermediate sprawl, constraint usage, and misissuance evidence drawn from Internet-wide scans.

## Verified metadata (2026-07-17)
- Title: Analysis of the HTTPS Certificate Ecosystem
- Authors: Zakir Durumeric, James Kasten, Michael Bailey, J. Alex Halderman
- Venue: ACM Internet Measurement Conference (IMC 2013)
- Year: 2013
- Locator: https://doi.org/10.1145/2504730.2504755
- Verification evidence: the CrossRef record for the DOI and DBLP record conf/imc/DurumericKBH13 confirm all four fields (CrossRef typesets the title in sentence case, a formatting difference only).
- Verdict: CONFIRMED

## Target use
RQ0. It operationalizes "certificate ecosystem" as an empirical, measurable object (a population of CAs, intermediates, and certificates), the template for treating VC deployments as an ecosystem-level object of study, and documents delegation and name-constraint hygiene failures. Must-cite item (axis d).

## Honesty flags
Peer-reviewed conference paper (ACM IMC). Web-PKI-only, like the whole axis-d corpus (axis_d.md, "What exists, what is thin"); the measured ecosystem is the HTTPS/TLS certificate population.

## Links
- [[S-054 clark-vanoorschot-sok-ssl-2013]]: the systematization this study measures empirically.
- [[S-061 liu-revocation-measurement-2015]]: the companion ecosystem-scale measurement of revocation.
- [[S-045 kumar-zlint-misissuance-2018]]: ecosystem-wide misissuance measurement with a machine-checkable linter.
- [[C-044 design-error-issuance-schema-binding]]: delegation and name-constraint hygiene failures as a taxonomy class.
- [[M-004 novelty-and-positioning]]: the "ecosystem as measurable object" definition-by-practice in the positioning argument.

## Source
Proto-SLR corpus, candidates.json (axis d).
