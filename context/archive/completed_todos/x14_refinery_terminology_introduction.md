---
id: "X14"
short: "refinery-terms"
title: "Introduce Refinery-specific terminology before first use"
status: done
priority: high
depends_on: []
binding_claims: [3, 4]
target: "sections/04_approach.md, sections/05_evaluation.md"
pipeline: ""
assigned: "claude"
created: "2026-03-28"
---

## Goal

Ensure all Refinery-specific terms are introduced before first use in Sec 04 and Sec 05. Oszkár noted that Refinery is not well-known among MDE reviewers; they will fall back to their own naming conventions (EMF, OCL, Alloy) and may misread Refinery-specific concepts.

## Context

**Source:** Oszkár's feedback during T08 review (2026-03-28). MDE reviewers (especially the Mathematician and Adversarial archetypes) know partial models, graph constraints, and model finding from other tools. Refinery's terminology overlaps but is not identical. If a term appears without introduction, the reviewer either skips it or maps it to a wrong concept.

## Terms to audit

Scan Sec 04 and Sec 05 for first occurrences of Refinery-specific terms. For each, verify it is introduced (defined or glossed) before or at first use. Organized by category:

### Metamodel structure (Refinery syntax for standard MDE concepts)

MDE reviewers know these concepts but under different syntax (EMF/Ecore, UML, Alloy). Refinery uses its own `.problem` file syntax — if the paper uses Refinery-specific keywords without mapping them to standard MDE concepts, reviewers will stumble.

- **class / abstract class** — Refinery's metaclass declaration; maps to EClass in EMF, Class in UML
- **extends** — single/multiple inheritance; maps to eSuperTypes in EMF, generalization in UML
- **contains** — containment reference (composition); maps to EReference with containment=true in EMF, UML composition
- **refers** — non-containment reference (association); maps to EReference in EMF, UML association
- **Multiplicity bounds** (`[0..*]`, `[1..1]`, etc.) — same semantics as EMF/UML but Refinery syntax differs
- **enum** — enumeration type; standard but syntax-specific
- **scope** — Refinery-specific: constrains the number of instances per class in generated models; no direct EMF equivalent

### Partial model semantics

These are Refinery-specific concepts with no direct equivalent in standard MDE tooling. Must be explicitly introduced.

- **Partial model** — Refinery's core representation; MDE readers may think "incomplete model" rather than Semeráth et al.'s 4-valued interpretation
- **Concretizability** (`check -k`) — whether a concrete model satisfying all constraints exists; not standard MDE terminology
- **Concretization / concrete model** — a fully resolved model with no unknowns
- **Refinement** — in Refinery, moving from partial to more concrete; distinct from standard MDE "refinement" (PIM→PSM)

### Constraint language

- **Graph predicate** — Refinery's constraint language (graph pattern + quantification); MDE readers may expect OCL or first-order logic
- **Error predicate** — a graph predicate whose satisfaction marks an invalid configuration; Refinery-specific role classification
- **Propagation predicate** — constrains refinement steps; eliminates invalid partial interpretations
- **Shadow predicate** — derived predicate that surfaces a consequence but does not directly constrain; used for anti-patterns

### Solver operations

- **`check`** — consistency checking (no internal contradictions in partial model)
- **`check -k`** — concretizability checking (a concrete model satisfying all constraints exists)
- **`generate`** — model generation (produce a fully resolved instance)

## Acceptance criteria

- [ ] Each Refinery-specific term above is glossed or defined at or before first use in the paper
- [ ] Terms that overlap with standard MDE vocabulary (partial model, refinement) are explicitly disambiguated
- [ ] No Refinery term appears in Sec 05 that was not introduced in Sec 02 (background) or Sec 04 (approach)
- [ ] The O-REFBG placeholder (Oszkár's Refinery background paragraph) is checked for coverage overlap; if it covers a term, the approach/evaluation sections can reference it rather than re-defining
