%% @META: Section: Evaluation %%
%% @META: Budget: ≥2.0 pages (target 2.5) %%
%% @META: Goal: Two-part evaluation (elaboration + measurement) + threats to validity. %%
%% @META: Dependencies: Section 04 (metamodel definitions and constraints). %%

# Evaluation

%% @SCAFFOLD: E0 — Preamble — evaluation strategy %%
%% @SCAFFOLD: Job: State the two-part evaluation strategy and what each part demonstrates. Elaboration characterizes scope and expressiveness (qualitative). Measurement quantifies scalability (quantitative). Threats to validity addresses limitations. Be explicit about what the evaluation does NOT claim (no user study, no industrial deployment). %%

%% @TODO: Draft preamble — two parts: (1) elaboration (scope, expressiveness, error visibility), (2) scalability measurement (runtime, model size). State scope and limitations upfront. %%

## Elaboration

### Metamodel Coverage

%% @SCAFFOLD: E1 — Soundness/completeness characterization %%
%% @SCAFFOLD: Job: Characterize how far the formalization covers W3C VCDM 2.0. This is elaboration — "how far we got in the work" — not a measurement. Frame as soundness (every metamodel element traces to a VCDM concept) and completeness (which VCDM concepts are covered vs. excluded). %%
%% @SCAFFOLD: Key content: Systematic mapping of VCDM 2.0 concepts to metamodel elements. Coverage table: VCDM concept → metamodel element → layer. Explicit exclusions with rationale (proof mechanisms, verifiable presentations, status/revocation). %%
%% @SCAFFOLD: Binding claims: #2 (grounding in VCDM 2.0), #5 (coverage characterization). %%

%% @CITE: W3C VCDM 2.0 specification — full concept list %%
%% @FIGURE: fig_coverage_table | Coverage mapping table: VCDM 2.0 concept → metamodel element → layer. Mark in-scope / out-of-scope. %%

%% @TODO: Draft — VCDM coverage as soundness/completeness characterization. N of M VCDM concepts mapped. Explicit exclusion list with rationale. Frame as "how far we formalized," not as a validation metric. %%

### Constraint Expressiveness

%% @SCAFFOLD: E4 — Method %%
%% @SCAFFOLD: Job: Describe how constraints were collected from governance sources and classified. %%
%% @SCAFFOLD: Key content: Collected constraints from W3C VCDM 2.0 spec, EU eIDAS 2.0 / Architecture Reference Framework (ARF). Classified each as: expressible (with predicate name), partially expressible, or not expressible in the constraint language. %%
%% @SCAFFOLD: Binding claims: #6 (expressiveness vs. W3C + EU sources) — HIGH RISK. %%

%% @CITE: W3C VCDM 2.0 — normative requirements %%
%% @CITE: eIDAS 2.0 implementing regulation %%
%% @CITE: EU Architecture Reference Framework (ARF) v2.7.3 %%

%% @SCAFFOLD: E5 — Results table %%
%% @SCAFFOLD: Job: Present constraint expressiveness results. Focus on constraints that exercise the three-layer architecture. %%
%% @SCAFFOLD: Key content: Table with columns: ID, constraint description, source, expressible (yes/partial/no), predicate/mechanism. Feature the ARF constraints that validate the metamodel's capabilities: %%
%% @SCAFFOLD: — C1 (PID_02): Dual format mandate — PID in both ISO 18013-5 and SD-JWT VC. YES — EidasMandate + format class. %%
%% @SCAFFOLD: — C4 (ARB_02): Proximity requires mdoc (SD-JWT VC lacks offline protocol). YES — supports_offline_verification. %%
%% @SCAFFOLD: — C7 (ARB_06): Encoding-independent attribute definition, then per-format. YES — validates three-layer trace architecture. %%
%% @SCAFFOLD: Plus W3C and community constraints already encoded in the Refinery model (governance_conflict, cross_cred_predicate_gap, trace consistency). %%
%% @SCAFFOLD: Passing mention: ARF contains additional constraints (C2, C3, C5, C6, C8) that are partially expressible — these mark metamodel scope boundaries, not failures. Details reserved for journal version. %%

| ID | Constraint | Source | Expressible | Predicate / Mechanism |
|----|-----------|--------|-------------|----------------------|
| | | | | |

%% @FIGURE: fig_expressiveness_table | Constraint expressiveness table: ID × constraint × source × expressible × predicate. %%

%% @TODO: Draft — expressiveness table. Include ARF constraints C1, C4, C7 (fully expressible) plus W3C/community constraints from the Refinery model. Mention remaining ARF constraints (partially expressible) as scope boundaries in a brief paragraph — journal material, not individual rows. %%

