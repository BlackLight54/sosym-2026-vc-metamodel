%% @META: Section: Approach %%
%% @META: Budget: 3.0 pages (~16 paragraphs, 4 subsections) %%
%% @META: Goal: Present the three-layer metamodel and cross-layer constraint formalization. This is the core contribution. %%
%% @META: Dependencies: Section 02 (Refinery concepts, multi-level modeling), Section 03 (running example). %%
%% @META: Source: prior_work/dse-vc-refinery/vc_model.new.problem (newer Refinery model). Internal naming uses CIM/PIM/PSM — translate to claim property / credential schema / format-specific layer names. %%

# Approach

%% @SCAFFOLD: Preamble — 1-2 sentences introducing the three-layer structure before diving into subsections. %%
%% @SCAFFOLD: Job: Orient the reader. Name the three layers and their roles. Reference multi-level modeling from Section 2.2. %%

%% @TODO: Draft preamble — introduce the three-layer metamodel structure. Each layer captures a different abstraction level of credential ecosystem design. Cross-layer constraints formalized as Refinery graph predicates. %%

## Claim Property Layer

%% @SCAFFOLD: A1 — Metamodel definition %%
%% @SCAFFOLD: Job: Define the claim property layer metaclasses and their relationships. %%
%% @SCAFFOLD: Key content: Entity (abstract, with Subject and Value subclasses), Prop (property connecting entities), statement predicate (subject, property, value). Root inference: an Entity with no incoming value references is a Subject. %%
%% @SCAFFOLD: Refinery source: Entity, Subject, Value, Prop, statement/3, root_is_subj propagation rule. %%

%% @FORMAL: Definition of claim property layer metaclasses: Entity, Subject, Value, Prop. Statement predicate: statement(subject, property, value). %%
%% @FIGURE: fig_metamodel | Three-layer metamodel class diagram. Show all three layers with metaclasses, relationships, and trace mappings. This is the paper's central figure. %%

%% @TODO: Draft — Entity hierarchy (Subject, Value), Prop with value containment, statement predicate. Formal definition. %%

%% @SCAFFOLD: A2 — Intra-layer constraints %%
%% @SCAFFOLD: Job: Define the constraints that apply within the claim property layer. %%
%% @SCAFFOLD: Key content: Connectivity (non_connected error — all entities must be reachable), no self-loops (no_self_loop propagation rule), statement well-formedness (subject ≠ value). %%
%% @SCAFFOLD: Refinery source: error non_connected/2, propagation rule no_self_loop, statement predicate body. %%

%% @FORMAL: Claim property layer constraints: connectivity, no self-loops, statement well-formedness. %%

%% @TODO: Draft — error predicates and propagation rules for claim layer. Include Refinery code listing. %%

%% @SCAFFOLD: A3 — Running example at claim property layer %%
%% @SCAFFOLD: Job: Instantiate the housing subsidy example at this layer. %%
%% @SCAFFOLD: Key content: Applicant (Subject) with three Props. Connected graph. Cross-property domain constraint. Satisfies all claim-layer constraints. %%

In the housing subsidy scenario, the claim property layer contains:

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

%% @FIGURE: fig_metamodel | Three-layer metamodel class diagram. Show all three layers with metaclasses, relationships, and trace mappings. This is the paper's central figure. %%

## Credential Schema Layer

%% @SCAFFOLD: A4 — Metamodel definition %%
%% @SCAFFOLD: Job: Define the credential schema layer metaclasses and trace mappings from the claim property layer. %%
%% @SCAFFOLD: Key content: CredEntity (abstract, with CredentialSubject and CredentialValue subclasses), Claim (with source and target CredEntity references), Credential (contained by CredentialSubject). Trace: CredEntity::trace → Entity, Prop::trace → Claim. %%
%% @SCAFFOLD: Refinery source: CredEntity, CredentialSubject, CredentialValue, Claim, Credential, trace references. %%

%% @FORMAL: Definition of credential schema layer metaclasses: CredEntity, CredentialSubject, CredentialValue, Claim, Credential. Trace mappings: CredEntity::trace → Entity, Prop::trace → Claim. %%

%% @TODO: Draft — credential layer metaclasses. The trace mapping is the central mechanism for cross-layer consistency. Formal definition. %%

