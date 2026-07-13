# Proto-SLR Axis (c): QEAA, Data Spaces, Organizational Credentials, Mandate/Representation; Industry 4.0/5.0 Probe

Synthesized 2026-07-13 from the verified corpus for this axis. Every item below was existence-confirmed with a working locator during corpus verification; nothing outside the confirmed corpus is cited.

## 1. Scope

This axis covers the organizational side of verifiable-credential ecosystems: qualified electronic attestations of attributes (QEAA) under eIDAS 2, credential-based governance in European data spaces (Gaia-X, Catena-X, IDS), organizational identity credentials (enterprise SSI, the GLEIF vLEI stack), and mandate or representation credentials by which one party acts for another. It also records the result of a deliberate probe into the Industry 4.0/5.0 literature. The paper needs this axis because RQ0 hypothesizes the emergence of VC-based B2B/B2G ecosystems, and this is the axis where such ecosystems would already exist if they existed: the corpus here establishes what the actual deployment spectrum looks like (consortium data spaces, a single vertical vLEI ecosystem, proposal-stage QEAA machinery), which is the empirical basis for claiming that open B2B/B2G credential ecosystems are anticipated rather than real. It also supplies the multi-source governance material (ETSI policy requirements, Gaia-X trust rules, the vLEI governance framework) that RQ1 asks whether a single formal metamodel can capture.

## 2. Confirmed corpus

| Title | Authors | Venue | Year | Locator | Kind |
|---|---|---|---|---|---|
| Self-Sovereign Identity for Organizations: Requirements for Enterprise Software | Bochnia, Richter, Anke | IEEE Access | 2024 | https://doi.org/10.1109/ACCESS.2023.3349095 | peer-reviewed |
| A Systematic Review of Identity and Access Management Requirements in Enterprises and Potential Contributions of Self-Sovereign Identity | Gloeckler, Sedlmeir, Frank, Fridgen | Business & Information Systems Engineering 66(4) | 2024 | https://doi.org/10.1007/s12599-023-00830-x | peer-reviewed |
| On Delegation of Verifiable Presentations | Flamini, Gangemi, Guglielmino, Orabona | TDI 2025, CEUR-WS Vol-3968 | 2025 | https://ceur-ws.org/Vol-3968/paper2.pdf | peer-reviewed |
| Electronic Attestation of Attributes Extended Validation Services | Castaldo, Cortese, Izzo, Balsamo | TDI 2025, CEUR-WS Vol-3968 | 2025 | https://ceur-ws.org/Vol-3968/paper1.pdf | peer-reviewed |
| ETSI TS 119 471 V1.1.1: Policy and Security requirements for Providers of Electronic Attestation of Attributes Services | ETSI (organizational) | ETSI ESI | 2025 | https://www.etsi.org/deliver/etsi_ts/119400_119499/119471/01.01.01_60/ts_119471v010101p.pdf | standard-spec |
| Designing Data Spaces: The Ecosystem Approach to Competitive Advantage | Otto, ten Hompel, Wrobel (eds.) | Springer (open access book) | 2022 | https://doi.org/10.1007/978-3-030-93975-5 | peer-reviewed |
| CX-0149 Verified Company Identity v1.0.0 | Catena-X Automotive Network e.V. (organizational) | Catena-X standards library (CX-Jupiter) | 2024 | https://catenax-ev.github.io/docs/next/standards/CX-0149-Dataspaceidentityandidentification | standard-spec |
| Gaia-X Trust Framework, 22.10 Release | Gaia-X AISBL Policy Rules Committee (organizational) | Gaia-X AISBL | 2022 | https://docs.gaia-x.eu/policy-rules-committee/trust-framework/22.10/ | standard-spec |
| XFSC: A Catalogue of Trustable Semantic Metadata for Data Services and Providers | Arnold, Baydoun, Collarana, Duda, Gillmann, Hemid, Hertweck, Moosmann, Sukhoroslov, Lange | arXiv (2501.14473) | 2025 | https://arxiv.org/abs/2501.14473 | preprint |
| The verifiable LEI (vLEI) | GLEIF (organizational) | GLEIF website, Organizational Identity section | n.d. (accessed 2026-07-13) | https://www.gleif.org/en/organizational-identity/lei-vlei/the-verifiable-lei-vlei | standard-spec |
| Self-Sovereign Identity: Use-cases, Technologies, and Challenges for Industrial IoT | Bartolomeu, Vieira, Hosseini, Ferreira | IEEE ETFA | 2019 | https://ieeexplore.ieee.org/document/8869262/ | peer-reviewed |
| Beyond the Golden Record: Toward a Design Theory for Trustworthy Master Data Management with Self-Sovereign Identity | Schulte, Johnson Jeyakumar, Kubach, Janiesch | arXiv (2604.11537) | 2026 | https://arxiv.org/abs/2604.11537 | preprint |
| verifiable LEI (vLEI) Ecosystem Governance Framework v4.0 | GLEIF (organizational) | GLEIF governance framework publication | 2026 (v4.0 dated 2026-03-25) | https://www.gleif.org/en/organizational-identity/introducing-the-verifiable-lei-vlei/introducing-the-vlei-ecosystem-governance-framework | standard-spec |

