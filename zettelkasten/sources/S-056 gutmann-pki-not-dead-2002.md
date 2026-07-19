---
id: S-056
title: "PKI: It's Not Dead, Just Resting (Gutmann)"
type: source
maturity: seed
tags: [topic/format, prov/external]
citekey: gutmann_pki-not-dead_2002
sources: ["https://doi.org/10.1109/MC.2002.1023787"]
related: ["[[S-057 lopez-why-pki-failed-2005]]", "[[S-054 clark-vanoorschot-sok-ssl-2013]]", "[[C-047 design-error-cross-credential-expressiveness-gap]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-07-17
---

**Gutmann, 2002, IEEE Computer 35(8).**
A classic design critique of the X.509 model: generic all-purpose identity certificates mismatch real-world requirements, and the paper argues for adapting PKI design to deployment reality, cataloguing the resulting structural design errors.

## Verified metadata (2026-07-17)
- Title: PKI: It's Not Dead, Just Resting
- Authors: Peter Gutmann
- Venue: IEEE Computer 35(8), pp. 41-49
- Year: 2002
- Locator: https://doi.org/10.1109/MC.2002.1023787
- Verification evidence: the CrossRef record for the DOI and DBLP both confirm title, author, journal Computer, vol. 35, no. 8, pp. 41-49, 2002 ("IEEE Computer" is the standard citation form of the journal "Computer").
- Verdict: CONFIRMED

## Target use
TAX and RQ0. TAX: the sole anchor for the design/reality mismatch error class, generic identity certificates versus actual deployment requirements, a taxonomy row no other corpus item covers. RQ0: articulates a design/reality mismatch failure class that a VC ecosystem metamodel should be able to express. Must-cite item (axis d).

## Honesty flags
Peer-reviewed per candidates.json (IEEE Computer). Web-PKI-only, like the whole axis-d corpus (axis_d.md, "What exists, what is thin"). It is a design-critique magazine article rather than an empirical study, so it grounds a taxonomy row by argument, not by measurement.

## Links
- [[S-057 lopez-why-pki-failed-2005]]: the adjacent multi-perspective failure analysis from the same design-critique era.
- [[S-054 clark-vanoorschot-sok-ssl-2013]]: the later systematization that subsumes these design critiques.
- [[C-047 design-error-cross-credential-expressiveness-gap]]: the design/reality mismatch as a taxonomy class.
- [[M-004 novelty-and-positioning]]: the design-error history in the relevance argument.

## Source
Proto-SLR corpus, candidates.json (axis d).
