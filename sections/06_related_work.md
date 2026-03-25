%% @META: Section: Related Work %%
%% @META: Budget: 0.75 pages (~4 paragraphs, 3 subsections) %%
%% @META: Goal: Position the contribution against three bodies of work. Each subsection: cited works, positioning statement, gap. %%
%% @META: Dependencies: Sections 04 (what we do), 05 (what we demonstrate). %%
%% @META: Note: Double-blind. CSCS 2024 short paper referenced in third person. %%
%% @META: Source: Gap analysis synthesis (2026-03-25), archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md %%

# Related Work

## Credential Ecosystem Design and Formalization

%% @SCAFFOLD: R1 — Informal baseline + single-layer formalizations + closest domain neighbors %%
%% @SCAFFOLD: Job: Position against (a) specifications (informal baseline), (b) single-layer formalizations of VCs, and (c) conceptual models for identity/credential systems. %%
%% @SCAFFOLD: Informal baseline: W3C VCDM 2.0, EU ARF, Hyperledger AnonCreds spec, ISO mDL — design patterns and specifications without formal cross-layer constraint checking. %%
%% @SCAFFOLD: Single-layer formalizations (from gap analysis RQ7): %%
%% @SCAFFOLD: Braun & Kafer 2025 (LNCS): RDF-based semantics for selective disclosure on VCs. Formalizes RDF-level semantics — one layer of representation. Does not address cross-layer constraints or credential structure. %%
%% @SCAFFOLD: EuroS&PW 2022: Formal LD-VC definition with selective disclosure proofs. Mathematical properties of a single format. %%
%% @SCAFFOLD: Braun et al. 2024 (WWW): ProVerif verification of assembled SSI protocol. Protocol-level security, not schema-level design. DIFFERENTIATION D3: protocol verification vs. design-time consistency. %%
%% @SCAFFOLD: Conceptual models: %%
%% @SCAFFOLD: Ding & Sato 2023 (TrustCom): SecureSSI — model-driven security analysis of SSI architectural patterns. Operates at protocol level, not schema level. DIFFERENTIATION D2. %%
%% @SCAFFOLD: Tith & Colin 2025 (Procedia CS): Trust policy meta-model for identity systems. Single governance concern (trust policy), no credential structure or format layers. %%
%% @SCAFFOLD: Schardong & Custodio 2024 (ER): RAF framework — meta-metamodel for comparing identity models. Protocol level, no credential constraints. [VERIFY existence] %%
%% @SCAFFOLD: Turkanovic et al. 2025 (Mathematics): Delegation semantics for Verifiable Mandates. Single concern within W3C VC. %%
%% @SCAFFOLD: Garcia-Rodriguez et al. 2021 (ARES): Predicate data model for privacy-preserving VC integration. Single concern. %%
%% @SCAFFOLD: Informal conflict analyses (from RQ4 — cite for motivation, not related work): %%
%% @SCAFFOLD: Pattiyanon & Aoki 2022 (ICISSP): Property compilation from standards, surfaces mismatches. Not formal. %%
%% @SCAFFOLD: Biedermann et al. 2024 (IEEE Blockchain): OIDC/Web3 incompatibility. Informal. %%
%% @SCAFFOLD: Schwalm & Alamillo-Domingo 2022: SSI-eIDAS contradiction. Informal. %%
%% @SCAFFOLD: Architectural layers: %%
%% @SCAFFOLD: ToIP stack (Davie et al. 2019): Four-layer architecture with "governance metamodel." Informal — no formalized cross-layer constraints. DIFFERENTIATION: we formalize what ToIP describes in prose. %%
%% @SCAFFOLD: Naghmouchi & Laurent 2025 (arXiv): Four-layer privacy framework for SSI. Classification scheme, not metamodel with constraints. %%
%% @SCAFFOLD: Position: Prior formalizations target individual layers (RDF semantics, protocol security, delegation, trust policy). Specifications and architectural frameworks define layers informally. None formalizes cross-layer constraints spanning domain semantics, credential structure, and format-specific representation. %%

