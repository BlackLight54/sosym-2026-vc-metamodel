---
id: S-058
title: The most dangerous code in the world (Georgiev et al.)
type: source
maturity: seed
tags: [topic/format, prov/external]
citekey: georgiev_dangerous-code_2012
sources: ["https://doi.org/10.1145/2382196.2382204", "https://crypto.stanford.edu/~dabo/pubs/abstracts/ssl-client-bugs.html"]
related: ["[[S-059 brubaker-frankencerts-2014]]", "[[S-045 kumar-zlint-misissuance-2018]]", "[[C-044 design-error-issuance-schema-binding]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-07-17
---

**Georgiev, Iyengar, Jana, Anubhai, Boneh, Shmatikov, 2012, ACM CCS.**
A landmark empirical study of certificate-validation misuse: SSL validation is "completely broken" across SDKs, middleware, and applications, with the root cause traced to badly designed APIs rather than crypto, defining the API-misuse error class.

## Verified metadata (2026-07-17)
- Title: The most dangerous code in the world: validating SSL certificates in non-browser software
- Authors: Martin Georgiev, Subodh Iyengar, Suman Jana, Rishita Anubhai, Dan Boneh, Vitaly Shmatikov
- Venue: ACM CCS 2012, pp. 38-49
- Year: 2012
- Locator: https://crypto.stanford.edu/~dabo/pubs/abstracts/ssl-client-bugs.html (DOI 10.1145/2382196.2382204)
- Verification evidence: Boneh's publications page, DBLP record conf/ccs/GeorgievIJABS12, and the CrossRef record for the DOI all match title, the six authors in order, CCS 2012, pp. 38-49.
- Verdict: CONFIRMED

## Target use
TAX and RQ0. TAX: defines the verifier-side validation-misuse error class, with root cause in API design rather than crypto, the direct PKI ancestor of anticipated VC presentation/verification errors. RQ0: documents a recurring error class (verifier-side validation logic) with a direct VC analog in presentation/verification code. Must-cite item (axis d).

## Honesty flags
Peer-reviewed conference paper (ACM CCS). Web-PKI-only, like the whole axis-d corpus (axis_d.md, "What exists, what is thin"); the finding is specifically about non-browser TLS client software.

## Links
- [[S-059 brubaker-frankencerts-2014]]: the differential-testing successor that quantifies validation divergence.
- [[S-045 kumar-zlint-misissuance-2018]]: validation and issuance faults made machine-checkable.
- [[C-044 design-error-issuance-schema-binding]]: validation code accepting malformed or misbound certificates as a taxonomy class.
- [[M-004 novelty-and-positioning]]: the verifier-side error class in the relevance argument.

## Source
Proto-SLR corpus, candidates.json (axis d).
