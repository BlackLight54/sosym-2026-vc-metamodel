---
id: "X11"
short: "prior-work-extension"
title: "Articulate what three-layer extension contributes beyond 'two more layers'"
status: pending
priority: medium
depends_on: []
binding_claims: []
target: "sections/06_related_work.md"
pipeline: "x-crosscutting"
assigned: "claude"
created: "2026-03-28"
---

## Problem

Adversarial reviewer question (X03 Reviewer D, Q3): "The paper cites a 'prior short paper' (reference 10) that 'applied Refinery to credential schema validation with a single-layer prototype.' The present work extends to three layers. What specifically is new beyond adding two more layers and their constraints?"

Z01 item T04 fixes the double-blind self-citation phrasing but does not address the substantive question: what is the intellectual contribution of the three-layer extension beyond mechanical expansion?

The prior short paper (farkas_prolog-based_2024) applied Refinery to credential schema validation with a single-layer prototype. The current paper extends to three layers. The reviewer wants to know what this extension *teaches* or *enables* that the single-layer version could not.

## Goal

In the self-citation passage in Sec 06 (related work), after the fixed third-person citation, add 1-2 sentences articulating the qualitative advance:

1. **Cross-layer constraint methodology:** The single-layer prototype validated credential schemas in isolation. The three-layer extension introduces a constraint methodology for independently governed sources — the cross-layer predicates (C1-C9) are the primary contribution, not the layers themselves.
2. **Governance conflict detection:** The headline results (governance conflict, cross-credential predicate gap) are structurally impossible in a single-layer model because they require reasoning across governance sources that attach at different layers.
3. **Independent governance as a modeling dimension:** The insight that layers are not related by top-down refinement but by independent governance sources is the conceptual advance. This is what distinguishes the work from standard multi-level modeling extension.

## Constraints

- Double-blind: maintain third-person framing for the self-citation
- Keep to 1-2 sentences — the related work section is space-constrained (0.75 page budget)

## Acceptance criteria

- The self-citation passage explains what the three-layer extension contributes beyond scale
- The explanation centers on cross-layer constraints and governance conflict detection, not on layer count
- Double-blind compliance maintained
