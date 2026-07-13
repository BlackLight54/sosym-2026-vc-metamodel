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

**Currency flag closed (2026-07-13):** re-verified against the fetched ARF v2.9.0 text
([[S-034 eudiw-arf-2.9.0]]). PID_02 (Annex 2.02, Topic 3) reads, verbatim: "A PID Provider SHALL
issue any PID in both the format specified in ISO/IEC 18013-5 [ISO/IEC 18013-5] and the format
specified in [SD-JWT VC]." The requirement is substantively identical to v2.7.3 (whitespace-only
diff). Dual issuance holds; the conjunctive reading stands. Note the rule's home is Annex 2
(Topic 3, PID Rulebook requirements), corroborated by the §5.4.1 format overview, not §5.4 itself.

## Links
- [[C-022 eidas-arf-format-mandate]] — the constraint this refines (or/and).
- [[C-016 format-capability-matrix]] — both mandated formats lack predicate proofs.
- [[S-028 eudiw-arf-status-2026]] — the source.

## Source
Notion ARF status report (page 11); CIR 2024/2977; ARF v2.8.0 Annex 3.01.
