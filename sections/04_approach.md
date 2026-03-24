<!--
Section: Approach
Budget: 3.0 pages (~16 paragraphs, 4 subsections)
Goal: Present the three-layer metamodel and cross-layer constraint formalization. This is the core contribution.
Dependencies: Section 02 (Refinery concepts, multi-level modeling), Section 03 (running examples).
Source: prior_work/dse-vc-refinery/vc_model.new.problem (newer Refinery model). Internal naming uses CIM/PIM/PSM — translate to claim property / credential schema / format-specific layer names.
-->

# Approach

<!-- Preamble: 1-2 sentences introducing the three-layer structure before diving into subsections. -->
<!-- Job: Orient the reader. Name the three layers and their roles. Reference multi-level modeling from Section 2.2. -->

%% @TODO: Draft preamble — introduce the three-layer metamodel structure. Each layer captures a different abstraction level of credential ecosystem design. Cross-layer constraints formalized as Refinery graph predicates. %%

## Claim Property Layer

<!-- A1: Metamodel definition -->
<!-- Job: Define the claim property layer metaclasses and their relationships. -->
<!-- Key content: Entity (abstract, with Subject and Value subclasses), Prop (property connecting entities), statement predicate (subject, property, value). Root inference: an Entity with no incoming value references is a Subject. -->
<!-- Refinery source: Entity, Subject, Value, Prop, statement/3, root_is_subj propagation rule. -->

%% @FORMAL: Definition of claim property layer metaclasses: Entity, Subject, Value, Prop. Statement predicate: statement(subject, property, value). %%
%% @FIGURE: fig_metamodel | Three-layer metamodel class diagram. Show all three layers with metaclasses, relationships, and trace mappings. This is the paper's central figure. %%

%% @TODO: Draft — Entity hierarchy (Subject, Value), Prop with value containment, statement predicate. Formal definition. %%

<!-- A2: Intra-layer constraints -->
<!-- Job: Define the constraints that apply within the claim property layer. -->
<!-- Key content: Connectivity (non_connected error — all entities must be reachable), no self-loops (no_self_loop propagation rule), statement well-formedness (subject ≠ value). -->
<!-- Refinery source: error non_connected/2, propagation rule no_self_loop, statement predicate body. -->

%% @FORMAL: Claim property layer constraints: connectivity, no self-loops, statement well-formedness. %%

%% @TODO: Draft — error predicates and propagation rules for claim layer. Include Refinery code listing. %%

<!-- A3: Running example at claim property layer -->
<!-- Job: Instantiate the Alice example at this layer. -->
<!-- Key content: Alice (Subject) with two Props: owns_plot → plot_num_387 (Value), id_number → id_num_142536EE (Value). Connected graph. Satisfies all claim-layer constraints. -->

%% @TODO: Draft — Alice example at claim layer. 3 entities, 2 properties. All claim-layer constraints satisfied. %%

## Credential Schema Layer

<!-- A4: Metamodel definition -->
<!-- Job: Define the credential schema layer metaclasses and trace mappings from the claim property layer. -->
<!-- Key content: CredEntity (abstract, with CredentialSubject and CredentialValue subclasses), Claim (with source and target CredEntity references), Credential (contained by CredentialSubject). Trace: CredEntity::trace → Entity, Prop::trace → Claim. -->
<!-- Refinery source: CredEntity, CredentialSubject, CredentialValue, Claim, Credential, trace references. -->

%% @FORMAL: Definition of credential schema layer metaclasses: CredEntity, CredentialSubject, CredentialValue, Claim, Credential. Trace mappings: CredEntity::trace → Entity, Prop::trace → Claim. %%

%% @TODO: Draft — credential layer metaclasses. The trace mapping is the central mechanism for cross-layer consistency. Formal definition. %%

<!-- A5: Trace mappings claim→credential -->
<!-- Job: Explain how trace relationships connect the two layers. -->
<!-- Key content: Every CredEntity traces to exactly one Entity. Every Claim traces from exactly one Prop. The trace is a refinement mapping: credential-layer elements are grounded in claim-layer facts. Subject inference: a CredEntity tracing to a Subject becomes a CredentialSubject (subject_traces_to_subject propagation rule). -->
<!-- Refinery source: subject_traces_to_subject, root_is_cred_subj propagation rules. -->

%% @TODO: Draft — trace mappings as refinement. Subject inference. Propagation rules. %%

<!-- A6: Intra-layer constraints -->
<!-- Job: Define credential schema layer constraints. -->
<!-- Key content: credential_statement well-formedness (source ≠ target, proper containment), no_empty_cred (CredentialSubject must have at least one outgoing Claim), Root_cred_entity (entities not targeted by any Claim are roots — must have a Credential). -->
<!-- Refinery source: credential_statement/3, no_empty_cred error, Root_cred_entity pred, root_ent_doesnt_have_cred error. -->

%% @FORMAL: Credential schema layer constraints: credential_statement, no_empty_cred, Root_cred_entity. %%

%% @TODO: Draft — credential layer constraints. Include Refinery code listing. %%

<!-- A7: Running example at credential schema layer -->
<!-- Job: Instantiate the Alice example at this layer. Show the two credentials with trace mappings. -->
<!-- Key content: property_sheet (CredentialSubject a_Alice1 tracing to Alice, Claim a_owns_plot tracing from owns_plot, CredentialValue a_plot_num_387). id_card (CredentialSubject a_Alice2 tracing to Alice, Claim a_id_number, CredentialValue a_id_num_142536EE). Entity alignment: a_Alice1 and a_Alice2 both trace to Alice. -->

%% @TODO: Draft — Alice example at credential layer. Two credentials. Trace mappings. Entity alignment visible. %%

## Format-Specific Layer

