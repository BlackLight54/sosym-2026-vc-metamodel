# Proto-SLR Axis (e): DIDComm and SSI Protocol Verification

## Scope

This axis covers formal verification of the protocols that make verifiable-credential ecosystems run: DIDComm messaging, the OpenID4VC issuance and presentation protocols (OID4VCI, OID4VP), the AnonCreds credential scheme, SSI web authentication protocols in the Braun/Horne/Kafer/Mauw line, and the expert and standards-body analyses of the EUDI Wallet's ARF credential formats. The paper needs this axis for two reasons. For RQ0, it is the richest documented error history inside the VC world itself: every major protocol in the stack has had design flaws found by formal analysis before or shortly after deployment, which is direct evidence that the design errors of future B2B/B2G ecosystems are anticipatable. For RQ1, it defines the paper's nearest formal-methods neighbors: behavioral, per-protocol verification (WIM, Tamarin, UC-style games) is exactly the layer the paper's design-time structural and governance constraints must be explicitly differentiated from, since none of these works models ecosystem-level, multi-source governance rules in one metamodel.

## Confirmed corpus

Note: the verified input contained the OIDF OpenID4VP report twice (identical locator); it is listed once below. 15 unique items.

| # | Title | Authors | Venue | Year | Locator | Kind |
|---|-------|---------|-------|------|---------|------|
| 1 | Privacy evaluation of the European Digital Identity Wallet's Architecture and Reference Framework | Abellan Alvarez, Hoelzmer, Sedlmeir | Computers & Security, vol. 160 (Elsevier) | 2026 | https://doi.org/10.1016/j.cose.2025.104707 | peer-reviewed |
| 2 | Cryptographers' Feedback on the EU Digital Identity's ARF | Baum, Blazy, Hoepman, Lehmann, Lysyanskaya, Mayrhofer, Montgomery, Nguyen, shelat, Slamanig, Thomsen et al. | Expert statement to the European Commission EUDI Wallet team (PDF at HPI; GitHub ARF discussion #211) | 2024 | https://hpi.de/oldsite/fileadmin/user_upload/fachgebiete/lehmann/Publications/cryptographers-feedback.pdf | report |
| 3 | OpenID for Verifiable Credentials: Formal Security Analysis Using the Web Infrastructure Model | Hauck | Universitat Stuttgart, master's thesis (OPUS) | 2023 | https://doi.org/10.18419/opus-13772 | grey-other |
| 4 | SSI, from Specifications to Protocol? Formally Verify Security! | Braun, Horne, Kafer, Mauw | Proceedings of the ACM Web Conference 2024 (WWW '24), pp. 1620-1631 | 2024 | https://doi.org/10.1145/3589334.3645426 | peer-reviewed |
| 5 | What Did Come Out of It? Analysis and Improvements of DIDComm Messaging | Badertscher, Banfi, Diaz | ACM CCS 2024, pp. 4732-4746; also IACR ePrint 2024/1361 | 2024 | https://doi.org/10.1145/3658644.3690300 | peer-reviewed |
| 6 | A Formal Security Analysis of Hyperledger AnonCreds | Fraser, Schneider | IEEE EuroS&P 2025 (accepted; IACR ePrint 2025/694) | 2025 | https://eprint.iacr.org/2025/694 | peer-reviewed |
| 7 | Securing Millions of Decentralized Identities in Alipay Super App with End-to-End Formal Verification | Mao, Ma, Huang, Yang, Zhang, Sun, Wang, Xue, Wang | IEEE/ACM ASE 2025 | 2025 | https://doi.org/10.1109/ASE63991.2025.00305 | peer-reviewed |
| 8 | Technical Report: Formal Security Analysis of the OpenID for Verifiable Presentations Specification, Final Report on Deliverable A.1(B) | Hauck, Hosseyni, Kuesters, Wuertele | OpenID Foundation technical report (Univ. Stuttgart, Institute of Information Security) | 2025 | https://openid.net/wp-content/uploads/2025/08/Report-Deliverable-A_1_B_.pdf | report |
| 9 | Formal Analysis of the OpenID for Verifiable Credential Issuance Protocol | Zischg (advisors Sasse, Hofmeier; responsible advisor Basin) | Semester project report, D-INFK, ETH Zurich | 2025 | https://ethz.ch/content/dam/ethz/special-interest/infk/inst-infsec/information-security-group-dam/research/software/zischg-oid4vci.pdf | grey-other |
| 10 | Unlinkability and history preserving bisimilarity | Aubert, Horne, Johansen, Mauw | Computers & Security | 2026 | https://doi.org/10.1016/j.cose.2025.104819 | peer-reviewed |
| 11 | Escaping from Identity Providers: Protecting Privacy with Verifiable Credentials in Community Solid Server | Macdonald, Horne, Boi | CEUR-WS Vol-3947, Solid Symposium 2024 posters (short paper, light review) | 2024 | https://ceur-ws.org/Vol-3947/short13.pdf | grey-other |
| 12 | A Passwordless Authentication Mechanism for the Web Using Self-Sovereign Identity | Ferdous, Ali, Chowdhury, Nahid, Ionita, Prinz | ACM Transactions on the Web | 2026 | https://doi.org/10.1145/3778360 | peer-reviewed |
| 13 | SISSI: An Architecture for Semantic Interoperable Self-Sovereign Identity-based Access Control on the Web | Braun, Papanchev, Kafer | Proceedings of the ACM Web Conference 2023 (WWW '23) | 2023 | https://doi.org/10.1145/3543507.3583409 | peer-reviewed |
| 14 | Invisible Traces: Subversion Attacks on Batch-Issued Credentials | Burmeister, Fennig, Franke, Friedrichs, Lehmann, Leissering, Letz, Oezbay | IACR ePrint 2026/1229 (HPI, University of Potsdam) | 2026 | https://eprint.iacr.org/2026/1229 | preprint |
| 15 | ETSI TR 119 476 V1.2.1: Analysis of selective disclosure and zero-knowledge proofs applied to Electronic Attestation of Attributes | ETSI (no individual authors listed) | ETSI Technical Report | 2024 | https://www.etsi.org/deliver/etsi_tr/119400_119499/119476/01.02.01_60/tr_119476v010201p.pdf | standard-spec |

## Classification

- **1. Abellan Alvarez et al. 2026 (EUDIW privacy evaluation): must-cite.** The central scholarly demonstration that design errors (linkability, over-disclosure) are already visible in the pre-deployment ARF specification; RQ0 cannot be argued without it.
- **2. Cryptographers' Feedback 2024: must-cite.** The canonical documented case of the research community flagging a VC-ecosystem design error (batch-issuance pseudo-unlinkability) before deployment; the anticipatability claim rests on it.
- **3. Hauck 2023 thesis: differentiate.** Closest early formal model of the EUDI exchange protocols (OID4VCI/OID4VP in WIM), a protocol-level neighbor whose scope delineates the paper's ecosystem-level delta; largely superseded by item 8 from the same group.
- **4. Braun et al. WWW '24 (seed): must-cite.** The axis seed and the advisor lead; proves a multi-spec SSI bundle is formally modelable only after implicit trust assumptions are made explicit, which is the RQ1 hinge.
- **5. Badertscher et al. CCS 2024 (DIDComm): must-cite.** A concrete, peer-reviewed design flaw in a deployed SSI transport found only by post-hoc formal analysis; prime taxonomy material for RQ0.
- **6. Fraser and Schneider 2025 (AnonCreds): must-cite.** The eight-year deployment-to-first-formal-analysis gap is the sharpest single data point for the verification-lag category in the design-error taxonomy.
- **7. Mao et al. ASE 2025 (Alipay): differentiate.** Novelty threat: "end-to-end formal verification of a DID system" sounds like the paper's territory but is code-level runtime verification of one consumer deployment, not multi-source governance modeling; also carries the RQ0 point that scale DID deployments today are consumer super-apps, not B2B/B2G.
- **8. OIDF OpenID4VP report 2025: differentiate.** The canonical runtime-protocol-verification neighbor; the paper must explicitly separate its design-time structural constraints from this WIM behavioral layer, while also using it as RQ0 evidence that standards bodies now commission pre-finalization verification. (Entered twice in the verified input; one item.)
- **9. Zischg 2025 (Tamarin OID4VCI): differentiate.** Documents the symbolic (Tamarin) tool track next to the WIM track; a close tooling neighbor, but a semester report, so cite only to complete the tool-landscape distinction.
- **10. Aubert et al. 2026 (bisimilarity): differentiate.** Defines the behavioral semantics of unlinkability that GDPR-derived constraints presuppose; needed to state precisely what the structural metamodel does and does not capture.
- **11. Macdonald et al. 2024 (Solid short paper): ignore.** Confirmed, but a light-review short paper whose deployment-spectrum point is carried more strongly by items 4 and 7.
- **12. Ferdous et al. TWEB 2026: ignore.** Confirmed metadata and that it cites the seed, but depth of formal analysis unverified and no RQ0/RQ1 claim depends on it; adds volume, not argument.
- **13. Braun et al. WWW '23 (SISSI): differentiate.** Close neighbor from the seed's own lineage; a brief cite marks the architecture-published-before-protocol-verified trajectory that the taxonomy names, no more is needed.
- **14. Burmeister et al. 2026 (Invisible Traces): must-cite.** The second-order design error (a flaw inside the ARF's chosen mitigation, batch issuance), found formally before B2B/B2G ecosystems exist; the taxonomy's strongest forward-looking exhibit. Caveat: preprint, not yet peer-reviewed.
- **15. ETSI TR 119 476: must-cite.** The governance corpus itself cataloguing the linkability limits of SD-JWT and mdoc; the metamodel ingests exactly this kind of document, and it fills the mdoc-analysis slot for which no dedicated peer-reviewed formal analysis was found.

Counts: must-cite 7, differentiate 6, ignore 2 (15 unique items).

## What exists, what is thin

The protocol-verification layer of this axis is dense and recent. Every major component of the eIDAS 2 / SSI stack now has at least one formal treatment: DIDComm (item 5, UC-style), AnonCreds (item 6, game-based), OID4VCI/OID4VP (items 3, 8, 9, WIM and Tamarin), the assembled SSI authentication bundle (item 4), and the ARF's credential-format choices (items 1, 2, 14, 15). The pattern across all of them is uniform and useful to the paper: analyses are per-protocol, behavioral, and post-hoc or spec-commissioned, and nearly every one found a real flaw or an implicit assumption the specifications left open.

What is thin is everything above the protocol layer. No item in this axis models an ecosystem: no formal treatment of multi-party governance structures, trust-registry topologies, role separation rules, or cross-layer constraints from law plus technical specs, and no structural/metamodel-based approach at all (the closest, item 7, verifies implementation code, not ecosystem design). There is also no dedicated peer-reviewed formal analysis of ISO mdoc (only the ETSI TR covers it), and the mdoc/SD-JWT batch-issuance mitigations are analyzed only in a not-yet-peer-reviewed preprint (item 14) and expert reports (item 2). B2B/B2G settings are entirely absent from this axis's corpus; every verified artifact targets consumer web or wallet flows.

## RQ0 evidence

No item in this axis defines or characterizes the future VC-based B2B/B2G ecosystem concept, and none names the threat of design errors in such ecosystems as its subject. Said plainly: the axis supplies the raw material for the anticipatability argument, not the argument itself. The paper must construct the B2B/B2G framing; this axis then evidences three of its premises with precise pointers:

- Errors are visible pre-deployment in specifications: item 1 (Abellan Alvarez et al.) argues from a systematic information-flow mapping that the EUDIW as specified in the ARF fails unlinkability across its key use cases; item 2 is a consensus statement of 16 cryptographers to the Commission that ARF 1.4's batch-issuance approach to unlinkability is inadequate and a redesign toward BBS-family anonymous credentials is needed. Both predate any B2B/B2G deployment.
- Deployed SSI protocols carried latent design flaws findable by formal analysis: item 5 shows DIDComm's combined AnonCrypt/AuthCrypt mode fails its expected guarantees unless restricted to AES-CBC+HMAC; item 6 gives AnonCreds its first formal security model roughly eight years after deployment; item 14 shows the batch-issuance mitigation itself admits undetectable issuer subversion breaking the promised unlinkability.
- Scale DID deployment today is consumer-only: item 7 is an industrial verification of a DID system inside the Alipay super app, which supports (indirectly, by being the only production-scale exhibit in the axis) the claim that B2B/B2G VC ecosystems remain hypothetical.

Caveat on precision: these pointers restate the verified corpus notes and abstracts; no verbatim quotes were extracted from full texts in this pass, so the paper should pull exact sentences from items 1, 2, and 5 before citing them for specific wording.

## RQ1 anchors

- **Item 4 (seed, Braun et al. WWW '24)**: the primary anchor. Its finding that W3C VC, DID, and Aries specifications compose into a verifiable protocol only after implicit trust assumptions are made explicit is the protocol-level analogue of RQ1's claim that multi-source constraints must be unified in one explicit model.
- **Items 3, 8, 9 (Stuttgart WIM analyses and ETH Tamarin model)**: define what formal modeling of the VC stack currently means (behavioral, per-protocol, computational or symbolic); they anchor the delta statement that no existing formal model captures ecosystem-level governance constraints.
- **Item 10 (Aubert et al.)**: anchors the semantics of unlinkability, the privacy property that GDPR-derived governance constraints would need to express; it fixes the boundary between behavioral equivalence properties and the structural graph predicates the paper's metamodel offers.
- **Item 7 (Mao et al.)**: feasibility anchor: whole-system formal treatment of a DID deployment is possible, but at code level; its existence sharpens rather than threatens RQ1 once the design-time versus runtime distinction is drawn.
- **Item 1 (Abellan Alvarez et al.)**: its role-and-information-flow mapping over the ARF is the closest thing to an ecosystem-level model in the axis, but it is qualitative; it anchors the claim that the modeling need is recognized while the formalization is missing.

## Seed resolution

Exact metadata (confirmed against the Crossref record for the DOI on 2026-07-13):

- Title: SSI, from Specifications to Protocol? Formally Verify Security!
- Authors: Christoph H.-J. Braun (Karlsruhe Institute of Technology), Ross Horne (University of Strathclyde), Tobias Kafer (Karlsruhe Institute of Technology), Sjouke Mauw (University of Luxembourg)
- Venue: Proceedings of the ACM Web Conference 2024 (WWW '24), Singapore, ACM, pp. 1620-1631
- Year: 2024
- DOI: https://doi.org/10.1145/3589334.3645426

Relation of the axis to the seed: the seed is the advisor lead and the axis was built outward from it in three directions. Backward, to its own lineage (item 13, SISSI, the unverified architecture the protocol grew from) and to the component analyses it presupposes (items 5, 6 on DIDComm and AnonCreds). Forward, to work citing it (items 7, 10, 11, 12: industrial-scale verification, refined unlinkability theory, a Solid implementation, and a journal SSI-auth design). Sideways, to the parallel verification track for the EUDI protocol stack the seed does not cover (items 1, 2, 3, 8, 9, 14, 15). The seed's core lesson, that SSI specifications underdetermine security and must be assembled into one explicit formal model before verification is possible, is the axis-level premise the paper lifts from the protocol layer to the ecosystem/governance layer.