%% @SCAFFOLD: A5 — Trace mappings claim→credential %%
%% @SCAFFOLD: Job: Explain how trace relationships connect the two layers. %%
%% @SCAFFOLD: Key content: Every CredEntity traces to exactly one Entity. Every Claim traces from exactly one Prop. The trace is a refinement mapping: credential-layer elements are grounded in claim-layer facts. Subject inference: a CredEntity tracing to a Subject becomes a CredentialSubject (subject_traces_to_subject propagation rule). %%
%% @SCAFFOLD: Refinery source: subject_traces_to_subject, root_is_cred_subj propagation rules. %%

%% @TODO: Draft — trace mappings as refinement. Subject inference. Propagation rules. %%

%% @SCAFFOLD: A6 — Intra-layer constraints %%
%% @SCAFFOLD: Job: Define credential schema layer constraints. %%
%% @SCAFFOLD: Key content: credential_statement well-formedness (source ≠ target, proper containment), no_empty_cred (CredentialSubject must have at least one outgoing Claim), Root_cred_entity (entities not targeted by any Claim are roots — must have a Credential). %%
%% @SCAFFOLD: Refinery source: credential_statement/3, no_empty_cred error, Root_cred_entity pred, root_ent_doesnt_have_cred error. %%

%% @FORMAL: Credential schema layer constraints: credential_statement, no_empty_cred, Root_cred_entity. %%

%% @TODO: Draft — credential layer constraints. Include Refinery code listing. %%

%% @SCAFFOLD: A7 — Running example at credential schema layer %%
%% @SCAFFOLD: Job: Instantiate the housing subsidy example at this layer. Show three credentials with trace mappings and entity alignment. %%

In the housing subsidy scenario, three credentials partition the claim-layer facts:

| Credential | CredentialSubject | Claim | CredentialValue | Issuer (informal) |
|---|---|---|---|---|
| FamilyStatusCred | $\text{CS\_Applicant}_1$ | $\text{has\_children}_1$ | $\text{num\_children}_1$ | Civil registry |
| PropertyCred | $\text{CS\_Applicant}_2$ | $\text{owns\_property}_1$ | $\text{property\_area}_1$ | Land registry |
| IncomeCred | $\text{CS\_Applicant}_3$ | $\text{earns}_1$ | $\text{monthly\_income}_1$ | Employer |

All three credential subjects trace to the same claim-layer entity: $\text{trace}(\text{CS\_Applicant}_i) = \text{Applicant}$ for $i \in \{1,2,3\}$. Each claim traces to its corresponding property, and each credential value traces to its corresponding value. Entity alignment holds pairwise: $\text{aligned}(\text{CS\_Applicant}_i, \text{CS\_Applicant}_j)$ for all $i \neq j$. The cross-property domain constraint — minimum floor area as a function of the number of children — now spans two credentials, requiring the verifier to combine claims from FamilyStatusCred and PropertyCred.

## Format-Specific Layer

%% @SCAFFOLD: A8 — Metamodel definition %%
%% @SCAFFOLD: Job: Define the format-specific layer metaclasses. %%
%% @SCAFFOLD: Key content: Formatted_Credential (abstract), AnoncredsCredentialSchema, JsonLdCredentialSchema, JwtVCCredentialSchema. Each Credential contains one instance of each format. %%
%% @SCAFFOLD: Note: This layer is less mature than the other two. Acknowledge this. %%
%% @SCAFFOLD: Refinery source: Formatted_Credential hierarchy, containment in Credential. %%

%% @FORMAL: Definition of format-specific layer metaclasses: Formatted_Credential hierarchy. %%

%% @TODO: Draft — format-specific metaclasses. Each credential has format-specific representations. %%

%% @SCAFFOLD: A9 — Format-specific constraints %%
%% @SCAFFOLD: Job: Define constraints specific to credential formats. %%
%% @SCAFFOLD: Key content: Surface Martin's FCA results here. Potential constraints: AnonCreds requires single credential definition per schema, JSON-LD requires @context URI, format capabilities (ZKP support, selective disclosure, linked data). %%
%% @SCAFFOLD: Note: This is where the housing subsidy example is primary — format choice constrains privacy capabilities. %%

%% @FORMAL: Format-specific constraints (derive from FCA) %%
%% @TODO: IMPORTANT — Surface Martin's formal concept analysis results here. At least 2-3 constraints derived from FCA to strengthen the three-layer claim. %%

%% @TODO: Draft — format-specific constraints. Housing subsidy example: SD-JWT-VC vs. AnonCreds ZKP capability. %%

%% @SCAFFOLD: A10 — Running example at format-specific layer %%
%% @SCAFFOLD: Job: Show format assignments for the housing subsidy credentials and the governance conflict site. %%