<!-- A8: Metamodel definition -->
<!-- Job: Define the format-specific layer metaclasses. -->
<!-- Key content: Formatted_Credential (abstract), AnoncredsCredentialSchema, JsonLdCredentialSchema, JwtVCCredentialSchema. Each Credential contains one instance of each format. -->
<!-- Note: This layer is less mature than the other two. Acknowledge this. -->
<!-- Refinery source: Formatted_Credential hierarchy, containment in Credential. -->

%% @FORMAL: Definition of format-specific layer metaclasses: Formatted_Credential hierarchy. %%

%% @TODO: Draft — format-specific metaclasses. Each credential has format-specific representations. %%

<!-- A9: Format-specific constraints -->
<!-- Job: Define constraints specific to credential formats. -->
<!-- Key content: Surface Martin's FCA results here. Potential constraints: AnonCreds requires single credential definition per schema, JSON-LD requires @context URI, format capabilities (ZKP support, selective disclosure, linked data). -->
<!-- Note: This is where the Diploma example is primary — format choice constrains privacy capabilities. -->

%% @FORMAL: Format-specific constraints (derive from FCA) %%
%% @TODO: IMPORTANT — Surface Martin's formal concept analysis results here. At least 2-3 constraints derived from FCA to strengthen the three-layer claim. %%

%% @TODO: Draft — format-specific constraints. Diploma example: JSON-LD vs. AnonCreds ZKP capability. %%

<!-- A10: Running example at format-specific layer -->
<!-- Job: Show format selection for both running examples. -->
<!-- Key content: Alice — property_sheet as JSON-LD, id_card as AnonCreds (governance requires ZKP for identity). Diploma — demonstrate that JSON-LD choice violates ZKP requirement. -->

%% @TODO: Draft — format selection for Alice and Diploma examples. Show governance-driven format choice. %%

## Cross-Layer Constraints as Graph Predicates

<!-- A11: Constraint taxonomy -->
<!-- Job: Classify constraints by source and scope. Provide the reader a map before the details. -->
<!-- Key content: Sources: structural (metamodel), W3C specification, EU regulation, community guidelines. Scopes: intra-layer (within one layer), cross-layer (spanning two or more layers). Table or figure. -->

%% @FIGURE: fig_constraint_taxonomy | Table classifying constraints by source (structural, W3C, EU, community) × scope (intra-layer, cross-layer). %%

%% @TODO: Draft — constraint taxonomy. Table format preferred. %%

<!-- A12: Trace consistency constraints -->
<!-- Job: Define the core cross-layer constraint: trace consistency between claim and credential layers. -->
<!-- Key content: prop_source and prop_target propagation rules — a Claim's source/target CredEntity must trace to the same Entity that owns/is the value of the traced Prop. If the trace is inconsistent, the propagation rule eliminates the invalid assignment. -->
<!-- Refinery source: prop_s, prop_t propagation rules in vc_model.new.problem. -->

%% @FORMAL: Trace consistency predicates: prop_source, prop_target propagation rules. %%

%% @TODO: Draft — trace consistency. The key insight: propagation rules in Refinery don't just check — they guide the model generator to maintain consistency. Include Refinery code listing. %%

<!-- A13: Entity alignment constraints -->
<!-- Job: Define the entity alignment predicate. -->
<!-- Key content: aligned_entities(e1, e2) holds when two CredEntities trace to the same Entity. This is the formalization of cross-credential subject binding. The aligned predicate is a shadow predicate — it records derived information without constraining. -->
<!-- Refinery source: aligned/2 in vc_model.new.problem, aligned_entites/2 in vc_model.problem. -->

%% @FORMAL: Entity alignment predicate: aligned_entities(e1, e2). %%

%% @TODO: Draft — entity alignment. Shadow predicate. Cross-credential subject binding. Alice example: a_Alice1 and a_Alice2 are aligned. %%

<!-- A14: Structural anti-pattern constraints -->
<!-- Job: Define error predicates that catch specific design anti-patterns. -->
<!-- Key content: noSubject (credential without a subject), no_source_or_target / no_cred_props_for_cred_entity (credential entity not participating in any claim), non_connected (disconnected information graph), multiple_creds_point_to_same_fact_set / common_parent (two properties sharing a credential subject unexpectedly). -->
<!-- Refinery source: error predicates in both vc_model.problem and vc_model.new.problem. -->

%% @FORMAL: Anti-pattern error predicates: noSubject, no_cred_props_for_cred_entity, root_ent_doesnt_have_cred, non_connected, common_parent. %%

%% @TODO: Draft — anti-pattern catalog. Each predicate catches a specific design error. Brief description + Refinery code. %%

<!-- A15: Propagation rules for cross-layer alignment -->
<!-- Job: Show how propagation rules actively guide model generation, not just validate. -->
<!-- Key content: pim_and_cim_should_align (commented out in new model but present in old), tracing_cim_to_pim (infers trace mappings from known credential statements). These rules demonstrate that the constraint formalization is generative, not just checking. -->
<!-- Note: Some propagation rules are commented out in vc_model.new.problem. Discuss which are active and why. -->

%% @TODO: Draft — propagation rules for cross-layer alignment. Distinguish error predicates (checking) from propagation rules (guiding generation). This is a key Refinery mechanism. %%

<!-- A16: Running example: full constraint application -->
<!-- Job: Apply the complete constraint set to both running examples. Show what the model generator produces. -->
<!-- Key content: Alice example — apply all constraints, show which propagation rules fire, show the generated model. Diploma example — show the cross-layer constraint violation when JSON-LD is chosen but ZKP is required. -->

%% @FIGURE: fig_generated_model | (Optional) Refinery-generated model instance for the Alice example showing constraint satisfaction. %%

%% @TODO: Draft — full constraint application. Both examples. Generated model output. %%
