# Threats to applicability in the EU legal/regulatory context

**Research synthesis, 2026-06-18.** Source: deep-research run `w7bu5mdj7` (5 angles, 27 sources fetched, 125 claims extracted, 25 adversarially verified, 23 confirmed, 2 refuted). Companion Zettelkasten map: [[M-009 threats-to-applicability]]. Companion todo: `context/todos/o-euthreat_regulatory_applicability.md` (O-EUTHREAT).

Scope as agreed: broad eIDAS 2 stack; relying-party angle treated both as real-world fact and as a metamodel scope gap; "is the problem real?" weighed across primary-source contradictions, deployment, and academic/civil-society critique.

---

## 1. Is the problem real? Yes, and the regulator documents it

The strongest evidence is the ARF's own text, not our constructed example or third-party critique. **ARF v2.9.0 §7.4.3.5.1** names Relying-Party *Linkability* as a privacy risk and concedes the mandated salted-hash baseline is linkable:

> "By comparing the received salt values, the Relying Party may find matching salt values ... conclude that the corresponding attestations must have been the same."

Zero-knowledge proofs sit in a separate subsection (§7.4.3.5.3) as a not-yet-baseline mitigation. The governance source therefore documents the exact vertical conflict the paper formalizes: a statutory unlinkability duty against linkable mandated formats, with the fix acknowledged but not bound.

Supporting layers of evidence, weighted by strength:

- **In-force mechanism (primary).** Reg. (EU) 2024/1183 Art. 5a(16)(b) unlinkability duty; mandated baseline formats are linkable (salted-hash, not ZK); Art. 5b(3) data-minimization bound at registration; dual issuance of two formats (mdoc and SD-JWT VC) neither of which supports predicate proofs.
- **Technology exists but is not bound (primary).** Unlinkability-capable schemes are now published EC specs (TS13, TS14) yet remain non-mandated. The contradiction is best stated as "governance does not yet bind the available technology," not "technology missing."
- **Institutional corroboration (primary).** A national DPA (AEPD) treats the minimization and linkability tension against the wallet as a live obligation.
- **Academic / civil-society (NOT yet verified, see §5).** Cryptographers' feedback on the ARF; SoK papers (Biedermann, Schwalm). Corroborating, not load-bearing.

---

## 2. Currency corrections (factual errors in the current draft)

| # | Item | Draft state | Correct state (June 2026) | Action |
|---|------|-------------|----------------------------|--------|
| 1 | ARF version | v2.7.3 (in section files + decision memory) | **v2.9.0, 21 May 2026** (v2.8.0 was 2 Feb 2026) | Bump string AND re-verify ARF-C1..C8 against v2.9.0 §5.4/§7.4 (two-minor jump) |
| 2 | Format taxonomy | "SD-JWT-VC or mdoc" | Four EAA realizations (SD-JWT VC, mdoc, JSON-LD W3C VC, X.509-AC) per ETSI TS 119 472-1 v1.2.1; ARF v2.9.0 §5.4 lists distinct families | Refine the coarse reading. **Do not** soften "W3C VCDM barred for PIDs/qualified attestations" (refuted, 1-2) |
| 3 | ZKP status | "single deferred draft TS13/TS14" | Two published-but-non-mandated specs: TS13 (arithmetic-circuit, v1.0.1, 26 Jan 2026), TS14 (multi-message-signature, v1.0, 27 Feb 2026); to ETSI as TS 119 476-2 (~Feb 2027) | Restate as published-but-non-mandated; TS13 is arithmetic-circuit, not narrowly zk-SNARK |

---

## 3. Threats to applicability, ranked by reviewer risk

1. **Relying-party scope gap (highest).** The three layers (DCL/CSL/FSL) are issuer/credential-structure-centric. eIDAS 2 Art. 5b and **CIR (EU) 2025/848** (adopted 6 May 2025, applicable 24 Dec 2026) impose a verifier-side regime the model does not express: register per intended use the attestations/attributes requested (Annex I point 9), a typed entitlement (Service_Provider, PID_Provider, QEAA_Provider, Non_Q_EAA_Provider, PUB_EAA_Provider), and the competent DPA; Art. 5b(3) forbids requesting beyond what was registered; over-asking grounds suspension (Art. 9(2)(c)); access is mediated by access certificates, not a Trusted List. Sibling instruments out of reach: cross-border matching (2025/846), breach notification (2025/847), certified-wallet listing (2025/849), trust/status governance. **Double-edged:** strengthens motivation and is a genuine limitation. The paper must state explicitly whether verifier-side governance is out of scope or an extension axis; the current draft leaves it silent.
2. **Moving-target regulation.** Three CIR batches Dec 2024 to Aug 2025; CIR 2025/848 is in force but only applicable 24 Dec 2026, after a typical mid-2026 submission. Frame currency as a dated snapshot.
3. **Coarse format reading.** See correction #2: the binary reading simplifies the four-realization rule. Refine without over-correcting.
4. **Single-jurisdiction (EU) framing.** The governance catalogue is EU-specific; generalization beyond eIDAS/GDPR/VCDM is asserted, not shown.
5. **Tool reliance (Refinery).** Portability of the predicates beyond one solver is untested (see Q-006).

---

## 4. Relying-party regime, in detail

Governance imposed on the verifier, structurally separate from issuer-side credential schemas and formats:

