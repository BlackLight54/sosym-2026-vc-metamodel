---
name: "No code listings"
description: "No code listings in paper body — formal definitions in prose+math only, Refinery encodings in supplementary"
type: project
date: 2026-03-27
status: active
affects: "All section files (especially Sec 04, 05), figure design, supplementary material"
revisit_when: "If reviewer requests Refinery encoding in body, or paper moves to tool-demo track"
tags: format, code, supplementary
---

**Decision:** No code listings in the paper body. All formal definitions in prose and mathematical notation only. Refinery encodings go to supplementary material.
**Rationale:** Aligns with feedback that Refinery definitions belong in prose+math. Code listings consume page budget without advancing argument for Foundations Track. Math notation is the expected register.
**Why:** Page budget and register — Foundations Track evaluates metamodel and constraints, not tool syntax.
**How to apply:** No lstlisting, no fenced code blocks rendered as figures, no inline Refinery syntax in body. Supplementary material only.