---
id: C-021
title: CSOK housing-subsidy running example
type: concept
maturity: permanent
tags: [kind/example, layer/cross]
sources: ["sections/03_overview.md §3.1", ".claude/memory/decision_csok_running_example.md", ".claude/memory/decision_csok_naming.md"]
related: ["[[C-002 domain-concept-layer]]", "[[C-025 governance-conflict-vertical]]", "[[C-026 cross-credential-predicate-gap-horizontal]]", "[[C-024 two-tier-governance-framing]]"]
created: 2026-06-16
---

A government housing subsidy where eligibility requires credentials from three independent authorities:
family status (civil registry), property records (land registry), income (employer). Two domain
constraints drive the analysis: required floor area is a function of the number of children (the decree
prescribes 40/50/60/70/80 m² for one–five+ children), spanning two credentials; and income must exceed
a regulatory threshold, a privacy-sensitive check. Simplified from the Hungarian CSOK program; in the
paper body it is called "family housing subsidy", with the Hungarian origin in a footnote.

The example is chosen for **structural completeness**: it exhibits *both* headline errors within a
single domain — the vertical income governance conflict and the horizontal floor-area predicate gap.

## Links
- [[C-002 domain-concept-layer]] — the three property edges (children, area, income).
- [[C-025 governance-conflict-vertical]] — IncomeCred conflict.
- [[C-026 cross-credential-predicate-gap-horizontal]] — floor-area gap across two credentials.
- [[C-024 two-tier-governance-framing]] — eIDAS vs GDPR framing on IncomeCred.

## Source
`sections/03_overview.md §3.1`; csok-running-example and csok-naming decisions.
