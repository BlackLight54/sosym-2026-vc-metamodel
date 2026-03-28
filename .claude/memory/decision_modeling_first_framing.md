---
name: "Thesis framing: modeling-first"
description: "Paper framed around multi-level metamodeling contribution, not error detection"
type: project
date: 2026-03-24
status: active
affects: "Sec 01 (intro framing), Sec 04 (approach), Sec 05 (evaluation), abstract, title"
revisit_when: "If reviewers want stronger detection/tooling claims, or if Refinery gains explicit error-reporting"
tags: framing, thesis
---

**Decision:** Frame the paper around multi-level metamodeling as the contribution. Refinery generates diverse graphs from partial metamodels — it does not detect errors algorithmically. Errors "become visible through the integrated formalization." The title leads with modeling, not detection.
**Rationale:** Previous title ("Detecting Cross-Layer Design Errors...") implied an error-detection algorithm. The actual mechanism is constraint formalization in a partial graph model. Detection-framing overpromises; modeling-framing matches the actual contribution for MODELS Foundations Track.
**Why:** Align claims with mechanism — the paper formalizes, it doesn't detect.
**How to apply:** Any sentence claiming "detection" or "error-finding" must be reframed as "formalization reveals" or "becomes visible through."