## 3. Classification

- Bochnia, Richter, Anke 2024 (IEEE Access): **must-cite**. The core scholarly statement that the organizational holder role in SSI is largely unexplored; RQ0's emergence-hypothesis claim rests on it.
- Gloeckler et al. 2024 (BISE): **must-cite**. The journal-level systematic review anchoring all organizational-credential claims on this axis; its unmet enterprise requirements are direct RQ0 evidence.
- Flamini et al. 2025 (TDI): **must-cite**. The only verified treatment of mandate/representation via VP delegation; without it the taxonomy's representation-credential slot is uncited, and its workshop-stage formality is itself RQ0 evidence.
- Castaldo et al. 2025 (TDI): **must-cite**. The only verified scholarly item directly on (Q)EAA validation in the EUDI Wallet; without it the QEAA layer rests on the ETSI spec alone.
- ETSI TS 119 471 V1.1.1: **must-cite**. The normative QEAA policy source whose constraints are the concrete multi-source governance input RQ1 formalizes.
- Otto, ten Hompel, Wrobel 2022: **must-cite**. The standard scholarly reference defining data spaces as designed ecosystems; the axis's ecosystem concept has no other peer-reviewed anchor.
- CX-0149 (Catena-X) 2024: **must-cite**. The closest existing thing to a VC-based B2B ecosystem; its managed-wallet centralization is a live design-tension example the taxonomy needs.
- Gaia-X Trust Framework 22.10: **must-cite**. The operating example of layered, machine-checkable governance over W3C VCs; the cross-layer constraint pattern RQ1 claims to formalize already exists here informally.
- vLEI Ecosystem Governance Framework v4.0: **must-cite**. RQ0 cannot be argued without acknowledging the one deployed organizational-credential ecosystem, and the paper must explicitly distinguish its Trust over IP Governance Metamodel basis (documentary, prose-and-policy) from a formal, analyzable graph-predicate metamodel; this is the axis's main novelty threat and needs positioning text, not just a citation.
- XFSC (Arnold et al. 2025, preprint): **differentiate**. Close neighbor performing runtime validation of Verifiable Presentations against semantic rules; distinguish operational credential checking in a deployed catalogue from design-time model analysis, and cite it as evidence of the pilot-stage deployment spectrum.
- Bartolomeu et al. 2019 (ETFA): **differentiate**. The Industry 4.0 probe anchor; a close neighbor whose scope (IIoT device identity) must be explicitly distinguished from organizational B2B/B2G governance to support the probe's negative result.
- Schulte et al. 2026 (arXiv): **differentiate**. Nearest recent neighbor connecting SSI organizational credentials to inter-company data governance; distinguish an IS design theory for master data management from a formal ecosystem metamodel, while citing its 2026 preprint status as RQ0 evidence.
- GLEIF vLEI overview page (n.d.): **ignore**. Confirmed but redundant given the EGF v4.0 entry; keep in reserve only if the ISO 17442-3 standardization fact needs a locator.

Counts: 9 must-cite, 3 differentiate, 1 ignore.

## 4. What exists, what is thin

The axis is dense on the specification side and thin on the scholarly side. Governance and standards artifacts are plentiful and mature: ETSI TS 119 471 (plus companion parts), the Gaia-X Trust Framework, Catena-X CX-0149, and the vLEI EGF v4.0 together give four independently governed, concrete credential-governance stacks, which is more than enough raw material for the RQ1 formalization argument. Peer-reviewed literature, by contrast, is sparse and recent: two solid 2024 journal papers on organizational SSI (Bochnia et al., Gloeckler et al.), two 2025 workshop papers (TDI, CEUR-WS) covering QEAA validation and VP delegation, one 2022 edited book on data spaces, and one 2019 conference paper on industrial SSI. Everything at the exact intersection the paper targets (organizational credentials as ecosystem infrastructure, mandate credentials, QEAA in practice) is from 2024 or later and mostly workshop or preprint grade.

