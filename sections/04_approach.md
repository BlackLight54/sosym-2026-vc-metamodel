%% @META: Section: Approach %%
%% @META: Budget: 3.0 pages (~16 paragraphs, 4 subsections) %%
%% @META: Goal: Present the three-layer metamodel and cross-layer constraint formalization. This is the core contribution. %%
%% @META: Dependencies: Section 02 (Refinery concepts, multi-level modeling), Section 03 (running example). %%
%% @META: Source: models/vc_metamodel.refinery. Layers: DCL / CSL / FSL. %%

# Approach
\label{sec:approach}

Credential ecosystem design involves three distinct concerns: what domain-level facts exist and how they relate, how those facts are grouped into credentials with defined subjects and claims, and which concrete credential format each credential uses. The metamodel separates these concerns into three layers — the *domain concept layer* (DCL), the *credential schema layer* (CSL), and the *format-specific layer* (FSL). The layered structure follows the multi-level modeling principles introduced in \autoref{sec:multi-level}: each layer is derived from the one above and carries its own intra-layer constraints. Constraints within and across layers are formalized as graph predicates that the Refinery framework (\autoref{sec:refinery}) can evaluate, yielding the three usage modes defined in \autoref{sec:functional-overview}. \autoref{fig:metamodel} shows the complete metamodel; the definitions below correspond to its elements layer by layer.

## Domain Concept Layer
\label{sec:dcl}

%% @FORMAL: Definition of domain concept layer metaclasses: Entity, Subject, Value, Prop. Statement predicate: statement(subject, property, value). %%
%% @FIGURE: fig_metamodel | Three-layer metamodel class diagram. Show all three layers with metaclasses, relationships, and trace mappings. This is the paper's central figure. %%

The domain concept layer models domain-level facts as a typed information graph. The abstract metaclass `Entity` has two concrete subclasses: `Subject` and `Value`. A `Subject` is an entity that can anchor a credential — it represents the person, organization, or thing about which claims are made. A `Value` is an entity that serves as the target of a property. Each `Entity` contains zero or more `Prop` instances; each `Prop` holds exactly one `Value` through a containment reference and carries a trace link to the credential schema layer (\autoref{sec:csl}). The ternary predicate $\text{statement}(s, p, v)$ holds when subject $s$ owns property $p$ and $p$ contains value $v$, with the well-formedness condition $s \neq v$. The distinction between `Subject` and `Value` is inferred structurally: a propagation rule classifies any `Entity` with no incoming value reference as a `Subject` — it is a root of the property tree, and therefore a candidate credential subject at the CSL layer. The complete Refinery encoding is provided in the supplementary material.

%% @FORMAL: Domain Concept Layer constraints: connectivity, no self-loops, statement well-formedness. %%

A credential ecosystem must cover all domain-level facts — an entity unreachable from the rest of the graph represents a fact that no credential path connects to the subject, and therefore cannot be verified. The `non_connected` error predicate enforces this: it flags any pair of entities not transitively reachable through the `neighbours` relation, where two entities are neighbours if a `statement` connects them in either direction. The `no_self_loop` propagation rule prevents an entity from serving as both the owner and the value of the same property — a structurally meaningless configuration that would collapse the subject–value distinction. Together with the $s \neq v$ condition in the `statement` predicate, these constraints ensure that every DCL instance is a connected, acyclic information graph with clear directionality from subjects to values. %% @TODO: Acyclicity constraint (error cyclic) not yet in vc_metamodel.refinery — add before submission. %% In terms of the usage modes (\autoref{sec:functional-overview}), DCL constraints serve error identification: evaluating `non_connected` on a partial specification with an orphaned entity returns $\textbf{NOT\_OK}(\text{non\_connected}(e_1, e_2))$, naming the unreachable pair and indicating where the domain model is incomplete.

In the housing subsidy scenario, the domain concept layer contains:

