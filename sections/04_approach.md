---
section: Approach
budget: "3.0 pages (~16 paragraphs, 4 subsections)"
goal: "Present the three-layer metamodel and cross-layer constraint formalization. This is the core contribution."
dependencies: ["02_background", "03_overview"]
source: "models/vc_metamodel.refinery. Layers: DCL / CSL / FSL."
---

# Approach {#sec:approach}

Credential ecosystem design involves three distinct concerns: what domain-level facts exist and how they relate, how those facts are grouped into credentials with defined subjects and claims, and which concrete credential format each credential uses. The metamodel separates these concerns into three layers: the [+DCL]{.full}, the [+CSL]{.full}, and the [+FSL]{.full}. The layered structure follows the multi-layer modeling principles introduced in \autoref{sec:multi-layer}: each layer is derived from the one above and carries its own intra-layer constraints. Constraints within and across layers are formalized as graph predicates that the Refinery framework (\autoref{sec:refinery}) can evaluate, yielding the three usage modes defined in \autoref{sec:functional-overview}. \autoref{fig:metamodel} shows the complete metamodel; the definitions below correspond to its elements layer by layer. Full Refinery encodings for all layer definitions, propagation rules, and constraint predicates are provided in the supplementary material.

## Domain Concept Layer {#sec:dcl}

Domain-level facts are modeled as a typed information graph at the first layer.

\autoref{fig:teaser} (top) shows the +DCL instance for the housing subsidy scenario. \autoref{lst:dcl-instance} specifies the same instance as a Refinery partial model:

```refinery {#lst:dcl-instance caption="DCL partial specification for the housing subsidy scenario"}
Subject(Applicant).
Prop(has_children).  Value(num_children).  property(Applicant, has_children).  value(has_children, num_children).
Prop(owns_property). Value(property_area). property(Applicant, owns_property). value(owns_property, property_area).
Prop(earns).         Value(monthly_income). property(Applicant, earns).         value(earns, monthly_income).
```

Three property edges connect the subject to its values. The two domain constraints established in \autoref{sec:motivation} carry forward: [property\_area]{.refi} $\geq$ [min\_area(num\_children)]{.refi} spans what will become separate credentials, and [monthly\_income]{.refi} $\geq$ [threshold]{.refi} establishes a privacy-sensitive eligibility check. All structural constraints (connectivity, acyclicity, no self-loops) are satisfied.

The following metaclasses and predicates formalize this structure. The abstract metaclass [Entity]{.refi} has two concrete subclasses, [Subject]{.refi} and [Value]{.refi}, connected by [Prop]{.refi} instances; each [Prop]{.refi} holds exactly one [Value]{.refi} and carries a trace link to the credential schema layer (\autoref{sec:csl}). The distinction between [Subject]{.refi} and [Value]{.refi} is inferred structurally: a propagation rule (\autoref{sec:refinery}) classifies any [Entity]{.refi} with no incoming value reference as a [Subject]{.refi}, a root of the property tree and therefore a candidate credential subject at the +CSL layer. Four predicates constrain the +DCL:

statement(s, p, v) — ternary predicate
:   Satisfied when subject $s$ owns property $p$ and $p$ contains value $v$, with the well-formedness condition $s \neq v$.

non_connected(e1, e2) — error predicate
:   Flags any pair of entities not transitively reachable through the [neighbours]{.refi} relation, where two entities are neighbours if a [statement]{.refi} connects them in either direction. An unreachable entity represents a domain fact that no credential path connects to the subject and therefore cannot be verified.

no_self_loop — propagation rule
:   Prevents an entity from serving as both the owner and the value of the same property, a structurally meaningless configuration that would collapse the subject–value distinction.

cyclic — error predicate
:   Enforces acyclicity via transitive closure of the [neighbours]{.refi} relation.

Together, these constraints ensure that every +DCL instance is a connected, directed acyclic information graph with clear directionality from subjects to values. In terms of the usage modes (\autoref{sec:functional-overview}), +DCL constraints serve error identification: evaluating [`non_connected`]{.refi} on a partial specification with an orphaned entity returns $\textbf{NOT\_OK}(\text{non\_connected}(e_1, e_2))$, naming the unreachable pair and indicating where the domain model is incomplete.

## Credential Schema Layer {#sec:csl}

The [+CSL]{.full} models how domain-level facts are partitioned into credentials, each issued by a different authority and carrying a subset of the domain's properties, as claimed by the issuer.

In the housing subsidy scenario, three credentials partition the facts. FamilyStatusCred (civil registry) carries $\text{CS\_Applicant}_1$ with claim $\text{has\_children}_1 \to \text{num\_children}_1$. PropertyCred (land registry) carries $\text{CS\_Applicant}_2$ with claim $\text{owns\_property}_1 \to \text{property\_area}_1$. IncomeCred (employer) carries $\text{CS\_Applicant}_3$ with claim $\text{earns}_1 \to \text{monthly\_income}_1$. Each credential subject, claim, and value traces to its +DCL counterpart.

