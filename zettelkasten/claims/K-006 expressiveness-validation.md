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

Constraint expressiveness is validated against EU regulatory sources: eight eIDAS ARF constraints
(extracted from v2.7.3, re-verified against v2.9.0 on 2026-07-13) classified as fully / partially /
not expressible (highest-risk claim).

## Evidence
§5.1.2: three fully expressible (ARF-C1, C4, C7), five partially expressible with two root causes
(attestation qualification levels; claim-granularity privacy), none outside the metamodel's capacity.
Framed strength-first with the partials owned ([[D-015 expressiveness-strength-first]]).
**Closed (currency, 2026-07-13):** all eight constraints re-verified against the fetched ARF v2.9.0
text (O-EUTHREAT, [[S-034 eudiw-arf-2.9.0]]). Requirement texts PID_02, ARB_01, ARB_01a, ARB_02,
PID_21, ARB_06 are substantively unchanged; the two section-referenced constraints moved with the
chapter-5 renumbering (ARF-C6: §5.3.4 to §5.4.4; ARF-C8: §5.3.3 to §5.4.3, ZKP contrast stable at
§7.4.3.5.3). Classification unchanged: 3 full, 5 partial, 0 not expressible. Prose re-pinned to
v2.9.0 in §5.1.2 and §5 limitations. **Open:** extended expressiveness figure not yet produced (T11).

## Links
- [[C-022 eidas-arf-format-mandate]] — the ARF source.
- [[Q-004 attestation-qualification-levels]], [[Q-005 claim-granularity-privacy-annotations]] — the two gap root causes.
- [[D-015 expressiveness-strength-first]] — the committed framing for this claim.

## Source
claim_06.
