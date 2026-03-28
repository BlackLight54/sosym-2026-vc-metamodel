---
id: "Z-P3"
short: "approach-fsl"
title: "Approach — FSL elaboration + formalization gaps"
status: pending
depends_on: ["Z-P2"]
binding_claims: [1, 3]
target: "sections/04_approach.md"
priority: high
pipeline: "z01-triage"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Elaborate the format-specific layer with one format-internal structural constraint (Decision B), reframe "less mature" as a scope boundary, and fix formalization gaps flagged by Z01. Bundles Z01 items T07, T09, T36, T37, T44, T45, plus Decision B (FSL elaboration).

**Prerequisite:** Z-P2 should run first — the multi-layer rename must be done, and Sec 2.2 detail (Ecore notation, partial model characterization) will have been moved into the approach preamble.

## Read before writing

1. `sections/04_approach.md` — full current text
2. `models/vc_metamodel.refinery` — authoritative Refinery encoding, especially FSL section
3. `sections/02_background.md` — verify what Z-P2 moved to Sec 04
4. `.claude/memory/decision_no_code_listings.md` — formal definitions in prose+math only

## What to draft

### Decision B: FSL elaboration

**Strategic decision:** Martin decided to elaborate the FSL beyond reframing, adding substance to demonstrate it is a genuine metamodel layer.

**Add one format-internal structural constraint:**
Propose SD-JWT-VC's hash-based selective disclosure structure as the constraint. SD-JWT-VC encodes each disclosable claim as a separate hash digest in the JWT body; the holder reveals claims by including corresponding disclosure objects. This imposes a structural constraint: every claim marked as selectively disclosable must have a corresponding disclosure entry, and the number of disclosures bounds the verification cost. Formalize as a graph predicate:

$$\text{disclosure\_required}(c) \iff \text{format}(cred, \text{SD\text{-}JWT\text{-}VC}) \wedge \text{selectively\_disclosable}(c) \wedge \neg\text{has\_disclosure}(c)$$

This is a format-internal constraint — it operates within the FSL, not across layers — demonstrating that the FSL carries genuine structural semantics beyond capability lookups.

**Important:** Verify against `models/vc_metamodel.refinery` whether this constraint or something analogous already exists. If not, note that the constraint is defined in the paper but implementation in the Refinery model is left for future work — state this explicitly.

### Z01 fixes

**T09 — Reframe "less mature" (Sec 4.3, around line 106 and Sec 7 line 15):**
The FSL subsection and the conclusion both say the FSL is "less mature." Replace with a precise scope statement:

In Sec 4.3: "The format-specific layer formalizes capability predicates and governance annotations sufficient for cross-layer constraint detection. Format-internal structural constraints — such as SD-JWT-VC's hash-based disclosure structure (see below) — are partially addressed; a comprehensive encoding of format-internal semantics is orthogonal to the cross-layer contribution and left for future work."

In Sec 7: Replace "less mature than the domain concept and credential schema layers, with fewer constraints formalized" with "currently formalizes capability predicates and governance annotations; extending it with richer format-internal structural constraints would deepen the formalization without altering the cross-layer methodology."

**T07 — Acyclicity claim (line 31):**
The text says "these constraints ensure that every DCL instance is a connected, acyclic information graph" and has a `.todo` annotation saying "Acyclicity constraint (error cyclic) not yet in vc_metamodel.refinery — add before submission." Soften to "connected information graph with tree-structured containment" and remove the `.todo` marker. The tree structure follows from the containment hierarchy (Prop owned by Entity, Value contained in Prop) without needing an explicit acyclicity predicate.

**T36 — Semi-formal definitions for `non_connected` and `no_self_loop` (line 31):**
These predicates are mentioned but not defined. Add brief semi-formal definitions:

$\text{non\_connected}(e_1, e_2) \iff \neg\text{neighbours}^*(e_1, e_2)$, where $\text{neighbours}(e_1, e_2) \iff \exists p.\ \text{statement}(e_1, p, e_2) \vee \text{statement}(e_2, p, e_1)$.

The `no_self_loop` propagation rule: for any Prop $p$ with $\text{property}(e, p)$, set $\text{value}(p, e)$ to **false** in the three-valued interpretation.

**T37 — Entity alignment forward reference (around line 153):**
The `aligned` shadow predicate is used in the cross-layer section but first appears without forward reference from the CSL section. Add a sentence at the end of the CSL subsection (before the scenario table): "The trace references from CSL to DCL also induce an alignment relation between credential entities that trace to the same domain entity; this relation is formalized as a shadow predicate in \autoref{sec:cross-layer}."

**T44 — "derived from" → "traced to" (line 13):**
In the approach preamble, the phrase "each layer is derived from the one above" is imprecise — the layers are not derived by refinement. Replace with "each layer is traced to the one above" to match the trace reference semantics.

**T45 — "Supplementary material" refrain (7 occurrences):**
The phrase "provided in the supplementary material" or similar appears ~7 times in Sec 04. Add one statement at the section opening: "Complete Refinery encodings for all layer definitions and constraints are provided in the supplementary material." Then shorten or remove subsequent occurrences — at most keep one reminder at the end of the cross-layer subsection.

## Constraints

- Sec 04 budget: 3.0 pages total
- All formal definitions in prose + math, NOT code listings
- Predicate names must match `models/vc_metamodel.refinery` where they exist
- Use `\autoref{}` for cross-references
- Net growth from this todo should be ≤15 lines (FSL constraint adds ~8 lines; reframing and compression offset)

## Acceptance criteria

- [ ] One format-internal structural constraint defined formally in FSL subsection
- [ ] "less mature" absent from Sec 04 and Sec 07
- [ ] Acyclicity claim softened, `.todo` marker removed from line 31
- [ ] `non_connected` and `no_self_loop` have semi-formal definitions
- [ ] `aligned` forward-referenced from CSL subsection
- [ ] "derived from" → "traced to" in preamble
- [ ] "Supplementary material" consolidated to ≤2 occurrences
- [ ] All `.formal` markers in Sec 04 addressed or removed
