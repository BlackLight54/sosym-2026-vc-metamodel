# Proto-SLR Corpus Map (cross-axis synthesis)

Synthesized 2026-07-13 from axis files (a) through (g), candidates.json, dropped_coverage.md, and do_not_cite_additions.md. This is the deliverable the paper pipeline consumes. Every item named below exists in the verified corpus with a working locator; nothing is cited from memory.

## 1. Method and caps

The proto-SLR ran seven axes, (a) VC/SSI ecosystem definitions and B2B/B2G deployments, (b) EUDI Wallet / ARF, (c) QEAA, data spaces, organizational and mandate credentials plus an Industry 4.0/5.0 probe, (d) X.509/PKI error history, (e) DIDComm and SSI protocol verification, (f) MDE/ontology modeling (cheap pass), and (g) a single-provenance resolution of the Siemens Dublin talk. Each axis used multiple finder modalities (academic index, web, standards/grey, citation-chasing from seeds), capped at 12 candidates per finder with a global verification cap of 90, as recorded in dropped_coverage.md, which also lists roughly 180 items seen but dropped at the caps or as overlaps. Every surviving candidate went through adversarial existence verification against a live locator; the outcome is 74 verified entries (65 CONFIRMED, 9 CORRECTED, 0 UNVERIFIABLE, so do_not_cite_additions.md is empty). Full coverage was explicitly not required; this is a scoping corpus for RQ0/RQ1 grounding, not a completed SLR, and the paper should describe it as such. A standing caveat from every axis applies: characterizations rest on abstracts, index records, and verification notes, so exact quotations must be pulled from full texts at drafting time.

## 2. RQ0 verdict

Across all seven axes the answer is uniform and every axis file states it plainly: no item in the verified corpus characterizes the design-error threat for future VC-based B2B/B2G ecosystems. None anticipates the design errors such ecosystems will face, and none draws on X.509/PKI error history for that purpose. RQ0's framing is unclaimed ground in this corpus, and the paper should claim it as its own contribution.

The ecosystem concept is likewise defined nowhere in consolidated form. What exists is a documented definitional gap plus partial definitions by practice:

- Gap chain, 2020 to 2026 (axis a, f): Schmidt et al. 2021 (SSI ecosystem "rapidly changing and ill-defined", re-check exact wording against full text), Soltani et al. 2021 (surveys the ecosystem while conceding the definition is open), Schardong and Custodio 2022 (defining SSI is the primary open conceptual problem), Laatikainen et al. 2021 (SSI ecosystems as emergent, prospective socio-technical business ecosystems), Richter and Anke 2026 (consolidated framework still missing as of 2026).
- Definitions by practice: the ARF plus Inza 2025 define the EUDI B2C ecosystem specifically (axis b); Otto, ten Hompel, Wrobel 2022 define data spaces as designed ecosystems (axis c); Durumeric et al. 2013 operationalize the certificate ecosystem as a measurable object (axis d). None generalizes to the VC B2B/B2G ecosystem concept RQ0 needs.

Items that come closest to the threat characterization, in decreasing proximity: Gruener et al. 2023 (systematic SSI threat model, present-tense, not ecosystem-level or anticipatory), Sharif et al. 2025 (EUDI threat model, single ecosystem, threat-level not design-error-level), Slamanig 2025 (recurring, predictable failure pattern in identity ecosystems, but with anonymous-credentials history rather than X.509), Serrano et al. 2019 (retrospective PKI incident taxonomy, wrong ecosystem), Burmeister et al. 2026 (a second-order design error found formally before any B2B/B2G deployment, one instance not a characterization), and Franz and Shams 2022 (one practitioner-named design friction, grey).