- **Instrument:** CIR (EU) 2025/848, legal basis Art. 5b(11) of Reg. (EU) 910/2014 (Art. 5b inserted by Reg. (EU) 2024/1183). Adopted 6 May 2025, published 7 May 2025, applicable 24 Dec 2026.
- **What must be registered:** for each intended use, the data (attestations and attributes) the RP intends to request (Annex I point 9); a typed entitlement; the competent DPA.
- **Minimization enforcement:** Art. 5b(3), "Relying parties shall not request users to provide any data other than that indicated pursuant to paragraph 2, point (c)." Over-asking is a suspension ground (CIR 2025/848 Art. 9(2)(c)).
- **Trust mechanism:** ARF v2.9.0 states there is no Trusted List or LoTE for relying parties; an RP holds access certificate(s) from an Access Certificate Authority.
- **Imprecisions to carry forward:** RP registration *certificates* were made optional (April 2025 comitology); cite the "registration record" for the mandatory backstop. The minimization duty attaches to Art. 5b(3), not to ETSI TS6. Entitlement *types* are set by CIR 2025/848 Annex I; ETSI TS 119 475 only defines their normative URIs.
- **Refuted (do not assert):** runtime wallet comparison of request-vs-registration as a settled, format-orthogonal enforcement mechanism is a discussion-topic proposal, not in force (0-3 vote).

---

## 5. Caveats before citing

- **External critique unverified.** The cryptographers' feedback and the named SoK papers (Biedermann, Schwalm) did not pass the workflow's verification step. Confirm titles, authors, venue, and dates before any citation (no-invented-references rule). The in-regulation evidence carries the argument independently.
- **EUR-Lex HTML did not render** for the verifier; CIR 2025/848 article text and dates come from the PDF plus four cross-consistent secondary sources. Identifiers and dates are consistent; capture the primary HTML once before camera-ready.
- **ETSI TS 119 472-1 PDF returned 403;** the four-realization list rests on the EC GitHub mirror plus two corroborating extractions.
- **One TS14 sentence was a paraphrase,** not located verbatim; cite ARF Topic G / the TS14 spec wording instead.

---

## 6. Open follow-ups (close before submission)

- [ ] Locate the exact 2025/xxxx OJ numbers and subjects of the 30 Jul 2025 round of eight CIRs (seven trust-services + one EAA specifications).
- [ ] Re-verify ARF-C1..C8 against ARF v2.9.0 §5.4/§7.4 (PID dual-issuance, proximity/mdoc, encoding-independence).
- [ ] Confirm the cryptographers' feedback citation; resolve Biedermann (S-020) and Schwalm (S-021) citekeys.
- [ ] Confirm the AEPD post title/date; fetch the rendered EUR-Lex HTML for CIR 2025/848.
- [ ] Decide and state the RP-scope-gap framing: deliberate out-of-scope, or a verifier/attribute-request extension.

---

## 7. Verified sources

Primary unless noted. Confidence high except where flagged.

| Topic | Identifier | Date | URL |
|-------|-----------|------|-----|
| ARF (current) | EUDI Wallet ARF v2.9.0 | 21 May 2026 | https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/releases ; https://eudi.dev/2.9.0/architecture-and-reference-framework-main/ |
| RP registration | CIR (EU) 2025/848 | adopted 6 May 2025, applicable 24 Dec 2026 | https://eur-lex.europa.eu/eli/reg_impl/2025/848/oj/eng |
| RP info to register | EC standards repo TS6 | 2025 | https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts6-common-set-of-rp-information-to-be-registered.md |
| Implementing acts (batch 2) | EC announcement, CIR 2025/846-849 | 6 May 2025 | https://ec.europa.eu/digital-building-blocks/sites/spaces/EUDIGITALIDENTITYWALLET/pages/909706465/New+round+of+EU+Digital+Identity+Wallet+implementing+regulations+adopted |
| Implementing acts (batch 1) | EC announcement, CIR 2024/2977-2982 | 4 Dec 2024 | https://ec.europa.eu/digital-building-blocks/sites/spaces/EUDIGITALIDENTITYWALLET/pages/896827698/European+Commission+adopts+new+round+of+EU+Digital+Identity+Wallet+implementing+regulations |
| ZKP TS14 | EC standards repo issue #468 | published 27 Feb 2026 | https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/468 |
| ZKP TS13 | EC standards repo issue #432 | published 26 Jan 2026 | https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/432 |
| EAA realizations | ETSI TS 119 472-1 v1.2.1 (via mirror) | Feb 2026 | https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/284 |
| EAA issuance | ETSI TS 119 471 v1.1.1 | 2026 | https://www.etsi.org/deliver/etsi_ts/119400_119499/119471/01.01.01_60/ts_119471v010101p.pdf |
| Unlinkability analysis | ETSI TR 119 476-1 v1.3.1 | 2026 | https://www.etsi.org/deliver/etsi_tr/119400_119499/11947601/01.03.01_60/tr_11947601v010301p.pdf |
| mdoc online presentation | ISO/IEC 18013-7 ed.2 | — | https://www.iso.org/obp/ui#!iso:std:iso-iec:ts:18013:-7:ed-2:v1:en |
| SD-JWT VC | IETF draft-ietf-oauth-sd-jwt-vc | draft | https://datatracker.ietf.org/doc/draft-ietf-oauth-sd-jwt-vc/ |
| ZKP discussion | ARF Discussion Topic G | — | https://eudi.dev/latest/discussion-topics/g-zero-knowledge-proof/ |
| GDPR (institutional) | AEPD blog, eIDAS2 + EUDI Wallet + GDPR | — (verify) | https://www.aepd.es/en/press-and-communication/blog/eidas2-the-eudi-wallet-and-the-gdpr-ii |
| Critique (UNVERIFIED) | Cryptographers' feedback on the ARF | — (verify) | https://www.cs.ru.nl/~jhh/publications/cryptographers-feedback.pdf |

**Refuted claims (do not assert):** (1) runtime wallet request-vs-registration comparison as settled enforcement (0-3); (2) that ETSI TS 119 472-1's JSON-LD realization overrides the ARF rule barring W3C VCDM for PIDs/qualified attestations (1-2).
