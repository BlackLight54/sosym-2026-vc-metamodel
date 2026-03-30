---
section: Background
budget: "1.45 pages (~12 paragraphs + 2 listings, 3 subsections) — over 1.25 budget, needs cuts"
goal: "Establish the three conceptual pillars the reader needs. Nothing more."
dependencies: []
---

# Background {#sec:background}

## W3C Verifiable Credentials Data Model 2.0 {#sec:vcdm}

The W3C [+VCDM]{.full} 2.0 [@sporny_verifiable_2025] defines a verifiable credential as a tamper-evident set of claims made by an issuer about one or more credential subjects. A *claim* is a subject–property–value triple; the *issuer* asserts the claims, the *holder* possesses the credential and presents it to a *verifier*. VCDM 2.0 standardizes this structural vocabulary but does not prescribe the domain-level semantics of claim values, the encoding format, or the privacy capabilities available during presentation. This gap between structural vocabulary and the format-specific concerns that govern real deployments motivates the multi-layer separation developed in \autoref{sec:approach}.

VCDM credentials can be serialized in multiple formats with distinct privacy capabilities. SD-JWT-VC [@terbu_sd-jwt-based_2026] provides hash-based *selective disclosure*, allowing a holder to reveal a chosen subset of claims while withholding others. AnonCreds [@curran2022anoncreds] supports both selective disclosure and *predicate proofs*, [+ZKP]{.plural} that a claim value satisfies a predicate (e.g., [monthly\_income]{.refi} $\geq$ [threshold]{.refi}) without disclosing the value itself.[^other-formats] The eIDAS 2.0 +ARF mandates SD-JWT-VC for EU wallet attestations [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026]; subsequent sections use it as the representative format.

[^other-formats]: Other formats in scope (JSON-LD with BBS [@noauthor_verifiable_2024; @_bbs_2024], ISO mdoc [@_mobile_2021]) support selective disclosure but not predicate proofs.

The asymmetry between these format families is the central design axis for the analysis that follows. Selective disclosure is available across all four formats; predicate proofs are restricted to AnonCreds. When privacy regulation requires predicate proofs that the mandated format cannot provide, a cross-layer conflict emerges (\autoref{sec:evaluation}).

## Multi-Layer Modeling {#sec:multi-layer}

Multi-layer modeling organizes a design problem into abstraction layers, each defining its own types, instances, and well-formedness rules. The three layers in \autoref{sec:approach} (domain concepts, credential schemas, and format-specific representations) are abstraction layers in this sense, but they are not related by instantiation.[^ml-distinction] Each is an independently governed concern space; cross-layer relationships are formalized as graph predicates.

[^ml-distinction]: Usually, in multi-level metamodeling [@goos_essence_2001], each layer instantiates the one above it. Our layers do not: a credential schema is not an instance of a domain concept, but a separate representation governed by a different authority.

Each layer's constraints originate from a different governance source: sector regulation and business rules at the domain level, the W3C data model at the credential-schema level, EU implementing acts at the format level. These sources were enacted independently. A single-layer model that merges them cannot attribute a constraint to its source, so conflicts between governance sources become undetectable.

These three concerns, format-dependent privacy capabilities (\autoref{sec:vcdm}), independently governed layers (\autoref{sec:multi-layer}), and partial graph reasoning (\autoref{sec:refinery}), together enable the cross-layer analysis. \autoref{sec:overview} introduces the running example where they interact.

## Partial Graph Modeling with Refinery{#sec:refinery}

During the early phase of development, our knowledge about models is often incomplete. In partial modeling [@famelisPartialModelsModeling2012] uncertainty can be denoted explicitly, thus a range of design alternatives can be developed together.
Refinery [@marussy_refinery_2024] is a modeling methodology in which design specifications are expressed as partial models and graph predicates serve as a first-class constraint language. Refinery uses a four-valued logic interpretation[@Belnap77useful]

to every node, edge, attribute value, enabling reasoning over incomplete (or inconsistent) specifications where both structural and data-level decisions remain open. In Refinery, nodes correspond to objects (instances of classes defined in a metamodel), and edges correspond to typed references between objects; class membership is an additional unary relation over nodes.

::: {.definition}
**Signature** [@marussy_refinery_2024]. A *signature* defines the vocabulary of a domain model: a finite set of *symbols* representing class names and reference names. Each symbol has an *arity*: class names are unary (they classify individual objects), and reference names are binary (they relate pairs of objects).
:::

::: {.definition}
**Partial model** [@marussy_refinery_2024]. A *partial model* over a signature consists of a finite set of objects and an interpretation that assigns each class membership and each reference between objects one of four truth values: [true]{.refi}, [false]{.refi}, [unknown]{.refi}, or [error]{.refi}.
:::

The four-valued interpretation assigns each element one of four statuses: [true]{.refi} (the value must be true), [false]{.refi} (the value must be false), [unknown]{.refi} (possibly true or false), and [error]{.refi} (both true and false, denoting contradiction). In diagrams,[do we have diagrams?]{.todo} a solid line denotes true values, a dashed line denotes unknown values, and absence denotes a false value. During the development (or automated synthesis) of partial models, [unknown]{.refi} values are gradually refined to either [true]{.refi} or [false]{.refi}. If a model contains only [true]{.refi} and [false]{.refi} values, we call them *concrete models*. If one of the design decision contradicts a design constraint, it produces [error]{.refi} to show the contradiction between a decision and the regulation.

