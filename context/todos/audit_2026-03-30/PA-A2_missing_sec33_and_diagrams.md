---
id: "PA-A2"
short: "missing-sec33-diagrams"
title: "Missing Sec 3.3 Usage Workflow + 2 scalability diagrams"
status: pending
priority: low
depends_on: []
binding_claims: []
target: "sections/03_overview.md, sections/05_evaluation.md"
pipeline: "audit_2026-03-30"
assigned: "martin"
created: "2026-03-30"
---

## Goal

Two structural gaps identified by the audit, both acceptable risks given page budget (~9.8 pages).

## Issue 1 — Sec 3.3 Usage Workflow missing (A2)

Decision `decision_sec03_overview_restructure` prescribes three subsections (3.1 Motivation, 3.2 Functional Overview, 3.3 Usage Workflow). Only 3.1 and 3.2 exist. The workflow content is partially absorbed into 3.2's final sentences. The decision itself notes 3.3 is "most compressible."

## Issue 2 — Missing 2 scalability diagrams (A3)

Decision `decision_evaluation_measurement_schema` requires 2 full-width `figure*` diagrams in the evaluation. Currently only `tab:scalability` exists; one figure is commented out (05_evaluation.md:106-115). The table is an adequate substitute for a 10-page paper, and adding figures would likely push past the page limit.

## Acceptable risk rationale

Both are page-budget tradeoffs. Sec 3.3 content is present, just not in its own subsection. The scalability table conveys the data; figures would improve presentation but risk page overflow. Address only if page budget allows after higher-priority fixes.
