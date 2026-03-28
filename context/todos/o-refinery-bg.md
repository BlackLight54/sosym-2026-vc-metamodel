---
id: "O-REFBG"
short: "refinery-bg"
title: "Create page budget placeholder in Background for Oszkár's Refinery + math foundations"
status: pending
priority: high
depends_on: []
binding_claims: [3, 4]
target: "sections/02_background.md"
pipeline: ""
assigned: "oszkár"
created: "2026-03-28"
---

## Goal

Reserve space in Sec 02 (Background) for Oszkár's Refinery introduction and mathematical foundations. Oszkár will write:
1. A self-contained Refinery explanation (partial graph modeling, graph predicates, design space exploration)
2. Mathematical definitions needed for the approach (relations, constraints as predicates, bool encoding for predicate proofs)
3. An illustrative example code snippet that demonstrates the core mechanism

## Context (from consultation notes)

Oszkár: "Ami hiányzik, a BG-be egy rendes refinery magyarázat. Önhordónak kell lennie a cikknek." (What's missing is a proper Refinery explanation in BG. The paper must be self-contained.)

Oszkár: "Oszkár a matekot meg a refinery bevezetését megírja, egy példakódot kell keresni ami illusztratív. Kell neki helyet szorítani, kell page budget matek." (Oszkár will write the math and Refinery introduction. Need an illustrative example. Need page budget for him.)

Technical note: The predication proof approach uses bool encoding. This is the mechanism that enables the soundness/completeness guarantees (see `decision_soundness_completeness.md`).

## Acceptance criteria

- [ ] Sec 02 contains a clearly marked placeholder subsection for Refinery foundations (~0.5–0.75 pages)
- [ ] Placeholder specifies what Oszkár needs to cover: partial graphs, predicates, bool encoding, example
- [ ] Page budget in section metadata updated to accommodate the new subsection
- [ ] No Refinery concepts used in Sec 04 without being defined in this BG subsection (or flagged as needing definition)
