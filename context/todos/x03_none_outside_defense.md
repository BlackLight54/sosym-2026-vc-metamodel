---
id: "X03"
short: "none-outside"
title: "Defend 'none falls entirely outside metamodel capacity' for expressiveness"
status: pending
priority: medium
depends_on: []
binding_claims: [6]
target: "sections/05_evaluation.md"
pipeline: "x-crosscutting"
assigned: "claude"
created: "2026-03-28"
---

## Problem

Sec 05.1.2 classifies eight eIDAS ARF regulatory constraints as: three fully expressible, five partially expressible, and none falling entirely outside the metamodel's capacity. The claim "none falls entirely outside" is strong — it means every EU regulatory constraint examined has at least some metamodel foothold. This claim rests on judgment calls about what "partially expressible" means and is not defended with a precise criterion.

The full constraint analysis is deferred to supplementary material. If the supplementary is not delivered or a reviewer disagrees with the partial/full classification boundary, the "none outside" claim is vulnerable.

## Source

- X02 (Claim-Evidence Audit): Issue I-5

## Goal

Either (a) add 1-2 sentences in Sec 05.1.2 defining the boundary between "partially expressible" and "outside capacity" with a concrete criterion, or (b) soften the claim to "at most partially expressible" without asserting full coverage of the regulatory space.

## Context for execution

The expressiveness table in Sec 05.1.2 currently shows three fully expressible constraints (tabled with metamodel predicates) and five partially expressible (analyzed in prose with two root causes: attestation-type subtyping needed for ARF-C2/C3/C5, per-claim privacy annotation needed for ARF-C6/C8). The "partially expressible" classification means the constraint can be partially captured in the metamodel but requires extensions for full expression.

A concrete criterion could be: "A constraint falls outside the metamodel's capacity if no metamodel element or cross-layer predicate addresses any aspect of the constraint's requirements. All eight ARF constraints address properties (attestation types, privacy annotations, credential structure) that have corresponding metamodel elements, even where the element's expressiveness is insufficient for full constraint encoding."

## Acceptance criteria

- The "none falls entirely outside" claim is either defended with a stated criterion or softened
- The expressiveness classification boundary is explicit
- Binding Claim #6 (expressiveness validation) remains delivered
