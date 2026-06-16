---
source: notion
notion_id: 3640766f-0685-8174-ac3c-d66110a6e217
notion_url: https://app.notion.com/p/3640766f06858174ac3cd66110a6e217
title: EU Digital Identity Wallet ARF and eIDAS 2.0 Implementing Acts: Status Report Q1–Q2 2026
pulled: 2026-06-17
---

## TL;DR
- **ARF v2.8.0 (released 2 February 2026) is the current authoritative version** of the EU Digital Identity Wallet Architecture and Reference Framework, integrating final Discussion Papers for Topics T (Wallet Provider support and maintenance), AA (Strong Customer Authentication for payments), E (Pseudonyms) and R (User-to-device authentication), plus Member State comments from the European Digital Identity Cooperation Group (EDICG) meeting of 2 December 2025.
- **Two formats are normatively co-mandated for PIDs**: PID Providers SHALL issue every PID in both ISO/IEC 18013-5 (mdoc with COSE) and SD-JWT VC; selective disclosure is achieved by salted-hash commitment (no BBS+ in the baseline). W3C VCDM is referenced in CIR 2024/2977 but is operationally restricted to non-qualified EAAs; BBS+/BBS#, AnonCreds and zk-SNARKs are explicitly out-of-scope of the current normative framework and are tracked only as Discussion Topic G ("Zero-Knowledge Proof") and draft Technical Specifications TS13/TS14 for a post-launch addition.
- **More than 30 Commission Implementing Regulations (CIRs) under Regulation (EU) 2024/1183 have been adopted and published in the OJ** — five core wallet acts on 4 December 2024 (CIRs 2024/2977–2982), four on 7 May 2025 (CIRs 2025/846–849), seven trust-services acts on 30 July 2025 (CIRs 2025/1566–1572), and a further wave on qualified trust services (CIRs 2025/1929, 1942–1946, 2160, 2162, decision 2164, 2527, 2530–2532). Three amending acts on standards, EAAs and relying-party registration are in public consultation until **5 March 2026**, while the remote on-boarding act (Article 5a(24)) has closed feedback but is not yet adopted.
---
## Key Findings
### 1. ARF Versioning and Recent Changes
- **Current version: v2.8.0**, tag `0c9e759`, signed and released 2 February 2026 by the Commission's editor (paolo-de-rosa) on `eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework`.
- The v2.8.0 changelog (Section 1.6) lists changes driven by 44 Member-State comments on v2.7.3 received around the EDICG meeting of 2 December 2025; further integration of the **final Discussion Papers** for Topic T (Support and Maintenance by the Wallet Provider), Topic AA (Strong Customer Authentication for electronic payments), Topic E (Pseudonyms and User authentication mechanism), and Topic R (Authentication of the User to the device); alignment with progress on Technical Specification TS3; and resolution of multiple Confluence/GitHub issues. Four figures were updated and one new figure added.
- v2.7.3 (12 Nov 2025) and v2.7.2 (11 Nov 2025) were minor maintenance releases; v2.7.0 (10 Nov 2025) integrated revised Topic E, F and T discussion papers; v2.6.0 (13 Oct 2025) added Topic S (Certificate Transparency) and updated Topics P/Q/R/Z; v2.5.0 (15 Sep 2025) introduced Topic Z (device-binding implementation) and the first papers on P/Q/R; v2.4.0 (18 Jul 2025) and v2.3.0 (4 Jul 2025) integrated Topic K and Topic U (Wallet Trust Mark). The release cadence has been roughly monthly in late 2025.
### 2. Credential Formats — Mandatory vs. Optional
**For PID (Person Identification Data):**
- The ARF's Annex 3.01 (PID Rulebook) and the underlying CIR 2024/2977 (laying down rules on PID and EAAs) require every PID Provider to **issue any PID in both the format specified in ISO/IEC 18013-5 (mdoc) and the format specified in SD-JWT VC** — a "dual-issuance" rule. Wallet Solutions and Relying Parties consequently must implement both. The PID Rulebook chapters explicitly fix the data-element identifiers for the mdoc namespace `eu.europa.ec.eudi.pid.1` and the SD-JWT VC `vct` URN convention `urn:eudi:pid:<MS>:<rulebook-version>`.
- W3C Verifiable Credentials Data Model is mentioned in CIR 2024/2977 (recital and Annex), but ARF Section 5.3.4 and the PID Rulebook treat W3C VCDM as **not permitted for PIDs and qualified attestations**; its use is permitted only for non-qualified EAAs, and Wallet Solutions are not required to support it (open Issue #486 in the ARF repository documents the active dispute over whether SD-JWT VC actually fulfils the CIR's W3C VCDM reference).
**For (Q)EAAs and PuB-EAAs:**
- The same two encodings (ISO/IEC 18013-5/23220-2 mdoc and SD-JWT VC) are normative. ETSI TS 119 472-1 v1.2.1 (Feb 2026), referenced from the ARF's Standards and Technical Specifications repository, additionally recognises four realisations — SD-JWT VC, ISO/IEC-mdoc, JSON-LD W3C-VC, X.509-AC — but only the first two are inside the EUDI Wallet's mandated profile.
- For mDLs specifically, only ISO/IEC 18013-5 is permitted (per CIR rules and the mDL Rulebook); SD-JWT VC must not be used for mDL.
### 3. Signature Schemes and Selective Disclosure
<table header-row="true">
<tr>
<td>Scheme</td>
<td>Status in ARF v2.8.0</td>
<td>Selective disclosure mechanism</td>
</tr>
<tr>
<td>**mdoc / ISO/IEC 18013-5 (issuerAuth = COSE_Sign1 over MSO)**</td>
<td>**MUST** for PID and qualified attestations</td>
<td>Salted-hash commitments; MSO carries digests of `IssuerSignedItem` (random salt + element value) — selectively revealed at presentation</td>
</tr>
<tr>
<td>**SD-JWT VC (JOSE/JWS)**</td>
<td>**MUST** for PID and qualified attestations</td>
<td>`_sd` array of salted hashes; disclosures sent separately base64url-encoded; key binding (KB-JWT) mandatory under HAIP</td>
</tr>
<tr>
<td>**W3C VCDM with Data Integrity proofs (incl. ECDSA-SD, BBS)**</td>
<td>Not mandatory; permitted only for non-qualified EAAs</td>
<td>Out-of-baseline</td>
</tr>
<tr>
<td>**BBS+ / BBS#**</td>
<td>**Not in baseline.** Discussed in Topic G (Discussion Paper v1.4, 30 March 2025) and in TS14 (multi-message signature ZKP). Pairing-friendly curve BLS12-381 is not in ENISA's agreed cryptographic mechanisms list v2.0 (April 2025) and is unsupported by mainstream WSCD/TPM hardware</td>
<td>Native unlinkability + selective disclosure (multi-message sig)</td>
</tr>
<tr>
<td>**zk-SNARKs / arithmetic-circuit ZKPs**</td>
<td>Discussion paper Topic G + TS13. Not yet specified normatively</td>
<td>ECDSA-based ZKPs (e.g. Crescent, Anonymous Credentials from ECDSA) may operate over existing mdoc/SD-JWT VC issuer signatures without changing issuance</td>
</tr>
<tr>
<td>**ECDSA P-256**</td>
<td>The de-facto algorithm: required for device-binding keys in WSCDs (LoA High); supported in Android/iOS Keystore APIs</td>
<td>—</td>
</tr>
</table>
Topic G's Section 5 lists nine High-Level Requirements (ZKP_01–ZKP_09): a future ZKP scheme **SHALL** support proofs of attribute possession, validity, non-revocation and device-binding while hiding all attributes; **SHOULD** support already-issued mdoc/SD-JWT VC PIDs (i.e., issuer-side change-free designs are preferred); **SHALL** rely solely on algorithms standardised by an organisation recognised by the Commission; **SHALL NOT** prevent LoA High. ZKP integration is explicitly scheduled for "after the launch of the EUDI Wallet."
### 4. Implementing Acts Timeline (under Regulation (EU) 2024/1183)
**Adopted and published in the Official Journal — wallet core (Art. 5a(23), 5b, 5c, 5d, 5e, 11a):**
- **CIR 2024/2977** — PID and electronic attestations of attributes (28 Nov 2024, OJ 4 Dec 2024)
- **CIR 2024/2979** — Integrity and core functionalities of EUDI Wallets (28 Nov 2024, OJ 4 Dec 2024)
- **CIR 2024/2980** — Trust framework / ecosystem notifications (28 Nov 2024, OJ 4 Dec 2024)
- **CIR 2024/2981** — Certification of EUDI Wallets (28 Nov 2024, OJ 4 Dec 2024) — Annex IV requires WSCD assessment against LoA High per Implementing Regulation (EU) 2015/1502
- **CIR 2024/2982** — Protocols and interfaces (28 Nov 2024, OJ 4 Dec 2024) — references OpenID4VCI, OpenID4VP, ISO/IEC 18013-5/-7, HAIP
- **CIR 2025/846** — Cross-border identity matching (Art. 11a(3))
- **CIR 2025/847** — Security breaches of EUDI Wallets (Art. 5e(5))
- **CIR 2025/848** — Registration of wallet-relying parties (Art. 5b(11))
- **CIR 2025/849** — List of certified EUDI Wallets (Art. 5d(7))
**Adopted on 30 July 2025 — trust services / attestation issuance:**
- **CIR 2025/1566** — Verification of identity of QC/QEAA holders (Art. 24(1c))
- **CIR 2025/1567** — Management of remote QSCDs as qualified trust services (Art. 29a(2), 39a)
- **CIR 2025/1568** — Peer reviews of eID schemes (Art. 12(6), 46e(7))
- **CIR 2025/1569** — QEAAs and EAAs by/on behalf of public sector bodies responsible for an authentic source (Art. 45d–45f)
- **CIR 2025/1570** — Notification of certified QSCDs (Art. 31(3), 39(3))
- **CIR 2025/1571** — Annual reports by supervisory bodies (Art. 46a(7), 46b(7))
- **CIR 2025/1572** — Notification of intention to provide qualified trust services (Art. 21(4))
**Subsequent adoptions through autumn 2025:**
- **CIR 2025/1929** — Qualified electronic time stamps (Art. 42(2))
- **CIR 2025/1942** — Qualified validation services for QES/QESeals (Art. 33(2), 40)
- **CIR 2025/1943** — Reference standards for qualified certificates for ES/ESeals (Art. 28(6), 38(6))
- **CIR 2025/1944** — Qualified electronic registered delivery services (Art. 44(2)) — published 29 Sept 2025
- **CIR 2025/1945** — Validation of QES/QESeals and AdES based on QC (Art. 32(3), 40, 32a(3), 40a)
- **CIR 2025/1946** — Qualified preservation services (Art. 34(2), 40)
- **CIR 2025/2160** — Risk-management requirements for non-qualified TSPs (Art. 19a(2))
- **CIR 2025/2162** — Accreditation of CABs for QTSPs (Art. 20(4))
- **CID 2025/2164** — Trusted lists template version (Art. 22(5))
- **CIR 2025/2527** — Qualified certificates for website authentication (Art. 45(2))
- **CIR 2025/2530** — Requirements for QTSPs (Art. 24(5))
- **CIR 2025/2531** — Qualified electronic ledgers (Art. 45l(3))
- **CIR 2025/2532** — Qualified electronic archiving services (Art. 45j(2))
- **CIR 2026/248** — Reference formats for advanced electronic signatures and seals (Art. 27(5), 37(5))
**In public consultation, deadline 5 March 2026:**
- **PLAN/2025/2856** — amends CIRs 2024/2979, 2982, 2977, 2980 to update standards/technical-spec references (under Art. 5a(23)).
- **PLAN/2025/2863** — amends CIR 2025/1569 on EAAs (Art. 45d–45f).
- **PLAN/2025/2854** — amends CIR 2025/848 on registration of wallet-relying parties (Art. 5b(11)).
**Public-feedback closed but not yet adopted:**
- Implementing act on **remote user on-boarding** under Art. 5a(24) (reference standards for remote identity proofing onto the wallet).
The 24-month wallet-availability clock under Regulation (EU) 2024/1183 runs from the entry into force of the Article 5a(23) acts (24 December 2024); Member States must therefore make at least one wallet available by **late December 2026**. Mandatory acceptance by regulated private-sector relying parties and VLOPs/gatekeepers follows 36 months after entry into force, i.e., late December 2027.
### 5. Open Technical Questions and Deferred Decisions
**(a) Revocation.** The ARF (Section 6.6.6.4 and Annex 2 Topic 7) recognises three mechanisms — short-lived attestations (≤ 24 h), Attestation Status List (ASL, IETF OAuth Status List, currently `draft-ietf-oauth-status-list-18`), and Attestation Revocation List (ARL, ISO/IEC CD 18013-5 second edition). The PID/Attestation Provider chooses (HLR VCR_12); Wallet Providers and Relying Parties must support both ASL and ARL (VCR_10/VCR_11). Privacy of revocation checks remains the most actively contested area: the position-on-status-list is a perfect correlator (raised in IETF OAuth WG threads and reflected in ARF Topic A "Privacy risks and mitigations"). Privacy-preserving revocation via cryptographic accumulators is mentioned only in Topic G as a future requirement. The reference implementation `eudi-srv-statuslist-py` supports ASL (draft-02) and ARL.
**(b) Trust anchors and trust-list infrastructure.** Trust anchors live in **Trusted Lists** for QEAA Providers and PuB-EAA Providers (under eIDAS Art. 22 and CID 2025/2164 trusted-list template), and in **Lists of Trusted Entities (LoTE)** for entities that are not formal trust service providers — Wallet Providers, PID Providers, Access Certificate Authorities (Access CAs), and Providers of Registration Certificates (ARF §3.5). The Commission operates a common trust-infrastructure URL registry. Two specific issues remain open: (i) **Certificate Transparency for access certificates** is required only "once such a log is available" (ARF §3.18, Topic 55, Topic S), with no production CT log yet for `wallet-relying-party access certificates`; (ii) **Issuer hiding** during presentation (so that selective disclosure does not leak which trust anchor was used) is a stated goal of Topic G but not yet specified.
**(c) Wallet-to-wallet / peer-to-peer credential exchange.** ARF v2.8.0 §6.6.4 (`PID or attestation presentation to another Wallet Unit`) introduces this flow only at a general level: the requesting Wallet Unit needs a WUA (Wallet Unit Attestation) and an access certificate; the requested Wallet Unit may log relevant WUA fields (Topic C). Concrete bindings — protocol stack (OpenID4VP over BLE/NFC vs. ISO/IEC 18013-5 device retrieval), trust evaluation of the requesting wallet, double-blind privacy properties — are explicitly deferred. There is no completed Discussion Paper specifying wallet-to-wallet flows.
Other deferred items called out in the ARF v2.8.0 main text include: pseudonym Use Cases B–D (cryptographic binding to a presented attestation, rate-limited "one-person-one-vote" pseudonyms, cross-relying-party linkable pseudonyms — Topic 11), embedded disclosure policies machine-readable language (Topic 19/40), and the WSCD architecture types beyond local-native (remote HSM and local-external WSCD trust models).
### 6. LFDT Anoncreds Integration
- **Anoncreds is not mentioned in the ARF main text.** ARF §5.3 lists exactly three attestation formats: ISO/IEC 18013-5/23220-2, SD-JWT VC, and W3C VCDM (latter restricted to non-qualified EAAs). The CL-signature-based Anoncreds v1 schema/credential-definition/registry model (originally in Hyperledger Indy, now under Linux Foundation Decentralized Trust) maps to none of these.
- **Cryptographic-profile compatibility:** The ARF's normative cryptography requires that PID device-binding keys live in a certified WSCD (LoA High) using algorithms supported by typical mobile secure elements — practically ECDSA on P-256 (secp256r1) and RSA. ENISA's "agreed cryptographic mechanisms" list v2.0 (April 2025) does not include the BLS12-381 pairing-friendly curve used by BBS+ and Anoncreds-V2, and Android Keystore/iOS Secure Enclave do not expose BLS12-381 primitives. CL signatures (Anoncreds v1) similarly rely on RSA-strong-RSA group operations that are not part of any approved profile. Therefore, an Anoncreds-style issuer signature could not directly be used to sign a PID at LoA High under the current rules.
- **Where Anoncreds-style proofs could enter:** Topic G's Discussion Paper (v1.4, 30 March 2025) and the draft TS14 ("Implementation of ZKP based on multi-message signatures in the EUDI Wallet") explicitly contemplate **BBS+/BBS# multi-message signatures**, which are the same family of building blocks used in Anoncreds v2 (`hyperledger/anoncreds-v2-rs`). The Cryptographers' Feedback discussion on the ARF (GitHub Discussion #211) specifically points the Commission's wallet team at AnonCredsV2 as a reference. However, Topic G's HLR ZKP_08 requires that any future ZKP scheme **SHALL rely solely on algorithms standardised by a standardisation organisation recognised by the Commission**; the IRTF CFRG BBS draft (`draft-irtf-cfrg-bbs-signatures`) and ISO/IEC PWI 24843 are still in progress, and Anoncreds itself is not on track for an EU-recognised standardisation track.
- **Practical situation:** Implementations such as the Lissi ID-Wallet support both ARF-defined formats (mdoc, SD-JWT VC) and Anoncreds in parallel, but Anoncreds artefacts are **outside the ARF profile** and would not be valid as PIDs or QEAAs under the EUDI Wallet ecosystem. Indicio's Proven platform similarly markets Anoncreds support alongside EUDI compliance as separate, non-interoperable tracks.
- **Net assessment for a researcher:** No, Anoncreds (v1 CL or v2 BBS+) is not currently within the ARF's permitted attestation cryptography. The closest path forward is the Topic G/TS13/TS14 work, which envisages **adding** ZKP capabilities (likely an ECDSA-based circuit ZKP first, e.g., Crescent/zk-creds, with BBS-family schemes a longer-term option contingent on (i) ENISA/SOG-IS curve approval, (ii) IRTF CFRG BBS standardisation, and (iii) WSCD hardware support). Even then, the ARF expects ZKPs to be generated **over already-issued mdoc or SD-JWT VC issuer signatures** (HLR ZKP_06), not to replace those formats with an Anoncreds-style credential definition.
---
## Details
### ARF v2.8.0 normative pyramid
The ARF distinguishes informative chapters (1–9 narrative) from **Annex 2 High-Level Requirements (HLRs)** organised by Topic; only the HLRs in the latest Annex 2 are authoritative. Discussion Papers (in `docs/discussion-topics/`) are explicitly **non-normative once integrated** and may become outdated. The ARF itself is informative: only Regulation (EU) 2024/1183 and the adopted CIRs are legally binding — a point reiterated in §1.3 of v2.8.0.
The roles taxonomy in Chapter 3 is unusually rich: User, Wallet Provider, PID Provider, QEAA Provider, PuB-EAA Provider (issued by/on behalf of a public-sector body responsible for an authentic source), non-qualified EAA Provider, QESRC (remote signing) Provider, Authentic Source, Trusted List/LoTE Provider, Relying Party (with a careful distinction between Relying Party and Relying Party Instance — each Instance receives its own access certificate), Intermediary, CAB, Supervisory Body, Device Manufacturer, Attestation Scheme Provider, NAB, Registrar, Access CA, Provider of Registration Certificates.
WSCD architecture types (§4.5) are explicitly enumerated as remote, local-external, local-internal, local-native and hybrid. Importantly, the CIR 2024/2981 Annex IV requires that, prior to certification under a national scheme, the WSCD be assessed against assurance level high under Implementing Regulation (EU) 2015/1502 — i.e., the WSCD by legal definition complies with LoA High requirements.
### Why mdoc and SD-JWT VC are dual-mandated
The technical rationale, visible in Annex 2 and in the High-Assurance Interoperability Profile (HAIP) referenced from the Standards and Technical Specifications repo, is that mdoc covers proximity flows efficiently (offline NFC/BLE under ISO/IEC 18013-5; remote presentation under ISO/IEC 18013-7) while SD-JWT VC covers remote/online flows over OpenID4VP and is interoperable with the broader OAuth/OpenID ecosystem. The Reference Implementation FAQ confirms the policy ("we will be supporting both mDoc and SD-JWT format"); Germany's national PID Rulebook implements both, with the German extension namespace `eu.europa.ec.eudi.pid.de.1` for additional fields under ARF rule PID_06.
### Selective-disclosure cryptography in detail
Both mdoc and SD-JWT VC implement selective disclosure by **issuer-side commitment to per-attribute hashes with random salts** and **disclosure of (salt, value) pairs at presentation time**. This is a hash-commitment, not a zero-knowledge scheme: every disclosure across two presentations of the same credential reveals the same issuer signature plus the same `{salt, hash}` for any disclosed attribute, which is therefore linkable across verifiers ("Relying Party linkability"). The ARF's mitigation is **batch issuance and rotation** (Topic B "re-issuance and batch issuance of PIDs and attestations") rather than cryptographic unlinkability — a deliberate, often-criticised trade-off. Article 5a(16)(b) of Regulation (EU) 2024/1183 requires unlinkability "where the attestation of attributes does not require the identification of the user", but the ARF acknowledges that the only schemes that achieve this cryptographically are out-of-baseline (BBS+/BBS#, programmable ZKPs).
### Implementing-act dependency graph and amendments
The three amending acts under consultation (PLAN/2025/2854, /2856, /2863) are the first formal acknowledgement that the December 2024 wallet quintet (CIRs 2024/2977/2979/2980/2982 and the relying-party CIR 2025/848) need updates to reflect ARF evolution. PLAN/2025/2856 explicitly aligns standards/technical-spec references — i.e., it is the regulatory vehicle that will pull HAIP, OpenID4VP, OpenID4VCI, ISO/IEC 18013-5 second edition and SD-JWT VC's evolving IETF draft into the legally binding layer.
### Wallet-to-wallet flow scope
ARF §6.6.4 introduces wallet-to-wallet presentation as a use case primarily for representation (a guardian's wallet authenticating to a child's wallet, or peer-to-peer credential transfer in payment SCA scenarios linked to Topic AA). The architecture inherits the standard Relying-Party trust model — one wallet acts as a Relying Party Instance to the other and must hold an access certificate. There is no Discussion Paper resolved for wallet-to-wallet at v2.8.0; community proposals (e.g. ToIP and DIDComm-based options used in Lissi/Indicio) are explicitly out-of-scope.
---
## Caveats
- The list of \~30 adopted CIRs above is drawn directly from the Commission's "European Digital Identity Regulation" page (last updated 6 February 2026) and the legal-context section of ARF v2.8.0 §1.2. The Commission's own materials list adoption dates and the "amending act in progress" annotations; this report reproduces the OJ identifiers (CIR 2024/2979 etc.) but the precise OJ L numbers/page references are best verified against EUR-Lex `data.europa.eu/eli/reg_impl/<year>/<no>/oj`.
- **CIR 2026/248** on advanced electronic signature/seal formats is listed as "adopted" on the Commission page (with link `OJ:L_202600248`); since I have not directly fetched the OJ entry, treat the "2026" numbering as provisional pending direct EUR-Lex verification.
- The ARF is explicitly informative; HLR text in Discussion Papers (including in Topic G) is **proposed**, not enacted, until integrated into Annex 2. Statements about "Topic G is normative" should be qualified: the integrated ZKP HLRs in Annex 2 of v2.8.0 are authoritative, the Discussion Paper itself is not.
- The relationship between the ARF's "must support both mdoc and SD-JWT VC" stance and the CIR 2024/2977 reference to W3C VCDM v1.1 is the subject of unresolved GitHub Issue #486; expect this to be addressed in the upcoming amending act PLAN/2025/2856 or in a follow-on ARF revision.
- ENISA's "agreed cryptographic mechanisms" v2.0 (April 2025) and the SOG-IS list set the de-facto cryptographic profile, but they are not formally part of the implementing acts; their evolution (in particular potential addition of pairing-friendly curves) will gate any future BBS+/Anoncreds-style integration.
- All version numbers, dates and identifiers above were captured between February 2026 and the time of writing (May 2026). A v2.9.0 ARF release between the December 2025 EDICG meeting cycle and the next one is plausible but had not appeared on the GitHub releases page at last check (v2.8.0 is "Latest"). Forthcoming changes will most likely incorporate the outcomes of the 5 March 2026 public-consultation closure on the three amending acts and any final TS3/TS13/TS14 outcomes.
