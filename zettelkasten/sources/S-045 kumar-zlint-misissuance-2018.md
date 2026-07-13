---
id: S-045
title: Tracking Certificate Misissuance in the Wild (ZLint) (Kumar et al.)
type: source
maturity: seed
tags: [topic/governance, prov/external]
citekey: kumar_misissuance_2018
sources: ["https://doi.org/10.1109/SP.2018.00015", "https://ieeexplore.ieee.org/document/8418638/"]
related: ["[[S-049 serrano-pki-incidents-2019]]", "[[C-009 cross-layer-constraint]]", "[[M-004 novelty-and-positioning]]"]
created: 2026-07-13
---

**Kumar, Wang, Hyder, Dickinson, Beck, Adrian, Mason, Durumeric, Halderman, Bailey, 2018, IEEE S&P.**
Codifies the CA/Browser Forum Baseline Requirements and RFC 5280 into ZLint, a machine-checkable linter, then measures certificate misissuance ecosystem-wide; errors concentrate in small CAs.

## Verified metadata (2026-07-13)
- Title: Tracking Certificate Misissuance in the Wild
- Authors: Deepak Kumar, Zhengping Wang, Matthew Hyder, Joseph Dickinson, Gabrielle Beck, David Adrian, Joshua Mason, Zakir Durumeric, J. Alex Halderman, Michael Bailey
- Venue: IEEE Symposium on Security and Privacy (S&P 2018), pp. 785-798
- Year: 2018
- Locator: https://ieeexplore.ieee.org/document/8418638/ (DOI 10.1109/SP.2018.00015)
- Verification evidence: https://doi.org/10.1109/SP.2018.00015 (CrossRef and DBLP concur on all fields)
- Verdict: CONFIRMED

## Target use
RQ1 (primary methodological precedent) and DIFF. ZLint is the closest PKI precedent to the paper's approach: it turns multi-source governance rules (a standard plus an industry baseline) into automatically checkable predicates over artifact structure. The paper lifts this from artifact-level lint rules to ecosystem-level graph predicates, which is exactly the differentiation. Differentiate-bucket item, not on the must-cite shortlist; requires positioning text. ZLint's rules are not graph predicates, and that gap is the load-bearing DIFF.

## Relation to this work
Per corpus_map §3 (axis d) and the M-012 delta: nearest formal neighbor at artifact scope. Supports the "formal below the target, informal at the target" argument in M-004.

## Links
- [[S-049 serrano-pki-incidents-2019]]: misissuance as a documented PKI error class.
- [[C-009 cross-layer-constraint]]: the ecosystem-level constraint pattern the paper formalizes.
- [[M-004 novelty-and-positioning]]: formal-at-artifact-scope neighbor in the positioning argument.

## Source
Proto-SLR corpus, candidates.json (axis d); corpus_map §3, §8 item 2.
