---
id: S-038
title: EUDI Wallet ZKP specs TS13 / TS14 (published, non-mandated)
type: source
maturity: developing
tags: [topic/format, topic/eidas, topic/gdpr, prov/external]
citekey:
sources: ["https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/468", "https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/432", "https://eudi.dev/latest/discussion-topics/g-zero-knowledge-proof/"]
related: ["[[C-034 statutory-unlinkability-gap]]", "[[C-016 format-capability-matrix]]", "[[D-010 range-proofs-future-work]]", "[[S-034 eudiw-arf-2.9.0]]", "[[M-009 threats-to-applicability]]"]
created: 2026-06-18
---

**EUDI Wallet zero-knowledge-proof technical specifications, EC, published early 2026.** Verified primary (EC standards repo issues #468/#432, 3-0 vote).

ZKP is no longer a single deferred line item. Two specs are **published but non-mandated**: **TS13** (arithmetic-circuit based; compatible with Bulletproofs and SHA-256 systems; grounded in "Anonymous Credentials from ECDSA"), v1.0.1, 26 Jan 2026; and **TS14** (multi-message-signature based), v1.0, 27 Feb 2026. Per issue #468, TS14 "is not referenced in any CIR (EU)", is framed as "exploratory work... not intended to be a final specification", and is to be handed to ETSI as TS 119 476-2 (expected 28 Feb 2027). Discussion Topic G defines full unlinkability such that no party, including PID/attestation providers colluding with relying parties, can correlate presentations.

## Relation to this work
Updates the captured "single deferred item / draft TS13/TS14" state and **sharpens** [[C-034 statutory-unlinkability-gap]]: the unlinkability-capable schemes now *exist as published specs* yet remain **legally non-mandated** relative to the in-force, linkable baseline formats. The gap is therefore not "technology missing" but "governance not yet binding the available technology" — a cleaner statement of the contradiction. Corrects the brief's gloss: TS13 is arithmetic-circuit based, not narrowly zk-SNARK.

## Links
- [[C-034 statutory-unlinkability-gap]] — the gap this sharpens.
- [[D-010 range-proofs-future-work]] — predicate/range proofs deferred similarly.
- [[S-034 eudiw-arf-2.9.0]] — ARF §7.4.3.5.3 positions ZKP as not-yet-baseline.

## Source
Deep-research synthesis 2026-06-18; cite the EC TS13/TS14 deliverables (or the GitHub issues for status).
