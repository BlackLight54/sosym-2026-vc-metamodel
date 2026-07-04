---
id: D-014
title: Vertical conflict presented as regulator-documented, not author-constructed
type: decision
maturity: permanent
tags: [topic/governance, topic/eidas, kind/method, prov/self]
sources: ["context/threats_to_applicability_2026-06-18.html §0 Decision B"]
related: ["[[C-034 statutory-unlinkability-gap]]", "[[C-025 governance-conflict-vertical]]", "[[C-021 csok-running-example]]", "[[K-008 contradictory-cross-framework-constraints]]", "[[S-034 eudiw-arf-2.9.0]]"]
created: 2026-07-04
---

The motivation headlines the **regulator's own text**: ARF v2.9.0 §7.4.3.5.1 names Relying-Party
linkability as a privacy risk and concedes the mandated salted-hash baseline is linkable, with ZKP
(§7.4.3.5.3) a distinct not-yet-baseline mitigation. The CSOK running example is positioned as an
**instantiation of a live conflict**, not its origin.

## Rationale
Leading with an author-constructed example invites "is this a real problem?". The framework's own
admission pre-empts the constructed-straw-problem objection and lets the in-regulation evidence carry the
argument independently of the unverified academic critique ([[S-040 cryptographers-feedback-arf]] and the
SoK papers). The bridge to the formal result: the G0–G7 ablation shows only the full governance
conjunction is unsatisfiable, so the conflict shape is structural, and the ARF documents the same shape
in force — CSOK instantiates it.

## Commits the paper to
Quoting ARF §7.4.3.5.1 in the motivation and positioning CSOK as an instantiation of a live conflict,
not its origin.

## Links
- [[C-034 statutory-unlinkability-gap]] — the regulator-documented conflict.
- [[C-025 governance-conflict-vertical]] — the CSOK instantiation (Headline 1).
- [[K-008 contradictory-cross-framework-constraints]] — the binding claim this framing delivers.

## Source
eIDAS-expressiveness framing pass (2026-07-04, PR #3), Decision B in
`context/threats_to_applicability_2026-06-18.html`.
