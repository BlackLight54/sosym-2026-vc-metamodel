---
id: S-037
title: EUDI Wallet technical standards status (ETSI / ISO / IETF, 2026)
type: source
maturity: developing
tags: [topic/format, topic/eidas, prov/external]
citekey:
sources: ["https://www.etsi.org/deliver/etsi_ts/119400_119499/11947201/01.02.01_60/ts_11947201v010201p.pdf", "https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/284", "https://datatracker.ietf.org/doc/draft-ietf-oauth-sd-jwt-vc/", "https://www.iso.org/obp/ui#!iso:std:iso-iec:ts:18013:-7:ed-2:v1:en"]
related: ["[[C-022 eidas-arf-format-mandate]]", "[[C-016 format-capability-matrix]]", "[[S-034 eudiw-arf-2.9.0]]", "[[S-024 terbu-sdjwt-vc-2026]]", "[[M-009 threats-to-applicability]]"]
created: 2026-06-18
---

**ETSI / ISO / IETF technical standards underpinning the ARF, status as of early-mid 2026.** Verified primary where noted; two fetches were blocked (see caveat).

The EAA format taxonomy is **finer than "SD-JWT-VC or mdoc"**: ETSI **TS 119 472-1 v1.2.1** (Feb 2026) specifies four EAA realizations — (a) SD-JWT VC, (b) ISO/IEC mdoc, (c) JSON-LD W3C VC, (d) X.509 attribute certificate (RFC 5755). Related: ETSI **TS 119 471** (issuance of EAAs), ETSI **TS 119 475** (relying-party attribute/entitlement URIs), ETSI **TR 119 476-1** (unlinkability analysis of selective-disclosure schemes); ISO/IEC **18013-5** (mdoc, published) and **18013-7** (online/web presentation); IETF **draft-ietf-oauth-sd-jwt-vc** (still a draft).

## Relation to this work
Refines the format layer behind [[C-016 format-capability-matrix]] and flags the **coarse-format-reading** threat ([[M-009 threats-to-applicability]]): the paper's binary "SD-JWT-VC or mdoc" is a simplification of the current four-realization rule. **Do not over-correct:** a verified-refuted sub-claim (1-2 vote) establishes that TS 119 472-1's inclusion of JSON-LD W3C VC does **not** override the ARF rule that W3C VCDM is not permitted for PIDs/qualified attestations; the ETSI realization catalogue and the ARF format mandate are distinct.

## Links
- [[C-022 eidas-arf-format-mandate]] — the mandate these standards instantiate.
- [[C-016 format-capability-matrix]] — capability facts these refine.
- [[S-034 eudiw-arf-2.9.0]] — the ARF that references these standards.

## Source
Deep-research synthesis 2026-06-18. **Caveat:** the ETSI TS 119 472-1 PDF returned 403 to automated fetch; the four-realization list rests on the EC GitHub mirror (issue #284) plus two corroborating extractions. Verify version numbers against the ETSI deliverable before citation.
