---
id: A-004
title: Constraint-sensitivity variants (G0–G7 governance power-set)
type: artifact
maturity: permanent
tags: [topic/governance, kind/result, prov/self]
sources: ["models/csok_no_eidas.problem", "models/csok_no_gdpr.problem", "models/csok_no_conflict.problem", "models/evaluation/instances", "models/evaluation/README.md"]
related: ["[[K-008 contradictory-cross-framework-constraints]]", "[[C-030 scalability-measurement]]", "[[C-025 governance-conflict-vertical]]", "[[A-003 csok-instance-models]]"]
created: 2026-06-17
---

**Artifact:** the governance power-set used to confirm Headline 1. `csok_no_eidas.problem`,
`csok_no_gdpr.problem`, and `csok_no_conflict.problem` remove one governance framework each (all SAT);
the generated `evaluation/instances/sensitivity_G{0-7}.problem` enumerate the full power-set of
{eIDAS, Privacy, VCDM} at N=3.

## What it provides
The experiment E3 evidence: of the eight configurations, **only G7 (the triple conjunction) is UNSAT**;
every proper subset is satisfiable. This is the constraint-sensitivity result that rules out a
manufactured or single-source conflict and backs [[K-008 contradictory-cross-framework-constraints]].

## Links
- [[K-008 contradictory-cross-framework-constraints]] — the claim this confirms.
- [[C-025 governance-conflict-vertical]] — the conflict isolated to G7.
- [[C-030 scalability-measurement]] — E3 sits in the same campaign.
- [[A-003 csok-instance-models]] — the base instance varied here.

## Source
`models/csok_no_*.problem`; `models/evaluation/instances/sensitivity_G*.problem`; `evaluation/README.md` (E3).
