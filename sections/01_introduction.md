%% @META: Section: Introduction %%
%% @META: Budget: 1.25 pages (~7 paragraphs) %%
%% @META: Goal: Establish problem, gap, contribution, approach sketch, paper structure. %%
%% @META: Dependencies: None (self-contained). %%

# Introduction

%% @FIGURE: fig_teaser | Teaser figure (full-width, before first column). Unified housing subsidy scenario across three metamodel layers. Layout: three horizontal bands (DCL top, CSL middle, FSL bottom). DCL: Applicant node with three Prop edges to num_children, property_area, monthly_income; dashed arc for cross-property constraint area ≥ f(children). CSL: three credential boxes (FamilyStatus, Property, Income) each with CS+Claim+CV; dashed alignment arrows between CS nodes; vertical trace lines to DCL. FSL: SD-JWT-VC boxes below FamilyStatus/Property (solid, valid); conflict zone below Income (split box: SD-JWT-VC "eIDAS required" vs. AnonCreds "GDPR predicate proof", red dashed border, no single format satisfies both); second conflict annotation between Property/FamilyStatus for cross-credential predicate gap. Caption: "A housing subsidy scenario across three metamodel layers. Domain facts at the domain concept layer are grouped into credentials with aligned subjects at the credential schema layer. At the format-specific layer, eIDAS format mandates and GDPR data minimization impose contradictory requirements on the income credential; cross-credential predicates lack privacy-preserving enforcement entirely." Production: Excalidraw prototype → TikZ for camera-ready. %%

%% @SCAFFOLD: P1 — Hook — why does the problem matter? %%
%% @SCAFFOLD: Job: Establish that VC ecosystems face a multi-layer design problem under diverse governance. %%
%% @SCAFFOLD: Key claim: Design constraints span multiple abstraction layers and originate from diverse governance frameworks. %%
%% @SCAFFOLD: Evidence: W3C VCDM 2.0, eIDAS 2.0, Hyperledger AnonCreds as concrete governance sources. %%

Emerging digital credential ecosystems allow persons and organizations to receive, hold, and selectively present cryptographically verifiable claims %% @CITE: W3C VCDM 2.0 %%. Such ecosystems are deployed under diverse governance frameworks — from government-regulated EU Digital Identity Wallets %% @CITE: eIDAS 2.0 / EU Digital Identity Wallet %% to community-governed decentralized identity systems %% @CITE: Hyperledger AnonCreds / Aries %%. Designing these ecosystems requires satisfying constraints that span multiple abstraction layers — from domain-level claim properties through credential schema structure to format-specific privacy capabilities — yet no integrated formal model captures these cross-layer constraints.

%% @SCAFFOLD: P2 — Gap — what's missing? %%
%% @SCAFFOLD: Job: Identify the specific gap: no multi-level metamodel formalizes cross-layer constraints jointly. %%
%% @SCAFFOLD: Key claim: Design errors spanning layers go unnoticed because no model makes them expressible. %%
%% @SCAFFOLD: Evidence: Show that constraints are scattered across W3C standards, EU regulations, community guidelines. %%

%% @TODO: Verify gap claim — confirm no existing multi-level metamodel for VC ecosystems %%

Constraints from W3C standards, EU implementing regulations, and community design guidelines interact across abstraction layers, and their combined effect on a single credential ecosystem design is not predictable from any individual governance source %% @CITE: existing VC design tools/approaches that are single-layer %%. For example, eIDAS mandates a specific credential format for government attestations; GDPR requires that privacy-sensitive claims disclose only the minimum necessary information; neither regulation anticipates the other, yet their joint effect on a single income credential may be unsatisfiable. Unlike hierarchical requirement systems in safety-critical domains, these governance sources are independent peers whose design goals may be formally irreconcilable. Design errors that span multiple layers go unnoticed — not because they are difficult to detect algorithmically, but because no model makes them expressible in the first place. Existing tools operate at a single layer — JSON Schema validators check credential structure, format-specific conformance tools verify encoding constraints, governance frameworks define requirements in isolation — but no tool checks cross-layer consistency. A credential schema may be well-formed when inspected in isolation, yet violate a cross-layer constraint that links domain-level claim semantics to format-specific privacy capabilities.