%% @CITE: W3C VCDM 2.0 working group %%
%% @CITE: ISO/IEC 18013-5 (mDL) %%
%% @CITE: Hyperledger AnonCreds specification %%
%% @CITE: EU Architecture Reference Framework (ARF) %%
%% @CITE: Braun & Kafer 2025 — "RDF-Based Semantics for Selective Disclosure and Zero-Knowledge Proofs on Verifiable Credentials" — Springer LNCS (DOI: 10.1007/978-3-031-94575-5_21) %%
%% @CITE: EuroS&PW 2022 — "Formalising Linked-Data based Verifiable Credentials for Selective Disclosure" (DOI: 10.1109/eurospw55150.2022.00013) %%
%% @CITE: Braun, Horne, Kafer, Mauw 2024 — "SSI, from Specifications to Protocol? Formally Verify Security!" — WWW 2024 (DOI: 10.1145/3589334.3645426) %%
%% @CITE: Tith & Colin 2025 — "A Trust Policy Meta-Model for Trustworthy and Interoperability of Digital Identity Systems" — Procedia CS %%
%% @CITE: Turkanovic, Kersic et al. 2025 — "From Model to Mechanism: Enforcing Delegated Authority in SSI with Language-Based Security" — Mathematics (DOI: 10.3390/math13182971) %%
%% @CITE: Garcia-Rodriguez et al. 2021 — "Towards a standardized model for privacy-preserving Verifiable Credentials" — ARES (DOI: 10.1145/3465481.3469204) %%
%% @CITE: Davie, Gisolfi et al. 2019 — "The Trust over IP Stack" — IEEE Comm. Standards %%
%% @CITE: Naghmouchi & Laurent 2025 — "A Systematic Review and Layered Framework for Privacy-by-Design in SSI" — arXiv %%
%% @CITE: Mazzocca et al. 2025 — "A Survey on Decentralized Identifiers and Verifiable Credentials" — IEEE COMST (DOI: 10.1109/COMST.2025.3543197) %%
%% @CITE: Ding & Sato 2023 — "Model-Driven Security Analysis of Self-Sovereign Identity Systems" — IEEE TrustCom 2023 [VERIFY] %%
%% @CITE: Schardong & Custodio 2024 — "RAF Framework for Understanding Digital Identity Models" — ER 2024 [VERIFY] %%

%% @TODO: Draft — credential ecosystem design + formalization landscape. ~1.5 paragraphs. Informal baseline (2 sentences), single-layer formalizations (3-4 sentences covering Braun & Kafer, EuroS&PW, Braun et al. protocol verification), conceptual models (2-3 sentences covering Tith & Colin, Turkanovic, ToIP), gap statement (1 sentence). %%

## Model-Driven Engineering for Security and SSI

%% @SCAFFOLD: R2 — MDE for security (UMLsec, SecureUML) + MDE for SSI (4 papers from gap analysis RQ3) %%
%% @SCAFFOLD: Job: (a) Cite foundational MDE-security works, (b) cite all 4 MDE-for-SSI works, (c) position all as targeting different problems than cross-layer credential design consistency. %%
%% @SCAFFOLD: MDE for security: UMLsec (Jürjens 2002/2004) targets confidentiality, integrity, authentication. SecureUML (Basin et al. 2002/2006) targets access control. %%
%% @SCAFFOLD: MDE for SSI (gap analysis RQ3 — MUST cite all 4, MUST differentiate): ChorSSI (Cippitelli et al. 2023, EMISA/Springer) — BPMN choreography metamodel, D1: choreography vs. credential design space. SecureSSI (Ding & Sato 2023, TrustCom) — custom modeling language + temporal logic, D2: security threats vs. design space. Pattiyanon et al. 2022 (MODELSWARD) — two DSMLs + knowledge graph, D2: weakness detection vs. design consistency. Barclay et al. 2020 (arXiv) — iStar 2.0 actor-based modeling, requirements-level. %%
%% @SCAFFOLD: Position: MDE has been successfully applied to SSI for security analysis, interaction choreography, weakness detection, and governance modeling. However, none defines a multi-level metamodel for credential design or formalizes cross-layer constraints. %%
%% @SCAFFOLD: NOTE: This is the corrected C5 claim per DECISIONS.md 2026-03-25. Do NOT claim "MDE has not been applied to SSI." %%

