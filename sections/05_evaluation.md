%% @META: Section: Evaluation %%
%% @META: Budget: ≥2.0 pages (target 2.5) %%
%% @META: Goal: Two-part evaluation (elaboration + measurement) + threats to validity. %%
%% @META: Dependencies: Section 04 (metamodel definitions and constraints). %%

# Evaluation
\label{sec:evaluation}

%% @TODO: E0 — State evaluation strategy. Two parts: (1) elaboration (scope, expressiveness, error visibility — qualitative), (2) scalability measurement (runtime, model size — quantitative). Threats to validity. Explicit about what evaluation does NOT claim: no user study, no industrial deployment. Length: 2–3 sentences. %%

## Elaboration
\label{sec:elaboration}

### Metamodel Coverage
\label{sec:coverage}

%% @TODO: E1 — VCDM coverage as soundness/completeness characterization. Soundness: every metamodel element traces to a VCDM concept. Completeness: which VCDM concepts covered vs. excluded. Explicit exclusions with rationale: proof mechanisms (cryptographic, not structural), verifiable presentations (runtime, not design-time), status/revocation (lifecycle, not schema). Brief coverage list by layer. Frame as "how far we formalized," not validation metric. [Binding Claim #5]. Length: 1 paragraph. %%

%% @CITE: W3C VCDM 2.0 specification — full concept list %%
%% @FIGURE: fig_coverage_table | Coverage mapping table: VCDM 2.0 concept → metamodel element → layer. Mark in-scope / out-of-scope. %%

### Constraint Expressiveness
\label{sec:expressiveness}

%% @TODO: E4/E5 — Constraint expressiveness method and results. 1 paragraph methodology: constraints collected from W3C VCDM 2.0, eIDAS ARF, community specs, classified as expressible/partial/no. Table: ID × constraint × source × expressible × predicate. Feature ARF-C1 (dual format mandate), ARF-C4 (proximity→mdoc), ARF-C7 (encoding-independent attributes). Plus paper-internal C1–C3 (structural), C5–C7 (governance). 1 paragraph on partially expressible ARF constraints as scope boundaries. Data source: archive/arf_5_3_4_gap_analysis.md. [Binding Claim #6 — HIGH RISK]. Length: 2 paragraphs + table. %%

%% @CITE: W3C VCDM 2.0 — normative requirements %%
%% @CITE: eIDAS 2.0 implementing regulation %%
%% @CITE: EU Architecture Reference Framework (ARF) v2.7.3 %%

| ID | Constraint | Source | Expressible | Predicate / Mechanism |
|----|-----------|--------|-------------|----------------------|
| | | | | |

%% @FIGURE: fig_expressiveness_table | Constraint expressiveness table: ID × constraint × source × expressible × predicate. %%

%% @TODO: E7 — State expressiveness limitations. Runtime behavioral constraints (revocation timing), policy-level access control, holder-binding protocols, issuance workflow constraints fall outside the constraint language. Briefly note partially expressible ARF constraints (C2, C3, C5, C6, C8) as scope boundaries — attestation qualification hierarchy, per-claim SD annotation, SD mechanism distinction are metamodel scope choices, not fundamental limitations. Length: 1 paragraph. %%

### Headline Results
\label{sec:headlines}

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

*Remark.* An issuer-precomputed boolean claim ($\text{income\_above\_threshold}: \text{true}$) can approximate a predicate proof within SD-JWT-VC. However, this workaround requires the issuer to anticipate every verifier threshold at issuance time, produces combinatorial explosion for multi-threshold scenarios, and remains static — a credential issued with threshold $X$ cannot serve a verifier requiring threshold $Y$ without reissuance. As shown in Section~\ref{sec:cross-layer}, this workaround restructures the domain concept layer — itself a cross-layer propagation that confirms the need for multi-layer analysis.

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
\label{sec:anti-patterns}

%% @TODO: E8 — Anti-pattern catalog. Table (4–5 rows): anti-pattern name, description, error predicate, layer(s) spanned, detected by Refinery? Candidates: bad_trace (trace maps subject to value), noSubject/root_ent_doesnt_have_cred (credential without subject), no_cred_props_for_cred_entity (orphaned credential entity), non_connected (disconnected DCL graph), common_parent (unintended credential overlap). [Binding Claim #7]. Length: 1 paragraph + table. %%

%% @FIGURE: fig_antipattern_table | Anti-pattern table: name × description × error predicate × layer(s) × detected? %%

%% @TODO: E9 — Detection results per anti-pattern. Construct error variants of housing subsidy example. For each anti-pattern, show Refinery error predicate firing. State which layer the error manifests in and whether single-layer inspection would catch it. Length: 1 paragraph. %%

%% @TODO: E10 — Multi-layer visibility demonstration. Construct specific bad_trace example: DCL valid (connected, well-formed), CSL valid (all credentials have subjects, all claims have source/target), but CredentialSubject traces to Value instead of Subject. Layer-by-layer passes, cross-layer trace consistency fails. Core argument for why multi-level modeling is necessary. [Binding Claim #9]. Length: 1 paragraph. %%

### Baseline Comparison
\label{sec:baseline}

%% @TODO: E11 — Baseline comparison. Short comparison (2–3 sentences) of Refinery-based approach vs. one baseline (OCL on Ecore, Alloy, or manual spreadsheet review). Compare on expressiveness or automation. Acknowledge Refinery limitations (learning curve, tool maturity). Addresses Reviewer D "tool dependency" attack. Length: 2–3 sentences. %%

## Scalability Measurement
\label{sec:scalability}

%% @TODO: S0 — State measurement objective: quantify how the approach scales with model size. Fixed structure: RQs → domains → setup → results → analysis. Length: 1–2 sentences. %%

### Research Questions
\label{sec:scalability-rqs}

%% @TODO: S1 — State research questions. RQ1: "How does constraint validation runtime scale with model size (number of entities and constraints)?" RQ2: "How does design space exploration (model generation) runtime scale with model size?" Consider whether a third RQ on error identification time or memory usage adds value. Length: 2–3 sentences. %%

### Selected Domains
\label{sec:scalability-domains}

%% @TODO: S2 — Define 2–5 model instances of increasing size for scalability measurement. Based on CSOK variants: (1) 1-credential minimal, (2) 3-credential CSOK as-is, (3) 5-credential extended, (4) 10-credential synthetic. Each additional credential adds ~N entities, ~M trace links, ~K governance annotations. Create instances in models/. Length: 1 paragraph. %%

### Measurement Setup
\label{sec:scalability-setup}

%% @CITE: <<NOUR_CITE>> — Nour's ECMFA paper for measurement methodology inspiration. Martin to provide reference. %%

%% @TODO: S3 — Measurement environment and methodology. Refinery version, JVM version, hardware spec (CPU, RAM). Repetitions, warm-up runs. Metrics: validation time (ms), model generation time (ms), memory usage (MB). Cite Nour's ECMFA paper for methodology. Include reproducibility information. Length: 1 paragraph. %%

### Measurement Results
\label{sec:scalability-results}

%% @FIGURE: fig_scalability_validation | Validation runtime vs. model size (number of entities/constraints). X-axis: model size. Y-axis: time (ms). Lines for consistency check, error identification. figure* (full-width). %%

%% @FIGURE: fig_scalability_generation | Generation runtime vs. model size. X-axis: model size. Y-axis: time (ms). Line for design space exploration. figure* (full-width). %%

%% @TODO: Run scalability measurements in Refinery and populate figures. %%
%% @TODO: Placeholder — additional result figures if new metrics are added. %%

### Analysis of Results
\label{sec:scalability-analysis}

%% @TODO: S4 — Answer each RQ based on measurement data. Draw conclusions about practical applicability. State limitations (single tool, synthetic scaling, no comparison with industrial-scale ecosystems). Length: 1–2 paragraphs. %%

## Threats to Validity
\label{sec:threats}

### Internal Validity
\label{sec:threats-internal}

%% @TODO: T1 — Internal validity threats. (1) Constraint selection bias: chosen to demonstrate capabilities, not randomly sampled. Mitigation: normative sources. (2) Running example constructed to exhibit both conflict types. Mitigation: independently documented. Length: 1 paragraph. %%

### External Validity
\label{sec:threats-external}

%% @TODO: T2 — External validity threats. (1) Single domain (Hungarian housing subsidy). Mitigation: metamodel defined generically. (2) EU regulatory focus (eIDAS/ARF). Other frameworks (NIST, ISO) may differ. Length: 1 paragraph. %%

### Construct Validity
\label{sec:threats-construct}

%% @TODO: T3 — Construct validity threats. (1) Metamodel scope excludes proof mechanisms, presentations, status/revocation — deliberate but limits expressible constraints. (2) ARF constraints ARF-C2, ARF-C3, ARF-C5, ARF-C6, ARF-C8 partially expressible — metamodel scope choices, not fundamental limitations. (3) "Partially expressible" is a judgment call. Length: 1 paragraph. %%

### Conclusion Validity
\label{sec:threats-conclusion}

%% @TODO: T4 — Conclusion validity threats. (1) Scalability measured on synthetic instances — representative of ecosystem growth but not richer governance complexity. (2) Tool-specific results: Refinery performance may not generalize. Contribution is the metamodel, not the tool. Length: 1 paragraph. %%
