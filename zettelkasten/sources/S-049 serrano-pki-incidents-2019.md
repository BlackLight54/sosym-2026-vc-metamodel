---
id: S-049
title: A Complete Study of P.K.I. (PKI's Known Incidents) (Serrano et al., grey)
type: source
maturity: seed
tags: [topic/governance, prov/external]
citekey: serrano_pki-incidents_2019
sources: ["https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3425554", "https://doi.org/10.2139/ssrn.3425554"]
related: ["[[S-048 ellison-schneier-pki-risks-2000]]", "[[S-045 kumar-zlint-misissuance-2018]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-07-13
---

**Serrano, Hadan, Camp, 2019, SSRN / TPRC47.**
The closest existing analog to the paper's planned design-error taxonomy: 1300+ CA incidents collected, 379 analyzed in depth, yielding an explicit taxonomy of incident types and causes (misissuance, backdating, MITM issuance, identity-verification lapses); finds governance and business-practice failures dominate over cryptographic ones.

## Verified metadata (2026-07-13)
- Title: A Complete Study of P.K.I. (PKI's Known Incidents)
- Authors: Nicolas Serrano, Hilda Hadan, L. Jean Camp
- Venue: SSRN Electronic Journal; presented at TPRC47 (47th Research Conference on Communications, Information and Internet Policy, 2019)
- Year: 2019
- Locator: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3425554
- Verification evidence: https://doi.org/10.2139/ssrn.3425554 (CrossRef record and the SSRN PDF first page confirm title and all three authors)
- Verdict: CONFIRMED

## Full-text pull (AF01 WS3, 2026-07-17): CONFIRMED-verbatim
Reached full text via an open-access mirror PDF (identical to SSRN abstract_id=3425554). The differentiation the paper draws is backed verbatim: the paper reports "over 1300 instances," a "detailed study of 379 of these 1300 incidents," and self-describes "a taxonomy of the different types of incidents and their causes" and "a taxonomy of failures" examined "from the perspective of business practices" and "governance and practices in PKI." This is an incident and business-practice taxonomy, not a design-error taxonomy, which is exactly the distinction K-016 relies on. The 1300+/379 figures are exact. No manual pull needed.

## Target use
TAX, DIFF, and RQ0. TAX: the taxonomizability precedent, direct evidence that a trust-ecosystem's error history can be systematically taxonomized from incident reports. DIFF: a grey incident-scoped analog to differentiate the paper's taxonomy from. RQ0: supports anticipation (documented history exists to extrapolate from). Differentiate-bucket item, not on the must-cite shortlist.

## Honesty flags
Grey source. SSRN/TPRC working paper, not a peer-reviewed publication, and incident-scoped rather than a design-error taxonomy as such (corpus_map §4, §7.8). No single peer-reviewed PKI design-error taxonomy exists in the corpus, so the paper's PKI grounding is a synthesis across items and must be presented that way.

## Links
- [[S-048 ellison-schneier-pki-risks-2000]]: the anticipation counterpart; risks vs realized incidents.
- [[S-045 kumar-zlint-misissuance-2018]]: misissuance, the error class made machine-checkable.
- [[M-004 novelty-and-positioning]]: grey taxonomy analog to distinguish in positioning.

## Source
Proto-SLR corpus, candidates.json (axis d); corpus_map §4, §8 item 7.
