---
id: S-078
title: "SoK: Trusting Self-Sovereign Identity (Krul et al., peer-reviewed)"
type: source
maturity: seed
tags: [topic/ssi, prov/external]
citekey: krul_trusting-ssi_2024
sources: ["https://doi.org/10.56553/popets-2024-0079"]
related: ["[[C-049 design-error-single-point-of-trust]]", "[[M-015 design-error-taxonomy]]", "[[S-079 sovrin-foundation-dissolution-2025]]", "[[S-074 bochnia-ssi-organizations-2024]]", "[[S-044 sroor-ssi-governance-modeling-2022]]"]
created: 2026-07-17
---

**Krul, Paik, Ruj, Kanhere, 2024, Proceedings on Privacy Enhancing Technologies (PoPETs).**
A peer-reviewed systematization that derives trust models for self-sovereign identity and identifies where trust is rooted across issuers, verifiers, and governance authorities. It supplies the actor and threat trust-model analysis for the single-point-of-trust class: even under decentralization claims, trust concentrates around a small set of anchoring roles.

## Verified metadata (2026-07-17)
- Title: SoK: Trusting Self-Sovereign Identity
- Authors: Evan Krul, Hye-young Paik, Sushmita Ruj, Salil S. Kanhere
- Venue: Proceedings on Privacy Enhancing Technologies (PoPETs), 2024(3), pp. 297-313
- Year: 2024
- Locator: https://doi.org/10.56553/popets-2024-0079
- Verification evidence: DOI 10.56553/popets-2024-0079 resolves to the PoPETs record on petsymposium.org, confirming title, all four authors, issue 2024(3), and pages 297-313.
- Verdict: CONFIRMED

## Target use
Single-point-of-trust class carrier (C-049). Cite it for the actor/threat trust-model systematization: the roles and registries where SSI trust re-concentrates despite decentralization. It is the peer-reviewed backbone under the concrete Sovrin instance, giving the class a model, not just an anecdote.

## Honesty flags
Reconciliation: this paper was earlier dropped at abstract level (corpus_map.md gap note) for drawing no PKI-failure lessons. It is re-included here for a different relevance, its SSI trust-model analysis, and must be cited for the actor/threat trust-model systematization, not as a PKI-failure lesson. Also, the framing that trust re-concentrates in ledger anchors is our interpretive summary, not a verbatim quotation from the paper. A prior arXiv twin (2404.06729) is the same paper; the peer-reviewed PoPETs record is the one retained.

## Links
- [[C-049 design-error-single-point-of-trust]]: the design-error class this carrier strengthens (trust re-concentration).
- [[S-079 sovrin-foundation-dissolution-2025]]: the concrete deployed instance the SoK model helps read.
- [[S-074 bochnia-ssi-organizations-2024]]: SSI stakeholder/requirements neighbor.
- [[S-044 sroor-ssi-governance-modeling-2022]]: SSI governance-modeling neighbor.

## Source
AF01 governance arm; proto-SLR candidates.json (ssi-trust-framework / single-point-of-trust).
