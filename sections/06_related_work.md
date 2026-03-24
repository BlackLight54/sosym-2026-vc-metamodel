<!--
Section: Related Work
Budget: 0.75 pages (~4 paragraphs, 3 subsections)
Goal: Position the contribution against three bodies of work. Each subsection: 2-3 cited works, positioning statement, gap.
Dependencies: Sections 04 (what we do), 05 (what we demonstrate).
Note: Double-blind. CSCS 2024 short paper referenced in third person.
-->

# Related Work

## Credential Ecosystem Design

<!-- R1: Non-MDE credential design approaches -->
<!-- Job: Cite the main credential ecosystem design efforts and position them as providing guidelines without formal cross-layer constraint checking. -->
<!-- Key content: W3C VCDM working group outputs (specification, implementation guides), ISO mDL (mobile driving license), Hyperledger AnonCreds specification, EU Architecture Reference Framework. These provide design patterns and specifications but lack formal consistency checking across abstraction layers. -->
<!-- Position: Guidelines without formalization. Our metamodel formalizes what these sources leave informal. -->

%% @CITE: W3C VCDM 2.0 working group %%
%% @CITE: ISO/IEC 18013-5 (mDL) %%
%% @CITE: Hyperledger AnonCreds specification %%
%% @CITE: EU Architecture Reference Framework (ARF) %%

%% @TODO: Draft — credential ecosystem design landscape. Position: informal design guidance, no formal cross-layer checking. %%

## Model-Driven Engineering for Security and Identity

<!-- R2: MDE approaches to security domains -->
<!-- Job: Cite MDE-based security modeling work and position it as applying MDE to security but not to the VC-specific multi-layer problem. -->
<!-- Key content: UMLsec (Jürjens), SecureUML (Basin et al.), model-driven security (various). These demonstrate that MDE is productive for security-critical domains but address access control, protocol verification, or policy modeling — not credential schema design across multiple governance frameworks. -->
<!-- Position: MDE for security exists, but not for VC ecosystems. Our contribution fills a domain gap. -->

%% @CITE: UMLsec — Jürjens %%
%% @CITE: SecureUML — Basin et al. %%
%% @CITE: model-driven security — survey or key papers %%

%% @TODO: Draft — MDE for security. Position: MDE successfully applied to security, but not to VC multi-layer design. %%

## Graph-Based Design Space Exploration

<!-- R3: DSE tools and partial graph modeling -->
<!-- Job: Cite Refinery and related DSE tools, position our contribution as domain-specific metamodel + constraints on top of existing solver infrastructure. -->
<!-- Key content: Refinery (partial graph modeling, model generation), Alloy (relational modeling, bounded model checking), graph transformation tools (VIATRA, Henshin). These provide the solver infrastructure; our contribution is the VC-specific metamodel and cross-layer constraints, not the solver. -->
<!-- Note: CSCS 2024 short paper in third person — "Prior work [N] presented a preliminary metamodel for VC schema design..." -->
<!-- Position: We contribute the metamodel and constraints, not the solver. The solver is a published tool we apply. -->

%% @CITE: Refinery — partial graph modeling framework (third person) %%
%% @CITE: Alloy — Jackson %%
%% @CITE: VIATRA / graph transformation %%
%% @CITE: CSCS 2024 short paper — third person, double-blind %%

%% @TODO: Draft — DSE landscape. Position: we contribute the domain-specific formalization, not the solver. Own prior work in third person. %%

<!-- R4: Summary positioning (optional if space allows) -->
<!-- Job: One sentence synthesizing the gap across all three bodies of work. -->
<!-- Key content: No prior work combines multi-level metamodeling with formalized cross-layer constraints for the verifiable credential domain. -->

%% @TODO: Draft — synthesis. One sentence gap summary. %%
