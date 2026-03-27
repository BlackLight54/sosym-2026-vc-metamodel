# Gap Analysis Synthesis

**Date:** 2026-03-25
**Method:** 7 research questions tested against corpora from arXiv, Google Scholar, SciSpace (full-text + metadata). Each RQ assessed by a dedicated review agent.
**Source data:** 7 zip files in this directory, each containing CSVs + analysis markdown.

## Overall Verdict

**Core novelty confirmed.** No paper defines a multi-layer metamodel for VC ecosystem design with cross-layer constraints formalized as graph predicates. All found formalizations operate at a single layer.

| RQ | Topic | Risk | Verdict | Key finding |
| --- | --- | --- | --- | --- |
| RQ1 | Metamodel for VC ecosystem | HIGH | CLEAR | No multi-layer metamodel exists. Closest: Tith & Colin (2025) trust policy meta-model, Turkanovic et al. (2025) delegation. Both single-layer. |
| RQ2 | Cross-layer constraint formalization | HIGH | CAUTION | No cross-layer constraints for VC. Differentiate from Braun et al. (2024, protocol verification), Mezei/DMLA (2017, MLM infrastructure), ToIP stack (2019, informal layers). |
| RQ3 | MDE for SSI/VC | MEDIUM | CAUTION | **MDE has been applied to SSI** (4 papers). Claim C5 must be softened. ChorSSI, SecureSSI, Pattiyanon, Barclay — each addresses different sub-problem, none does multi-layer metamodel + cross-layer constraints. |
| RQ4 | Governance framework conflicts | MEDIUM | CLEAR | No formal conflict detection. Informal tensions documented (Pattiyanon & Aoki, Biedermann et al., Schwalm & Alamillo-Domingo). Motivate formal treatment. |
| RQ5 | Multi-level modeling + governance | MEDIUM | CLEAR | No MLM applied to governance-constrained domains with formal cross-layer checking. King et al. (2017) closest — different formal objects (norms vs. model elements). |
| RQ6 | Formal credential verification | MEDIUM | CLEAR | Formal methods applied to single layers (Alloy for RBAC, DL for policies, ProVerif for protocols). Semerath et al. (2017) is methodological antecedent. |
| RQ7 | VCDM formalizations | LOW | CLEAR | Single-layer formalizations: Braun & Kafer (RDF), EuroS&PW 2022 (LD-VC math), SHACL shapes. None integrates multiple layers. |

## Claim Correction Required

**C5 must change from:** "MDE/metamodeling has not been applied to the VC/SSI domain specifically"
**To:** "No prior work applies multi-level metamodeling to VC credential design with formalized cross-layer constraints spanning domain semantics, credential structure, and format-specific representation"

Four MDE works for SSI:
1. **ChorSSI** (Cippitelli et al. 2023, EMISA/Springer) — BPMN choreography for SSI interactions
2. **SecureSSI** (Ding & Sato 2023, TrustCom) — Security analysis of SSI architectural patterns
3. **Pattiyanon et al.** (2022, MODELSWARD) — DSMLs for SSI weakness detection
4. **Barclay et al.** (2020, arXiv) — iStar governance modeling for SSI

## Papers to Cite

### Tier 1 — Must cite

| Paper | Authors | Year | Venue | Cite in |
| --- | --- | --- | --- | --- |
| SSI, from Specifications to Protocol? Formally Verify Security! | Braun, Horne, Kafer, Mauw | 2024 | WWW | Sec 06 |
| ChorSSI: Model-Driven Framework for SSI on Blockchain | Cippitelli, Marcelletti, Morichetta | 2023 | EMISA / Springer | Sec 06 |
| SecureSSI: Security Analysis of SSI Architectural Patterns | Ding, Sato | 2023 | TrustCom | Sec 06 |
| Detecting Common Weaknesses in SSI Systems Using DSMs | Pattiyanon, Aoki, Ishii | 2022 | MODELSWARD | Sec 06 |
| Formalising Linked-Data based VCs for Selective Disclosure | (anonymous) | 2022 | EuroS&PW | Sec 06 |
| RDF-Based Semantics for Selective Disclosure on VCs | Braun, Kafer | 2025 | Springer LNCS | Sec 06 |
| The Trust over IP Stack | Davie, Gisolfi et al. | 2019 | IEEE Comm. Standards | Sec 02/06 |
| Formal validation of DSLs with derived features | Semerath, Barta, Horvath, Szatmari, Varro | 2017 | SoSyM | Sec 02 |
| The essence of multilevel metamodeling | Atkinson, Kuhne | 2001 | UML/LNCS | Sec 02 |

