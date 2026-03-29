---
section: Approach
budget: "3.0 pages (~16 paragraphs, 4 subsections)"
goal: "Present the three-layer metamodel and cross-layer constraint formalization. This is the core contribution."
dependencies: ["02_background", "03_overview"]
source: "models/vc_metamodel.refinery. Layers: DCL / CSL / FSL."
---

# Approach

\label{sec:approach}

Credential ecosystem design involves three distinct concerns: what domain-level facts exist and how they relate, how those facts are grouped into credentials with defined subjects and claims, and which concrete credential format each credential uses. The metamodel separates these concerns into three layers: the [+DCL]{.full}, the [+CSL]{.full}, and the [+FSL]{.full}. The layered structure follows the multi-layer modeling principles introduced in \autoref{sec:multi-layer}: each layer is derived from the one above and carries its own intra-layer constraints. Constraints within and across layers are formalized as graph predicates that the Refinery framework (\autoref{sec:refinery}) can evaluate, yielding the three usage modes defined in \autoref{sec:functional-overview}. \autoref{fig:metamodel} shows the complete metamodel; the definitions below correspond to its elements layer by layer. Full Refinery encodings for all layer definitions, propagation rules, and constraint predicates are provided in the supplementary material.

## Domain Concept Layer

\label{sec:dcl}

Domain-level facts are modeled as a typed information graph at the first layer. The abstract metaclass `Entity` has two concrete subclasses: `Subject` and `Value`. A `Subject` is an entity that can anchor a credential, representing the person, organization, or thing about which claims are made. A `Value` is an entity that serves as the target of a property. Each `Entity` contains zero or more `Prop` instances; each `Prop` holds exactly one `Value` through a containment reference and carries a trace link to the credential schema layer (\autoref{sec:csl}). The ternary predicate $\text{statement}(s, p, v)$ is satisfied when subject $s$ owns property $p$ and $p$ contains value $v$, with the well-formedness condition $s \neq v$. The distinction between `Subject` and `Value` is inferred structurally: a propagation rule (\autoref{sec:refinery}) classifies any `Entity` with no incoming value reference as a `Subject`: a root of the property tree, and therefore a candidate credential subject at the +CSL layer.
A credential ecosystem must cover all domain-level facts; an entity unreachable from the rest of the graph represents a fact that no credential path connects to the subject, and therefore cannot be verified. The `non_connected` error predicate (\autoref{sec:refinery}) enforces this: it flags any pair of entities not transitively reachable through the `neighbours` relation, where two entities are neighbours if a `statement` connects them in either direction. The `no_self_loop` propagation rule prevents an entity from serving as both the owner and the value of the same property, a structurally meaningless configuration that would collapse the subject–value distinction. Together with the $s \neq v$ condition in the `statement` predicate, these constraints ensure that every +DCL instance is a connected, directed acyclic information graph with clear directionality from subjects to values. The `cyclic` error predicate enforces acyclicity via transitive closure of the `neighbours` relation. In terms of the usage modes (\autoref{sec:functional-overview}), +DCL constraints serve error identification: evaluating `non_connected` on a partial specification with an orphaned entity returns $\textbf{NOT\_OK}(\text{non\_connected}(e_1, e_2))$, naming the unreachable pair and indicating where the domain model is incomplete.

In the housing subsidy scenario (\autoref{fig:teaser}, top), the +DCL instance models the Applicant as a Subject with three properties: has_children $\to$ num_children (family size), owns_property $\to$ property_area (floor area), and earns $\to$ monthly_income (employment income). Three statements capture the domain facts, one per property edge in the domain graph. Two domain constraints apply: $\text{property\_area} \geq \text{min\_area}(\text{num\_children})$ links two properties across what will become separate credentials, and $\text{monthly\_income} \geq \text{threshold}$ establishes a privacy-sensitive eligibility check. All claim-layer structural constraints (connectivity, no self-loops) are satisfied.

## Credential Schema Layer

\label{sec:csl}

