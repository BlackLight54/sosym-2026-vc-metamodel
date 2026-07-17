---
id: S-062
title: Black Tulip / DigiNotar breach report (Fox-IT, report)
type: source
maturity: seed
tags: [topic/governance, prov/external]
citekey: foxit_black-tulip_2012
sources: ["https://roselabs.nl/files/audit_reports/Fox-IT_-_DigiNotar.pdf"]
related: ["[[S-048 ellison-schneier-pki-risks-2000]]", "[[S-063 grindal-webpki-governance-2025]]", "[[S-049 serrano-pki-incidents-2019]]", "[[C-049 design-error-single-point-of-trust]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-07-17
---

**Fox-IT BV, 2012, forensic report (Delft).**
The primary-source forensic account of the canonical CA compromise: all eight DigiNotar CA servers breached, 531 rogue certificates for 344 domains, a rogue Google certificate abused against Iranian users, with governance and operational failures (no antivirus, weak passwords, tampered logs).

## Verified metadata (2026-07-17)
- Title: Black Tulip: Report of the investigation into the DigiNotar Certificate Authority breach
- Authors: Fox-IT BV (commissioned forensic report)
- Venue: Fox-IT, Delft (public forensic report)
- Year: 2012
- Locator: https://roselabs.nl/files/audit_reports/Fox-IT_-_DigiNotar.pdf
- Verification evidence: the locator resolves to the actual 101-page PDF; title on page 1, publisher Fox-IT BV (Delft) on page 2, dated 13 August 2012, version 1.0, corroborated by PDF metadata. roselabs.nl is a third-party mirror, not Fox-IT's own site, but the content is authentic.
- Verdict: CONFIRMED

## Target use
RQ0. The primary-source account of the archetypal single-point-of-trust compromise with ecosystem-wide and e-government blast radius (including e-government collapse in the Netherlands); the concrete disaster the EUDI/VC trust-registry design must be shown to anticipate. Must-cite item (axis d).

## Honesty flags
Grey source: a commissioned forensic report, not peer-reviewed. Web-PKI-only, like the whole axis-d corpus (axis_d.md, "What exists, what is thin"). Authorship nuance: the report names an individual team (Hans Hoogstraaten as team leader plus twelve others), so some citation styles use "Hoogstraaten et al." rather than the corporate author Fox-IT BV; both are accurate.

## Links
- [[S-048 ellison-schneier-pki-risks-2000]]: the pre-deployment risk enumeration in which CA compromise was anticipated.
- [[S-063 grindal-webpki-governance-2025]]: the governance-layer reading of DigiNotar as a remediated governance event.
- [[S-049 serrano-pki-incidents-2019]]: the incident taxonomy that catalogues this compromise among many.
- [[C-049 design-error-single-point-of-trust]]: single-point-of-trust compromise as a taxonomy class.
- [[M-004 novelty-and-positioning]]: the archetypal trust-anchor disaster in the relevance argument.

## Source
Proto-SLR corpus, candidates.json (axis d).
