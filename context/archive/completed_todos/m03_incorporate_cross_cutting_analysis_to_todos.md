---
id: "M03"
short: "cross-cutting-todos"
title: "Extract cross-cutting issues from section reviews into todos"
status: done
priority: high
depends_on: []
binding_claims: []
target: "context/todos/"
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

Read the cross-cutting review analyses from `prompts/.archive/2026-03-27_section_reviews/`:

- `X01_argument_coherence.md` — argument flow issues spanning multiple sections
- `X02_claim_evidence_audit.md` — claims without evidence, evidence without claims
- `X03_reviewer_simulation.md` — predicted reviewer objections
- `X04_decision_cfp_compliance.md` — CFP compliance gaps

For each cross-cutting issue that is not already captured by the Z01 triage (M04) or an existing todo:
1. Create a todo with the appropriate scope (single-section or multi-section).
2. Tag with `binding_claims` if it affects a specific binding claim's delivery.
3. Set priority based on submission risk (blocks acceptance → high, weakens acceptance → medium, polish → low).

**Relationship to M04:** M04 extracts from the Z01 synthesis (which aggregates per-section reviews). This task extracts from the cross-cutting analyses (X01–X04), which identify issues that span sections and may not appear in Z01's per-section triage. Run M03 after M04, then M01 deduplicates.

Acceptance criteria: all actionable cross-cutting issues from X01–X04 are captured as todos or confirmed as duplicates of Z01 items.
