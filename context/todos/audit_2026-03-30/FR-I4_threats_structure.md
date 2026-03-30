---
id: "FR-I4"
short: "threats-structure"
title: "Threats to validity: restructure single paragraph into compact list"
status: pending
priority: medium
depends_on: []
binding_claims: []
target: "sections/05_evaluation.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Restructure the threats to validity paragraph into a more scannable format.

## Context

Line 124 of `sections/05_evaluation.md` contains all seven threats to validity compressed into a single dense paragraph. The threats are:

1. Silent promotion of unmarked entities (DCL structural inference)
2. Single running example selection bias
3. eIDAS ARF version specificity (v2.7.3)
4. Single governance context (EU/Hungarian)
5. Uniform synthetic scalability instances
6. Partially-expressible classification judgment
7. Single-tool dependency (Refinery)

These are substantive threats, well-identified. The issue is presentation: the Mathematician reviewer (persona B) expects structured validity discussion, typically organized by construct/internal/external validity or at minimum as a bulleted list. A wall-of-text paragraph makes individual threats harder to evaluate and suggests less careful analysis.

## Reviewer impact

- **Mathematician:** Will want to evaluate each threat individually. Single paragraph makes this harder.
- **Adversarial:** May cite presentation quality as evidence of insufficient rigor in self-evaluation.

## Action

Convert the paragraph into a compact list or structured format. Two options:

**Option A (minimal change):** Convert to a bulleted list, one bullet per threat, preserving the existing text. This changes layout but not content and is safe under page budget constraints.

**Option B (structured):** Group threats by validity type:
- *Construct validity:* silent promotion, partially-expressible classification
- *Internal validity:* single running example, uniform synthetic instances
- *External validity:* eIDAS version specificity, EU governance scope, single-tool dependency

Option A is safer under time pressure; Option B is more thorough but risks page budget.

## Acceptance criteria

- Each threat is individually identifiable (not buried in running prose).
- Total length does not exceed current paragraph length.
- All seven threats preserved.
