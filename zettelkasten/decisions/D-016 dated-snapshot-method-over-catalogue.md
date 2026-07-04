---
id: D-016
title: Moving-target regulation — dated snapshot, method over catalogue
type: decision
maturity: permanent
tags: [topic/eidas, topic/governance, kind/method, prov/self]
sources: ["context/threats_to_applicability_2026-06-18.html §0 Decision D"]
related: ["[[S-036 eidas2-implementing-acts-timeline]]", "[[S-034 eudiw-arf-2.9.0]]", "[[K-006 expressiveness-validation]]", "[[Q-008 broaden-governance-catalog]]", "[[C-013 cross-layer-constraint-taxonomy-c1-c9]]", "[[D-013 verifier-scope-issuer-remit]]"]
created: 2026-07-04
---

Regulatory currency is handled as a **dated snapshot** with an explicit as-of date (June 2026,
ARF v2.9.0), and the eIDAS/GDPR/VCDM catalogue is framed as a **dated instantiation of a method** —
cross-layer constraints as graph predicates — that outlives any regulation version.

## Rationale
The stack moved across three CIR batches between Dec 2024 and Aug 2025, the ARF advanced two minor
versions in six months, and CIR 2025/848 is in force but applicable only from 24 Dec 2026, after a
typical mid-2026 submission. Pinning to one version silently means being out of date by publication.
Foregrounding the durable method, with the regulation as a timestamped instance, protects the
contribution from the regulation moving again between submission and print. The same
method-vs-catalogue distinction answers the single-jurisdiction threat: the EU stack is one
instantiation, a second jurisdiction is future work ([[Q-008 broaden-governance-catalog]]).

## Commits the paper to
An as-of footnote; an explicit method-vs-catalogue distinction; the v2.7.3 → v2.9.0 re-verification of
ARF-C1..C8 already tracked in `context/todos/o-euthreat_regulatory_applicability.md` (O-EUTHREAT).

## Links
- [[S-036 eidas2-implementing-acts-timeline]] — the moving-target evidence.
- [[S-034 eudiw-arf-2.9.0]] — the version the snapshot pins.
- [[K-006 expressiveness-validation]] — the claim the re-verification protects.

## Source
eIDAS-expressiveness framing pass (2026-07-04, PR #3), Decision D in
`context/threats_to_applicability_2026-06-18.html`.