Consequence for how the paper argues relevance: RQ0 cannot be supported by a direct citation and must be constructed as a three-legged argument, each leg fully citable. Leg 1, the ecosystem is hypothetical and its concept unsettled (axes a, c, g: gap chain above plus Bochnia et al. 2024, Gloeckler et al. 2024, pilot/prototype evidence from Tan 2023, Abid 2022, OrgBook BC as the single production counterpoint, and the Siemens prototype talk). Leg 2, design errors are demonstrably visible pre-deployment in the one ecosystem now being built (axes b, e: Abellan Alvarez et al. 2026, Cryptographers' Feedback 2024, Hauck 2023, Burmeister et al. 2026, OIDF report 2025). Leg 3, a comparable credential trust ecosystem's error history has been documented, classified, and partly anticipated (axis d, see section 4). The synthesis of the three legs into an anticipatory design-error taxonomy for B2B/B2G VC ecosystems is the paper's own move.

## 3. RQ1 anchoring

The strongest verified items the formal-metamodel question builds on, per axis:

- Axis a: Sroor et al. 2022 is the primary anchor and primary novelty threat (multi-source SSI governance modeled, but visually and informally; the paper's delta is formal checkable graph predicates). Barclay et al. 2020 (ecosystem modeling stopped at iStar goal/actor models). Ding and Sato 2024 (formal verification of SSI exists, at architecture/protocol level).
- Axis b: ARF v2.x (the artifact the architecture layer must reproduce; version churn motivates machine-checkable conformance). De Marco et al. 2024 (informal legal-to-technical mapping, the exact mapping RQ1 formalizes). Ebadi Ansaroudi et al. 2025 (governance constraint checked against deployment-spectrum facts, the paper's cross-layer predicate pattern in the wild). Hauck 2023 (protocol-level formal neighbor). Inza 2025 (regulatory-layer anchor).
- Axis c: ETSI TS 119 471 (the concrete normative policy source whose requirements are candidates for graph-predicate formalization). Gaia-X Trust Framework 22.10 (existing machine-checkable cross-layer governance over W3C VCs, informally layered). vLEI EGF v4.0 (the nearest existing metamodel claim, built on the Trust over IP Governance Metamodel; documentary prose-and-policy versus formal analyzable metamodel is the load-bearing distinction). Gloeckler et al. 2024 (scholarly source taxonomy for multi-source constraints). Flamini et al. 2025 (mandate relations admit formal treatment, protocol level).
- Axis d: Kumar et al. 2018 (ZLint) is the primary methodological precedent: rules from two governance sources compiled into machine-checkable predicates, at artifact level; the paper lifts this to ecosystem-level graph predicates. Brubaker et al. 2014 (spec ambiguity produces implementation divergence, the core motivation for formal constraints). Lopez et al. 2005 (failure causes are multi-source: technical, economic, legal, social). Grindal et al. 2025 (governance as a first-class causal layer).
- Axis e: Braun et al. WWW '24 (the seed: multi-spec SSI bundles verify only after implicit trust assumptions are made explicit in one model; the protocol-level analogue of RQ1). The Stuttgart WIM analyses and ETH Tamarin model define what formal VC modeling currently means, fixing the delta. Aubert et al. 2026 fixes the boundary between behavioral unlinkability semantics and structural graph predicates. Mao et al. 2025 (whole-system formal treatment is feasible, at code level).
- Axis f: Richter and Anke 2026 (governance as a distinct layer legitimizes the layered metamodel). ARES 2024 eIDAS/ToIP mapping (multi-source governance alignment is manual today). W3C VC Vocabulary v2.0 (the normative data-model baseline the metamodel extends beyond). LIGHTest (trust frameworks made machine-readable before, as policy language not metamodel).
- Axis g: no RQ1 anchors; at most the Franz and Shams lifecycle phases as domain requirements the metamodel should express.

The cross-axis picture: formal treatment exists below the target (protocol, code, data model, certificate artifact) and informal treatment exists at the target (Sroor, vLEI EGF, De Marco, ARES mapping, Gaia-X); no verified item combines ecosystem-governance scope with formal checkable constraints. The related-work section must assemble the gap from these partial neighbors; there is no single rival.

## 4. X.509 precedent grounding

Yes, the design-error taxonomy can be motivated from documented PKI error history using axis (d), and axis (d) alone carries it. The axis provides an unbroken 25-year arc and, crucially, both premises the analogy needs:

- Anticipation precedent: Ellison and Schneier 2000 enumerated design-level PKI risks before mass deployment; several later materialized as documented incidents (Fox-IT Black Tulip 2012 for CA compromise, Serrano et al. 2019 for identity-verification lapses). This is the direct evidentiary pattern for anticipating errors in an ecosystem that does not yet exist.
- Taxonomizability precedent: Serrano et al. 2019 (1300+ incidents collected, 379 analyzed, explicit incident taxonomy) and Hadan et al. 2021 (peer-reviewed failure-dimension analysis, plus the finding that expert intuition diverges from incident data, which justifies grounding the taxonomy in documented history rather than speculation).

Error classes and their carriers: misissuance (Kumar et al. 2018), revocation/status failure (Liu et al. 2015, the class with the most direct VC analog in status lists and registries), verifier-side validation misuse (Georgiev et al. 2012), spec ambiguity causing divergence (Brubaker et al. 2014), single-point-of-trust compromise (Fox-IT 2012), governance failure and institutional remediation (Grindal et al. 2025), design/reality mismatch (Gutmann 2002), multi-source failure causation (Lopez et al. 2005), with Clark and van Oorschot 2013 as the canonical systematization citation and Durumeric et al. 2013 as the ecosystem-measurement template.

Existing PKI-to-SSI lessons paper to differentiate from: none exists in the verified corpus. No axis (d) item mentions VCs, SSI, or eIDAS 2, and the dropped item Krul et al. PETS 2024 (SoK: Trusting Self-Sovereign Identity) was checked at abstract level and draws no PKI-failure lessons. The closest bridging item anywhere is Slamanig 2025, whose error history is the anonymous-credentials literature, not X.509; it should be cited and distinguished, not treated as a predecessor. The PKI-to-VC bridge is therefore the paper's own construction. Two honesty obligations: the corpus covers only the web PKI (no eIDAS 1 qualified certificates, S/MIME, code signing, enterprise PKI, arguably closer relatives of B2B/B2G VC ecosystems), and no single peer-reviewed publication is itself a design-error taxonomy of PKI (Serrano is grey and taxonomizes incidents; Hadan is organized around failure dimensions), so the analogy rests on a documented synthesis, which the paper should state.

## 5. Industry 5.0 evidence check

From axis (c): verified items pairing Industry 5.0 with VCs or SSI: zero. Verified industrial items: one, Bartolomeu et al. 2019 (IEEE ETFA), which is Industry 4.0 IIoT device identity and supply-chain traceability, not organizational B2B/B2G governance. Two probe searches on 2026-07-13 explicitly pairing Industry 5.0 with VCs/SSI returned only vendor and tutorial pages plus unrelated preprints; nothing verifiable. The closest dropped item (MDPI Electronics 15(9):1878, zero-trust identity for the fifth industrial revolution) is not VC-centric.

Recommendation on D-023 (rejected as spin): the rejection stands; no revisit is warranted. The probe was run deliberately and returned a clean negative. If Industry 5.0 appears in the paper at all, it should appear as an explicit non-finding of the probe (the I4.0 connection exists via device identity through Bartolomeu et al. 2019; the I5.0 connection does not exist in the verified corpus), never as a supported motivation. Reinstating I5.0 framing would put an uncitable claim in the paper's motivation.

## 6. Must-cite shortlist

All must-cite items across axes, deduplicated (Abellan Alvarez and Cryptographers' Feedback are must-cite in both b and e; Richter and Anke and Schardong and Custodio in both a and f). Target uses: RQ0 = relevance motivation, RQ1 = metamodel anchor, TAX = design-error taxonomy, DIFF = differentiation text also required despite must-cite status.

| Item | Axis | Locator | Target use |
|---|---|---|---|
| Soltani et al. 2021 | a | https://doi.org/10.1155/2021/8873429 | RQ0 (definitional gap) |
| Laatikainen et al. 2021 | a | https://arxiv.org/abs/2105.15131 | RQ0 (emergence hypothesis) |
| Richter and Anke 2026 | a, f | https://doi.org/10.1007/s12525-025-00867-8 | RQ0 (gap persists) + RQ1 (governance layer) |
| Gruener et al. 2023 | a | https://doi.org/10.1007/s10207-023-00688-w | RQ0 + TAX (SSI threat grounding) |
| Schmidt et al. 2021 | a | https://ieeexplore.ieee.org/document/9647797/ | RQ0 (ill-defined quote) |
| Schardong and Custodio 2022 | a, f | https://www.mdpi.com/1424-8220/22/15/5641 | RQ0 (open definition problem) |
| Mazzocca et al. 2025 | a | https://doi.org/10.1109/COMST.2025.3543197 | RQ0 (deployment spectrum base) |
| Tan et al. 2023 | a | https://doi.org/10.3390/bdcc7020079 | RQ0 (EBSI pilot stage) |
| Abid et al. 2022 | a | https://ieeexplore.ieee.org/document/9908860/ | RQ0 (B2B prototype stage) |
| OrgBook BC 2023 (grey) | a | https://digital.gov.bc.ca/2023/07/26/orgbook-bc/ | RQ0 (production counterpoint) |
| ARF v2.x (spec) | b | https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework | RQ1 (architecture layer) + RQ0 (version churn) |
| Abellan Alvarez et al. 2026 | b, e | https://doi.org/10.1016/j.cose.2025.104707 | RQ0 (pre-deployment errors) + RQ1 (flow mapping) + TAX |
| Cryptographers' Feedback 2024 (report) | b, e | https://hpi.de/oldsite/fileadmin/user_upload/fachgebiete/lehmann/Publications/cryptographers-feedback.pdf | RQ0 (canonical anticipation case) + TAX |
| Slamanig 2025 (preprint) | b | https://arxiv.org/abs/2501.07209 | RQ0 (recurring pattern) + DIFF (not X.509 history) |
| Ebadi Ansaroudi et al. 2025 | b | https://doi.org/10.1186/s13635-025-00187-6 | RQ0/RQ1 bridge (constraint vs deployment reality) |
| Termont and Esteves 2026 (preprint) | b | https://arxiv.org/abs/2601.14503 | TAX (trusted-list governance error class) |
| Inza 2025 | b | https://doi.org/10.1007/978-3-031-74889-9_19 | RQ1 (regulatory layer anchor) |
| NiScy study 2026 (report) | b | https://ec.europa.eu/digital-building-blocks/sites/spaces/EUDIGITALIDENTITYWALLET/pages/940311900/What+do+Europeans+want+out+of+their+EUDI+Wallets+New+study+sheds+light | RQ0 (B2C itself nascent) |
| Bochnia et al. 2024 | c | https://doi.org/10.1109/ACCESS.2023.3349095 | RQ0 (org holder role unexplored) |
| Gloeckler et al. 2024 | c | https://doi.org/10.1007/s12599-023-00830-x | RQ0 + RQ1 (requirement source taxonomy) |
| Flamini et al. 2025 | c | https://ceur-ws.org/Vol-3968/paper2.pdf | TAX (mandate/representation slot) + RQ1 |
| Castaldo et al. 2025 | c | https://ceur-ws.org/Vol-3968/paper1.pdf | RQ0 (QEAA at workshop stage) |
| ETSI TS 119 471 (spec) | c | https://www.etsi.org/deliver/etsi_ts/119400_119499/119471/01.01.01_60/ts_119471v010101p.pdf | RQ1 (primary policy-source input) |
| Otto, ten Hompel, Wrobel 2022 | c | https://doi.org/10.1007/978-3-030-93975-5 | RQ0 (ecosystem concept via data spaces) |
| CX-0149 Catena-X (spec) | c | https://catenax-ev.github.io/docs/next/standards/CX-0149-Dataspaceidentityandidentification | RQ0 (closest B2B) + TAX (managed-wallet tension) |
| Gaia-X Trust Framework 22.10 (spec) | c | https://docs.gaia-x.eu/policy-rules-committee/trust-framework/22.10/ | RQ1 (existing checkable governance) |
| vLEI EGF v4.0 (spec) | c | https://www.gleif.org/en/organizational-identity/introducing-the-verifiable-lei-vlei/introducing-the-vlei-ecosystem-governance-framework | RQ0 + RQ1 + DIFF (main axis c novelty threat) |
| Clark and van Oorschot 2013 | d | https://www.ieee-security.org/TC/SP2013/papers/4977a511.pdf | TAX (canonical PKI systematization) |
| Hadan et al. 2021 | d | https://doi.org/10.1093/cybsec/tyab025 | TAX (incident grounding, anti-speculation) |
| Ellison and Schneier 2000 (grey) | d | https://www.schneier.com/academic/archives/2000/01/ten_risks_of_pki_wha.html | RQ0 (anticipation precedent) |
| Gutmann 2002 | d | https://doi.org/10.1109/MC.2002.1023787 | TAX (design/reality mismatch class) |
| Lopez et al. 2005 | d | https://doi.org/10.1108/10662240510629475 | RQ1 (multi-source failure causes) |
| Georgiev et al. 2012 | d | https://doi.org/10.1145/2382196.2382204 | TAX (verifier-side validation class) |
| Brubaker et al. 2014 | d | https://doi.org/10.1109/SP.2014.15 | RQ1 motivation + TAX (spec ambiguity class) |
| Durumeric et al. 2013 | d | https://doi.org/10.1145/2504730.2504755 | RQ0 (ecosystem as measurable object) |
| Liu et al. 2015 | d | https://doi.org/10.1145/2815675.2815685 | TAX (revocation/status class) |
| Fox-IT 2012 Black Tulip (report) | d | https://roselabs.nl/files/audit_reports/Fox-IT_-_DigiNotar.pdf | TAX (single-point-of-trust class) |
| Grindal et al. 2025 | d | https://doi.org/10.1093/cybsec/tyaf018 | RQ1 (governance as first-class layer) |
| Braun et al. WWW '24 (seed) | e | https://doi.org/10.1145/3589334.3645426 | RQ1 (primary protocol-level anchor) |
| Badertscher et al. CCS 2024 | e | https://doi.org/10.1145/3658644.3690300 | TAX (latent flaw in deployed transport) |
| Fraser and Schneider 2025 | e | https://eprint.iacr.org/2025/694 | TAX (verification-lag class, 8-year gap) |
| Burmeister et al. 2026 (preprint) | e | https://eprint.iacr.org/2026/1229 | TAX (second-order design error, forward-looking) |
| ETSI TR 119 476 (spec) | e | https://www.etsi.org/deliver/etsi_tr/119400_119499/119476/01.02.01_60/tr_119476v010201p.pdf | RQ1 (governance corpus input) + TAX (mdoc/SD-JWT limits) |
| W3C VC Vocabulary v2.0 (spec) | f | https://www.w3.org/2018/credentials/ | RQ1 (data-model baseline) |
| ARES 2024 eIDAS/ToIP mapping | f | https://doi.org/10.1145/3664476.3670919 | RQ1 (manual alignment motivates formalization) |
| Liu et al. 2020 EuroPLoP | f | https://dl.acm.org/doi/10.1145/3424771.3424802 | TAX (recurring design decisions premise) |
| Franz and Shams 2022 (talk) | g | https://hgf22.sched.com/event/14H61 | RQ0 (industrial anticipation) + TAX (device/web friction) |

47 unique must-cite items. Key differentiate-bucket items that are not must-cite but need positioning text: Sroor et al. 2022, Barclay et al. 2020, Ding and Sato 2024 (a, f); Sharif et al. 2025, Hauck 2023, De Marco et al. 2024, Sitouah et al. 2026, Saifullah et al. 2026 (b); XFSC, Bartolomeu 2019, Schulte 2026 (c); Serrano et al. 2019, Kumar et al. 2018 (d); Mao et al. 2025, OIDF OpenID4VP report 2025, Zischg 2025, Aubert et al. 2026, Braun et al. WWW '23 (e); Ferdous et al. 2019, Braun and Kaefer 2025, LIGHTest (f); Kind keynote 2022 (g).

## 7. Gaps

Where the corpus does not carry the paper, and what to do about it:

1. The RQ0 threat characterization itself. No item anywhere. The paper argues it as its own synthesis (section 2 above); claim it explicitly, do not stretch citations.
2. Post-deployment VC evidence. None exists (rollout timeline); every axis b/e error claim is about specifications and pilots. Narrow all claims to "errors visible in specifications and pilots".
3. Large-scale pilot evaluations. POTENTIAL, EWC, DC4EU, NOBID have no scholarly evaluation in the corpus; only grey deliverables and press (dropped at cap). Argue from primary pilot deliverables if needed, flagged as grey.
4. Member-state coverage. Italy and Finland only; nothing scholarly on German, Spanish, or other wallets. Do not generalize member-state claims.
5. vLEI scholarship. Zero academic literature; all claims must cite GLEIF's own documents and be flagged as self-published. Same pattern for Catena-X (own standards library) and OrgBook BC (government blog).
6. Mandate/representation credentials. Exactly one verified scholarly treatment (Flamini et al. 2025). The taxonomy's representation slot rests on one workshop paper; hedge accordingly.
7. Non-web PKI. Axis d is entirely web PKI/TLS. eIDAS 1 qualified certificates, S/MIME, code signing, enterprise PKI are absent; flag as a limitation or targeted search extension, since these are arguably the closer B2B/B2G relatives.
8. No citable PKI design-error taxonomy as such. Serrano 2019 is grey and incident-scoped; Hadan 2021 is dimension-scoped. The paper's taxonomy fills a real gap but must present the PKI grounding as a synthesis across items.
9. mdoc formal analysis. No dedicated peer-reviewed item; only ETSI TR 119 476 plus a preprint (Burmeister) and an expert report. State the format-coverage asymmetry honestly.
10. B2B/B2G absence from protocol verification. Axis e is entirely consumer web/wallet flows; do not imply the verified protocol corpus covers organizational settings.
11. Recency and review-status skew. Axis b has five 2026 items and three preprints; Burmeister, Slamanig, Termont/Esteves, Sitouah, Schulte, XFSC are unreviewed. Flag preprint status at citation sites.
12. Quote precision. All axis files warn that findings are paraphrased from abstracts and verification notes; every verbatim quote (Schmidt "ill-defined", Bochnia "largely unexplored", sched.com description text) must be re-pulled from full texts before the camera-ready.
13. Industry 5.0. Empty; see section 5. Any I5.0 sentence in the paper is uncitable except as a negative probe result.

## 8. Integration notes

S-notes to create first, in priority order (cross-axis load-bearing items):

1. Sroor et al. 2022 (primary RQ1 novelty threat, axis a)
2. Kumar et al. 2018 ZLint (primary RQ1 methodological precedent, axis d)
3. vLEI EGF v4.0 (nearest existing metamodel claim, axis c)
4. Abellan Alvarez et al. 2026 (central pre-deployment error evidence, axes b/e)
5. Cryptographers' Feedback 2024 (canonical anticipation case, axes b/e)
6. Ellison and Schneier 2000 (anticipation precedent, axis d)
7. Serrano et al. 2019 (taxonomy analog to differentiate, axis d)
8. Braun et al. WWW '24 (seed, RQ1 protocol-level anchor, axis e)
9. Gruener et al. 2023 (SSI threat grounding for the taxonomy, axis a)
10. Richter and Anke 2026 (definitional gap plus governance layer, axes a/f)
11. Otto, ten Hompel, Wrobel 2022 (ecosystem concept via data spaces, axis c)
12. Franz and Shams 2022 (resolved Siemens referent, axis g)

Remaining must-cite items become S-notes in axis order as drafting reaches them; the specs (ARF, ETSI TS 119 471, TR 119 476, Gaia-X, CX-0149, W3C vocabulary) may already have S-notes from earlier work and should be checked before duplicating.

Vault-note feeds:

- M-004 (positioning): feed from the differentiate buckets of axes a, b, c, d, e, f. The positioning argument is "formal below the target, informal at the target": Sroor, Barclay, Ding and Sato (a/f); Hauck, OIDF report, Sharif, De Marco (b/e); vLEI EGF, XFSC (c); Serrano, Kumar (d); Mao, Aubert (e); Ferdous 2019, Braun and Kaefer, LIGHTest (f). Section 3 of this file is the drafting source.
- M-010 (O3 row): feed from axis d section "RQ0 evidence" and axis b section "RQ0 evidence". Uncertainty note: this synthesis did not read M-010, so the exact semantics of the O3 row were not verified; if O3 is the objection that the relevance claim is speculative, the counter-evidence is the three-legged structure in section 2 above and the Ellison-and-Schneier anticipation precedent. Confirm row semantics against M-010 before editing.
- M-012 (delta): feed from section 3's cross-axis picture and the DIFF-marked shortlist rows. The delta statement is: no verified item combines ecosystem-governance scope with formal checkable constraints; nearest neighbors are Sroor (informal, right scope), Kumar/ZLint (formal, artifact scope), vLEI EGF (documentary metamodel), and the axis e protocol verifiers (formal, behavioral scope).
- M-013 (do-not-cite): no additions. do_not_cite_additions.md records zero UNVERIFIABLE verdicts; all 74 entries are CONFIRMED or CORRECTED, with corrections in candidates.json verify_notes. M-013 needs no edit from this pass.

Axis g additionally resolves a provenance question for the meeting-notes trail: the Siemens Dublin talk is Franz and Shams, HGF 2022, 12 September 2022, with the Kind keynote as the disambiguated alternative; the year 2022 (not 2023) should be corrected wherever the notes say otherwise.

## Addendum: AF01 cycle 1 session A (2026-07-17)

- **Gap 7 (non-web PKI): partially closed.** A targeted finder-plus-verifier arm added 10 CONFIRMED
  non-web-PKI carriers (0 unverifiable), one or more per design-error class, across eIDAS-1 qualified
  certificates, S/MIME, and enterprise/code-signing PKI. See `axis_d_nonweb.md`. The taxonomy grounding
  moves from web-PKI-only to **PARTIAL**. Residual: no TSL/trusted-list governance incident located; the
  QWAC record is dominated by the eIDAS-2 Article 45 policy controversy, not realized misissuance; the
  eIDAS-1 evidence is Estonia-concentrated. Records appended to `candidates.json` with axes ["d-nonweb"].
- **Gap 12 (quote precision): partially closed for the load-bearing items.** Full-text pulls (AF01 WS3):
  Bochnia 2024 "largely unexplored" CONFIRMED-verbatim from the CC-BY PDF (S-074); Serrano 2019
  "taxonomy of incidents/failures" CONFIRMED-verbatim from an OA mirror (S-049 updated). Still open,
  manual pull needed to freeze: Schmidt 2021 "rapidly changing and ill-defined" (verbatim in the
  abstract, IEEE full text bot-blocked, S-075); Sroor 2022 "visual/informal" (ScienceDirect 403, "visual"
  supported by abstract and sibling thesis, "informal" is our framing, S-044 updated). Hadan 2021 uses
  the dimensions code/cryptography/organizational/human, already correct in S-055; the
  technical/economic/legal/social framing is Lopez 2005's and must not be pinned on Hadan.
- **do-not-cite: still none.** All 84 ledger entries are CONFIRMED or CORRECTED; 0 UNVERIFIABLE.

### Governance arm (AF01 follow-on, 2026-07-17)

- **Governance dimension: strengthened (TSL gap now PARTIAL).** 6 verified (5 CONFIRMED, 1 CORRECTED,
  0 unverifiable). the out-of-model governance-regime class (C-050) gains the EU trusted-list regime failure history:
  EC SWD(2021) 130 eIDAS evaluation (supervisory fragmentation, primary instrument), ENISA 2024
  trust-service incident report, Weigl et al. 2023 (GIQ, SSI governance tension). C-049
  single-point-of-trust gains a deployed-SSI instance: the Sovrin Foundation dissolution (21 May 2025,
  MainNet read-only on one operator) plus Krul et al. 2024 (PoPETs SoK). Parsovs 2020 (already S-065)
  re-surfaced as a supervisory-oversight failure. Records appended to candidates.json with axes ["governance"].
- **Residual (state in prose):** no carrier documents a Trusted-List-as-artifact failure, only the
  governance regime behind the lists; C-049's non-web evidence is entirely SSI-side.
- **Krul reconciliation:** Krul et al. 2024 (SoK: Trusting SSI) was earlier abstract-level dropped in
  this map (gap note, "draws no PKI-failure lessons"). It is re-included for its SSI trust-MODEL analysis
  only, a different relevance, not as a PKI-failure lesson. The earlier drop rationale still holds for the
  PKI-lessons use.
