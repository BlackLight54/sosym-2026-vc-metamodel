---
id: S-050
title: Threat modeling of SSI management systems (Gruener et al.)
type: source
maturity: seed
tags: [topic/ssi, kind/method, prov/external]
citekey: gruener_threat-modeling_2023
sources: ["https://doi.org/10.1007/s10207-023-00688-w", "https://api.crossref.org/works/10.1007/s10207-023-00688-w"]
related: ["[[S-009 ding-securessi-2023]]", "[[M-009 threats-to-applicability]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-07-13
---

**Gruener, Muehle, Lockenvitz, Meinel, 2023, International Journal of Information Security (Springer).**
Hybrid STRIDE plus attack-tree threat model comparing SSI against isolated and centralized identity models; 35 threats, 15 countermeasures. Finds the SSI paradigm's threat surface significantly larger than traditional identity management.

## Verified metadata (2026-07-13)
- Title: Analyzing and comparing the security of self-sovereign identity management systems through threat modeling
- Authors: Andreas Gruener, Alexander Muehle, Niko Lockenvitz, Christoph Meinel (record uses umlauts: Grüner, Mühle)
- Venue: International Journal of Information Security (Springer), vol. 22, issue 5, pp. 1231-1248
- Year: 2023 (online 2023-04-08, print October 2023)
- Locator: https://doi.org/10.1007/s10207-023-00688-w
- Verification evidence: https://api.crossref.org/works/10.1007/s10207-023-00688-w (CrossRef and DBLP concur)
- Verdict: CONFIRMED

## Target use
RQ0 and TAX. A direct, present-tense threat characterization for SSI/VC systems; the enlarged threat surface supports the anticipatory design-error argument, and the STRIDE plus attack-tree structure grounds the taxonomy. Not ecosystem-level or anticipatory, which delineates the paper's move. Must-cite item (axis a).

## Relation to this work
Nearest scholarly threat grounding for the design-error taxonomy (corpus_map §2 lists it as closest to the threat characterization, present-tense not ecosystem-level). Feeds M-009.

## Links
- [[S-009 ding-securessi-2023]]: model-driven SSI security analysis, architecture level.
- [[M-009 threats-to-applicability]]: threat grounding for the taxonomy.
- [[M-004 novelty-and-positioning]]: present-tense threat model vs anticipatory ecosystem framing.

## Source
Proto-SLR corpus, candidates.json (axis a); corpus_map §2, §6, §8 item 9.