Specific thin spots to be honest about in the paper: (1) academic literature on the vLEI is essentially absent; verification searches surfaced only GLEIF and vendor material, so all vLEI claims must cite GLEIF's own framework documents; (2) mandate/representation credentials have exactly one verified scholarly treatment (Flamini et al.); (3) there is no peer-reviewed empirical study of any production VC-based B2B exchange; Catena-X is documented only through its own standards library; (4) the Industry 4.0/5.0 connection is a single 2019 device-identity paper, and the Industry 5.0 side is empty (see section 7). This sparsity is itself evidence for RQ0, but it also means several load-bearing claims rest on organizational self-published sources, which reviewers may flag.

## 5. RQ0 evidence

No item in this axis characterizes the threat RQ0 poses, that is, none attempts to anticipate the design errors a future VC-based B2B/B2G ecosystem will face, and none draws on X.509/PKI error history for that purpose. That framing is unclaimed territory in this corpus.

What the corpus does provide is the two ingredients short of the threat itself:

- Gap statements. Bochnia et al. 2024 state, per the abstract recorded at verification, that the organizational holder role in SSI is largely unexplored and that adoption by organizations is impeded (note: paraphrase from verification notes; IEEE Xplore blocked a re-fetch on 2026-07-13, so pull the exact sentence from the PDF before quoting in the paper). Gloeckler et al. 2024 catalog enterprise IAM requirements that SSI does not yet meet. Schulte et al. 2026 is still proposing a design theory for SSI-based B2B data exchange at preprint stage. Together these establish that the ecosystem is prospective, which is the premise of RQ0, not its answer.
- Ecosystem concept. Otto, ten Hompel, Wrobel 2022 is the item that defines the ecosystem concept for this axis: data spaces as deliberately designed ecosystems with governance, trust, and federation as design objects (the framing is in the book's title and structure). The Gaia-X Trust Framework and CX-0149 operationalize that concept with credentials but define it only implicitly.

Plain verdict: the corpus supports the emergence hypothesis and supplies the ecosystem concept via the data-spaces literature, but the design-error-anticipation move is the paper's own contribution with no precedent on this axis.

## 6. RQ1 anchors

- ETSI TS 119 471: the primary anchor. A normative policy layer (attribute verification, issuance/validation, embedded disclosure policies, unlinkability) sitting on top of eIDAS 2 legal text; its requirements are the concrete candidates for graph-predicate formalization.
- Gaia-X Trust Framework 22.10: proof that cross-layer governance rules over W3C VCs can be expressed as machine-checkable constraints in practice (Gaia-X rules over VCDM over member law); the metamodel generalizes exactly this pattern.
- vLEI EGF v4.0: the nearest existing metamodel claim. It is explicitly built on the Trust over IP Governance Metamodel, per GLEIF pages seen during verification, so it is the item RQ1's novelty must be argued against: a documentary governance metamodel versus a formal, analyzable one.
- Flamini et al. 2025: precedent that representation/mandate relations admit formal treatment (delegation algorithms with stated security properties), supporting the claim that the relational structure of VC ecosystems is formalizable, though at protocol level rather than ecosystem level.
- Gloeckler et al. 2024: its requirement categories (security/compliance, operability, technology, user) provide a scholarly-derived source taxonomy for the multi-source constraints the metamodel must accommodate.

## 7. Industry 5.0 check (feeds D-023)

There is no substantial verified Industry 5.0-VC literature. Counts:

- Verified items pairing Industry 5.0 with VCs/SSI: 0.
- Verified Industry 4.0/industrial items on this axis: 1, namely Bartolomeu, Vieira, Hosseini, Ferreira 2019 (IEEE ETFA), and it is framed around IIoT device identification and supply-chain traceability, not organizational B2B/B2G governance.
- Two probe searches run on 2026-07-13 explicitly pairing "Industry 5.0" with verifiable credentials / self-sovereign identity returned zero Industry 5.0-specific scholarly items; results were vendor and tutorial pages plus general SSI preprints with no I5.0 connection. None was verified as a candidate and none is citable.

Recommendation for the D-023 revisit: treat Industry 5.0 as having no citable scholarly basis on this axis. If the paper mentions I5.0 at all, it should be as an explicit non-finding of the probe (the I4.0 connection exists via device identity through Bartolomeu et al. 2019; the I5.0 connection does not exist in the verified corpus), not as a supported motivation.