In the housing subsidy scenario, format assignments are governance-driven:

| Credential | Format | Governance source | Status |
|---|---|---|---|
| FamilyStatusCred | SD-JWT-VC | eIDAS ARF (SHALL) | Valid |
| PropertyCred | SD-JWT-VC | eIDAS ARF (SHALL) | Valid |
| IncomeCred | ? | eIDAS + GDPR | **Conflict** |

FamilyStatusCred and PropertyCred are straightforward: as EU wallet attestations, the eIDAS Architecture Reference Framework mandates SD-JWT-VC (or mdoc; since both lack predicate proof support, we use SD-JWT-VC without loss of generality %% @CITE: eIDAS ARF — dual format mandate %%). IncomeCred is the conflict site: eIDAS requires SD-JWT-VC, but the income threshold check — verifying $\text{monthly\_income} \geq \text{threshold}$ without disclosing the exact value — requires predicate proof capability that SD-JWT-VC does not provide %% @CITE: SD-JWT-VC — hash-based selective disclosure, no predicate proofs %%. AnonCreds supports predicate proofs via CL signatures %% @CITE: AnonCreds specification %% but does not conform to W3C VCDM 2.0 %% @CITE: W3C VCDM 2.0 — AnonCreds v1 non-conformance %%.

## Cross-Layer Constraints as Graph Predicates

%% @SCAFFOLD: A11 — Constraint taxonomy %%
%% @SCAFFOLD: Job: Classify constraints by source and scope, instantiated with CSOK. %%

The following table classifies the constraints exercised in the housing subsidy scenario by source and scope:

| # | Constraint | Source | Layers | CSOK instance |
|---|---|---|---|---|
| C1 | Entity alignment | Structural | CPL$\leftrightarrow$CSL | $\text{CS\_Applicant}_{1,2,3}$ trace to same Applicant |
| C2 | Trace consistency | Structural | CPL$\rightarrow$CSL | Each Claim traces to exactly one Prop |
| C3 | No empty credential | Structural | CSL | Each CredentialSubject has $\geq 1$ outgoing Claim |
| C4 | Cross-credential value dep. | Domain rule | CPL horiz. | $\text{property\_area} \geq f(\text{num\_children})$ |
| C5 | Format mandate | eIDAS ARF | FSL | EU wallet attestations require SD-JWT-VC |
| C6 | Predicate proof required | GDPR Art. 5(1)(c) | CPL$\leftrightarrow$FSL | Income threshold check $\rightarrow$ predicate proof |
| C7 | VCDM conformance | W3C VCDM 2.0 | CSL$\leftrightarrow$FSL | Format must conform to VCDM data model |
| C8 | **Governance conflict** | eIDAS+GDPR+W3C | FSL | C5$\wedge$C6$\wedge$C7 unsatisfiable on IncomeCred |
| C9 | Cross-credential predicate gap | Format limitation | CPL$\leftrightarrow$FSL | C4 requires cross-credential arithmetic; no deployed format supports it |

%% @FIGURE: fig_constraint_taxonomy | The table above, formatted as a figure with caption. %%

Constraints C1–C3 are structural (metamodel-enforced). C4 is a domain rule grounded in government regulation. C5–C7 each originate from a different governance framework. C8 and C9 are cross-layer results: they emerge only when constraints from multiple sources and layers are checked jointly. Section 5.3 develops C8 and C9 as the paper's headline results.

%% @SCAFFOLD: A12 — Trace consistency constraints %%
%% @SCAFFOLD: Job: Define the core cross-layer constraint: trace consistency between claim and credential layers. %%
%% @SCAFFOLD: Key content: prop_source and prop_target propagation rules — a Claim's source/target CredEntity must trace to the same Entity that owns/is the value of the traced Prop. If the trace is inconsistent, the propagation rule eliminates the invalid assignment. %%
%% @SCAFFOLD: Refinery source: prop_s, prop_t propagation rules in vc_model.new.problem. %%

%% @FORMAL: Trace consistency predicates: prop_source, prop_target propagation rules. %%

%% @TODO: Draft — trace consistency. The key insight: propagation rules in Refinery don't just check — they guide the model generator to maintain consistency. Include Refinery code listing. %%

%% @SCAFFOLD: A13 — Entity alignment constraints %%
%% @SCAFFOLD: Job: Define the entity alignment predicate. %%
%% @SCAFFOLD: Key content: aligned_entities(e1, e2) holds when two CredEntities trace to the same Entity. This is the formalization of cross-credential subject binding. The aligned predicate is a shadow predicate — it records derived information without constraining. %%
%% @SCAFFOLD: Refinery source: aligned/2 in vc_model.new.problem, aligned_entites/2 in vc_model.problem. %%