Trace references connect layers: when a credential claim traces to a domain fact, the metamodel can check whether the credential faithfully represents what it claims. When a trace is broken, the metamodel names the specific design error. The +CSL mirrors the +DCL type structure (\autoref{fig:metamodel}): credential entities parallel domain entities, claims parallel properties, and credential subjects parallel subjects. Every +CSL element carries a mandatory [trace]{.refi} reference to its +DCL origin. Combined with Refinery's propagation rules, traces actively derive +CSL structure from +DCL during model generation: two propagation rules ([subject_traces_to_subject]{.refi} and [root_is_cred_subj]{.refi}) infer credential-layer type assignments from domain-layer structure, so that +CSL types are consequences of domain-layer origin, not independent design choices.

All three credential subjects trace to the same +DCL entity, Applicant: $\text{trace}(\text{CS\_Applicant}_i, \text{Applicant})$ for $i \in \{1,2,3\}$. Each claim traces to its corresponding property, and each credential value traces to its corresponding value. Entity alignment holds pairwise: $\text{aligned}(\text{CS\_Applicant}_i, \text{CS\_Applicant}_j)$ for all $i \neq j$. The cross-property domain constraint (minimum floor area as a function of the number of children) now spans two credentials, requiring the verifier to combine claims from FamilyStatusCred and PropertyCred.

Beyond type derivation, the metamodel enforces structural well-formedness through four predicates (two shadow, two error; \autoref{sec:refinery}). The shadow predicates mirror +DCL structure at the credential level:

credential_statement — shadow predicate
:   Recognizes when a claim connects distinct source and target credential entities.

Root_cred_entity — shadow predicate
:   Identifies root credential entities that no claim targets.

The error predicates catch violations that would otherwise propagate silently to format assignment:

no_empty_cred — error predicate
:   Flags a credential subject with no outgoing claims.

root_ent_doesnt_have_cred — error predicate
:   Flags a root credential entity without an associated credential.

When either error predicate fires, the framework reports the violation before format-specific constraints are evaluated. The anti-pattern catalog (\autoref{sec:anti-patterns}) classifies all five predicates by layer scope and kind.

## Format-Specific Layer {#sec:fsl}

Each credential receives a concrete representation format at the third layer, the [+FSL]{.full}.

In the housing subsidy scenario, governance requirements drive format assignments. FamilyStatusCred and PropertyCred are assigned SD-JWT-VC under the eIDAS +ARF mandate; both formats mandated by the +ARF (SD-JWT-VC and mdoc) lack predicate proof support; we use SD-JWT-VC as representative [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026]. IncomeCred is the conflict site analyzed in \autoref{sec:headlines}: the income threshold check requires predicate proof capability that the ARF-mandated format does not provide.

The +FSL does not carry intra-layer structural constraints like the upper layers. Its role is to carry capability predicates that governance frameworks demand or prohibit, and governance annotations that attach regulatory requirements to individual credentials. This makes governance conflicts expressible as graph predicates. The metamodel represents the five credential formats in scope (AnonCreds, JSON-LD, JWT-VC, SD-JWT-VC, and mdoc) as subclasses of [Formatted_Credential]{.refi}; each credential contains exactly one (\autoref{fig:metamodel}). Formats lacking predicate proofs force issuers to pre-compute boolean claims, restructuring the domain concept layer (\autoref{sec:cross-layer}). The following matrix shows the six capability predicates derived from the class hierarchy (analysis in \autoref{sec:vcdm}):

| Capability predicate | AC | JLD | JWT | SDJ | mdoc |
|---|:---:|:---:|:---:|:---:|:---:|
| [`supports_predicate_proof`]{.refi} | $\checkmark$ | — | — | — | — |
| [`supports_selective_disclosure`]{.refi} | $\checkmark$ | $\checkmark$ | — | $\checkmark$ | $\checkmark$ |
| [`conforms_vcdm`]{.refi} | — | $\checkmark$ | $\checkmark$ | $\checkmark$ | — |
| [`supports_zkp`]{.refi} | $\checkmark$ | — | — | — | — |
| [`supports_offline_verification`]{.refi} | — | — | — | — | $\checkmark$ |
| [`supports_multi_credential_proof`]{.refi} | — | — | — | — | — |

Table: Format-capability matrix (AC = AnonCreds, JLD = JSON-LD, JWT = JWT-VC, SDJ = SD-JWT-VC). Each predicate is derived from the format class hierarchy. \label{tab:format_capabilities}

Propagation rules narrow the format design space during generation: requiring predicate proof support on IncomeCred eliminates all formats except AnonCreds, which does not conform to W3C +VCDM 2.0, setting up the governance conflict in \autoref{sec:headlines}. Three governance annotation classes ([EidasMandate]{.refi}, [PrivacyRequirement]{.refi}, [VcdmConformance]{.refi}) attach regulatory requirements to individual credentials as typed markers for error identification and +DSE.

## Cross-Layer Constraints as Graph Predicates {#sec:cross-layer}

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
| C8 | **Governance conflict** | C5+C6+C7 | FSL |
| C9 | Cross-credential predicate gap | Format limitation | DCL$\leftrightarrow$FSL |

