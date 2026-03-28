---
id: "X12"
short: "dse-navigation"
title: "Clarify what design space exploration produces operationally"
status: done
priority: low
depends_on: []
binding_claims: [4]
target: "sections/03_overview.md"
pipeline: "x-crosscutting"
assigned: "claude"
created: "2026-03-28"
---

## Problem

Reviewer A (X03) question 3: "Could you clarify what 'diverse model instances' means operationally in design space exploration? How many configurations are typically generated, and how does the designer navigate them?"

Z01 item T26 adds operational parentheticals to usage modes (consistency checking = all error predicates false; error identification = at least one satisfied; exploration = generates completions or proves none exists). But T26 does not address the "how many / how to navigate" question.

The current Sec 3.2 defines exploration mode as "generates diverse credential ecosystem designs that satisfy all constraints" but does not operationalize "diverse" or describe designer workflow with generated results.

## Goal

Add 1-2 sentences in Sec 3.2 or 3.3 (usage workflow) clarifying:
- Refinery's generation produces multiple distinct graph completions of the partial model
- "Diverse" is Refinery's built-in diversity mechanism (different concrete assignments to abstract/unknown nodes)
- The designer inspects generated instances to understand the feasible design space — each instance is a concrete credential ecosystem configuration satisfying all constraints
- Typical generation produces 5-20 instances depending on scope bounds; the designer examines a sample, not an exhaustive enumeration

## Constraints

- Do not overspecify Refinery internals — the paper's contribution is the metamodel, not Refinery itself
- Keep brief (1-2 sentences)

## Acceptance criteria

- "Diverse model instances" is operationalized in Sec 3.2 or 3.3
- The reader understands what the designer receives from exploration mode and how they use it
