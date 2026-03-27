%% @META: Section: Related Work %%
%% @META: Budget: 0.75 pages (~4 paragraphs, 3 subsections) %%
%% @META: Goal: Position the contribution against three bodies of work. Each subsection: cited works, positioning statement, gap. %%
%% @META: Dependencies: Sections 04 (what we do), 05 (what we demonstrate). %%
%% @META: Note: Double-blind. CSCS 2024 short paper referenced in third person. %%
%% @META: Source: Gap analysis synthesis (2026-03-25), archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md %%

# Related Work
\label{sec:related-work}

## Credential Ecosystem Design and Formalization
\label{sec:rw-credential}

%% @CITE: W3C VCDM 2.0 working group %%
%% @CITE: ISO/IEC 18013-5 (mDL) %%
%% @CITE: Hyperledger AnonCreds specification %%
%% @CITE: EU Architecture Reference Framework (ARF) %%
%% @CITE: Braun & Kafer 2025 — "RDF-Based Semantics for Selective Disclosure and Zero-Knowledge Proofs on Verifiable Credentials" — Springer LNCS (DOI: 10.1007/978-3-031-94575-5_21) %%
%% @CITE: EuroS&PW 2022 — Yamamoto, Suga, Sako — "Formalising Linked-Data based Verifiable Credentials for Selective Disclosure" (DOI: 10.1109/eurospw55150.2022.00013) %%
%% @CITE: Braun, Horne, Kafer, Mauw 2024 — "SSI, from Specifications to Protocol? Formally Verify Security!" — WWW 2024 (DOI: 10.1145/3589334.3645426) %%
%% @CITE: Tith & Colin 2025 — "A Trust Policy Meta-Model for Trustworthy and Interoperability of Digital Identity Systems" — Procedia CS %%
%% @CITE: Turkanovic, Kersic et al. 2025 — "From Model to Mechanism: Enforcing Delegated Authority in SSI with Language-Based Security" — Mathematics (DOI: 10.3390/math13182971) %%
%% @CITE: Garcia-Rodriguez et al. 2021 — "Towards a standardized model for privacy-preserving Verifiable Credentials" — ARES (DOI: 10.1145/3465481.3469204) %%
%% @CITE: Davie, Gisolfi et al. 2019 — "The Trust over IP Stack" — IEEE Comm. Standards %%
%% @CITE: Naghmouchi & Laurent 2025 — "A Systematic Review and Layered Framework for Privacy-by-Design in SSI" — arXiv %%
%% @CITE: Mazzocca et al. 2025 — "A Survey on Decentralized Identifiers and Verifiable Credentials" — IEEE COMST (DOI: 10.1109/COMST.2025.3543197) %%
%% @CITE: Ding & Sato 2023 — "Model-Driven Security Analysis of Self-Sovereign Identity Systems" — IEEE TrustCom 2023 [VERIFY] %%
%% @CITE: Schardong & Custodio 2024 — "RAF Framework for Understanding Digital Identity Models" — ER 2024 [VERIFY] %%

Verifiable credential schema design is currently guided by specifications that define credential structure at individual abstraction layers: the W3C Verifiable Credentials Data Model 2.0 %% @CITE: W3C VCDM 2.0 %% and EU Architecture Reference Framework %% @CITE: EU ARF %% prescribe issuance and presentation flows, while AnonCreds %% @CITE: Hyperledger AnonCreds %% and ISO mDL %% @CITE: ISO/IEC 18013-5 %% define format-specific encoding and proof mechanisms. %% @CUT-START: supplementary survey reference — can be removed for budget %% Mazzocca et al. %% @CITE: Mazzocca et al. 2025 %% provide a comprehensive survey of this landscape. %% @CUT-END %% None of these specifications provides a formal mechanism for checking constraints that span multiple layers. Where formal methods have been applied, they target individual layers: Braun and Käfer %% @CITE: Braun & Kafer 2025 %% define RDF-based semantics for selective disclosure and zero-knowledge proofs on verifiable credentials, Yamamoto et al. %% @CITE: EuroS&PW 2022 %% formalize selective disclosure specifically for linked-data credentials, and Braun et al. %% @CITE: Braun, Horne, Kafer, Mauw 2024 %% verify SSI protocol security properties using ProVerif. Each formalization targets protocol-level security or single-format semantics — none operates across the boundary between domain-level claim semantics and format-specific representation capabilities.

Complementary conceptual models address individual concerns in credential system design. Tith and Colin %% @CITE: Tith & Colin 2025 %% propose a trust policy meta-model that captures how identity systems establish and evaluate trust across organizational boundaries. Turkanović et al. %% @CITE: Turkanovic, Kersic et al. 2025 %% formalize delegated authority enforcement, modeling how credential issuance rights propagate through delegation chains. The Trust over IP stack %% @CITE: Davie, Gisolfi et al. 2019 %% organizes the credential ecosystem into informal governance layers, and Naghmouchi and Laurent %% @CITE: Naghmouchi & Laurent 2025 %% systematize privacy-by-design principles for SSI. %% @CUT-START: supplementary conceptual models — can be removed for budget %% Garcia-Rodriguez et al. %% @CITE: Garcia-Rodriguez et al. 2021 %% propose a standardized model for privacy-preserving credentials, and Schardong and Custódio %% @CITE: Schardong & Custodio 2024 %% develop a framework for understanding digital identity models. %% @CUT-END %% Each of these works addresses a single concern — trust policy, delegation, governance layering, or privacy — but none formalizes cross-layer constraints spanning domain semantics, credential structure, and format-specific representation simultaneously.