Table: Cross-layer constraint taxonomy. C1--C3 are metamodel-enforced; C4 is grounded in regulation; C5--C7 originate from independent governance frameworks; C8 and C9 are cross-layer results. \label{tab:constraint_taxonomy}

C8 and C9 are cross-layer results: they emerge only when constraints from multiple sources and layers are checked jointly. \autoref{sec:headlines} develops them as the paper's headline results.

\autoref{fig:teaser} traces all three usage modes on the constraint table above. Consistency checking on the partial specification returns **OK**. Fixing IncomeCred to SD-JWT-VC triggers error identification: the framework returns $\textbf{NOT\_OK}$([governance\_conflict]{.refi}), naming the conflict site where C5, C6, and C7 cannot be simultaneously satisfied. Leaving IncomeCred's format open and running +DSE with [C5]{.refi} $\wedge$ [C6]{.refi} $\wedge$ [C7]{.refi} returns **UNVIABLE**. Relaxing C6, the framework generates configurations assigning SD-JWT-VC to all three credentials.

The predicates defined in the preceding sections ([non_connected]{.refi}, [no_empty_cred]{.refi}, [root_ent_doesnt_have_cred]{.refi}) operate within a single layer. The cross-layer predicates below combine elements from multiple layers and fall into the three categories defined in \autoref{sec:refinery}: propagation rules, shadow predicates, and error predicates.

prop_t, prop_s — propagation rules (C2)
:   Trace consistency by negative elimination. The target rule [prop_t]{.refi} excludes any credential entity whose trace is inconsistent with the domain-layer value; the source rule [prop_s]{.refi} is dual. A claim that connects to a credential entity tracing to the wrong domain entity is a silent design error: each layer is well-formed individually, but the cross-layer mapping is broken. In the running example, the claim tracing to [has_children]{.refi} can only target a credential entity tracing to [num_children]{.refi}, not one tracing to [property_area]{.refi}. (\autoref{lst:trace-consistency})

```refinery {#lst:trace-consistency caption="Cross-layer trace consistency: negative elimination rules"}
% Target consistency: forbid misaligned claim targets
propagation rule prop_t(Claim c, CredEntity t) <->
    must Prop::trace(p, c),
    must Prop::value(p, e),
    must !CredEntity::trace(t, e),
    may Claim::target(c, t)
==>
    !Claim::target(c, t).

% Source consistency: forbid misaligned claim sources
propagation rule prop_s(Claim c, CredEntity s) <->
    must Prop::trace(p, c),
    must Entity::property(e, p),
    must !CredEntity::trace(s, e),
    may Claim::source(c, s)
==>
    !Claim::source(c, s).
```

aligned(c_e1, c_e2) — shadow predicate (C1)
:   Holds when two distinct credential entities trace to the same domain entity. Formalizes cross-authority subject identity. In the running example, all three credential subjects are aligned because each traces to Applicant. (\autoref{lst:cross-layer-shadow})

cross_cred_predicate_gap(c1, c2) — shadow predicate (C9)
:   Fires when two credentials have aligned subjects but at least one format lacks multi-credential proof support. When a domain constraint spans two credentials ($\text{property\_area} \geq f(\text{num\_children})$ requires combining claims from FamilyStatusCred and PropertyCred), the design depends on a format capability that may not exist. No deployed format supports cross-credential arithmetic, so the predicate fires for every aligned pair, making a structural limitation of the current format space visible. \autoref{sec:headlines} develops this as the second headline result. (\autoref{lst:cross-layer-shadow})

[aligned]{.refi}, [cross_cred_predicate_gap]{.refi}, and [common_parent]{.refi} (defined in supplementary material) feed the anti-pattern analysis (\autoref{sec:evaluation}).

```refinery {#lst:cross-layer-shadow caption="Cross-layer shadow predicates: entity alignment and cross-credential predicate gap"}
% Entity alignment: two CredEntities tracing to the same Entity
shadow pred aligned(CredEntity c_e1, CredEntity c_e2) <->
    CredEntity::trace(c_e1, e),
    CredEntity::trace(c_e2, e),
    c_e1 != c_e2.

% Flags credential pairs where cross-credential predicates
% cannot be evaluated (no format supports it)
shadow pred cross_cred_predicate_gap(Credential c1, Credential c2) <->
    c1 != c2,
    credentialSubject(c1, cs1), credentialSubject(c2, cs2),
    aligned(cs1, cs2),
    format(c1, f1), !supports_multi_credential_proof(f1)
  ;
    c1 != c2,
    credentialSubject(c1, cs1), credentialSubject(c2, cs2),
    aligned(cs1, cs2),
    format(c2, f2), !supports_multi_credential_proof(f2).
```

Format capability propagation rules apply the same negative elimination mechanism (\autoref{sec:refinery}) at the format level. When a governance annotation demands a capability, incompatible format classes are eliminated: requiring [supports_predicate_proof]{.refi} on IncomeCred excludes SD-JWT-VC, JWT-VC, mdoc, and JSON-LD, leaving only AnonCreds. When no format in scope satisfies a required capability, the only workaround is restructuring the domain concept layer, replacing a numeric property with pre-computed boolean claims, a cross-layer design consequence that \autoref{sec:headlines} develops as the first headline result.