%% @SCAFFOLD: E7 — Limitations of expressiveness %%
%% @SCAFFOLD: Job: State what the constraint language cannot express. %%
%% @SCAFFOLD: Key content: Runtime behavioral constraints (e.g., revocation timing), policy-level access control, holder-binding protocols, issuance workflow constraints. The formalization covers structural and semantic constraints, not operational ones. Note: ARF constraints C2, C3, C5, C6, C8 are partially expressible — attestation qualification hierarchy, per-claim SD annotation, and SD mechanism distinction are metamodel scope choices, not fundamental limitations. %%

%% @TODO: Draft — expressiveness limitations. What falls outside the constraint language. Briefly note partially expressible ARF constraints as scope boundaries. %%

### Headline Results

%% @SCAFFOLD: E6 — Cross-governance conflict results — TWO HEADLINE RESULTS %%
%% @SCAFFOLD: Binding claims: #8 (formally contradictory cross-framework constraints), #9 (multi-layer errors invisible to single-layer). %%

#### Headline 1: Income governance conflict (vertical)

At the credential schema layer, IncomeCred is well-formed: $\text{CS\_Applicant}_3$ traces to Applicant, $\text{earns}_1$ traces to the $\text{earns}$ property, $\text{monthly\_income}_1$ traces to its value. All structural constraints (C1–C3) are satisfied.

At the format-specific layer, three governance sources impose requirements on IncomeCred:

1. **eIDAS ARF** (normative, SHALL): $\text{format}(\text{IncomeCred}) \in \{\text{SD-JWT-VC}, \text{mdoc}\}$ — neither supports predicate proofs %% @CITE: eIDAS ARF — dual format mandate %%.
2. **GDPR Art. 5(1)(c)** (operationally binding): the income threshold check requires disclosing only whether $\text{monthly\_income} \geq \text{threshold}$, not the exact value. If data minimization is to be achieved through technical means at the credential layer, this requires predicate proof capability %% @CITE: GDPR Art. 5(1)(c) %%. The Hungarian data protection authority has enforced this interpretation in the housing subsidy context specifically.^[NAIH fined a bank 35M HUF for excessive data collection during CSOK applications.]
3. **W3C VCDM 2.0**: the credential format must conform to the VCDM data model — AnonCreds v1 does not (no `@context`, no `credentialSubject` structure, CL signatures not a registered proof type) %% @CITE: W3C VCDM 2.0 %% %% @CITE: AnonCreds specification %%.

No format satisfies all three requirements. SD-JWT-VC satisfies (1) and (3) but not (2). AnonCreds satisfies (2) but not (1) or (3). The configuration is unsatisfiable: constraints C5, C6, and C7 cannot be simultaneously satisfied on IncomeCred.

This contradiction is invisible to single-layer inspection. At the credential schema layer alone, IncomeCred is well-formed. At the format-specific layer under eIDAS alone, SD-JWT-VC is compliant. At the format-specific layer under GDPR alone, AnonCreds provides the needed capability. Only the joint, cross-governance, cross-layer analysis reveals the conflict.

%% @TODO: After Refinery formalization (Pass 2) — show the error predicates firing and the model generator producing no valid instance. %%

*Remark.* An issuer-precomputed boolean claim ($\text{income\_above\_threshold}: \text{true}$) can approximate a predicate proof within SD-JWT-VC. However, this workaround requires the issuer to anticipate every verifier threshold at issuance time, produces combinatorial explosion for multi-threshold scenarios, and remains static — a credential issued with threshold $X$ cannot serve a verifier requiring threshold $Y$ without reissuance. As shown in Section 4.4, this workaround restructures the domain concept layer — itself a cross-layer propagation that confirms the need for multi-layer analysis.

#### Headline 2: Cross-credential predicate gap (horizontal)

The domain constraint $\text{property\_area} \geq \text{min\_area}(\text{num\_children})$ (C4) requires combining values from two credentials issued by independent authorities: $\text{property\_area}$ from PropertyCred (land registry) and $\text{num\_children}$ from FamilyStatusCred (civil registry).

No deployed credential format supports cross-credential arithmetic predicates in zero-knowledge:

| Format | Single-cred predicate | Cross-cred equality | Cross-cred arithmetic |
|---|---|---|---|
| AnonCreds v1 (CL) | Yes (attr $\geq$ const) | No | **No** |
| AnonCreds v2 (BBS/PS) | Yes (range proofs) | Yes | **No** |
| SD-JWT-VC | No | No | **No** |
| SNARK-based %% @CITE: zk-creds, IEEE S&P 2023 %% | Yes | Yes | Yes (research prototype) |

To verify the floor area constraint, the verifier must see both raw values from two separate credentials, defeating the privacy properties that ZKP-capable formats promise. The metamodel captures this: a domain-concept-layer constraint (C4) that spans credentials cannot be enforced privacy-preservingly at the format-specific layer because no deployed format supports cross-credential predicate proofs (C9).