## Model-Driven Engineering for Security and SSI
\label{sec:rw-mde}

%% @CITE: UMLsec — Jürjens, UML 2002 / book 2004 %%
%% @CITE: SecureUML — Basin, Doser, Lodderstedt, UML 2002 / ACM TOSEM 2006 %%
%% @CITE: ChorSSI — Cippitelli, Marcelletti, Morichetta 2023, EMISA Journal / Springer %%
%% @CITE: Pattiyanon, Aoki, Ishii 2022 — "A Method for Detecting Common Weaknesses in SSI Systems Using DSMs and Knowledge Graph" — MODELSWARD 2022 %%
%% @CITE: Barclay et al. 2020 — "Towards a Modelling Framework for SSI Systems" — arXiv %%
%% @CITE: King, De Vos et al. 2017 — "Automated multi-level governance compliance checking" — AAMAS Journal %%

Model-driven security engineering has established metamodel-based approaches to security properties of software architectures. UMLsec %% @CITE: UMLsec — Jurjens %% annotates UML models with confidentiality and authentication constraints, enabling formal verification of security properties during design. SecureUML %% @CITE: SecureUML — Basin et al. %% integrates role-based access control specifications into class models, generating enforcement infrastructure from the model. Neither targets credential schema design — both operate on software architecture elements rather than the domain-specific structure of verifiable credentials.

Within SSI specifically, four model-driven approaches address different facets of the design problem. Cippitelli et al. %% @CITE: ChorSSI %% model SSI interactions as BPMN choreographies and generate executable code from the choreography models — their concern is the protocol execution flow between participants, not the structure of credentials exchanged. Ding and Sato %% @CITE: Ding & Sato 2023 %% apply model-driven security analysis to SSI architectural patterns, systematically identifying threats in system configurations rather than checking credential design consistency. Pattiyanon et al. %% @CITE: Pattiyanon, Aoki, Ishii 2022 %% define domain-specific modeling languages and knowledge graphs that surface common SSI implementation weaknesses, while Barclay et al. %% @CITE: Barclay et al. 2020 %% model SSI governance requirements using iStar goal models, operating at the requirements level without formalizing credential structure. In adjacent work, King et al. %% @CITE: King, De Vos et al. 2017 %% automate multi-level governance compliance checking using institutional norms — a structurally related problem, though their formal objects (normative rules governing agent actions) differ from the structural constraints over model elements addressed here.

Model-driven engineering has thus been applied to SSI for choreography, security analysis, weakness detection, and governance requirements. None of these works defines a multi-level metamodel or formalizes cross-layer constraints connecting domain-level semantics through credential structure to format-specific representation.

## Multi-Level Modeling and Graph-Based Design Space Exploration
\label{sec:rw-multilevel}

%% @CITE: Atkinson & Kühne — "The Essence of Multilevel Metamodeling" UML 2001; "Reducing accidental complexity" SoSyM 2008 %%
%% @CITE: de Lara & Guerra 2010 — "Deep meta-modelling with MetaDepth" LNCS %%
%% @CITE: Diskin et al. — "Specifying overlaps of heterogeneous models for global consistency checking" MODELS 2010 %%
%% @CITE: Refinery — Marussy et al., "Refinery: Graph Solver as a Service" ICSE 2024; Semerath & Varró, SoSyM 2017 (third person) %%
%% @CITE: Alloy — Jackson, "Software Abstractions" MIT Press 2012 %%
%% @CITE: CSCS 2024 short paper — third person, double-blind %%

Multi-level metamodeling, as established by Atkinson and Kühne %% @CITE: Atkinson & Kühne 2001/2008 %%, eliminates accidental complexity in deep classification scenarios by allowing model elements to span more than two metalevels; de Lara and Guerra %% @CITE: de Lara & Guerra 2010 %% implement these principles with deep instantiation in MetaDepth. Diskin et al. %% @CITE: Diskin et al. 2010 %% formalize consistency checking across heterogeneous model views — a problem this work extends by adding independently governed constraint sources as a consistency dimension.

The present metamodel relies on the Refinery partial graph modeling framework %% @CITE: Refinery — Semerath et al. %% as its solver infrastructure. Refinery generates diverse model instances that satisfy structural and relational constraints expressed as graph predicates, and its three-valued partial model semantics enable reasoning over designs that are still incomplete — a property essential for credential ecosystems where not all schema elements are known at design time. A prior short paper %% @CITE: CSCS 2024 short paper %% applied Refinery to credential schema validation with a single-layer prototype; the present work extends this to a three-layer metamodel with formalized cross-layer constraints.

Unlike standard multi-level modeling applications where layers represent successive instantiation and constraints take the form of potency annotations, the three layers in the present metamodel — domain concepts, credential structure, and format-specific representation — represent independently governed concern spaces. They are connected by coverage and capability constraints formalized as graph predicates over partial models (\ref{sec:cross-layer}), not by instantiation relationships. The contribution is therefore the formalization of governance constraints across independently governed layers, not the layering technique itself.

No prior work combines multi-level metamodeling with formalized cross-layer constraints for verifiable credential ecosystem design under multi-source governance.