%% @FORMAL: Entity alignment predicate: aligned_entities(e1, e2). %%

%% @TODO: Draft — entity alignment. Shadow predicate. Cross-credential subject binding. Housing subsidy: CS_Applicant₁ and CS_Applicant₂ are aligned. %%

%% @SCAFFOLD: A14 — Structural anti-pattern constraints %%
%% @SCAFFOLD: Job: Define error predicates that catch specific design anti-patterns. %%
%% @SCAFFOLD: Key content: noSubject (credential without a subject), no_source_or_target / no_cred_props_for_cred_entity (credential entity not participating in any claim), non_connected (disconnected information graph), multiple_creds_point_to_same_fact_set / common_parent (two properties sharing a credential subject unexpectedly). %%
%% @SCAFFOLD: Refinery source: error predicates in both vc_model.problem and vc_model.new.problem. %%

%% @FORMAL: Anti-pattern error predicates: noSubject, no_cred_props_for_cred_entity, root_ent_doesnt_have_cred, non_connected, common_parent. %%

%% @TODO: Draft — anti-pattern catalog. Each predicate catches a specific design error. Brief description + Refinery code. %%

%% @SCAFFOLD: A15 — Propagation rules for cross-layer alignment %%
%% @SCAFFOLD: Job: Show how propagation rules actively guide model generation, not just validate. %%
%% @SCAFFOLD: Key content: pim_and_cim_should_align (commented out in new model but present in old), tracing_cim_to_pim (infers trace mappings from known credential statements). These rules demonstrate that the constraint formalization is generative, not just checking. %%
%% @SCAFFOLD: Note: Some propagation rules are commented out in vc_model.new.problem. Discuss which are active and why. %%

%% @TODO: Draft — propagation rules for cross-layer alignment. Distinguish error predicates (checking) from propagation rules (guiding generation). This is a key Refinery mechanism. %%

%% @SCAFFOLD: A16 — Running example: full constraint application %%
%% @SCAFFOLD: Job: Apply the complete constraint set to the housing subsidy example. Show what the model generator produces. %%
%% @SCAFFOLD: Key content: Housing subsidy example — apply all constraints, show which propagation rules fire, show the generated model. Show the cross-layer constraint violation when SD-JWT-VC is chosen but predicate proof is required. %%

%% @FIGURE: fig_generated_model | (Optional) Refinery-generated model instance for the housing subsidy example showing constraint satisfaction. %%

%% @TODO: Draft — full constraint application. Housing subsidy example. Generated model output. %%

%% @SCAFFOLD: A17 — Format-driven CPL restructuring — worked example of cross-layer propagation %%
%% @SCAFFOLD: Job: Show concretely how FSL limitations propagate upward to CPL, changing the claim structure. %%
%% @SCAFFOLD: Key content: AnonCreds encodes monthly_income as integer, predicate proof works directly. SD-JWT-VC forces boolean restructuring (income_above_X claims). This is a cross-layer constraint propagation. %%
%% @SCAFFOLD: Placement: Sec 04.4 worked example (per DECISIONS.md). %%

The income threshold check illustrates how format-specific limitations propagate upward through the metamodel. With AnonCreds (CL signatures), the issuer encodes $\text{monthly\_income}$ as an integer attribute; at verification time, the holder proves $\text{monthly\_income} \geq \text{threshold}$ via a predicate proof without disclosing the exact value %% @CITE: AnonCreds specification — predicate proofs %% — the claim property layer structure is unchanged. With SD-JWT-VC, no predicate proof mechanism exists %% @CITE: SD-JWT-VC — hash-based selective disclosure only %%. The only workaround is for the issuer to pre-compute boolean claims at issuance: $\text{earns\_above\_200k} \mapsto \text{true}$, $\text{earns\_above\_300k} \mapsto \text{true}$, and so on. This restructures the claim property layer: the single Prop $\text{earns} \to \text{monthly\_income}$ (integer) is replaced by multiple Props $\text{earns\_above\_X} \to \text{boolean}$ for each anticipated threshold. The format-specific limitation has forced a change in the domain-level information model — a cross-layer constraint propagation that is visible only when both layers are analyzed together.

%% @TODO: Polish — this paragraph may need tightening for page budget. The key point is that FSL limitations change CPL structure, which is exactly what the metamodel detects. %%