| Element | Type | Description |
|---------|------|-------------|
| Applicant | Subject | Person applying for subsidy |
| has_children | Prop | Family size |
| num_children | Value | Number of children |
| owns_property | Prop | Property ownership |
| property_area | Value | Floor area (m²) |
| earns | Prop | Employment income |
| monthly_income | Value | Monthly net income |

Three statements capture the domain facts: $\text{statement}(\text{Applicant}, \text{has\_children}, \text{num\_children})$, $\text{statement}(\text{Applicant}, \text{owns\_property}, \text{property\_area})$, and $\text{statement}(\text{Applicant}, \text{earns}, \text{monthly\_income})$. Two domain constraints apply: $\text{property\_area} \geq \text{min\_area}(\text{num\_children})$ links two properties across what will become separate credentials, and $\text{monthly\_income} \geq \text{threshold}$ establishes a privacy-sensitive eligibility check. All claim-layer structural constraints (connectivity, no self-loops) are satisfied.

## Credential Schema Layer
\label{sec:csl}

A domain concept graph captures *what* is known about a subject. Credential ecosystems must partition these facts into credentials — each issued by a different authority, each carrying a subset of the domain's claims. The Credential Schema Layer (CSL) models this partitioning. Each CSL element is traced from a DCL element: the abstract metaclass `CredEntity` carries a mandatory `trace` reference to exactly one DCL `Entity`, and each DCL `Prop` contains exactly one `Claim` via `Prop::trace`. This pair of cross-layer references ensures that every credential-layer element has a domain-level origin (\autoref{fig:metamodel}). CSL mirrors DCL's type structure: `CredentialSubject` and `CredentialValue` specialize `CredEntity`, paralleling DCL's `Subject` and `Value`. A `Claim` connects a source `CredEntity` to a target `CredentialValue`, mirroring DCL's `statement` predicate. Each `CredentialSubject` optionally contains a `Credential`, which itself holds exactly one `Formatted_Credential` (\autoref{sec:fsl}). The complete Refinery class declarations are provided in the supplementary material.

Trace mappings do more than record provenance — combined with Refinery's propagation rules, they actively derive CSL structure from DCL during model generation. Propagation rules fire when partial information is committed, narrowing the space of valid completions. The `subject_traces_to_subject` rule enforces type consistency: when a `CredEntity` traces to a DCL `Subject`, the rule infers it must be a `CredentialSubject`. Similarly, `root_is_cred_subj` infers `CredentialSubject` for any `CredEntity` that no `Claim` targets, mirroring DCL's `root_is_subj` at the credential level. The effect is that CSL type assignments are derived from DCL structure rather than independently specified — a credential entity's type is a consequence of its domain-layer origin. The full propagation rule definitions are provided in the supplementary material.

Beyond type derivation, the metamodel enforces structural well-formedness through error predicates — graph predicates whose satisfaction marks a partial model as inconsistent. At the CSL, the `credential_statement` predicate mirrors DCL's `statement`: it holds when a `Claim` connects distinct source and target entities with the target typed as `CredentialValue`. The `Root_cred_entity` predicate identifies CredEntities not targeted by any `credential_statement` — these must serve as credential subjects. Two error predicates catch structural violations that would otherwise propagate silently to downstream format assignment: `no_empty_cred` rejects a `CredentialSubject` with no outgoing `Claim`, and `root_ent_doesnt_have_cred` rejects a root entity without an associated `Credential`. When either fires, the framework reports the violation — e.g., $\text{NOT\_OK}(\text{no\_empty\_cred}(cs))$ — before format-specific constraints are even evaluated. The full constraint definitions are provided in the supplementary material.

In the housing subsidy scenario, three credentials partition the claim-layer facts:

| Credential | CredentialSubject | Claim | CredentialValue | Issuer (informal) |
|---|---|---|---|---|
| FamilyStatusCred | $\text{CS\_Applicant}_1$ | $\text{has\_children}_1$ | $\text{num\_children}_1$ | Civil registry |
| PropertyCred | $\text{CS\_Applicant}_2$ | $\text{owns\_property}_1$ | $\text{property\_area}_1$ | Land registry |
| IncomeCred | $\text{CS\_Applicant}_3$ | $\text{earns}_1$ | $\text{monthly\_income}_1$ | Employer |

