---
id: K-006
title: Constraint expressiveness validation vs EU regulation
type: claim
maturity: developing
tags: [topic/eidas, topic/evaluation, prov/self]
status: delivered
sources: [".claude/memory/claim_06_expressiveness_validation.md", "sections/05_evaluation.md §5.1.2"]
related: ["[[C-022 eidas-arf-format-mandate]]", "[[C-028 three-axis-validation]]", "[[Q-004 attestation-qualification-levels]]", "[[Q-005 claim-granularity-privacy-annotations]]", "[[D-015 expressiveness-strength-first]]", "[[S-034 eudiw-arf-2.9.0]]"]
created: 2026-06-16
---

Constraint expressiveness is validated against EU regulatory sources: eight eIDAS ARF v2.7.3
constraints classified as fully / partially / not expressible (highest-risk claim).

## Evidence
§5.1.2: three fully expressible (ARF-C1, C4, C7), five partially expressible with two root causes
(attestation qualification levels; claim-granularity privacy), none outside the metamodel's capacity.
Framed strength-first with the partials owned ([[D-015 expressiveness-strength-first]]).
**Open:** extended expressiveness figure not yet produced (T11). **Open (currency):** the eight
constraints were extracted from ARF v2.7.3; current is v2.9.0 — re-verification against §5.4/§7.4 is
pending (O-EUTHREAT, [[S-034 eudiw-arf-2.9.0]]) and blocks final delivery of this claim.

## Links
- [[C-022 eidas-arf-format-mandate]] — the ARF source.
- [[Q-004 attestation-qualification-levels]], [[Q-005 claim-granularity-privacy-annotations]] — the two gap root causes.
- [[D-015 expressiveness-strength-first]] — the committed framing for this claim.

## Source
claim_06.