The [+CSL]{.full} models the partitioning of domain-level facts into credentials, each issued by a different authority and carrying a subset of the domain's claims. Each +CSL element is traced from a +DCL element: the abstract metaclass `CredEntity` carries a mandatory `trace` reference to exactly one +DCL `Entity`, and each +DCL `Prop` contains exactly one `Claim` via `Prop::trace`. This pair of cross-layer references ensures that every credential-layer element has a domain-level origin (\autoref{fig:metamodel}). +CSL mirrors the +DCL type structure: `CredentialSubject` and `CredentialValue` specialize `CredEntity`, paralleling +DCL's `Subject` and `Value`. A `Claim` connects a source `CredEntity` to a target `CredentialValue`, mirroring the +DCL `statement` predicate. Each `CredentialSubject` optionally contains a `Credential`, which itself holds exactly one `Formatted_Credential` (\autoref{sec:fsl}).

Trace mappings do more than record provenance. Combined with Refinery's propagation rules, they actively derive +CSL structure from +DCL during model generation. Two propagation rules derive +CSL type assignments from +DCL structure. `subject_traces_to_subject` infers `CredentialSubject` when a `CredEntity` traces to a +DCL `Subject`; `root_is_cred_subj` infers it when no `Claim` targets the entity, mirroring the +DCL `root_is_subj` at the credential level. The effect is that +CSL type assignments are derived from +DCL structure rather than independently specified: a credential entity's type is a consequence of its domain-layer origin.

Beyond type derivation, the metamodel enforces structural well-formedness through four predicates (two shadow, two error; \autoref{sec:refinery}). The shadow predicates mirror +DCL structure at the credential level: `credential_statement` is true when a `Claim` connects distinct source and target with the target typed as `CredentialValue`; `Root_cred_entity` holds when a `CredEntity` is not targeted by any `credential_statement`. The error predicates flag structural violations: `no_empty_cred` flags a `CredentialSubject` with no outgoing `Claim`, and `root_ent_doesnt_have_cred` flags a root entity without an associated `Credential`; the anti-pattern catalog (\autoref{sec:anti-patterns}) classifies all five predicates by layer scope and kind. The error predicates catch structural violations that would otherwise propagate silently to downstream format assignment. When either fires, the framework reports the violation (e.g., $\text{NOT\_OK}(\text{no\_empty\_cred}(cs))$) before format-specific constraints are even evaluated. In terms of the usage modes (\autoref{sec:functional-overview}), the shadow predicates (`credential_statement`, `Root_cred_entity`) derive structural facts in all three modes; the error predicates (`no_empty_cred`, `root_ent_doesnt_have_cred`) trigger in consistency checking and error identification.

In the housing subsidy scenario, three credentials partition the facts: FamilyStatusCred (civil registry: $\text{CS\_Applicant}_1$, claim $\text{has\_children}_1 \to \text{num\_children}_1$), PropertyCred (land registry: $\text{CS\_Applicant}_2$, claim $\text{owns\_property}_1 \to \text{property\_area}_1$), and IncomeCred (employer: $\text{CS\_Applicant}_3$, claim $\text{earns}_1 \to \text{monthly\_income}_1$). Each credential subject, claim, and value traces to its +DCL counterpart.

All three credential subjects trace to the same +DCL entity: $\text{trace}(\text{CS\_Applicant}_i, \text{Applicant})$ for $i \in \{1,2,3\}$. Each claim traces to its corresponding property, and each credential value traces to its corresponding value. Entity alignment holds pairwise: $\text{aligned}(\text{CS\_Applicant}_i, \text{CS\_Applicant}_j)$ for all $i \neq j$. The cross-property domain constraint (minimum floor area as a function of the number of children) now spans two credentials, requiring the verifier to combine claims from FamilyStatusCred and PropertyCred.

## Format-Specific Layer

\label{sec:fsl}

