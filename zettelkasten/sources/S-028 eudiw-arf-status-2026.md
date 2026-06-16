---
id: S-028
title: EUDI Wallet ARF v2.8.0 & eIDAS 2.0 implementing acts — status Q1–Q2 2026 (Notion)
type: source
maturity: developing
tags: [topic/eidas, topic/governance, topic/format, prov/notion]
citekey:
sources: ["inbox/notion/11-eu-digital-identity-wallet-arf-and-eidas-2-0-implementing-acts-status-report-q1-q2-2026.md"]
related: ["[[C-033 dual-issuance-mandate]]", "[[C-034 statutory-unlinkability-gap]]", "[[C-022 eidas-arf-format-mandate]]", "[[C-016 format-capability-matrix]]", "[[K-008 contradictory-cross-framework-constraints]]", "[[Q-008 broaden-governance-catalog]]"]
created: 2026-06-17
---

**EU governance status report (compiled in Notion), Q1–Q2 2026.** Tracks EUDI Wallet ARF v2.8.0 and
30+ eIDAS 2.0 implementing regulations. A current, primary-source grounding for the format-mandate
constraints the paper formalizes, replacing the coarse "SD-JWT-VC or mdoc" reading with the exact rules.

## Key rules captured
- **Dual issuance** (CIR 2024/2977, ARF Annex 3.01 PID Rulebook): every PID issued in BOTH ISO/IEC
  18013-5 (mdoc) AND SD-JWT VC → [[C-033 dual-issuance-mandate]].
- **Format restriction:** W3C VCDM NOT permitted for PIDs/qualified attestations (only non-qualified
  EAAs); mDL ONLY 18013-5. Tightens [[C-022 eidas-arf-format-mandate]].
- **Selective disclosure is hash-commitment, not ZK:** mdoc MSO salted hashes; SD-JWT VC `_sd` array.
  Both cross-verifier linkable; ARF mitigates by batch issuance + rotation, not cryptography.
- **Holder/device binding:** KB-JWT mandatory under HAIP; PID keys in certified WSCD at LoA High,
  ECDSA P-256 (BLS12-381 unsupported by hardware, not on ENISA's approved list).
- **ZKP/BBS+/AnonCreds out of baseline:** Discussion Topic G, draft TS13/TS14, "after launch"; future
  ZKP (HLR ZKP_06/08) must operate over already-issued mdoc/SD-JWT signatures.
- **Statutory unlinkability tension:** Reg. (EU) 2024/1183 Art. 5a(16)(b) → [[C-034 statutory-unlinkability-gap]].

## Relation to this work
Primary-source evidence that the governance conflict ([[K-008 contradictory-cross-framework-constraints]])
is real outside the constructed CSOK example. Anchors the journal's broadened governance catalogue
([[Q-008 broaden-governance-catalog]]).
**Open:** citekey UNRESOLVED — cite the primary instruments (Reg. (EU) 2024/1183; CIR 2024/2977;
EUDI Wallet ARF v2.8.0), not the Notion compilation.

## Links
- [[C-016 format-capability-matrix]] — the capability facts this grounds.
- [[C-022 eidas-arf-format-mandate]] — the mandate this sharpens.

## Source
Notion page 11 (inbox/notion/).
