---
id: S-007
title: SSI from specifications to protocol, formal security verification (Braun et al.)
type: source
maturity: permanent
tags: [topic/ssi, kind/formal, prov/external]
citekey: braun_ssi_2024
sources: ["sections/06_related_work.md §6.1", "context/archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md Tier1"]
related: ["[[K-013 differentiation-braun-protocol-verification]]", "[[C-009 cross-layer-constraint]]"]
created: 2026-06-16
---

**Braun, Horne, Käfer, Mauw, 2024, WWW.** Assembles W3C VC, DIDs, and Hyperledger Aries components
into a web authentication protocol and formally verifies secrecy, authentication, and unlinkability;
the seed of the proto-SLR and the anchor of the Braun et al. SSI protocol-verification line.

## Verified metadata (proto-SLR, 2026-07-13)
- Title: SSI, from Specifications to Protocol? Formally Verify Security!
- Authors: Christoph H.-J. Braun, Ross Horne, Tobias Käfer, Sjouke Mauw
- Venue: Proceedings of the ACM Web Conference 2024 (WWW '24), pp. 1620-1631
- Year: 2024
- Locator: https://doi.org/10.1145/3589334.3645426
- Verification evidence: https://doi.org/10.1145/3589334.3645426 (CrossRef and DBLP concur on all four fields)
- Verdict: CONFIRMED

This is the same paper as the proto-SLR seed (candidates.json axis e, DOI 10.1145/3589334.3645426);
S-007 is updated in place rather than duplicated. Note the paper uses Tamarin/ProVerif-style symbolic
verification; the corpus records secrecy, authentication, and unlinkability as the verified properties.

## Target use
RQ1 (primary protocol-level anchor). Demonstrates that a multi-spec SSI bundle can be captured in one
formal model only after implicit trust assumptions are made explicit, the protocol-level analogue of
RQ1. RQ0 signal: specs underdetermine security-critical controls, so implementors can commit
anticipatable design errors. Must-cite seed item (axis e).

## Relation to this work
Tier-1 cite. Protocol-level runtime verification, complementary to the present design-time structural
formalization (differentiation D3). Different formalism (behavioral protocol verification vs Refinery
graph predicates), different question. Fixes the delta: formal at behavioral/protocol scope, not
ecosystem-governance scope.

## Links
- [[K-013 differentiation-braun-protocol-verification]]: the differentiation argument.
- [[C-009 cross-layer-constraint]]: the ecosystem-level constraint scope the paper adds beyond the protocol.

## Source
Related work §6.1; gap synthesis Tier 1. Metadata re-verified against the proto-SLR corpus
(candidates.json axis e; corpus_map §3, §8 item 8), 2026-07-13.
