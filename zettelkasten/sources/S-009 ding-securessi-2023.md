---
id: S-009
title: SecureSSI — security analysis of SSI architectural patterns (Ding & Sato)
type: source
maturity: permanent
tags: [topic/ssi, prov/external]
citekey: ding_model-driven_2023
sources: ["sections/06_related_work.md §6.2", "context/archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md"]
related: ["[[K-012 differentiation-securessi-pattiyanon]]"]
created: 2026-06-16
---

**Ding & Sato, 2023, TrustCom.** Model-driven security analysis of SSI architectural patterns
(temporal logic / model checking).

## Verified record (O01, 2026-07-13)

Confirmed against DBLP, the Crossref DOI registry, and arXiv; the paper exists exactly as cited.

- Title: "Model-Driven Security Analysis of Self-Sovereign Identity Systems"
- Authors: Yepeng Ding, Hiroyuki Sato (The University of Tokyo)
- Venue: 2023 IEEE 22nd International Conference on Trust, Security and Privacy in Computing and
  Communications (TrustCom), Exeter, UK, 1 to 3 Nov 2023, pp. 1687-1694, IEEE
- DOI: 10.1109/TrustCom60117.2023.00230
- Extended preprint: arXiv:2406.00620 (2024)
- Evidence: <https://api.crossref.org/works/10.1109/TrustCom60117.2023.00230>,
  <https://arxiv.org/abs/2406.00620>, DBLP publication search
- The arXiv abstract confirms the characterization above and in [[K-012 differentiation-securessi-pattiyanon]]:
  architectural patterns and threats are formalized as temporal-logic security properties and
  verified by model checking (the SecureSSI environment).
- The bib entry `ding_model-driven_2023` in `pandoc/bibliography/references.bib` matches this
  record; no correction needed.

## Relation to this work
MDE-for-SSI work (C5 correction). Differentiated (D2): formalizes SSI for security analysis, not
credential structure across abstraction layers; no cross-layer governance constraints.

## Links
- [[K-012 differentiation-securessi-pattiyanon]] — the differentiation argument.

## Source
Related work §6.2; gap synthesis.
