---
id: C-034
title: Statutory unlinkability vs baseline-format gap (real-world conflict)
type: concept
maturity: developing
tags: [topic/eidas, topic/gdpr, topic/governance, layer/cross]
sources: ["inbox/notion/11-eu-digital-identity-wallet-arf-and-eidas-2-0-implementing-acts-status-report-q1-q2-2026.md"]
related: ["[[C-025 governance-conflict-vertical]]", "[[C-024 two-tier-governance-framing]]", "[[K-008 contradictory-cross-framework-constraints]]", "[[S-028 eudiw-arf-status-2026]]", "[[S-021 schwalm-ssi-eidas-contradiction-2022]]", "[[S-034 eudiw-arf-2.9.0]]", "[[S-038 eudiw-zkp-ts13-ts14]]", "[[M-009 threats-to-applicability]]"]
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

**Confirmed in the current ARF (June 2026 update):** ARF v2.9.0 §7.4.3.5.1 names Relying-Party *Linkability* as an explicit privacy risk, with dedicated subsections on mitigation (§7.4.3.5.2) and ZKP (§7.4.3.5.3). The ARF states: "By comparing the received salt values, the Relying Party may find matching salt values ... conclude that the corresponding attestations must have been the same." This is regulator-side acknowledgement of the gap. The unlinkability-capable schemes now exist as *published but non-mandated* specs ([[S-038 eudiw-zkp-ts13-ts14]]), so the contradiction is best stated as "governance does not yet bind the available technology," not "technology missing." See [[S-034 eudiw-arf-2.9.0]].

## Links
- [[C-025 governance-conflict-vertical]] — the conflict pattern this instantiates in the wild.
- [[K-008 contradictory-cross-framework-constraints]] — external corroboration of the binding claim.
- [[S-028 eudiw-arf-status-2026]] — the source.

## Source
Notion ARF status report (page 11); Reg. (EU) 2024/1183 Art. 5a(16)(b); ARF v2.8.0 privacy section.
