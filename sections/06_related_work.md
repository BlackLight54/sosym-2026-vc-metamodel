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

%% @TODO: R1 — Credential ecosystem design + formalization landscape. (1) Informal baseline: W3C VCDM 2.0, ARF, AnonCreds spec — design patterns without formal cross-layer checking (2 sentences). (2) Single-layer formalizations: Braun & Kafer 2025 (RDF semantics), EuroS&PW 2022 (LD-VC), Braun et al. 2024 (ProVerif protocol verification, D3) — each formalizes one layer or concern (3–4 sentences). (3) Conceptual models: Tith & Colin 2025 (trust policy), Turkanovic et al. 2025 (delegation), ToIP stack (informal layers), Naghmouchi & Laurent 2025 (privacy framework) (2–3 sentences). (4) Gap: none formalizes cross-layer constraints spanning domain semantics, credential structure, and format representation (1 sentence). Length: ~1.5 paragraphs. %%

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

## Model-Driven Engineering for Security and SSI
\label{sec:rw-mde}

%% @CITE: UMLsec — Jürjens, UML 2002 / book 2004 %%
%% @CITE: SecureUML — Basin, Doser, Lodderstedt, UML 2002 / ACM TOSEM 2006 %%
%% @CITE: ChorSSI — Cippitelli, Marcelletti, Morichetta 2023, EMISA Journal / Springer %%
%% @CITE: Pattiyanon, Aoki, Ishii 2022 — "A Method for Detecting Common Weaknesses in SSI Systems Using DSMs and Knowledge Graph" — MODELSWARD 2022 %%
%% @CITE: Barclay et al. 2020 — "Towards a Modelling Framework for SSI Systems" — arXiv %%
%% @CITE: King, De Vos et al. 2017 — "Automated multi-level governance compliance checking" — AAMAS Journal %%

%% @TODO: R2 — MDE for security + SSI. MDE-security foundations: UMLsec (Jürjens), SecureUML (Basin et al.) — target confidentiality/access control, not credential schema design (2 sentences). MDE-for-SSI (MUST cite all 4, MUST differentiate): ChorSSI (D1: choreography vs. credential design), SecureSSI (D2: security threats vs. design space), Pattiyanon (D2: weakness detection), Barclay (requirements-level) (4–5 sentences). King et al. — governance compliance, norms vs. model elements (1–2 sentences). Corrected C5 claim per DECISIONS.md: MDE HAS been applied to SSI, but none defines multi-level metamodel with cross-layer constraints. Length: ~1.5 paragraphs. %%

## Multi-Level Modeling and Graph-Based Design Space Exploration
\label{sec:rw-multilevel}

%% @CITE: Atkinson & Kühne — "The Essence of Multilevel Metamodeling" UML 2001; "Reducing accidental complexity" SoSyM 2008 %%
%% @CITE: de Lara & Guerra 2010 — "Deep meta-modelling with MetaDepth" LNCS %%
%% @CITE: Diskin et al. — "Specifying overlaps of heterogeneous models for global consistency checking" MODELS 2010 %%
%% @CITE: Refinery — Marussy et al., "Refinery: Graph Solver as a Service" ICSE 2024; Semerath & Varró, SoSyM 2017 (third person) %%
%% @CITE: Alloy — Jackson, "Software Abstractions" MIT Press 2012 %%
%% @CITE: CSCS 2024 short paper — third person, double-blind %%

%% @TODO: R3 — Multi-level modeling + DSE landscape. Atkinson & Kühne + de Lara & Guerra (MetaDepth) as multi-level modeling foundations (2 sentences). Diskin et al. — multi-view consistency, we add governance dimension (1 sentence). Refinery / Semerath et al. — solver infrastructure, third person (1–2 sentences). CSCS 2024 own prior work, third person (1 sentence). D5 PREEMPTION (critical for Reviewer D): layers are not instantiation levels, constraints are graph predicates not potency, contribution is governance constraint formalization not layering technique. Length: ~1 paragraph. %%

%% @TODO: R4 — Synthesis sentence closing the section. "No prior work combines multi-level metamodeling with formalized cross-layer constraints for verifiable credential ecosystem design under multi-source governance." Corrected, defensible version per gap analysis 2026-03-25. Length: 1 sentence. %%