Each credential receives a concrete representation format at the third layer, the [+FSL]{.full}. The abstract metaclass `Formatted_Credential` has five concrete subclasses (one per credential format in scope: AnonCreds, JSON-LD, JWT-VC, SD-JWT-VC, and mdoc), and each `Credential` contains exactly one instance via the `format[1]` containment. These formats differ along a design-relevant axis: *selective disclosure* (revealing a subset of claims) versus *predicate proofs* (proving a comparison such as $\text{monthly\_income} \geq \text{threshold}$ without disclosing the value). Format capabilities follow from the analysis in \autoref{sec:vcdm}: only AnonCreds supports predicate proofs natively; the remaining formats provide selective disclosure only. Formats lacking predicate proofs force issuers to pre-compute boolean claims, restructuring the domain concept layer (\autoref{sec:cross-layer}). Unlike the +DCL and +CSL, the format-specific layer does not yet carry intra-layer structural constraints; its role in the metamodel is different. +FSL elements participate in cross-layer predicates (\autoref{sec:cross-layer}), carry governance annotations as typed containment, and their capability predicates feed the propagation rules that narrow the format design space during generation. The layer is a metamodel component with cross-layer predicate participation and governance semantics, not a lookup table mapping credentials to format labels.

The metamodel encodes format capabilities as six derived predicates over the class hierarchy, each capturing a functional property that at least one governance framework or domain requirement in the running example imposes:

| Predicate | Capability |
|---|---|
| `supports_predicate_proof` | Predicate proof (e.g., $\text{monthly\_income} \geq \text{threshold}$ without disclosure) |
| `supports_selective_disclosure` | Selective disclosure of claim subsets |
| `conforms_vcdm` | W3C VCDM 2.0 data model conformance |
| `supports_zkp` | Zero-knowledge proof support |
| `supports_offline_verification` | Offline verification without network access |
| `supports_multi_credential_proof` | Cross-credential predicate evaluation |

Table: +FSL capability predicates derived from the format class hierarchy.

Propagation rules narrow the format design space during generation: requiring predicate proof support on IncomeCred eliminates all formats except AnonCreds, which does not conform to W3C +VCDM 2.0, setting up the governance conflict in \autoref{sec:headlines}. Three governance annotation classes (`EidasMandate`, `PrivacyRequirement`, `VcdmConformance`) attach regulatory requirements to individual credentials as typed markers for error identification and +DSE.

In the housing subsidy scenario, format assignments are governance-driven. FamilyStatusCred and PropertyCred are assigned SD-JWT-VC under the eIDAS +ARF mandate; both formats mandated by the +ARF (SD-JWT-VC and mdoc) lack predicate proof support; we use SD-JWT-VC as representative [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026]. IncomeCred is the conflict site analyzed in \autoref{sec:headlines}: the income threshold check requires predicate proof capability that the ARF-mandated format does not provide.

## Cross-Layer Constraints as Graph Predicates

\label{sec:cross-layer}

