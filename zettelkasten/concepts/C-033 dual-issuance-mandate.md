---
id: C-033
title: Dual-issuance mandate (mdoc AND SD-JWT VC)
type: concept
maturity: developing
tags: [layer/fsl, topic/eidas, topic/format, topic/governance]
sources: ["inbox/notion/11-eu-digital-identity-wallet-arf-and-eidas-2-0-implementing-acts-status-report-q1-q2-2026.md"]
related: ["[[C-022 eidas-arf-format-mandate]]", "[[C-016 format-capability-matrix]]", "[[C-024 two-tier-governance-framing]]", "[[S-028 eudiw-arf-status-2026]]"]
created: 2026-06-17
---

eIDAS CIR 2024/2977 (ARF Annex 3.01 PID Rulebook) requires every PID Provider to issue each PID in
**both** ISO/IEC 18013-5 (mdoc) **and** SD-JWT VC. W3C VCDM is not permitted for PIDs or qualified
attestations (only non-qualified EAAs); mDLs may use only 18013-5. The mandate is therefore
**conjunctive**, not disjunctive: a conformant PID design must satisfy two format families at once.

This sharpens [[C-022 eidas-arf-format-mandate]], which models C5 as "SD-JWT-VC or mdoc." The real rule
is stronger and tightens the format-mandate horn of Headline 1 ([[C-025 governance-conflict-vertical]]):
neither mandated format supports predicate proofs ([[C-016 format-capability-matrix]]), so the
conjunction cannot be escaped by choosing the more capable of the two — both are required, both lack the
capability GDPR's operationalization demands.

**Currency flag (June 2026):** the dual-issuance rule was read from ARF v2.7.3 / CIR 2024/2977. The current
ARF is v2.9.0 ([[S-034 eudiw-arf-2.9.0]]); re-verify that PID dual-issuance (mdoc AND SD-JWT VC) still holds
verbatim in v2.9.0 §5.4 before relying on the exact wording. See [[M-009 threats-to-applicability]].

## Links
- [[C-022 eidas-arf-format-mandate]] — the constraint this refines (or/and).
- [[C-016 format-capability-matrix]] — both mandated formats lack predicate proofs.
- [[S-028 eudiw-arf-status-2026]] — the source.

## Source
Notion ARF status report (page 11); CIR 2024/2977; ARF v2.8.0 Annex 3.01.
