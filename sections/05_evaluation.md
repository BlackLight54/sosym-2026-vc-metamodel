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

<!-- E6: Cross-governance conflict results — TWO HEADLINE RESULTS -->
<!-- Binding claims: #8 (formally contradictory cross-framework constraints), #9 (multi-layer errors invisible to single-layer). -->

### Headline 1: Income governance conflict (vertical)

At the credential schema layer, IncomeCred is well-formed: $\text{CS\_Applicant}_3$ traces to Applicant, $\text{earns}_1$ traces to the $\text{earns}$ property, $\text{monthly\_income}_1$ traces to its value. All structural constraints (C1–C3) are satisfied.

At the format-specific layer, three governance sources impose requirements on IncomeCred:

1. **eIDAS ARF** (normative, SHALL): $\text{format}(\text{IncomeCred}) \in \{\text{SD-JWT-VC}, \text{mdoc}\}$ — neither supports predicate proofs %% @CITE: eIDAS ARF — dual format mandate %%.
2. **GDPR Art. 5(1)(c)** (operationally binding): the income threshold check requires disclosing only whether $\text{monthly\_income} \geq \text{threshold}$, not the exact value. If data minimization is to be achieved through technical means at the credential layer, this requires predicate proof capability %% @CITE: GDPR Art. 5(1)(c) %%. The Hungarian data protection authority has enforced this interpretation in the housing subsidy context specifically.^[NAIH fined a bank 35M HUF for excessive data collection during CSOK applications.]
3. **W3C VCDM 2.0**: the credential format must conform to the VCDM data model — AnonCreds v1 does not (no `@context`, no `credentialSubject` structure, CL signatures not a registered proof type) %% @CITE: W3C VCDM 2.0 %% %% @CITE: AnonCreds specification %%.

No format satisfies all three requirements. SD-JWT-VC satisfies (1) and (3) but not (2). AnonCreds satisfies (2) but not (1) or (3). The configuration is unsatisfiable: constraints C5, C6, and C7 cannot be simultaneously satisfied on IncomeCred.

This contradiction is invisible to single-layer inspection. At the credential schema layer alone, IncomeCred is well-formed. At the format-specific layer under eIDAS alone, SD-JWT-VC is compliant. At the format-specific layer under GDPR alone, AnonCreds provides the needed capability. Only the joint, cross-governance, cross-layer analysis reveals the conflict.

%% @TODO: After Refinery formalization (Pass 2) — show the error predicates firing and the model generator producing no valid instance. %%

*Remark.* An issuer-precomputed boolean claim ($\text{income\_above\_threshold}: \text{true}$) can approximate a predicate proof within SD-JWT-VC. However, this workaround requires the issuer to anticipate every verifier threshold at issuance time, produces combinatorial explosion for multi-threshold scenarios, and remains static — a credential issued with threshold $X$ cannot serve a verifier requiring threshold $Y$ without reissuance. As shown in Section 4.4, this workaround restructures the claim property layer — itself a cross-layer propagation that confirms the need for multi-layer analysis.

### Headline 2: Cross-credential predicate gap (horizontal)

The domain constraint $\text{property\_area} \geq \text{min\_area}(\text{num\_children})$ (C4) requires combining values from two credentials issued by independent authorities: $\text{property\_area}$ from PropertyCred (land registry) and $\text{num\_children}$ from FamilyStatusCred (civil registry).

No deployed credential format supports cross-credential arithmetic predicates in zero-knowledge:

| Format | Single-cred predicate | Cross-cred equality | Cross-cred arithmetic |
|---|---|---|---|
| AnonCreds v1 (CL) | Yes (attr ≥ const) | No | **No** |
| AnonCreds v2 (BBS/PS) | Yes (range proofs) | Yes | **No** |
| SD-JWT-VC | No | No | **No** |
| SNARK-based %% @CITE: zk-creds, IEEE S&P 2023 %% | Yes | Yes | Yes (research prototype) |

To verify the floor area constraint, the verifier must see both raw values from two separate credentials, defeating the privacy properties that ZKP-capable formats promise. The metamodel captures this: a claim-property-layer constraint (C4) that spans credentials cannot be enforced privacy-preservingly at the format-specific layer because no deployed format supports cross-credential predicate proofs (C9).

This gap is again invisible to single-layer inspection: the claim property layer constraint is well-defined, both credentials are well-formed at the credential schema layer, and each credential's format is individually valid at the format-specific layer. Only the cross-layer analysis — checking whether the CPL constraint can be enforced given the FSL format capabilities — reveals the expressiveness gap.

*Complementarity.* The two results are orthogonal. Headline 1 identifies a *vertical* governance conflict: contradictory requirements on a single credential's format from different regulatory sources. Headline 2 identifies a *horizontal* expressiveness gap: an ecosystem-level constraint spanning credentials that exceeds any single format's capabilities. Together, they demonstrate that multi-layer analysis detects both governance conflicts and format expressiveness gaps invisible to single-layer inspection.

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
<!-- Key content: Construct a variant of the housing subsidy example that contains each anti-pattern. Show the Refinery error predicate firing. State which layer the error manifests in and whether single-layer inspection would catch it. -->

%% @TODO: Draft — detection results per anti-pattern. Construct error variants of housing subsidy example. %%

<!-- E10: The multi-layer visibility argument -->
<!-- Job: Deliver binding claim #9 — demonstrate a specific error that passes single-layer checks but fails the cross-layer constraint. -->
<!-- Key content: Construct a specific model where the claim property layer is valid (connected, well-formed) and the credential schema layer is valid (all credentials have subjects, all claims have source/target), but the trace mapping is inconsistent (a CredentialSubject traces to a Value instead of a Subject). Show that this passes layer-by-layer checks but violates the cross-layer trace consistency constraint. -->

%% @TODO: Draft — multi-layer visibility. The key demonstration: layer-by-layer checks pass, cross-layer check fails. This is the paper's core argument for why multi-level modeling is necessary. %%
