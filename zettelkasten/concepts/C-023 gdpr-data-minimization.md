---
id: C-023
title: GDPR data minimization as a format-capability requirement
type: concept
maturity: permanent
tags: [topic/gdpr, topic/governance, layer/cross]
sources: ["sections/03_overview.md §3.1", "sections/05_evaluation.md §5.1.3", ".claude/memory/decision_gdpr_two_tier.md"]
related: ["[[C-024 two-tier-governance-framing]]", "[[C-018 governance-annotations]]", "[[C-025 governance-conflict-vertical]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]"]
created: 2026-06-16
---

GDPR Art. 5(1)(c) (data minimization) is **operationalized in this paper as a format-capability
requirement**: a threshold comparison such as `monthly_income ≥ threshold` should disclose only the
boolean result, not the underlying value, so the credential needs predicate-proof capability. Modeled
as the `PrivacyRequirement` annotation and constraint C6.

The operationalization is defended empirically: the Hungarian DPA fined a bank for copying entire
pregnancy booklets when only a threshold check was needed — a directly analogous enforcement action.
GDPR is framed as *operationally binding* (a defensible interpretation) rather than a hard textual
mandate; eIDAS is the hard one.

## Links
- [[C-024 two-tier-governance-framing]] — the hard/operationally-binding split.
- [[C-018 governance-annotations]] — the PrivacyRequirement marker.
- [[C-025 governance-conflict-vertical]] — C6 in the conflict.
- [[C-013 cross-layer-constraint-taxonomy-c1-c9]] — C6.

## Source
`sections/03_overview.md §3.1`; gdpr-two-tier decision.
