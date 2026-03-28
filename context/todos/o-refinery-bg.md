---
id: "O-REFBG"
short: "refinery-bg"
title: "Write Refinery content for Sec 2.3 — code examples and missing concepts"
status: pending
priority: high
depends_on: []
binding_claims: [3, 4]
target: "sections/02_background.md"
pipeline: ""
assigned: "oszkár"
created: "2026-03-28"
---

**This todo will be extended with additional items as gaps are identified.**

## Goal

Expand Sec 2.3 (Partial Graph Modeling with Refinery) so that it is self-contained: a reader unfamiliar with Refinery should understand how the tool works from this section alone. Specifically:

1. **Add Refinery code examples** — `.problem` file snippets illustrating the mechanisms that the prose already describes (error predicates, propagation rules, shadow predicates, scope constraints). The examples should be small, self-contained, and directly relatable to the credential modeling domain used in the paper.
2. **Cover all missing Refinery concepts** — anything used in Sec 04 (cross-layer constraints) that is not yet introduced in Sec 2.3 must be defined here. Audit Sec 04 for Refinery features that lack a BG definition.
3. **Mathematical foundations** — bool encoding for predicate proofs, the mechanism that enables soundness/completeness guarantees (see `decision_soundness_completeness.md`).

## Current baseline (what Sec 2.3 already covers)

The section currently has three paragraphs of prose covering:
- Motivation: why partial graph modeling over bounded model finding (incremental, incomplete specs)
- Refinery core: partial models with four-valued interpretation (must / must not / may / may not — fixed by O-4VAL), graph predicates as constraint language, design space exploration, refinement-based generation
- Four mechanisms used in Sec 04: error predicate, propagation rule (incl. negative elimination), shadow predicate, scope constraint

**What is missing:**
- Refinery code examples (`.problem` syntax) for the described mechanisms
- Mathematical definitions (relations, constraints as predicates, bool encoding)
- Any additional Refinery features used in Sec 04 but not yet introduced here

## Context (from consultation notes)

Oszkár: "Ami hiányzik, a BG-be egy rendes refinery magyarázat. Önhordónak kell lennie a cikknek." (What's missing is a proper Refinery explanation in BG. The paper must be self-contained.)

Oszkár: "Oszkár a matekot meg a refinery bevezetését megírja, egy példakódot kell keresni ami illusztratív. Kell neki helyet szorítani, kell page budget matek." (Oszkár will write the math and Refinery introduction. Need an illustrative example. Need page budget for him.)

## Acceptance criteria

- [ ] Sec 2.3 contains at least one Refinery `.problem` code example illustrating a core mechanism
- [ ] Mathematical foundations (bool encoding, predicate semantics) are defined
- [ ] Every Refinery concept used in Sec 04 has a corresponding definition in Sec 2.3
- [ ] The section is self-contained for a reader unfamiliar with Refinery
- [ ] Page budget in section metadata updated to accommodate the new content
