---
id: D-005
title: Paper needs explicit formalizable claims
type: decision
maturity: permanent
tags: [kind/method, prov/self]
sources: [".claude/memory/decision_formal_claims_required.md"]
related: ["[[C-019 soundness-completeness-guarantee]]", "[[K-008 contradictory-cross-framework-constraints]]", "[[D-006 soundness-completeness-core-guarantees]]"]
created: 2026-06-16
---

The paper must state explicit, formalizable claims, not vague contributions. Each binding claim (K-001
to K-010) maps to evidence; the headline results are stated as formal satisfiability outcomes
(unsatisfiable conjunction, gap predicate that always fires).

## Rationale
Vague contributions ("we improve credential design") cannot be defended or evaluated. Formalizable
claims let the evaluation be a delivery audit and let reviewers check proportionality of evidence.

## Links
- [[C-019 soundness-completeness-guarantee]] — what makes the claims checkable.
- [[D-006 soundness-completeness-core-guarantees]] — the core guarantees stated as claims.

## Source
formal-claims-required decision.