%% @SCAFFOLD: P3 — Contribution — numbered list %%
%% @SCAFFOLD: Job: State exactly what the paper contributes. Each item references its delivering section. %%
%% @SCAFFOLD: Key claim: Three distinct contributions that together address the gap. %%
%% @SCAFFOLD: Rule: The list must match what the paper actually delivers. Check against binding claims in 00_abstract.md. %%

%% @TODO: Finalize contribution list — must align with binding claims #1-#10 in 00_abstract.md %%

We make the following contributions:

1. A **three-layer metamodel** for credential ecosystem design, grounded in the W3C Verifiable Credentials Data Model 2.0, spanning claim properties, credential schemas, and format-specific representations (Section 4).
2. A **formalization of cross-layer constraints** as graph predicates in the Refinery partial graph modeling framework, supporting consistency checking, error identification, and design space exploration (Section 4.4).
3. A **three-axis validation** demonstrating metamodel coverage against the W3C specification, constraint expressiveness against W3C and EU regulatory sources, and error visibility against known credential design anti-patterns (Section 5).

%% @SCAFFOLD: P4 — Approach sketch — credible mechanism in one paragraph %%
%% @SCAFFOLD: Job: Give the reader enough to believe the approach works, without detail. %%
%% @SCAFFOLD: Key content: Three-layer structure, layer names, Refinery as tool, graph predicates as constraint language. %%

The metamodel organizes credential ecosystem design into three layers: a *domain concept layer* capturing domain-level facts as an information graph, a *credential schema layer* defining how claims are grouped into verifiable credentials with subject bindings and trace mappings, and a *format-specific layer* encoding the capabilities and constraints of concrete credential formats such as SD-JWT-VC and AnonCreds. Cross-layer constraints are formalized as graph predicates in Refinery %% @CITE: Refinery partial graph modeling framework %%, which generates diverse model instances satisfying these constraints — or reveals that no consistent design exists when constraints from different governance frameworks are formally contradictory. The framework supports three usage modes: *consistency checking* confirms that a partial or complete design satisfies all constraints, *error identification* names specific constraint violations, and *design space exploration* generates diverse valid configurations or proves that none exist.

%% @SCAFFOLD: P5 — Structure paragraph — argumentative roadmap %%
%% @SCAFFOLD: Job: Trace the paper's argument through its sections. Not a table of contents. %%
%% @SCAFFOLD: Rule: Each section gets one sentence/clause. Use active, specific verbs. Show causal links between sections. %%
%% @SCAFFOLD: Generated by skills/structure_paragraph — regenerate when sections change. %%

%% Structure paragraph — regenerate with skills/structure_paragraph when sections change. %%

Section 2 introduces the W3C Verifiable Credentials Data Model, multi-level modeling concepts, and the Refinery partial graph modeling framework that together ground the formalization. Section 3 presents an overview of the approach: a running example motivates the multi-layer design problem through a housing subsidy scenario with cross-credential constraints and conflicting governance requirements (Section 3.1), a functional overview defines the three usage modes of the framework (Section 3.2), and a usage workflow walks through a designer's interaction with the tool on the running example (Section 3.3). Building on this overview, Section 4 presents the three-layer metamodel and formalizes cross-layer constraints as Refinery graph predicates, including trace consistency, entity alignment, and structural anti-pattern detection. Section 5 validates the approach along three axes: metamodel coverage against the W3C specification, constraint expressiveness against W3C and EU regulatory sources, and error visibility against known credential design anti-patterns. Section 6 positions the contribution against related work in credential ecosystem design, model-driven security, and graph-based design space exploration. Section 7 discusses limitations and identifies directions for extending the formalization.
