<!--
Section: Introduction
Budget: 1.25 pages (~7 paragraphs)
Goal: Establish problem, gap, contribution, approach sketch, paper structure.
Dependencies: None (self-contained).
-->

# Introduction

%% @FIGURE: fig_teaser | Teaser figure (full-width, before first column). Split panel: Left — Diploma scenario showing vertical constraint (format→claim ZKP dependency). Right — Alice scenario showing horizontal constraint (cross-credential entity alignment). Both highlight cross-layer errors invisible to single-layer inspection. %%

<!-- P1: Hook — why does the problem matter? -->
<!-- Job: Establish that VC ecosystems face a multi-layer design problem under diverse governance. -->
<!-- Key claim: Design constraints span multiple abstraction layers and originate from diverse governance frameworks. -->
<!-- Evidence: W3C VCDM 2.0, eIDAS 2.0, Hyperledger AnonCreds as concrete governance sources. -->

%% @CITE: W3C VCDM 2.0 %%
%% @CITE: eIDAS 2.0 / EU Digital Identity Wallet %%
%% @CITE: Hyperledger AnonCreds / Aries %%

Emerging digital credential ecosystems allow persons and organizations to receive, hold, and selectively present cryptographically verifiable claims. Such ecosystems are deployed under diverse governance frameworks — from government-regulated EU Digital Identity Wallets to community-governed decentralized identity systems. Designing these ecosystems requires satisfying constraints that span multiple abstraction layers — from domain-level claim properties through credential schema structure to format-specific privacy capabilities — yet no integrated formal model captures these cross-layer constraints.

<!-- P2: Gap — what's missing? -->
<!-- Job: Identify the specific gap: no multi-level metamodel formalizes cross-layer constraints jointly. -->
<!-- Key claim: Design errors spanning layers go unnoticed because no model makes them expressible. -->
<!-- Evidence: Show that constraints are scattered across W3C standards, EU regulations, community guidelines. -->

%% @CITE: existing VC design tools/approaches that are single-layer %%
%% @TODO: Verify gap claim — confirm no existing multi-level metamodel for VC ecosystems %%

These constraints are currently scattered across W3C standards, EU implementing regulations, and community design guidelines, with no formal means to check their consistency. Design errors that span multiple layers go unnoticed — not because they are difficult to detect algorithmically, but because no model makes them expressible in the first place. A credential schema may be well-formed when inspected in isolation, yet violate a cross-layer constraint that links domain-level claim semantics to format-specific privacy capabilities.

<!-- P3: Contribution — numbered list -->
<!-- Job: State exactly what the paper contributes. Each item references its delivering section. -->
<!-- Key claim: Three distinct contributions that together address the gap. -->
<!-- Rule: The list must match what the paper actually delivers. Check against binding claims in 00_abstract.md. -->

%% @TODO: Finalize contribution list — must align with binding claims #1-#10 in 00_abstract.md %%

We make the following contributions:

1. A **three-layer metamodel** for credential ecosystem design, grounded in the W3C Verifiable Credentials Data Model 2.0, spanning claim properties, credential schemas, and format-specific representations (Section 4).
2. A **formalization of cross-layer constraints** as graph predicates in the Refinery partial graph modeling framework, enabling automated consistency checking through design space exploration (Section 4.4).
3. A **three-axis validation** demonstrating metamodel coverage against the W3C specification, constraint expressiveness against W3C and EU regulatory sources, and error visibility against known credential design anti-patterns (Section 5).

<!-- P4: Approach sketch — credible mechanism in one paragraph -->
<!-- Job: Give the reader enough to believe the approach works, without detail. -->
<!-- Key content: Three-layer structure, layer names, Refinery as tool, graph predicates as constraint language. -->

%% @CITE: Refinery partial graph modeling framework %%

The metamodel organizes credential ecosystem design into three layers: a *claim property layer* capturing domain-level facts as an information graph, a *credential schema layer* defining how claims are grouped into verifiable credentials with subject bindings and trace mappings, and a *format-specific layer* encoding the capabilities and constraints of concrete credential formats such as AnonCreds and JSON-LD Verifiable Credentials. Cross-layer constraints are formalized as graph predicates in Refinery, which generates diverse model instances satisfying these constraints — or reveals that no consistent design exists when constraints from different governance frameworks are formally contradictory.

<!-- P5: Structure paragraph — argumentative roadmap -->
<!-- Job: Trace the paper's argument through its sections. Not a table of contents. -->
<!-- Rule: Each section gets one sentence/clause. Use active, specific verbs. Show causal links between sections. -->
<!-- Generated by skills/structure_paragraph — regenerate when sections change. -->

%% Structure paragraph — regenerate with skills/structure_paragraph when sections change. %%

Section 2 introduces the W3C Verifiable Credentials Data Model, multi-level modeling concepts, and the Refinery partial graph modeling framework that together ground the formalization. Section 3 motivates the problem through two running examples — a diploma credential with format-dependent privacy properties and a multi-credential property-identity scenario — demonstrating that cross-layer design errors are invisible to single-layer inspection. Building on these examples, Section 4 presents the three-layer metamodel and formalizes cross-layer constraints as Refinery graph predicates, including trace consistency, entity alignment, and structural anti-pattern detection. Section 5 validates the approach along three axes: metamodel coverage against the W3C specification, constraint expressiveness against W3C and EU regulatory sources, and error visibility against known credential design anti-patterns. Section 6 positions the contribution against related work in credential ecosystem design, model-driven security, and graph-based design space exploration. Section 7 discusses limitations and identifies directions for extending the formalization.
