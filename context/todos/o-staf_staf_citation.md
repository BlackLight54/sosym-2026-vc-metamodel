---
id: O-STAF
short: "staf-citation"
title: "Double-blind citation strategy for STAF/prior Refinery paper"
status: blocked
depends_on: []
binding_claims: []
target: sections/02_background.md, sections/05_evaluation.md, sections/06_related_work.md
priority: low
pipeline: "consolidation"
assigned: "martin"
created: "2026-03-28"
---

## Problem

The paper cites a "prior short paper" (farkas_prolog-based_2024) that applied Refinery to credential schema validation with a single-layer prototype, and potentially Al-Gburi et al. STAF 2026 (shared co-authors Semeráth, Kocsis). Under double-blind review, these self-citations must not reveal authorship.

## Options

1. **Cite in third person:** "Prior work [N] applied Refinery to..." — standard double-blind practice
2. **Omit:** Remove the self-citation entirely — loses the "extension of prior work" narrative
3. **Anonymize:** "[Anonymous] applied..." — some venues accept this

## Blocked on

Martin discussing with Oszkár which strategy to adopt. The self-citation is important for X11 (articulating what three-layer extension contributes beyond the single-layer prototype).

**Assigned to Martin.** Claude can implement the chosen strategy once Martin decides.