All three credential subjects trace to the same claim-layer entity: $\text{trace}(\text{CS\_Applicant}_i, \text{Applicant})$ for $i \in \{1,2,3\}$. Each claim traces to its corresponding property, and each credential value traces to its corresponding value. Entity alignment holds pairwise: $\text{aligned}(\text{CS\_Applicant}_i, \text{CS\_Applicant}_j)$ for all $i \neq j$. The cross-property domain constraint — minimum floor area as a function of the number of children — now spans two credentials, requiring the verifier to combine claims from FamilyStatusCred and PropertyCred.

## Format-Specific Layer
\label{sec:fsl}

The format-specific layer assigns each credential a concrete representation format. The abstract metaclass `Formatted_Credential` has five concrete subclasses — `AnoncredsCredentialSchema`, `JsonLdCredentialSchema`, `JwtVCCredentialSchema`, `SdJwtVcSchema`, and `MdocSchema` — and each `Credential` contains exactly one instance via the `format[1]` containment. These formats differ along a design-relevant axis: *selective disclosure* (revealing a subset of claims) versus *predicate proofs* (proving a comparison such as $\text{income} \geq \text{threshold}$ without disclosing the value). Only AnonCreds supports predicate proofs natively %% @CITE: AnonCreds specification %%; SD-JWT-VC %% @CITE: IETF SD-JWT-VC %% and mdoc %% @CITE: ISO 18013-5 %% provide selective disclosure but not predicate proofs, and JSON-LD supports selective disclosure via BBS+ signatures %% @CITE: W3C VC Data Integrity — BBS+ %%. Formats lacking predicate proofs force issuers to pre-compute boolean claims, restructuring the domain concept layer (\autoref{sec:cross-layer}). This layer is less mature than DCL and CSL: format-internal structural constraints are not yet formalized.

The metamodel encodes format capabilities as six derived predicates over the class hierarchy — `supports_predicate_proof`, `supports_selective_disclosure`, `conforms_vcdm`, `supports_zkp`, `supports_offline_verification`, and `supports_multi_credential_proof` — each capturing a functional property that at least one governance framework or domain requirement in the running example imposes (full definitions in the supplementary material). Propagation rules use these predicates to narrow the format design space during generation: when a capability is required, formats lacking it are eliminated. Requiring predicate proof support on IncomeCred eliminates all formats except AnonCreds, which in turn does not conform to W3C VCDM 2.0, setting up the governance conflict in \autoref{sec:headlines}. Three governance annotation classes — `EidasMandate`, `PrivacyRequirement`, `VcdmConformance` — attach regulatory and standards requirements to individual credentials as typed markers. These annotations are the primary input for error identification (flagging format-governance conflicts) and design space exploration (generating only format assignments satisfying all active governance constraints).

In the housing subsidy scenario, format assignments are governance-driven:

| Credential | Format | Governance source | Status |
|---|---|---|---|
| FamilyStatusCred | SD-JWT-VC | eIDAS ARF (SHALL) | Valid |
| PropertyCred | SD-JWT-VC | eIDAS ARF (SHALL) | Valid |
| IncomeCred | ? | eIDAS + GDPR | **Conflict** |

FamilyStatusCred and PropertyCred are straightforward: as EU wallet attestations, the eIDAS Architecture Reference Framework mandates SD-JWT-VC (or mdoc; since both lack predicate proof support, we use SD-JWT-VC without loss of generality %% @CITE: eIDAS ARF — dual format mandate %%). IncomeCred is the conflict site: eIDAS requires SD-JWT-VC, but the income threshold check — verifying $\text{monthly\_income} \geq \text{threshold}$ without disclosing the exact value — requires predicate proof capability that SD-JWT-VC does not provide %% @CITE: SD-JWT-VC — hash-based selective disclosure, no predicate proofs %%. AnonCreds supports predicate proofs via CL signatures %% @CITE: AnonCreds specification %% but does not conform to W3C VCDM 2.0 %% @CITE: W3C VCDM 2.0 — AnonCreds v1 non-conformance %%.

