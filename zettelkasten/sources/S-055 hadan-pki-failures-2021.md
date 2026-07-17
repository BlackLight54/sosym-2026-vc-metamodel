---
id: S-055
title: A holistic analysis of web PKI failures (Hadan et al.)
type: source
maturity: seed
tags: [topic/governance, prov/external]
citekey: hadan_pki-failures_2021
sources: ["https://doi.org/10.1093/cybsec/tyab025"]
related: ["[[S-049 serrano-pki-incidents-2019]]", "[[S-054 clark-vanoorschot-sok-ssl-2013]]", "[[C-046 design-error-cross-framework-governance-conflict]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-07-17
---

**Hadan, Serrano, Camp, 2021, Journal of Cybersecurity (OUP).**
Peer-reviewed successor to the Serrano incident study: a quantitative analysis of web PKI incidents since 2001 combined with 18 expert interviews, spanning code, crypto, organizational, and human failure dimensions, and finding that expert perceptions of failure modes diverge from documented incidents.

## Verified metadata (2026-07-17)
- Title: A holistic analysis of web-based public key infrastructure failures: comparing experts' perceptions and real-world incidents
- Authors: Hilda Hadan, Nicolas Serrano, L. Jean Camp
- Venue: Journal of Cybersecurity 7(1), tyab025, Oxford University Press
- Year: 2021
- Locator: https://doi.org/10.1093/cybsec/tyab025
- Verification evidence: the OUP article page and the CrossRef record for the DOI match all four fields (OUP renders the third author as "L Jean Camp" without the period, a styling difference only).
- Verdict: CONFIRMED

## Target use
TAX and RQ0. TAX: the peer-reviewed archival grounding for the incident corpus that the design-error taxonomy draws on. RQ0: its finding that expert intuition diverges from incident data justifies grounding the VC taxonomy in documented history rather than expert speculation; a methodological caution for the anticipatory taxonomy. Must-cite item (axis d).

## Honesty flags
Peer-reviewed journal article. Web-PKI-only, like the whole axis-d corpus (axis_d.md, "What exists, what is thin"). It is organized around failure dimensions and expert perception rather than a reusable design-error catalog, so no single peer-reviewed PKI design-error taxonomy exists and the paper's PKI grounding is a synthesis across items.

## Links
- [[S-049 serrano-pki-incidents-2019]]: the earlier grey incident study this peer-reviewed analysis succeeds.
- [[S-054 clark-vanoorschot-sok-ssl-2013]]: the systematization this incident evidence grounds.
- [[C-046 design-error-cross-framework-governance-conflict]]: the governance and organizational failure dimensions as a taxonomy class.
- [[M-004 novelty-and-positioning]]: the incident-grounded PKI error history in the relevance argument.

## Source
Proto-SLR corpus, candidates.json (axis d).
