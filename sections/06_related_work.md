<!--
Section: Related Work
Budget: 0.75 pages (~4 paragraphs, 3 subsections)
Goal: Position the contribution against three bodies of work. Each subsection: 2-3 cited works, positioning statement, gap.
Dependencies: Sections 04 (what we do), 05 (what we demonstrate).
Note: Double-blind. CSCS 2024 short paper referenced in third person.
-->

# Related Work

## Credential Ecosystem Design

<!-- R1: Informal baseline + closest domain neighbors -->
<!-- Job: Position against (a) the specifications themselves (informal baseline), and (b) the two closest academic works applying formal/conceptual modeling to identity/credential systems. -->
<!-- Informal baseline: W3C VCDM 2.0, EU ARF, Hyperledger AnonCreds spec, ISO mDL — design patterns and specifications without formal cross-layer constraint checking. -->
<!-- Ding & Sato 2023 (TrustCom): Model-driven security analysis of SSI — formalizes SSI architectural patterns as state machines, verifies security properties via LTL/CTL model checking (NuSMV/Promela). Operates at protocol level (participants, messages, trust), not schema level (claim grouping, subject binding, trace mappings). Complementary: security analysis presupposes well-designed credential schemas. -->
<!-- Schardong & Custodio 2024 (ER): RAF framework — meta-metamodel for comparing digital identity models (OAuth, OIDC, SSI) using set-theoretic notation. Operates at identity protocol level, not credential structure level. Does not formalize intra-credential constraints or enable consistency checking. -->
<!-- Position: Closest neighbors address either the domain without formalization (specs), security without schema structure (Ding & Sato), or identity models without credential constraints (Schardong & Custodio). None formalizes cross-layer credential schema constraints under multi-source governance. -->

%% @CITE: W3C VCDM 2.0 working group %%
%% @CITE: ISO/IEC 18013-5 (mDL) %%
%% @CITE: Hyperledger AnonCreds specification %%
%% @CITE: EU Architecture Reference Framework (ARF) %%
%% @CITE: Ding & Sato 2023 — "Model-Driven Security Analysis of Self-Sovereign Identity Systems" — IEEE TrustCom 2023 [VERIFY — found via web search, not yet confirmed] %%
%% @CITE: Schardong & Custodio 2024 — "The Role-Artifact-Function Framework for Understanding Digital Identity Models" — ER 2024 [VERIFY — found via web search, not yet confirmed] %%

%% @TODO: Draft — credential ecosystem design landscape. ~1 paragraph. Informal baseline (2-3 sentences), then Ding & Sato differentiation (1-2 sentences), then Schardong & Custodio differentiation (1-2 sentences). %%

## Model-Driven Engineering for Security and Identity

<!-- R2: MDE for security — same technique family, different domain and property class -->
<!-- Job: Cite foundational MDE-security works and position them as targeting security properties (confidentiality, RBAC, authorization), not cross-layer structural consistency of credential schemas under multi-source governance. -->
<!-- UMLsec (Jürjens 2002/2004): UML profile for expressing security-relevant information; formal semantics for evaluating security properties. Targets confidentiality, integrity, authentication in distributed systems. -->
<!-- SecureUML (Basin et al. 2002/2006): Model-driven RBAC with OCL authorization constraints; generates access control infrastructure from UML models. Targets access control in enterprise applications. -->
<!-- Neither addresses credential schema design, multi-layer abstraction for VCs, or governance constraint reconciliation. -->
<!-- Position: MDE is proven effective for security-critical domains. The present work applies MDE to a different property class — not security properties but cross-layer structural consistency — in a domain these works do not address. -->

%% @CITE: UMLsec — Jürjens, UML 2002 / book 2004 %%
%% @CITE: SecureUML — Basin, Doser, Lodderstedt, UML 2002 / ACM TOSEM 2006 %%

%% @TODO: Draft — MDE for security. ~1 paragraph. Acknowledge UMLsec + SecureUML effectiveness (2-3 sentences), then differentiate: different property class (structural consistency vs. security), different domain (VC ecosystems vs. distributed systems / enterprise IAM). %%

## Multi-Level Modeling and Graph-Based Design Space Exploration

<!-- R3: Foundational techniques and tools we build on -->
<!-- Job: Position against (a) multi-level modeling foundations, (b) multi-view consistency, (c) DSE tools. The contribution is the domain-specific formalization, not the technique or tool. -->
<!-- Atkinson & Kühne (2001/2008): Foundational multi-level metamodeling with deep instantiation and potency. Our three layers instantiate multi-level modeling principles for the VC domain. The novelty is not the layering mechanism — it is that the VC design problem requires it because governance constraints target different ontological levels and cross-level violations are invisible to single-level inspection. -->
<!-- Diskin et al. (2010/2013): Multi-view consistency for heterogeneous models with overlap specifications. Our cross-layer constraints are a specific instance of multi-view consistency. We add the governance dimension — constraints from independent, potentially conflicting sources — which Diskin's framework does not address. -->
<!-- Refinery / Semerath et al. (ICMT 2017, ICSE 2024): Partial graph modeling with graph predicate evaluation and model generation. Provides our solver infrastructure. The contribution is the VC-specific metamodel and constraints, not the solver. Removing Refinery leaves the formalization intact as a specification. -->
<!-- Alloy (Jackson 2012): Alternative solver paradigm (relational logic + SAT). Could encode the metamodel but lacks Refinery's partial model semantics for incomplete designs during exploration. -->
<!-- CSCS 2024 short paper: Own prior work. Third person. "Prior work [N] presented a preliminary metamodel..." — the present paper extends with cross-layer constraints, governance reconciliation, and three-axis validation. -->
<!-- Position: We contribute the domain-specific formalization and the governance reconciliation problem, building on established multi-level modeling theory and partial graph modeling tools. -->

%% @CITE: Atkinson & Kühne — "The Essence of Multilevel Metamodeling" UML 2001; "Reducing accidental complexity" SoSyM 2008 %%
%% @CITE: Diskin et al. — "Specifying overlaps of heterogeneous models for global consistency checking" MODELS 2010 %%
%% @CITE: Refinery — Marussy et al., "Refinery: Graph Solver as a Service" ICSE 2024; Semerath & Varró, ICMT 2017 (third person) %%
%% @CITE: Alloy — Jackson, "Software Abstractions" MIT Press 2012 %%
%% @CITE: CSCS 2024 short paper — third person, double-blind %%

%% @TODO: Draft — multi-level modeling + DSE landscape. ~1 paragraph. Atkinson & Kühne as foundation (1-2 sentences), Diskin as structurally related (1 sentence), Refinery as tool (1-2 sentences), own prior work (1 sentence). %%

<!-- R4: Synthesis (mandatory — closes the section) -->
<!-- Job: One sentence synthesizing the gap across all three bodies of work. -->
<!-- Content: "No prior work combines multi-level metamodeling with formalized cross-layer constraints for verifiable credential ecosystem design under multi-source governance." -->

%% @TODO: Draft — synthesis sentence closing the section. %%
