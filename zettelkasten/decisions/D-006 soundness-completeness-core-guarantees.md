---
id: D-006
title: Soundness and completeness are the core guarantees
type: decision
maturity: permanent
tags: [kind/formal, prov/self]
sources: [".claude/memory/decision_soundness_completeness.md"]
related: ["[[C-019 soundness-completeness-guarantee]]", "[[C-015 coverage-soundness-completeness]]", "[[K-004 automated-consistency-checking]]"]
created: 2026-06-16
---

The approach's correctness rests on two inherited guarantees: an invalid design is truly invalid
(soundness of detection within scope), and generated models satisfy all constraints (generation
soundness), with bounded completeness for unsatisfiability. These are stated explicitly rather than
left implicit in "we use Refinery".

## Rationale
The trustworthiness of "no conflict found" and "no configuration exists" depends entirely on these
properties; making them explicit is what separates the approach from a heuristic checker. The same
soundness–completeness lens is reused for VCDM coverage.

## Links
- [[C-019 soundness-completeness-guarantee]] — the formal property.
- [[C-015 coverage-soundness-completeness]] — the lens reused for coverage.

## Source
soundness-completeness decision.