%% @CITE: UMLsec — Jürjens, UML 2002 / book 2004 %%
%% @CITE: SecureUML — Basin, Doser, Lodderstedt, UML 2002 / ACM TOSEM 2006 %%
%% @CITE: ChorSSI — Cippitelli, Marcelletti, Morichetta 2023, EMISA Journal / Springer %%
%% @CITE: Pattiyanon, Aoki, Ishii 2022 — "A Method for Detecting Common Weaknesses in SSI Systems Using DSMs and Knowledge Graph" — MODELSWARD 2022 %%
%% @CITE: Barclay et al. 2020 — "Towards a Modelling Framework for SSI Systems" — arXiv %%
%% @CITE: King, De Vos et al. 2017 — "Automated multi-level governance compliance checking" — AAMAS Journal %%

%% @TODO: Draft — MDE for security + SSI. ~1.5 paragraphs. UMLsec + SecureUML (2 sentences), then ChorSSI + SecureSSI + Pattiyanon + Barclay (4-5 sentences with differentiation), then King et al. for governance compliance (1-2 sentences, differentiate: norms vs. model elements). Gap: none does multi-level metamodel + cross-layer constraints for credential design. %%

## Multi-Level Modeling and Graph-Based Design Space Exploration

%% @SCAFFOLD: R3 — Foundational techniques and tools we build on %%
%% @SCAFFOLD: Job: Position against (a) multi-level modeling foundations, (b) multi-view consistency, (c) DSE tools. The contribution is the domain-specific formalization, not the technique or tool. %%
%% @SCAFFOLD: Atkinson & Kühne (2001/2008): Foundational multi-level metamodeling. DIFFERENTIATION D5: our layers are not ontological classification levels. %%
%% @SCAFFOLD: de Lara & Guerra 2010 (MetaDepth): Tool support for multi-level constraints. %%
%% @SCAFFOLD: Diskin et al. (2010/2013): Multi-view consistency. We add the governance dimension. %%
%% @SCAFFOLD: Refinery / Semerath et al. (SoSyM 2017, ICSE 2024): Our solver infrastructure. Contribution is the metamodel, not the solver. %%
%% @SCAFFOLD: Alloy (Jackson 2012): Alternative solver. Lacks partial model semantics. %%
%% @SCAFFOLD: CSCS 2024: Own prior work (third person). Extends with cross-layer constraints, governance, validation. %%
%% @SCAFFOLD: Preempt Reviewer D: Three-point argument from D5 — layers are not instantiation levels, constraints are graph predicates not potency, contribution is governance constraint formalization not layering. %%

%% @CITE: Atkinson & Kühne — "The Essence of Multilevel Metamodeling" UML 2001; "Reducing accidental complexity" SoSyM 2008 %%
%% @CITE: de Lara & Guerra 2010 — "Deep meta-modelling with MetaDepth" LNCS %%
%% @CITE: Diskin et al. — "Specifying overlaps of heterogeneous models for global consistency checking" MODELS 2010 %%
%% @CITE: Refinery — Marussy et al., "Refinery: Graph Solver as a Service" ICSE 2024; Semerath & Varró, SoSyM 2017 (third person) %%
%% @CITE: Alloy — Jackson, "Software Abstractions" MIT Press 2012 %%
%% @CITE: CSCS 2024 short paper — third person, double-blind %%

%% @TODO: Draft — multi-level modeling + DSE landscape. ~1 paragraph. Atkinson & Kühne + de Lara & Guerra as foundation (2 sentences), Diskin as structurally related (1 sentence), Refinery as tool (1-2 sentences), own prior work (1 sentence). Include D5 preemption: "Unlike standard multi-level modeling applications where layers represent successive instantiation, the three layers in our metamodel represent independently governed concern spaces connected by coverage and capability constraints — formalized as graph predicates rather than potency annotations." %%

%% @SCAFFOLD: R4 — Synthesis (mandatory — closes the section) %%
%% @SCAFFOLD: Job: One sentence synthesizing the gap across all three bodies of work. %%
%% @SCAFFOLD: Content: "No prior work combines multi-level metamodeling with formalized cross-layer constraints for verifiable credential ecosystem design under multi-source governance." %%
%% @SCAFFOLD: NOTE: This is the corrected, defensible version per gap analysis 2026-03-25. %%

%% @TODO: Draft — synthesis sentence closing the section. %%