This gap is again invisible to single-layer inspection: the domain concept layer constraint is well-defined, both credentials are well-formed at the credential schema layer, and each credential's format is individually valid at the format-specific layer. Only the cross-layer analysis — checking whether the DCL constraint can be enforced given the FSL format capabilities — reveals the expressiveness gap.

*Complementarity.* The two results are orthogonal. Headline 1 identifies a *vertical* governance conflict: contradictory requirements on a single credential's format from different regulatory sources. Headline 2 identifies a *horizontal* expressiveness gap: an ecosystem-level constraint spanning credentials that exceeds any single format's capabilities. Together, they demonstrate that multi-layer analysis detects both governance conflicts and format expressiveness gaps invisible to single-layer inspection.

### Anti-Pattern Detection

%% @SCAFFOLD: E8 — Anti-pattern catalog %%
%% @SCAFFOLD: Job: List the known credential design anti-patterns and their error predicates. %%
%% @SCAFFOLD: Key content: 3-5 anti-patterns drawn from the Refinery model. Each has a name, description of the design error, the error predicate that catches it, and which layer(s) it spans. %%
%% @SCAFFOLD: Binding claims: #7 (error detection vs. anti-patterns), #9 (multi-layer errors invisible to single-layer). %%

%% @FIGURE: fig_antipattern_table | Anti-pattern table: name × description × error predicate × layer(s) × detected? %%

%% @TODO: Draft — anti-pattern catalog. At least 4 anti-patterns: bad_trace, noSubject/root_ent_doesnt_have_cred, no_cred_props_for_cred_entity, non_connected, common_parent. %%

%% @SCAFFOLD: E9 — Detection results %%
%% @SCAFFOLD: Job: For each anti-pattern, show whether the error predicate catches it and demonstrate with the running example. %%
%% @SCAFFOLD: Key content: Construct a variant of the housing subsidy example that contains each anti-pattern. Show the Refinery error predicate firing. State which layer the error manifests in and whether single-layer inspection would catch it. %%

%% @TODO: Draft — detection results per anti-pattern. Construct error variants of housing subsidy example. %%

%% @SCAFFOLD: E10 — The multi-layer visibility argument %%
%% @SCAFFOLD: Job: Deliver binding claim #9 — demonstrate a specific error that passes single-layer checks but fails the cross-layer constraint. %%
%% @SCAFFOLD: Key content: Construct a specific model where the domain concept layer is valid (connected, well-formed) and the credential schema layer is valid (all credentials have subjects, all claims have source/target), but the trace mapping is inconsistent (a CredentialSubject traces to a Value instead of a Subject). Show that this passes layer-by-layer checks but violates the cross-layer trace consistency constraint. %%

%% @TODO: Draft — multi-layer visibility. The key demonstration: layer-by-layer checks pass, cross-layer check fails. This is the paper's core argument for why multi-level modeling is necessary. %%

### Baseline Comparison

%% @SCAFFOLD: E11 — Baseline comparison %%
%% @SCAFFOLD: Job: Compare the Refinery-based approach with at least one baseline development tool to justify the tooling choice. %%
%% @SCAFFOLD: Key content: Select one baseline (OCL on Ecore, Alloy, or manual inspection / spreadsheet-based design review). Compare on at least one axis: expressiveness (what constraints can be stated), automation (what the tool checks vs. what requires manual inspection), error visibility (does the tool surface cross-layer issues). Be honest about Refinery limitations (learning curve, tool maturity, graph-based reasoning overhead). %%
%% @SCAFFOLD: Binding claims: addresses Reviewer D's "tool dependency" attack and Oszkár's "why Refinery instead of X?" question. %%

%% @TODO: Draft — baseline comparison. Select one baseline tool. Compare on expressiveness and/or automation. Acknowledge Refinery limitations honestly. %%

## Scalability Measurement

%% @SCAFFOLD: S0 — Preamble %%
%% @SCAFFOLD: Job: State the measurement objective: quantify how the approach scales with model size. Fixed schema: RQs → domains → setup → results → analysis. %%

### Research Questions

%% @SCAFFOLD: S1 — Research questions %%
%% @SCAFFOLD: Key content: %%
%% @SCAFFOLD: RQ1: "How does constraint validation runtime scale with model size (number of entities and constraints)?" %%
%% @SCAFFOLD: RQ2: "How does design space exploration (model generation) runtime scale with model size?" %%

%% @TODO: Draft RQ1 and RQ2. Consider whether a third RQ on error identification time or memory usage adds value. %%
%% @TODO: Placeholder — additional RQs or metrics may be identified during measurement. %%

### Selected Domains

