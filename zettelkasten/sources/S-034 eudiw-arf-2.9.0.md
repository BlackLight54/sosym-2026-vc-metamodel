---
id: S-034
title: EUDI Wallet ARF v2.9.0 (current as of June 2026)
type: source
maturity: developing
tags: [topic/eidas, topic/governance, topic/format, prov/external]
citekey:
sources: ["https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/releases", "https://eudi.dev/2.9.0/architecture-and-reference-framework-main/"]
related: ["[[S-028 eudiw-arf-status-2026]]", "[[C-022 eidas-arf-format-mandate]]", "[[C-034 statutory-unlinkability-gap]]", "[[C-033 dual-issuance-mandate]]", "[[M-009 threats-to-applicability]]", "[[K-006 expressiveness-validation]]"]
created: 2026-06-18
---

**EUDI Wallet Architecture and Reference Framework, European Commission, v2.9.0, released 21 May 2026.** Verified primary (GitHub releases + eudi.dev/2.9.0 portal, 3-0 adversarial vote).

The current published ARF is **v2.9.0 (21 May 2026)**; v2.8.0 was 2 Feb 2026. The paper's section files and decision memory cite **v2.7.3** (≈Nov 2025), so the operative currency correction is **v2.7.3 → v2.9.0**, a two-minor-version jump. Section 5.4 specifies multiple technical attestation formats: 5.4.2 ISO/IEC 18013-5 + 23220-2 (mdoc), 5.4.3 SD-JWT VC, 5.4.4 W3C VC. Section 7.4.3.5 treats privacy: 7.4.3.5.1 *Linkability*, 7.4.3.5.2 *Mitigating Relying Party linkability*, 7.4.3.5.3 *Zero-Knowledge Proofs*.

## Relation to this work
Supersedes the Notion-compiled [[S-028 eudiw-arf-status-2026]] as the primary, version-pinned source. The §7.4.3.5 linkability text is direct regulator-side confirmation of [[C-034 statutory-unlinkability-gap]]. **Open (currency risk):** the eight evaluation constraints (ARF-C1..C8) were extracted from v2.7.3; the jump to v2.9.0 requires re-verifying they still hold in §5.4/§7.4 of the current text, not just bumping the version string ([[M-009 threats-to-applicability]], moving-target threat).

## Links
- [[C-022 eidas-arf-format-mandate]] — §5.4 format taxonomy (finer than "SD-JWT-VC or mdoc").
- [[C-034 statutory-unlinkability-gap]] — §7.4.3.5.1 linkability named by the ARF itself.
- [[S-028 eudiw-arf-status-2026]] — the Notion compilation this version-pins and corrects.

## Source
Deep-research synthesis 2026-06-18; cite ARF v2.9.0 (EUDI Wallet ARF, EC, 21 May 2026).