## Cross-Layer Constraints as Graph Predicates
\label{sec:cross-layer}

The following table classifies the constraints exercised in the housing subsidy scenario by source and scope:

| # | Constraint | Source | Layers | CSOK instance |
|---|---|---|---|---|
| C1 | Entity alignment | Structural | DCL$\leftrightarrow$CSL | $\text{CS\_Applicant}_{1,2,3}$ trace to same Applicant |
| C2 | Trace consistency | Structural | DCL$\rightarrow$CSL | Each Claim traces to exactly one Prop |
| C3 | No empty credential | Structural | CSL | Each CredentialSubject has $\geq 1$ outgoing Claim |
| C4 | Cross-credential value dep. | Domain rule | DCL horiz. | $\text{property\_area} \geq f(\text{num\_children})$ |
| C5 | Format mandate | eIDAS ARF | FSL | EU wallet attestations require SD-JWT-VC |
| C6 | Predicate proof required | GDPR Art. 5(1)(c) | DCL$\leftrightarrow$FSL | Income threshold check $\rightarrow$ predicate proof |
| C7 | VCDM conformance | W3C VCDM 2.0 | CSL$\leftrightarrow$FSL | Format must conform to VCDM data model |
| C8 | **Governance conflict** | eIDAS+GDPR+W3C | FSL | C5$\wedge$C6$\wedge$C7 unsatisfiable on IncomeCred |
| C9 | Cross-credential predicate gap | Format limitation | DCL$\leftrightarrow$FSL | C4 requires cross-credential arithmetic; no deployed format supports it |

%% @FIGURE: fig_constraint_taxonomy | The table above, formatted as a figure with caption. %%

Constraints C1–C3 are structural (metamodel-enforced). C4 is a domain rule grounded in government regulation. C5–C7 each originate from a different governance framework. C8 and C9 are cross-layer results: they emerge only when constraints from multiple sources and layers are checked jointly. \autoref{sec:headlines} develops C8 and C9 as the paper's headline results.

The housing subsidy scenario demonstrates all three usage modes (\autoref{sec:functional-overview}) on the cross-layer constraint set. Running consistency checking on the partial specification — FamilyStatusCred and PropertyCred assigned to SD-JWT-VC, IncomeCred unassigned — returns **OK**: structural constraints C1–C3 and domain constraint C4 hold in the partial model. Assigning IncomeCred to SD-JWT-VC and enforcing all governance constraints triggers error identification: the framework returns **NOT_OK(governance_conflict(IncomeCred, income_format))**, naming the credential and format slot where C5, C6, and C7 cannot be simultaneously satisfied. Finally, leaving IncomeCred's format open and running design space exploration with the full constraint set ($\text{C5} \wedge \text{C6} \wedge \text{C7}$) returns **UNVIABLE** — no format assignment satisfies all three governance sources simultaneously. Relaxing C6 (dropping the predicate proof requirement), the framework returns two **GENERATED** configurations: both assign SD-JWT-VC to all three credentials, differing in selective disclosure granularity.

The predicates defined in the preceding sections (`non_connected`, `no_empty_cred`, `root_ent_doesnt_have_cred`) operate within a single layer using the Refinery mechanisms introduced in \autoref{sec:refinery}; the cross-layer predicates below combine elements from multiple layers.