%% @SCAFFOLD: S2 — Model instances %%
%% @SCAFFOLD: Job: Define 2-5 model instances of increasing size for scalability measurement. %%
%% @SCAFFOLD: Key content: Based on CSOK variants. E.g., (1) 1-credential minimal, (2) 3-credential CSOK as-is, (3) 5-credential extended (add HealthCred, EmploymentCred), (4) 10-credential synthetic. Justify scaling: each additional credential adds ~N entities (CredentialSchema, CredentialSubject, Claims), ~M trace links, ~K governance annotations. %%

%% @TODO: Create 2–5 model instances of increasing size in models/ for scalability measurement. Base on CSOK variants. %%

### Measurement Setup

%% @SCAFFOLD: S3 — Environment and methodology %%
%% @SCAFFOLD: Key content: Refinery version, JVM version, hardware spec (CPU, RAM). Number of repetitions per measurement. Warm-up runs. Metrics: validation time (ms), model generation time (ms), memory usage (MB). %%

%% @CITE: <<NOUR_CITE>> — Nour's ECMFA paper for measurement methodology inspiration. Martin to provide reference. %%

%% @TODO: Draft measurement setup. Include reproducibility information. Cite Nour's ECMFA paper for methodology. %%
%% @TODO: Placeholder — additional metrics beyond runtime and memory may be added. %%

### Measurement Results

%% @FIGURE: fig_scalability_validation | Validation runtime vs. model size (number of entities/constraints). X-axis: model size. Y-axis: time (ms). Lines for consistency check, error identification. figure* (full-width). %%

%% @FIGURE: fig_scalability_generation | Generation runtime vs. model size. X-axis: model size. Y-axis: time (ms). Line for design space exploration. figure* (full-width). %%

%% @TODO: Run scalability measurements in Refinery and populate figures. %%
%% @TODO: Placeholder — additional result figures if new metrics are added. %%

### Analysis of Results

%% @SCAFFOLD: S4 — Analysis %%
%% @SCAFFOLD: Job: Answer each RQ based on measurement data. Draw conclusions about practical applicability. State limitations of the measurement (single tool, synthetic scaling, no comparison with industrial-scale ecosystems). %%

%% @TODO: Draft analysis — answer RQ1 and RQ2, state practical implications and measurement limitations. %%

## Threats to Validity

### Internal Validity

%% @SCAFFOLD: T1 — Internal validity threats %%
%% @SCAFFOLD: Key content: %%
%% @SCAFFOLD: — Constraint selection bias: constraints were chosen to demonstrate the metamodel's capabilities, not sampled randomly from governance documents. Mitigation: constraints come from normative sources (ARF, VCDM spec), not invented. %%
%% @SCAFFOLD: — Running example design: the CSOK scenario was constructed to exhibit both a vertical governance conflict and a horizontal expressiveness gap. A real-world ecosystem may not exhibit both simultaneously. Mitigation: both conflict types are independently documented in the literature. %%

%% @TODO: Draft internal validity threats. %%

### External Validity

%% @SCAFFOLD: T2 — External validity threats %%
%% @SCAFFOLD: Key content: %%
%% @SCAFFOLD: — Single domain: evaluation uses one running example (Hungarian housing subsidy). Results may not generalize to other credential ecosystems (healthcare, education, travel). Mitigation: the metamodel is defined generically; the CSOK instance demonstrates applicability, not exhausts it. %%
%% @SCAFFOLD: — EU regulatory focus: governance constraints drawn primarily from eIDAS/ARF. Other regulatory frameworks (NIST, ISO) may impose different constraint patterns. %%

%% @TODO: Draft external validity threats. %%

### Construct Validity

%% @SCAFFOLD: T3 — Construct validity threats %%
%% @SCAFFOLD: Key content: %%
%% @SCAFFOLD: — Metamodel scope choices: the formalization excludes proof mechanisms, verifiable presentations, status/revocation. These exclusions are deliberate (structural vs. cryptographic concerns) but limit what constraints can be expressed. ARF constraints C2, C3, C5, C6, C8 are partially expressible due to missing attestation qualification hierarchy, per-claim SD annotation, and SD mechanism distinction — these are scope choices, not fundamental limitations. %%
%% @SCAFFOLD: — Expressibility classification: "partially expressible" is a judgment call. Different metamodel designs might express the same constraint fully or not at all. %%

%% @TODO: Draft construct validity threats. Include metamodel scope choices from ARF gap analysis. %%

### Conclusion Validity

%% @SCAFFOLD: T4 — Conclusion validity threats %%
%% @SCAFFOLD: Key content: %%
%% @SCAFFOLD: — Scalability measurement on synthetic instances: scaling model instances by adding credentials is representative of ecosystem growth, but does not capture complexity growth from richer governance frameworks or cross-ecosystem interoperability. %%
%% @SCAFFOLD: — Tool-specific results: Refinery's performance characteristics may not generalize to other graph-based modeling tools. The contribution is the metamodel and constraint formalization, not the tool. %%

%% @TODO: Draft conclusion validity threats. %%