::: {.formal}
Oscar: refinement ordering definition (partial model $A$ refines $B$ iff every must/must-not commitment in $B$ is preserved in $A$). Target length: 1--2 sentences + definition.
:::

\autoref{lst:refinery-metamodel} illustrates a fragment of the domain concept layer from \autoref{sec:approach}, simplified for exposition.[^bg-names] Classes define node types with typed references; the [contains]{.refi} keyword denotes ownership (composition). The derived predicate [reachable]{.refi} pattern-matches over the [property]{.refi} and [value]{.refi} references: it holds when entity $a$ owns a property whose value is entity $b$. The *error predicate* [disconnected]{.refi} uses transitive closure ([+]{.refi}) to flag any pair of entities not connected by a chain of reachable steps; when it evaluates to [must]{.refi}, the partial model contains a structural flaw that no refinement can repair.

[^bg-names]: The full metamodel in \autoref{sec:approach} uses a symmetric [neighbours]{.refi} relation and the error predicate [non_connected]{.refi}; the simplified names here prioritize readability.

Graph predicates define structural constraints and derived properties over partial models. A predicate body specifies a graph pattern; the framework evaluates it over the partial interpretation under the four-valued semantics introduced above. Negation and transitive closure extend this evaluation to richer structural queries.

::: {.definition}
**Predicate satisfaction** [@marussy_refinery_2024]. A model *satisfies* a predicate when the predicate evaluates to [true]{.refi} for all variable bindings. Under four-valued semantics, a conjunction of conditions evaluates to the least committed value among its operands: if any condition is [unknown]{.refi}, the conjunction is [unknown]{.refi}; if any condition is [false]{.refi}, the conjunction is [false]{.refi}; [error]{.refi} arises when an element is simultaneously required and forbidden. Negation and transitive closure extend analogously over the four values.
:::

::: {.example}
The predicate [reachable(a, b)]{.refi} from \autoref{lst:refinery-metamodel} is defined as the conjunction of [property(a, p)]{.refi} and [value(p, b)]{.refi}. It checks whether entity a owns a property p whose value is entity b. On a partial model where [property(a, p)]{.refi} is [true]{.refi} and [value(p, b)]{.refi} is [unknown]{.refi}, the predicate evaluates to [unknown]{.refi}: the reachability relationship may or may not hold, and the framework preserves this uncertainty until further refinement commits the value reference. If both relations are [true]{.refi}, [reachable(a, b)]{.refi} evaluates to [true]{.refi}.
:::

```refinery {#lst:refinery-metamodel caption="Metamodel fragment with error predicate"}
abstract class Entity {
    contains Prop[] property
}
class Subject extends Entity.
class Value extends Entity.

class Prop {
    contains Value[1] value
}

pred reachable(Entity a, Entity b) <->
    property(a, p), value(p, b).

error disconnected(Entity a, Entity b) <->
    a != b, !reachable+(a, b).
```

*Propagation rules* derive new facts during refinement: when their precondition pattern matches with all elements committed ([must]{.refi}), the consequent is applied. A propagation rule with a positive consequent (e.g., [Subject(e)]{.refi}) infers new class memberships or edges. *Negative elimination* is the dual: a propagation rule with a negated consequent (e.g., [!value(p, e)]{.refi}) removes design choices that would necessarily violate a constraint, setting them to [must not]{.refi}. Both operate incrementally during model refinement, narrowing the space of possible completions before generation explores them.

::: {.formal}
Oscar: propagation rule semantics (precondition = must pattern, consequent = forced assignment). Boolean encoding and fixpoint computation. Target length: 3--5 sentences.
:::

\autoref{lst:refinery-mechanisms} demonstrates the remaining mechanisms. The propagation rule [classify_root]{.refi} performs positive inference: when an entity has no incoming [value]{.refi} reference, it is classified as a [Subject]{.refi}. The rule [no_self_loop]{.refi} performs negative elimination: when an entity owns a property, that property cannot point back to the same entity as its value. The *shadow predicate* [DCL]{.refi} marks all entities and properties as belonging to the domain concept layer; it records derived information for inspection without constraining generation. Finally, the *scope constraint* bounds the number of instances of each type, controlling the size and shape of generated models.

```refinery {#lst:refinery-mechanisms caption="Propagation rules, shadow predicate, and scope constraint"}
propagation rule classify_root(Entity e) <->
    must !value(_, e)
==>
    Subject(e).

propagation rule no_self_loop(Prop p, Entity e) <->
    must property(e, p)
==>
    !value(p, e).

shadow pred DCL(e) <-> Entity(e); Prop(e).

scope Entity = 3..5, Prop = 2..4.
```

Given a partial specification combining a metamodel, predicates, and instance-level assertions, Refinery applies propagation rules to derive new facts, checks error predicates, and generates concrete models that satisfy all constraints, or determines that no consistent completion exists [@semerath_graph_2018]. Generation is refinement-based: every generated model is guaranteed to satisfy all specified constraints (soundness), and if a constraint is violated in every possible completion, the tool detects the violation (completeness).

::: {.formal}
Oscar: formal statement of soundness and completeness guarantees for Refinery's refinement-based generation. Reference Semerath et al. 2018. Target length: 2--3 sentences + formal claim.
:::

In credential ecosystem design, requirements arrive incrementally from independent governance sources as standards evolve and regulatory frameworks are adopted, so the designer must reason over partial specifications. Refinery evaluates constraints *during* refinement of such partial specifications, pruning inconsistent design choices before they propagate (\autoref{sec:rw-multilevel} compares this to bounded model finding alternatives).
