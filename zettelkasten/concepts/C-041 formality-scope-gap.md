---
id: C-041
title: Formality-scope gap (the state-of-the-art quadrant)
type: concept
maturity: developing
tags: [topic/ssi, topic/governance, kind/method, prov/external]
sources: ["context/slr/corpus_map.md", "context/reports/2026-07-13_kickoff_slr_report.html"]
related: ["[[S-044 sroor-ssi-governance-modeling-2022]]", "[[S-046 gleif-vlei-egf-2026]]", "[[S-045 kumar-zlint-misissuance-2018]]", "[[S-007 braun-ssi-protocol-2024]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-07-13
---

Sorting every relevant verified item from the 2026-07-13 proto-SLR by two axes leaves exactly one
cell empty. The axes are **scope** (ecosystem-level governance versus a lower level: protocol,
artifact, or code) and **rigor** (formal and machine-checkable versus informal or documentary).
Every corpus item falls into one of three cells; the fourth, **formal-and-ecosystem**, is empty.
That empty cell is the paper's contribution: a three-layer metamodel with graph predicates that
makes ecosystem-level governance formally checkable. There is no single rival to displace; the
novelty is assembled from partial neighbors, each strong on exactly one axis. This is the
load-bearing positioning fact for related work, and it decides how the related-work section is
restructured (see [[M-004 novelty-and-positioning]]).

## The four cells

**Ecosystem governance, informal or documentary (crowded).** Sroor 2022 (visual domain-specific
models of multi-source SSI governance), the GLEIF vLEI Ecosystem Governance Framework v4.0
(documentary metamodel on the ToIP governance stack), the Gaia-X Trust Framework 22.10 (rule lists
over W3C VCs), Catena-X CX-0149, De Marco 2024 (manual legal-to-technical mapping), and the ARES
2024 eIDAS/ToIP mapping (manual alignment). Right scope, wrong rigor. Sroor and the vLEI EGF are the
primary novelty threats: the differentiation lines are "visual versus checkable" and "documentary
versus analyzable" (see [[S-044 sroor-ssi-governance-modeling-2022]], [[S-046 gleif-vlei-egf-2026]]).

**Below the target, formal and machine-checkable (strong, and busy).** Braun et al. WWW '24 (a
multi-spec SSI bundle that verifies only after implicit trust assumptions are made explicit),
Tamarin and ProVerif wallet analyses (Hauck 2023, the ETH 2025 model), Badertscher CCS 2024, ZLint
(Kumar 2018: two governance sources compiled into machine-checkable certificate lints), and Mao
2025 (whole-system treatment at code level). Right rigor, wrong scope: each analyzes one protocol,
artifact, or codebase, and all are complementary to an ecosystem-level treatment (see
[[S-007 braun-ssi-protocol-2024]], [[S-045 kumar-zlint-misissuance-2018]]).

**Below the target, informal or documentary (surveys and threat models).** Gruener 2023 (systematic
SSI threat model), Sharif 2025 (EUDI threat model), Mazzocca 2025 (deployment survey), and Bochnia
2024 (the organizational holder role "largely unexplored"). These characterize present-tense
threats, not ecosystem-level anticipatory design errors.

**Ecosystem governance, formal and machine-checkable (empty).** No verified item combines
ecosystem-governance scope with formal, checkable constraints. This is the paper's cell.

## Links
- [[S-044 sroor-ssi-governance-modeling-2022]] the nearest neighbor at the target scope; visual, not checkable.
- [[S-046 gleif-vlei-egf-2026]] the running contrast: an operating ecosystem self-described as metamodel-based, with no automated analysis.
- [[S-045 kumar-zlint-misissuance-2018]] the formal-below precedent the paper lifts one level up.
- [[S-007 braun-ssi-protocol-2024]] the formal-below protocol anchor; complementary, not a rival.
- [[M-004 novelty-and-positioning]] where this quadrant feeds the positioning argument.

## Source
Proto-SLR corpus map, `context/slr/corpus_map.md` section 3 (RQ1 anchoring, cross-axis picture);
kickoff report `context/reports/2026-07-13_kickoff_slr_report.html` section 2. Cell placements rest
on abstracts and verification notes; verbatim characterizations are re-pulled from full texts at
drafting time.