![The three-layer type graph. The +DCL models facts as a typed information graph; the +CSL partitions facts into credentials with subject bindings and trace mappings; the +FSL assigns concrete formats with capability predicates and governance annotations.](pandoc/assets/fig_metamodel.pdf){#fig:metamodel width=100%}

Cross-layer constraints are predicates whose variables reference elements from more than one metamodel layer; they capture design requirements that no single-layer check can express. The following table classifies the constraints exercised in the housing subsidy scenario by source and scope:

| # | Constraint | Source | Layers |
|---|---|---|---|
| C1 | Entity alignment | Structural | DCL$\leftrightarrow$CSL |
| C2 | Trace consistency | Structural | DCL$\rightarrow$CSL |
| C3 | No empty credential | Structural | CSL |
| C4 | Cross-credential value dep. | Domain rule | DCL horiz. |
| C5 | Format mandate | eIDAS +ARF | FSL |
| C6 | Predicate proof required | +GDPR Art. 5(1)(c) | DCL$\leftrightarrow$FSL |
| C7 | VCDM conformance | W3C VCDM 2.0 | CSL$\leftrightarrow$FSL |
| C8 | **Governance conflict** | eIDAS+GDPR+W3C | FSL |
| C9 | Cross-credential predicate gap | Format limitation | DCL$\leftrightarrow$FSL |

Table: Cross-layer constraint taxonomy. C1--C3 are metamodel-enforced; C4 is grounded in regulation; C5--C7 originate from independent governance frameworks; C8 and C9 are cross-layer results. \label{tab:constraint_taxonomy}

Constraints C1–C3 are structural (metamodel-enforced). C4 is a domain rule grounded in government regulation. C5–C7 each originate from a different governance framework. C8 and C9 are cross-layer results: they emerge only when constraints from multiple sources and layers are checked jointly. \autoref{sec:headlines} develops C8 and C9 as the paper's headline results.

\autoref{fig:teaser} traces all three usage modes on the constraint table above. Consistency checking on the partial specification returns **OK**. Fixing IncomeCred to SD-JWT-VC triggers error identification: the framework returns **NOT_OK(governance_conflict(IncomeCred, income_format))**, naming the conflict site where C5, C6, and C7 cannot be simultaneously satisfied. Leaving IncomeCred's format open and running +DSE with $\text{C5} \wedge \text{C6} \wedge \text{C7}$ returns **UNVIABLE**. Relaxing C6, the framework generates configurations assigning SD-JWT-VC to all three credentials.

The predicates defined in the preceding sections (`non_connected`, `no_empty_cred`, `root_ent_doesnt_have_cred`) operate within a single layer using the Refinery mechanisms introduced in \autoref{sec:refinery}. The cross-layer predicates below combine elements from multiple layers and fall into three categories defined in \autoref{sec:refinery}: *propagation rules*, *shadow predicates*, and *error predicates*. This classification determines which usage mode (\autoref{sec:functional-overview}) each predicate serves.

A Claim that connects to a CredEntity tracing to the wrong +DCL Entity is a silent design error: each layer is well-formed individually, but the cross-layer mapping is broken. Two propagation rules prevent this by negative elimination. The target consistency rule enforces that if $\text{trace}(p, c)$ and $\text{value}(p, e)$ hold (where $\text{trace}(p, c)$ denotes `Prop::trace` and $\text{trace}(t, e)$ below denotes `CredEntity::trace`), then any CredEntity $t$ for which $\neg\text{trace}(t, e)$ holds is excluded as $c$'s target; the source rule is dual over $\text{property}(e, p)$. In the running example, the Claim tracing to `has_children` can only target a CredEntity tracing to `num_children`, not one tracing to `property_area`. Both rules operate by negative elimination (\autoref{sec:refinery}): bindings inconsistent with committed traces are excluded before generation explores them.

The shadow predicate `aligned` formalizes cross-authority subject identity: $\text{aligned}(ce_1, ce_2)$ holds when two distinct CredEntities satisfy $\text{trace}(ce_1, e) \wedge \text{trace}(ce_2, e)$ for some +DCL Entity $e$. In the running example, $\text{aligned}(\text{CS\_Applicant}_i, \text{CS\_Applicant}_j)$ holds for all $i \neq j$. A second shadow predicate, `common_parent`, holds when two Props' traced Claims share a source CredEntity, capturing co-location within a single credential. Both feed the anti-pattern analysis (\autoref{sec:evaluation}); `aligned` additionally feeds `cross_cred_predicate_gap` below.

Some design problems are invisible at any single layer. When a domain constraint spans two credentials ($\text{property\_area} \geq f(\text{num\_children})$ requires combining claims from FamilyStatusCred and PropertyCred), the design depends on a format capability that may not exist. The shadow predicate `cross_cred_predicate_gap` detects this: $\text{cross\_cred\_predicate\_gap}(c_1, c_2)$ fires when $\text{aligned}(cs_1, cs_2)$ and at least one credential's format lacks multi-credential proof support. No deployed format supports cross-credential arithmetic (AnonCreds supports multi-credential *presentation* but not cross-credential *computation*), so the predicate fires for every aligned pair, making a structural limitation of the current format space visible. As a shadow predicate, it records a condition whose severity depends on domain requirements; \autoref{sec:headlines} develops this as the second headline result.

Format capability propagation rules apply the same negative elimination mechanism (\autoref{sec:refinery}) at the format level. When a governance annotation demands a capability, incompatible format classes are eliminated: requiring `supports_predicate_proof` on IncomeCred excludes SD-JWT-VC, JWT-VC, mdoc, and JSON-LD, leaving only AnonCreds. When no format in scope satisfies a required capability, the only workaround is restructuring the domain concept layer, replacing a numeric property with pre-computed boolean claims, a cross-layer design consequence that \autoref{sec:headlines} develops as the first headline result.
