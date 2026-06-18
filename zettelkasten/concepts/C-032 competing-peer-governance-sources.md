---
id: C-032
title: Governance sources as competing non-cooperating peers
type: concept
maturity: permanent
tags: [topic/governance, kind/method]
sources: ["sections/01_introduction.md", ".claude/memory/decision_competing_peer_requirements.md", "sections/02_background.md §2.2"]
related: ["[[C-024 two-tier-governance-framing]]", "[[C-018 governance-annotations]]", "[[C-031 emergent-constraint-interactions]]", "[[K-015 differentiation-mlm-new-domain]]"]
created: 2026-06-16
---

Unlike hierarchical requirement systems where constraints decompose top-down, credential governance
sources are **non-cooperating peers with competing goals**: W3C VCDM, eIDAS ARF, GDPR, and format
specifications were enacted independently, and no source anticipates the others. Their requirements
cannot necessarily be brought into a coherent whole, so they may be formally irreconcilable.

This is why a single-layer model that merges constraints fails: merging loses the attribution of a
constraint to its source, so conflicts between sources become undetectable. The metamodel keeps each
governance source as a first-class structural element (via annotations), which is precisely what makes
the contribution the cross-layer constraint methodology *under multi-source governance*, not the
layering technique itself.

## Links
- [[C-024 two-tier-governance-framing]] — grading the peers.
- [[C-018 governance-annotations]] — sources as first-class elements.
- [[C-031 emergent-constraint-interactions]] — peers' joint consequences emerge.
- [[K-015 differentiation-mlm-new-domain]] — why this is not "MLM in a new domain".

## Source
`sections/01_introduction.md`; competing-peer-requirements decision; `sections/02_background.md §2.2`.
