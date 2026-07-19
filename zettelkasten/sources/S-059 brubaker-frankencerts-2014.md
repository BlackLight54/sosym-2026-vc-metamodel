---
id: S-059
title: Frankencerts (Brubaker et al.)
type: source
maturity: seed
tags: [topic/format, prov/external]
citekey: brubaker_frankencerts_2014
sources: ["https://doi.org/10.1109/SP.2014.15"]
related: ["[[S-058 georgiev-dangerous-code-2012]]", "[[S-045 kumar-zlint-misissuance-2018]]", "[[C-048 design-error-specification-ambiguity]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-07-17
---

**Brubaker, Jana, Ray, Khurshid, Shmatikov, 2014, IEEE S&P.**
Differential testing with mutated ("Frankencert") certificates found 208 validation discrepancies between TLS implementations, showing the X.509 specification is ambiguous enough that implementations disagree on validity.

## Verified metadata (2026-07-17)
- Title: Using Frankencerts for Automated Adversarial Testing of Certificate Validation in SSL/TLS Implementations
- Authors: Chad Brubaker, Suman Jana, Baishakhi Ray, Sarfraz Khurshid, Vitaly Shmatikov
- Venue: IEEE Symposium on Security and Privacy (S&P 2014), pp. 114-129
- Year: 2014
- Locator: https://doi.org/10.1109/SP.2014.15
- Verification evidence: the CrossRef record for the DOI and DBLP record conf/sp/BrubakerJRKS14 match title, the five authors in order, venue, year, and page range 114-129.
- Verdict: CONFIRMED

## Target use
RQ1. The empirical proof that spec ambiguity produces implementation divergence (208 validation discrepancies); the core motivation for machine-checkable formal constraints, since a precise formal metamodel with checkable constraints is meant to prevent exactly this ambiguity-driven divergence. Must-cite item (axis d).

## Honesty flags
Peer-reviewed (top-venue IEEE S&P). Web-PKI-only, like the whole axis-d corpus (axis_d.md, "What exists, what is thin"); it tests TLS/SSL certificate-validation implementations specifically.

## Links
- [[S-058 georgiev-dangerous-code-2012]]: the validation-misuse study this differential-testing work extends.
- [[S-045 kumar-zlint-misissuance-2018]]: the machine-checkable-predicate response to specification ambiguity.
- [[C-048 design-error-specification-ambiguity]]: specification ambiguity causing implementation divergence as a taxonomy class.
- [[M-004 novelty-and-positioning]]: the ambiguity-to-divergence motivation for formal constraints in the positioning argument.

## Source
Proto-SLR corpus, candidates.json (axis d).
