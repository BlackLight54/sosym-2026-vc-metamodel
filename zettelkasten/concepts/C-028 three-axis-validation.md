---
id: C-028
title: Three-axis validation
type: concept
maturity: permanent
tags: [topic/evaluation, kind/method]
sources: ["sections/05_evaluation.md §5.1", ".claude/memory/decision_three_axis_validation.md", ".claude/memory/decision_core_disc_properties.md"]
related: ["[[C-015 coverage-soundness-completeness]]", "[[C-029 anti-pattern-catalog]]", "[[C-030 scalability-measurement]]", "[[K-005 coverage-validation]]", "[[K-006 expressiveness-validation]]"]
created: 2026-06-16
---

The qualitative elaboration validates the metamodel along three axes: **coverage** against W3C VCDM 2.0
(soundness–completeness), **constraint expressiveness** against EU regulatory sources (eight eIDAS ARF
constraints classified fully/partially/not expressible — three fully, five partially, none outside),
and **error detection** against structural credential design anti-patterns (five anti-patterns as graph
predicates). This three-axis structure organizes §5.

Validation targets the CORE-DISC properties with a deliberate scope: **Consistency** is primary,
**Diverse** and **Scalable** are addressed (DSE diversity; scalability measurement), **Realistic** is
out of scope (no empirical practitioner study).

## Links
- [[C-015 coverage-soundness-completeness]] — axis 1.
- [[C-029 anti-pattern-catalog]] — axis 3.
- [[C-030 scalability-measurement]] — the quantitative complement.
- [[K-005 coverage-validation]], [[K-006 expressiveness-validation]] — the claims it delivers.

## Source
`sections/05_evaluation.md §5.1`; three-axis-validation and core-disc-properties decisions.