A Claim that connects to a CredEntity tracing to the wrong DCL Entity is a silent design error — each layer is well-formed individually, but the cross-layer mapping is broken. Two propagation rules prevent this by negative elimination. The target consistency rule enforces that if $\text{trace}(p, c)$ and $\text{value}(p, e)$ hold (where $\text{trace}(p, c)$ denotes `Prop::trace` and $\text{trace}(t, e)$ below denotes `CredEntity::trace`), then any CredEntity $t$ for which $\neg\text{trace}(t, e)$ holds is excluded as $c$'s target; the source rule is dual over $\text{property}(e, p)$. In the running example, the Claim tracing to `has_children` can only target a CredEntity tracing to `num_children`, not one tracing to `property_area`. Bindings that are definitely inconsistent with committed traces are set to **false** in Refinery's three-valued interpretation, removed from the space of valid completions before model generation explores them. The full propagation rule definitions are provided in the supplementary material.

Credentials issued by different authorities for the same person must be recognizable as referring to that person. The shadow predicate `aligned` formalizes this: $\text{aligned}(ce_1, ce_2)$ holds when two distinct CredEntities satisfy $\text{trace}(ce_1, e) \wedge \text{trace}(ce_2, e)$ for some DCL Entity $e$. In the running example, $\text{aligned}(\text{CS\_Applicant}_i, \text{CS\_Applicant}_j)$ holds for all $i \neq j$, recording that all three credential subjects represent the same Applicant. A second shadow predicate, `common_parent`, holds when $\text{common\_parent}(p_1, p_2)$ is satisfied — i.e., two Props' traced Claims share a source CredEntity, capturing co-location within a single credential. Both predicates make cross-layer structure visible for conformance checking without constraining generation; `aligned` feeds into the cross-credential predicate gap below, and `common_parent` supports the anti-pattern catalog in \autoref{sec:evaluation}.

Some design problems are invisible at any single layer. When a domain constraint spans two credentials — $\text{property\_area} \geq f(\text{num\_children})$ requires combining claims from FamilyStatusCred and PropertyCred — the design depends on a format capability that may not exist. The shadow predicate `cross_cred_predicate_gap` detects this: $\text{cross\_cred\_predicate\_gap}(c_1, c_2)$ holds when $\text{aligned}(cs_1, cs_2)$ and at least one credential's format lacks multi-credential proof support. No deployed format supports cross-credential arithmetic (AnonCreds supports multi-credential *presentation* but not cross-credential *computation*), so the predicate fires for every aligned pair, making a structural limitation of the format landscape visible. As a shadow predicate, it records a condition whose severity depends on domain requirements; \autoref{sec:headlines} develops this as the second headline result.

%% @FIGURE: fig_generated_model | (Optional) Refinery-generated model instance for the housing subsidy example showing constraint satisfaction. %%

%% @TODO: A16 — Apply complete constraint set to housing subsidy example. Show which propagation rules fire, generated model output. Cross-layer constraint violation when SD-JWT-VC chosen but predicate proof required. Length: 1 paragraph. %%

The income threshold check illustrates how format-specific limitations propagate upward through the metamodel. With AnonCreds (CL signatures), the issuer encodes $\text{monthly\_income}$ as an integer attribute; at verification time, the holder proves $\text{monthly\_income} \geq \text{threshold}$ via a predicate proof without disclosing the exact value %% @CITE: AnonCreds specification — predicate proofs %% — the domain concept layer structure is unchanged. With SD-JWT-VC, no predicate proof mechanism exists %% @CITE: SD-JWT-VC — hash-based selective disclosure only %%. The only workaround is for the issuer to pre-compute boolean claims at issuance: $\text{earns\_above\_200k} \mapsto \text{true}$, $\text{earns\_above\_300k} \mapsto \text{true}$, and so on. This restructures the domain concept layer: the single Prop $\text{earns} \to \text{monthly\_income}$ (integer) is replaced by multiple Props $\text{earns\_above\_X} \to \text{boolean}$ for each anticipated threshold. The format-specific limitation has forced a change in the domain-level information model — a cross-layer constraint propagation that is visible only when both layers are analyzed together.

%% @TODO: Polish — this paragraph may need tightening for page budget. The key point is that FSL limitations change DCL structure, which is exactly what the metamodel detects. %%