### Tier 2 — Should cite

| Paper | Authors | Year | Venue | Cite in |
| --- | --- | --- | --- | --- |
| Trust Policy Meta-Model for DI Systems | Tith, Colin | 2025 | Procedia CS | Sec 06 |
| From Model to Mechanism: Delegated Authority in SSI | Turkanovic, Kersic et al. | 2025 | Mathematics | Sec 06 |
| SISSI: Semantic Interoperable SSI-based Access Control | Braun, Papanchev, Kafer | 2023 | WWW | Sec 06 |
| Analysis and Enhancement of SSI System Properties | Pattiyanon, Aoki | 2022 | ICISSP | Sec 06 |
| Layered Framework for Privacy-by-Design in SSI | Naghmouchi, Laurent | 2025 | arXiv | Sec 06 |
| Automated multi-level governance compliance checking | King, De Vos et al. | 2017 | AAMAS Journal | Sec 06 |
| EU Digital Identity + Web3 SoK | Biedermann et al. | 2024 | IEEE Blockchain | Sec 03 |
| Self-sovereign-identity & eIDAS: a contradiction? | Schwalm, Alamillo-Domingo | 2022 | ResearchGate | Sec 03 |
| Deep meta-modelling with MetaDepth | de Lara, Guerra | 2010 | LNCS | Sec 02 |
| Towards a Modelling Framework for SSI Systems | Barclay et al. | 2020 | arXiv | Sec 06 |
| Towards standardized model for privacy-preserving VCs | Garcia-Rodriguez et al. | 2021 | ARES | Sec 06 |
| Survey on decentralized identifiers and VCs | Mazzocca et al. | 2025 | IEEE COMST | Sec 02 |

### Tier 3 — Consider if space permits

| Paper | Year | Venue | Use |
| --- | --- | --- | --- |
| Multi-level constraint modeling in DMLA (Mezei et al.) | 2017 | ECMFA | MLM infrastructure differentiation |
| OCL-Lite: Finite reasoning on UML/OCL (Queralt et al.) | 2012 | DKE | Formal schema reasoning alternative |
| SSI Tutorial on Interoperability (Yildiz, Kupper et al.) | 2023 | IEEE Access | Reference model for SSI layers |
| Design Patterns for Blockchain-based SSI (Liu et al.) | 2020 | IEEE Software | Domain context |

## Differentiation Arguments

### D1: vs. ChorSSI
ChorSSI models SSI interactions as BPMN choreography with model-driven execution. Different problem (protocol execution vs. credential design space consistency). No multi-level metamodel, no cross-layer constraints.

### D2: vs. SecureSSI + Pattiyanon
Both formalize SSI for security analysis (temporal logic / model checking, knowledge graphs). Neither models credential structure across abstraction layers or formalizes cross-layer governance constraints.

### D3: vs. Braun et al. (2024)
Protocol verification (ProVerif) of assembled SSI protocol vs. design-time structural constraints across metamodel layers. Different questions, different formalisms, complementary.

### D4: vs. King et al. (2017)
Multi-level governance compliance uses modal deontic logic on institutional norms. Our layers are modeling abstraction levels, not governance hierarchies. Different formal objects (norms vs. model elements).

### D5: vs. "just MLM applied to a new domain" (Reviewer D preemption)
1. VC layers are not ontological classification levels — connected by coverage and capability constraints, not instantiation
2. Cross-layer constraints are graph predicates over partial models, not potency annotations
3. Contribution is the constraint formalization across independently governed sources, not the layering itself

## Search Methodology Gaps

All 7 agents flagged:
1. Missing direct database searches (IEEE Xplore, ACM DL, DBLP, Scopus)
2. Missing MULTI workshop proceedings (co-located with MODELS)
3. No Refinery-specific search in credential/identity context
4. No EUDI/eIDAS technical specification search
5. No "ontology" + "verifiable credentials" search

Acceptable risks for submission. Optional supplementary search added to TODO.
