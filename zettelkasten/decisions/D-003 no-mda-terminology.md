---
id: D-003
title: No MDA terminology (hard advisor constraint)
type: decision
maturity: permanent
tags: [kind/method, prov/self]
sources: [".claude/memory/decision_no_mda_terminology.md"]
related: ["[[D-002 domain-is-mde]]", "[[K-015 differentiation-mlm-new-domain]]"]
created: 2026-06-16
---

Do not frame the layers as Model-Driven Architecture (CIM/PIM/PSM) or use MDA vocabulary. Hard
constraint from the advisor.

## Rationale
The three layers are **independently governed concern spaces**, not MDA abstraction-refinement levels.
MDA framing would mislead reviewers into expecting platform-independent-to-specific transformation
semantics that the metamodel does not claim, and would undercut the D5 differentiation.

## Links
- [[K-015 differentiation-mlm-new-domain]] — why the layers are not instantiation/refinement levels.

## Source
no-mda-terminology decision.
