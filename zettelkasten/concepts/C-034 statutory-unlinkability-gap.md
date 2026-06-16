---
id: C-034
title: Statutory unlinkability vs baseline-format gap (real-world conflict)
type: concept
maturity: developing
tags: [topic/eidas, topic/gdpr, topic/governance, layer/cross]
sources: ["inbox/notion/11-eu-digital-identity-wallet-arf-and-eidas-2-0-implementing-acts-status-report-q1-q2-2026.md"]
related: ["[[C-025 governance-conflict-vertical]]", "[[C-024 two-tier-governance-framing]]", "[[K-008 contradictory-cross-framework-constraints]]", "[[S-028 eudiw-arf-status-2026]]", "[[S-021 schwalm-ssi-eidas-contradiction-2022]]"]
created: 2026-06-17
---

Reg. (EU) 2024/1183 Art. 5a(16)(b) requires the EUDI Wallet to enable **unlinkability** where user
identification is not needed. But the mandated baseline formats (mdoc MSO, SD-JWT VC `_sd`) are
salted-hash commitments, not zero-knowledge: their disclosures are **cross-verifier linkable**. The ARF
concedes that only out-of-baseline ZKP/BBS+ schemes achieve cryptographic unlinkability, and defers them
to "after launch." A statutory privacy requirement and a format mandate are thus jointly unsatisfiable
under the currently approved capability set.

This is a **primary-source instance of the paper's central claim** outside the constructed CSOK example:
the EU's own framework documents a vertical governance conflict ([[C-025 governance-conflict-vertical]])
between a privacy statute and a format capability. It strengthens the manufactured-conflict defense
([[C-024 two-tier-governance-framing]]) — the tension is not an artifact of over-reading GDPR; the ARF
states it explicitly — and corroborates the informal contradiction in [[S-021 schwalm-ssi-eidas-contradiction-2022]]
with a concrete, dated, statutory citation.

## Links
- [[C-025 governance-conflict-vertical]] — the conflict pattern this instantiates in the wild.
- [[K-008 contradictory-cross-framework-constraints]] — external corroboration of the binding claim.
- [[S-028 eudiw-arf-status-2026]] — the source.

## Source
Notion ARF status report (page 11); Reg. (EU) 2024/1183 Art. 5a(16)(b); ARF v2.8.0 privacy section.
