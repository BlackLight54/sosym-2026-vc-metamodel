# Three-Layer Metamodel Pattern

Project-specific metamodel architecture for the VC ecosystem design space. Defined in `prior_work/dse-vc-refinery/vc_model.new.problem` (current) and `prior_work/dse-vc-refinery/vc_model.problem` (older version).

**Terminology mapping** (per DECISIONS.md — no MDA terminology in the paper):

| Prior work name | Paper name | Purpose |
|---|---|---|
| CIM | Domain Concept Layer (DCL) | Domain-level information graph |
| PIM | Credential Schema Layer (CSL) | Abstract credential schemas |
| PSM | Format-Specific Layer (FSL) | Format-specific representations |

## Domain Concept Layer (prior work: CIM)

Domain facts represented as an Entity–Property–Value information graph.

```refinery
abstract class Entity { contains Prop[] property }
class Subject extends Entity {}
class Value extends Entity {}
class Prop { contains Value[1] value; contains Claim[1] trace }
```

Triple pattern: `statement(subject, property, value)` — holds when `subject != value`, `property(subject, property)`, and `value(property, value)`.

Layer marker: `shadow pred CIM(e) <-> Entity(e); Prop(e).`

Key propagation rules:

- `root_is_subj` — entities with no incoming `value` references are classified as `Subject`
- `statement_rule` / `statement_rule_bw` — decompose/recompose statement triples from their components
- `no_self_loop` — a property of an entity cannot have that entity as its value
- `non_connected` (error) — all entities must be reachable from each other

## Credential Schema Layer (prior work: PIM)

Credential abstraction mapping domain claims to credential structure. Each PIM entity traces back to a CIM entity.

```refinery
abstract class CredEntity { Entity[1] trace }
class CredentialSubject extends CredEntity { contains Credential[0..1] _ opposite credentialSubject }
class CredentialValue extends CredEntity {}
class Claim { contains CredEntity[1] source; contains CredentialValue[1] target }
class Credential {
    container CredentialSubject credentialSubject opposite _
    contains AnoncredsCredentialSchema[1] anoncreds
    contains JsonLdCredentialSchema[1] json_ld
    contains JwtVCCredentialSchema[1] jwt_vc
}
```

Triple pattern: `credential_statement(source, claim, target)` — mirrors CIM's `statement` at the credential level.

Layer marker: `shadow pred PIM(e) <-> CredEntity(e); Claim(e); Credential(e).`

Key propagation rules:

- `subject_traces_to_subject` — if a `CredEntity` traces to a `Subject`, it must be a `CredentialSubject`
- `root_is_cred_subj` — CredEntities that are not claim targets become `CredentialSubject`
- `credential_statement_rule` / `credential_statement_rule_opp` — decompose/recompose credential statement triples

## Format-Specific Layer (prior work: PSM)

Concrete credential format schemas. Each `Credential` contains one of each format.

```refinery
abstract class Formatted_Credential {}
class AnoncredsCredentialSchema extends Formatted_Credential.
class JsonLdCredentialSchema extends Formatted_Credential.
class JwtVCCredentialSchema extends Formatted_Credential.
```

Layer marker: `shadow pred PSM(e) <-> Formatted_Credential(e).`

Currently minimal — format-specific constraints (capabilities, limitations) are planned for CSOK formalization (Pass 2) using format capability analysis results.

## Cross-layer enforcement

Two propagation rules enforce CIM↔PIM trace consistency:

```refinery
% If a CIM property traces to a PIM claim, the claim's target
% must trace to the same CIM value as the property's value.
propagation rule prop_t(Claim c, CredEntity t) <->
    must Prop::trace(p, c),
    must Prop::value(p, e),
    must !CredEntity::trace(t, e),
    may Claim::target(c, t)
    ==> !Claim::target(c, t).

% If a CIM property traces to a PIM claim, the claim's source
% must trace to the same CIM entity that owns the property.
propagation rule prop_s(Claim c, CredEntity s) <->
    must Prop::trace(p, c),
    must Entity::property(e, p),
    must !CredEntity::trace(s, e),
    may Claim::source(c, s)
    ==> !Claim::source(c, s).
```

These rules *forbid misalignment* — they eliminate invalid source/target assignments rather than asserting correct ones. The solver then finds only consistent decompositions.

Additional cross-layer predicates:

- `aligned(c_e1, c_e2)` — two CredEntities trace to the same Entity (potential merge candidates)
- `common_parent(p1, p2)` — two Props trace to Claims with the same source CredEntity (same credential subject)

## Tom instance walkthrough

The Tom scenario in `vc_model.new.problem` (lines 183–211):

**Asserted (CIM — given facts):**

```refinery
Subject(Tom).
statement(Tom, owns_plot, plot_num_387).
statement(Tom, id_number, id_num_142536EE).
!exists(Subject::new).
```

Tom has two properties: plot ownership and ID number. No additional subjects can be created.

**Asserted (PIM — partial):**

```refinery
CredEntity(id_num_142536EE_1).
```

One CredEntity is asserted. Everything else in PIM/PSM is left for the solver.

**Scope:**

```refinery
scope node = 1..20, Prop = 2, Entity = 3, Credential = 2.
```

Exactly 2 properties, 3 entities, 2 credentials. Up to 20 total objects.

**What the solver generates:** PIM-layer structure (CredentialSubjects, Claims, CredentialValues) and PSM-layer format schemas, consistent with the trace constraints. The solver explores how Tom's two properties can be split across two credentials.

## Evolution: old → new model

Key differences between `vc_model.problem` (old) and `vc_model.new.problem` (new):

| Aspect | Old | New | Why |
|---|---|---|---|
| PIM entity types | `CredentialEntity` (generic) | `CredentialSubject`, `CredentialValue` (typed) | Distinguish PIM roles |
| Claim structure | `CredentialProp` with `source`/`target` refs | `Claim` with `contains` source/target | Containment semantics |
| Trace direction | `Entity contains CredentialEntity[1..4] trace` (CIM→PIM) | `CredEntity.trace: Entity[1]` (PIM→CIM) | Cleaner ownership |
| Alignment enforcement | Bidirectional propagation (derive traces + derive statements) | Negative propagation (forbid mismatches) | More robust |
| Instance data | Full PIM scenario asserted | Minimal — solver explores | Focus on DSE |

Commented-out code in the new model (lines 115–155) preserves the old bidirectional rules and error predicates. These were superseded by `prop_t`/`prop_s` but kept for reference.
