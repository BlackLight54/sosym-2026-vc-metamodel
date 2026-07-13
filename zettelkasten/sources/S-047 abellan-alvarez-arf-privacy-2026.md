---
id: S-047
title: Privacy evaluation of the EUDI Wallet ARF (Abellan Alvarez et al.)
type: source
maturity: seed
tags: [topic/eidas, topic/gdpr, prov/external]
citekey: abellan_privacy_2026
sources: ["https://doi.org/10.1016/j.cose.2025.104707", "https://api.crossref.org/works/10.1016/j.cose.2025.104707"]
related: ["[[C-034 statutory-unlinkability-gap]]", "[[S-040 cryptographers-feedback-arf]]", "[[S-034 eudiw-arf-2.9.0]]"]
created: 2026-07-13
---

**Abellan Alvarez, Hoelzmer, Sedlmeir, 2026, Computers & Security vol. 160 (Elsevier).**
The central scholarly privacy analysis of the ARF itself: maps information flows in three key use cases via qualitative privacy risk assessment and argues the EUDIW as specified fails unlinkability.

## Verified metadata (2026-07-13)
- Title: Privacy evaluation of the European Digital Identity Wallet's Architecture and Reference Framework
- Authors: Ivan Abellan Alvarez, Pol Hoelzmer, Johannes Sedlmeir (record carries diacritics: Hölzmer)
- Venue: Computers & Security, vol. 160, article 104707 (Elsevier)
- Year: 2026 (print 2026-01; DOI suffix says 2025)
- Locator: https://doi.org/10.1016/j.cose.2025.104707
- Verification evidence: https://api.crossref.org/works/10.1016/j.cose.2025.104707
- Verdict: CONFIRMED

## Target use
RQ0, RQ1, and TAX. RQ0: documents concrete design errors (linkability, identifiability, over-disclosure) already visible in the pre-deployment specification, exactly the anticipatable-error claim. RQ1: its systematic mapping of roles and information flows over the ARF is a modeling anchor for cross-layer constraints. Must-cite item (axes b, e).

## Relation to this work
Peer-reviewed corroboration of the statutory-unlinkability gap, complementing the in-regulation evidence and the cryptographers' expert statement. Narrow the error claim to "visible in specifications", per corpus_map §7.2 (no post-deployment VC evidence exists).

## Links
- [[C-034 statutory-unlinkability-gap]]: the gap this paper documents scholarly.
- [[S-040 cryptographers-feedback-arf]]: the expert-community statement of the same gap.
- [[S-034 eudiw-arf-2.9.0]]: the specification under evaluation.

## Source
Proto-SLR corpus, candidates.json (axes b, e); corpus_map §2, §6, §8 item 4.
