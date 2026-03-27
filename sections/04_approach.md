%% @META: Section: Approach %%
%% @META: Budget: 3.0 pages (~16 paragraphs, 4 subsections) %%
%% @META: Goal: Present the three-layer metamodel and cross-layer constraint formalization. This is the core contribution. %%
%% @META: Dependencies: Section 02 (Refinery concepts, multi-level modeling), Section 03 (running example). %%
%% @META: Source: models/vc_metamodel.refinery. Layers: DCL / CSL / FSL. %%

# Approach
\label{sec:approach}

%% @TODO: Preamble — Orient the reader. Name the three layers (domain concept, credential schema, format-specific) and their roles. Cross-layer constraints formalized as Refinery graph predicates. Forward-reference three usage modes from Section 3.2 (consistency checking, error identification, design space exploration). Reference multi-level modeling from Section 2.2. [Binding Claims #1, #3]. Length: 2–3 sentences. %%

## Domain Concept Layer
\label{sec:dcl}

%% @FORMAL: Definition of domain concept layer metaclasses: Entity, Subject, Value, Prop. Statement predicate: statement(subject, property, value). %%
%% @FIGURE: fig_metamodel | Three-layer metamodel class diagram. Show all three layers with metaclasses, relationships, and trace mappings. This is the paper's central figure. %%

%% @TODO: A1 — Define domain concept layer metaclasses and relationships. Entity (abstract, with Subject and Value subclasses), Prop (source→Entity, target→Entity, value containment), statement(subject, property, value) predicate. Root inference: Entity with no incoming target is Subject. Include Refinery class declaration listing. Formal definition. [Binding Claim #1]. Length: 1 paragraph. %%

%% @FORMAL: Domain Concept Layer constraints: connectivity, no self-loops, statement well-formedness. %%

%% @TODO: A2 — Define intra-layer constraints for DCL. error non_connected(e1, e2), propagation rule no_self_loop, statement well-formedness (subject ≠ value). Include 1 Refinery code listing showing error predicate syntax. After drafting, add mode annotation: DCL constraints are targets for error identification — NOT_OK(non_connected(e1, e2)). [Binding Claim #3]. Length: 1 paragraph. %%

%% @SCAFFOLD: A3 — Running example at domain concept layer %%
%% @SCAFFOLD: Job: Instantiate the housing subsidy example at this layer. %%
%% @SCAFFOLD: Key content: Applicant (Subject) with three Props. Connected graph. Cross-property domain constraint. Satisfies all claim-layer constraints. %%

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

%% @FORMAL: Definition of credential schema layer metaclasses: CredEntity, CredentialSubject, CredentialValue, Claim, Credential. Trace mappings: CredEntity::trace → Entity, Prop::trace → Claim. %%

%% @TODO: A4 — Define credential schema layer metaclasses and trace mappings from DCL. CredEntity (abstract), CredentialSubject/CredentialValue subclasses, Claim (source→CredEntity, target→CredEntity), Credential (contained by CredentialSubject). Trace: CredEntity::trace→Entity, Prop::trace→Claim. Central mechanism: trace mapping grounds credential-layer elements in DCL facts. Formal definition. [Binding Claim #1]. Length: 1 paragraph. %%

%% @TODO: A5 — Explain trace relationships connecting DCL and CSL. Every CredEntity traces to exactly one Entity. Subject inference: CredEntity tracing to Subject becomes CredentialSubject (subject_traces_to_subject propagation rule). root_is_cred_subj propagation rule. Include Refinery propagation rule listing. Length: 1 paragraph. %%

%% @FORMAL: Credential schema layer constraints: credential_statement, no_empty_cred, Root_cred_entity. %%

%% @TODO: A6 — Define credential schema layer constraints. credential_statement/3 well-formedness (source ≠ target, proper containment), no_empty_cred error (CredentialSubject must have ≥1 outgoing Claim), Root_cred_entity predicate, root_ent_doesnt_have_cred error. Include 1 Refinery listing. After drafting, add mode annotation: error identification catches structural violations at this layer. [Binding Claim #3]. Length: 1 paragraph. %%

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
\label{sec:fsl}

%% @FORMAL: Definition of format-specific layer metaclasses: Formatted_Credential hierarchy. %%

%% @TODO: A8 — Define format-specific layer metaclasses. Formatted_Credential (abstract), concrete subclasses: AnoncredsCredentialSchema, JsonLdCredentialSchema, SdJwtVcCredentialSchema, MdocCredentialSchema. Each Credential contains one Formatted_Credential. Acknowledge this layer is less mature than DCL/CSL. [Binding Claim #1]. Length: 1 paragraph (brief). %%

%% @FORMAL: Format-specific constraints (derive from FCA) %%

%% @TODO: A9 — Define format-specific constraints derived from FCA results. AnonCreds requires single credential definition per schema, JSON-LD requires @context URI. Format capabilities: ZKP support, selective disclosure, linked data. Surface at least 2–3 FCA-derived constraints. Housing subsidy: SD-JWT-VC vs. AnonCreds ZKP capability. After drafting, add mode annotation: governance annotations at this layer are primary input for error identification and design space exploration. Length: 1–2 paragraphs. %%

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
\label{sec:cross-layer}

%% @SCAFFOLD: A11 — Constraint taxonomy %%
%% @SCAFFOLD: Job: Classify constraints by source and scope, instantiated with CSOK. %%

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

Constraints C1–C3 are structural (metamodel-enforced). C4 is a domain rule grounded in government regulation. C5–C7 each originate from a different governance framework. C8 and C9 are cross-layer results: they emerge only when constraints from multiple sources and layers are checked jointly. Section~\ref{sec:headlines} develops C8 and C9 as the paper's headline results.

The housing subsidy scenario demonstrates all three usage modes (Section~\ref{sec:functional-overview}) on the cross-layer constraint set. Running consistency checking on the partial specification — FamilyStatusCred and PropertyCred assigned to SD-JWT-VC, IncomeCred unassigned — returns **OK**: structural constraints C1–C3 and domain constraint C4 hold in the partial model. Assigning IncomeCred to SD-JWT-VC and enforcing all governance constraints triggers error identification: the framework returns **NOT_OK(governance_conflict(IncomeCred, income_format))**, naming the credential and format slot where C5, C6, and C7 cannot be simultaneously satisfied. Finally, leaving IncomeCred's format open and running design space exploration with the full constraint set ($\text{C5} \wedge \text{C6} \wedge \text{C7}$) returns **UNVIABLE** — no format assignment satisfies all three governance sources simultaneously. Relaxing C6 (dropping the predicate proof requirement), the framework returns two **GENERATED** configurations: both assign SD-JWT-VC to all three credentials, differing in selective disclosure granularity.

%% @FORMAL: Trace consistency predicates: prop_source, prop_target propagation rules. %%

%% @TODO: A12 — Define trace consistency between claim and credential layers. prop_source and prop_target propagation rules: a Claim's source/target CredEntity must trace to the same Entity that owns/is the value of the traced Prop. Key insight: propagation rules guide generation, not just validate. Include Refinery code listing. [Binding Claim #3]. Length: 1 paragraph. %%

%% @FORMAL: Entity alignment predicate: aligned_entities(e1, e2). %%

%% @TODO: A13 — Define entity alignment predicate. aligned_entities(e1, e2) shadow predicate: holds when two CredEntities trace to the same Entity. Formalizes cross-credential subject binding. CSOK: CS_Applicant₁ aligned with CS_Applicant₂ and CS_Applicant₃. Shadow predicates record derived info without constraining — key Refinery mechanism. [Binding Claim #3]. Length: 1 paragraph. %%

%% @FORMAL: Anti-pattern error predicates: noSubject, no_cred_props_for_cred_entity, root_ent_doesnt_have_cred, non_connected, common_parent. %%

%% @TODO: A14 — Define error predicates catching specific design anti-patterns. noSubject, no_source_or_target / no_cred_props_for_cred_entity, non_connected, common_parent. Brief description + Refinery code per predicate. Length: 1 paragraph. %%

%% @TODO: A15 — Show how propagation rules actively guide model generation, not just validate. Distinguish error predicates (checking) from propagation rules (guiding generation). pim_and_cim_should_align, tracing_cim_to_pim rules. Key Refinery mechanism. Discuss which rules are active and why. Length: 1 paragraph. %%

%% @FIGURE: fig_generated_model | (Optional) Refinery-generated model instance for the housing subsidy example showing constraint satisfaction. %%

%% @TODO: A16 — Apply complete constraint set to housing subsidy example. Show which propagation rules fire, generated model output. Cross-layer constraint violation when SD-JWT-VC chosen but predicate proof required. Length: 1 paragraph. %%

%% @SCAFFOLD: A17 — Format-driven DCL restructuring — worked example of cross-layer propagation %%
%% @SCAFFOLD: Job: Show concretely how FSL limitations propagate upward to DCL, changing the claim structure. %%
%% @SCAFFOLD: Key content: AnonCreds encodes monthly_income as integer, predicate proof works directly. SD-JWT-VC forces boolean restructuring (income_above_X claims). This is a cross-layer constraint propagation. %%
%% @SCAFFOLD: Placement: Sec 04.4 worked example (per DECISIONS.md). %%

The income threshold check illustrates how format-specific limitations propagate upward through the metamodel. With AnonCreds (CL signatures), the issuer encodes $\text{monthly\_income}$ as an integer attribute; at verification time, the holder proves $\text{monthly\_income} \geq \text{threshold}$ via a predicate proof without disclosing the exact value %% @CITE: AnonCreds specification — predicate proofs %% — the domain concept layer structure is unchanged. With SD-JWT-VC, no predicate proof mechanism exists %% @CITE: SD-JWT-VC — hash-based selective disclosure only %%. The only workaround is for the issuer to pre-compute boolean claims at issuance: $\text{earns\_above\_200k} \mapsto \text{true}$, $\text{earns\_above\_300k} \mapsto \text{true}$, and so on. This restructures the domain concept layer: the single Prop $\text{earns} \to \text{monthly\_income}$ (integer) is replaced by multiple Props $\text{earns\_above\_X} \to \text{boolean}$ for each anticipated threshold. The format-specific limitation has forced a change in the domain-level information model — a cross-layer constraint propagation that is visible only when both layers are analyzed together.

%% @TODO: Polish — this paragraph may need tightening for page budget. The key point is that FSL limitations change DCL structure, which is exactly what the metamodel detects. %%
