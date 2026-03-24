<!--
Section: Evaluation
Budget: 2.0 pages (~11 paragraphs, 3 subsections + preamble)
Goal: Three-axis validation. Tables carry the argument.
Dependencies: Section 04 (all metamodel definitions and constraints).
-->

# Evaluation

<!-- E0: Preamble — evaluation strategy -->
<!-- Job: State the three validation axes and what each demonstrates. Be explicit about what the evaluation does NOT claim (no user study, no runtime performance, no comparison with competing tools). -->

%% @TODO: Draft preamble — three axes: (1) coverage, (2) expressiveness, (3) error visibility. State scope and limitations upfront. %%

## Metamodel Coverage

<!-- E1: Method -->
<!-- Job: Describe the systematic mapping of W3C VCDM 2.0 concepts to metamodel elements. -->
<!-- Key content: Take the VCDM 2.0 specification's defined concepts (credential, credentialSubject, issuer, claim, proof, verifiablePresentation, etc.) and map each to a metamodel element or state that it is out of scope. Present as a coverage table. -->
<!-- Binding claims: #2 (grounding in VCDM 2.0), #5 (coverage validation). -->

%% @CITE: W3C VCDM 2.0 specification — full concept list %%
%% @FIGURE: fig_coverage_table | Coverage mapping table: VCDM 2.0 concept → metamodel element → layer. Mark in-scope / out-of-scope. %%

%% @TODO: Draft — VCDM coverage method. Systematic extraction of concepts from the spec. %%

<!-- E2: Results -->
<!-- Job: State the coverage count and identify what is excluded. -->
<!-- Key content: N of M VCDM concepts mapped. Exclusions: proof mechanisms (out of scope — we model structure, not cryptography), verifiable presentations (future work), status/revocation. -->

%% @TODO: Draft — coverage results. N/M count. Explicit exclusion list with rationale. %%

<!-- E3: Interpretation -->
<!-- Job: What does coverage mean for the contribution? -->
<!-- Key content: The metamodel captures the structural and semantic core of VCDM 2.0 relevant to credential ecosystem design. It is not a complete formalization of the entire specification — it covers what is needed for cross-layer constraint checking. -->

%% @TODO: Draft — interpretation. Coverage is sufficient for the paper's claims, not exhaustive. %%

## Constraint Expressiveness

<!-- E4: Method -->
<!-- Job: Describe how constraints were collected from governance sources and classified. -->
<!-- Key content: Collected constraints from W3C VCDM 2.0 spec, EU eIDAS 2.0 implementing regulation, Architecture Reference Framework (ARF). Classified each as: expressible (with predicate name), partially expressible, or not expressible in the constraint language. -->
<!-- Binding claims: #6 (expressiveness vs. W3C + EU sources) — HIGH RISK. -->

%% @CITE: W3C VCDM 2.0 — normative requirements %%
%% @CITE: eIDAS 2.0 implementing regulation %%
%% @CITE: EU Architecture Reference Framework (ARF) %%

%% @TODO: HIGH PRIORITY — Collect constraints from EU sources. Mitigation: representative subset (5-8 key ARF/eIDAS requirements), not exhaustive. %%

<!-- E5: Results table -->
<!-- Job: Present the constraint expressiveness results. -->
<!-- Key content: Table with columns: constraint description, source (W3C/EU/community), expressible (yes/partial/no), predicate name if yes. Row count: target 10-15 constraints minimum. -->

%% @FIGURE: fig_expressiveness_table | Constraint expressiveness table: constraint × source × expressible × predicate. %%

%% @TODO: Draft — expressiveness table. Must include constraints from at least two governance sources. %%

<!-- E6: Cross-governance conflict result — THE HEADLINE RESULT -->
<!-- Job: Present the specific example of formally contradictory constraints from different governance sources. -->
<!-- Key content: A specific pair of constraints from different sources that cannot be simultaneously satisfied in the metamodel. The Refinery model generator cannot produce a valid instance under both constraints — demonstrating formal contradiction. -->
<!-- Binding claims: #8 (formally contradictory cross-framework constraints) — HIGH RISK, DOES NOT EXIST YET. -->

%% @TODO: CRITICAL PATH — Develop the cross-governance conflict example. Need a specific pair of constraints from W3C and eIDAS/ARF that formally contradict. This is the paper's headline result and does not yet exist. %%

%% @TODO: Draft — cross-governance conflict. Show the two constraints, show why they contradict, show that Refinery cannot generate a valid model satisfying both. %%

<!-- E7: Limitations of expressiveness -->
<!-- Job: State what the constraint language cannot express. -->
<!-- Key content: Runtime behavioral constraints (e.g., revocation timing), policy-level access control, holder-binding protocols, issuance workflow constraints. The formalization covers structural and semantic constraints, not operational ones. -->

%% @TODO: Draft — expressiveness limitations. What falls outside the constraint language. %%

## Error Visibility

<!-- E8: Anti-pattern catalog -->
<!-- Job: List the known credential design anti-patterns and their error predicates. -->
<!-- Key content: 3-5 anti-patterns drawn from the Refinery model. Each has a name, description of the design error, the error predicate that catches it, and which layer(s) it spans. -->
<!-- Binding claims: #7 (error detection vs. anti-patterns), #9 (multi-layer errors invisible to single-layer). -->

%% @FIGURE: fig_antipattern_table | Anti-pattern table: name × description × error predicate × layer(s) × detected? %%

%% @TODO: Draft — anti-pattern catalog. At least 4 anti-patterns: bad_trace, noSubject/root_ent_doesnt_have_cred, no_cred_props_for_cred_entity, non_connected, common_parent. %%

<!-- E9: Detection results -->
<!-- Job: For each anti-pattern, show whether the error predicate catches it and demonstrate with the running example. -->
<!-- Key content: Construct a variant of the Alice example that contains each anti-pattern. Show the Refinery error predicate firing. State which layer the error manifests in and whether single-layer inspection would catch it. -->

%% @TODO: Draft — detection results per anti-pattern. Construct error variants of Alice example. %%

<!-- E10: The multi-layer visibility argument -->
<!-- Job: Deliver binding claim #9 — demonstrate a specific error that passes single-layer checks but fails the cross-layer constraint. -->
<!-- Key content: Construct a specific model where the claim property layer is valid (connected, well-formed) and the credential schema layer is valid (all credentials have subjects, all claims have source/target), but the trace mapping is inconsistent (a CredentialSubject traces to a Value instead of a Subject). Show that this passes layer-by-layer checks but violates the cross-layer trace consistency constraint. -->

%% @TODO: Draft — multi-layer visibility. The key demonstration: layer-by-layer checks pass, cross-layer check fails. This is the paper's core argument for why multi-level modeling is necessary. %%
