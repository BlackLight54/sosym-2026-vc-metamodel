---
section: Background
budget: "1.45 pages (~12 paragraphs + 2 listings, 3 subsections) — over 1.25 budget, needs cuts"
goal: "Establish the three conceptual pillars the reader needs. Nothing more."
dependencies: []
---

# Background

\label{sec:background}

## W3C Verifiable Credentials Data Model 2.0

\label{sec:vcdm}

The W3C [+VCDM]{.full} 2.0 [@sporny_verifiable_2025] defines a verifiable credential as a tamper-evident set of claims made by an issuer about one or more credential subjects. A *claim* is a subject–property–value triple asserting a characteristic of the credential subject, for example that an applicant's monthly income exceeds a threshold. The *issuer* is the entity asserting the claims; the *holder* possesses the credential and presents it to a *verifier*. Each credential carries a digital signature or comparable cryptographic evidence that binds the claims to the issuer and allows a verifier to confirm their integrity. VCDM 2.0 standardizes this structural vocabulary: the abstract data model for credential issuance, holding, and verification. It does not, however, prescribe the domain-level semantics of claim values, the encoding format in which credentials are serialized, or the privacy capabilities available during presentation. This gap between structural vocabulary and the domain-specific, format-specific concerns that govern real deployments motivates the multi-layer separation developed in \autoref{sec:approach}.

VCDM credentials can be secured and serialized in multiple formats with distinct cryptographic foundations and privacy capabilities. SD-JWT-VC [@terbu_sd-jwt-based_2026] provides hash-based *selective disclosure*, allowing a holder to reveal a chosen subset of claims while withholding others. AnonCreds [@curran2022anoncreds] uses Camenisch–Lysyanskaya signatures to support both selective disclosure and *predicate proofs*, [+ZKP]{.plural} that a claim value satisfies a given predicate (e.g., [monthly\_income]{.refi} $\geq$ [threshold]{.refi}) without disclosing the value itself. JSON-LD credentials with Data Integrity Proofs [@noauthor_verifiable_2024] support selective disclosure via the BBS cryptosuite [@_bbs_2024] but currently lack predicate proof capability (the underlying BBS+ scheme admits extensions that could support them). The ISO 18013-5 mobile document format (mdoc) [@_mobile_2021] is mandated alongside SD-JWT-VC by the eIDAS 2.0 +ARF for EU wallet attestations [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026]; since both formats lack predicate proof support, subsequent sections use SD-JWT-VC as the representative format.

## Multi-Layer Modeling

\label{sec:multi-layer}

Multi-layer modeling organizes a design problem into abstraction layers, each defining its own types, instances, and well-formedness rules. Multi-level metamodeling [@goos_essence_2001] relates such layers through successive instantiation controlled by potency annotations. The three layers in \autoref{sec:approach} (domain concepts, credential schemas, and format-specific representations) are abstraction layers in this sense, but they are not related by instantiation. Each layer is an independently governed concern space whose constraints originate from distinct normative sources not designed for joint satisfaction. Cross-layer relationships are formalized as typed trace references and graph predicates over partial models (\autoref{sec:cross-layer}), not as potency annotations.

Layer definitions in \autoref{sec:approach} use Ecore-style class diagrams with typed references and containment hierarchies as the metamodeling notation. Layer instance(s) are *partial models*: model elements may have definite ([must]{.refi}), absent ([must not]{.refi}), or open ([unknown]{.refi}) status for any reference or class membership, enabling reasoning over specifications where not all design decisions have been made. Cross-layer trace relationships are formalized as typed references between partial models at adjacent layers, capturing the correspondence between a domain concept and the credential-layer claims that represent it.

## Partial Graph Modeling with Refinery

\label{sec:refinery}

::: todo
Do not use this PGM, it is a non-existing concept
:::

[+PGM]{.full}
During the early phase of developement, our knowledge about models is often incomplete. In partial modeling

::: todo
cite this: Partial models: Towards modeling and reasoning with uncertainty
M Famelis, R Salay, M Chechik
:::

uncertainty can be denoted explicitly, thus a range of design alternatives can be developed together.
Refinery [@marussy_refinery_2024] is a modeling methodology in which design specifications are expressed as partial models and graph predicates serve as a first-class constraint language. Refinery uses a four-valued logic interpretation

::: todo
cite this:
@incollection{Belnap77useful,
  author = {Belnap, Jr., Nuel D.},
  title = {A Useful Four-Valued Logic},
  booktitle = {Modern Uses of Multiple-Valued Logic},
  series = {EPIS},
  volume = {2},
  pages = {5-37},
  year = {1977},
  publisher = {Springer},
  doi = {10.1007/978-94-010-1161-7_2}
}
:::

to every node, edge, attribute value, enabling reasoning over incomplete (or inconsistent) specifications where both structural and data-level decisions remain open. In Refinery, nodes correspond to objects (instances of classes defined in a metamodel), and edges correspond to typed references between objects; class membership is an additional unary relation over nodes.

::: {.formal}
Oscar: precise definition of graph elements (nodes, edges, class membership as relations). Reference Marussy et al. 2024. Target length: 2--3 sentences.
:::

A *4-valued partial model* provide partial interpretation to edge and class memberships in a model.

::: todo
Honnan jön ez a commited?
:::

The four-valued interpretation assigns each element one of four statuses: [true]{.refi} (the value must be true), [false]{.refi} (the value must be false), [unknown]{.refi} (possibly true or false), and [error]{.refi} (both true and false, denoting contraiction). In diagrams,

::: todo
do we have diagrams?
:::

a solid line denotes true values, a dashed line denotes unknown values, and absence denotes a false value. During the development (or automated synthesis) of partial models, [unknown]{.refi} values are gradually refined to either [true]{.refi} or [false]{.refi}. If a model contains only [true]{.refi} and [false]{.refi} values, we call them *concrete models*. If one of the design decision contradicts a design constraint, it produces [error]{.refi} to show the contradiction between a decision and the regulation.

::: {.formal}
Oscar: refinement ordering definition (partial model $A$ refines $B$ iff every must/must-not commitment in $B$ is preserved in $A$). Target length: 1--2 sentences + definition.
:::

\autoref{lst:refinery-metamodel} illustrates a fragment of the domain concept layer from \autoref{sec:approach}, simplified for exposition.[^bg-names] Classes define node types with typed references; the [contains]{.refi} keyword denotes ownership (composition). The derived predicate [reachable]{.refi} pattern-matches over the [property]{.refi} and [value]{.refi} references: it holds when entity $a$ owns a property whose value is entity $b$. The *error predicate* [disconnected]{.refi} uses transitive closure ([+]{.refi}) to flag any pair of entities not connected by a chain of reachable steps; when it evaluates to [must]{.refi}, the partial model contains a structural flaw that no refinement can repair.

[^bg-names]: The full metamodel in \autoref{sec:approach} uses a symmetric [neighbours]{.refi} relation and the error predicate [non_connected]{.refi}; the simplified names here prioritize readability.

Graph predicates define structural constraints and derived properties over partial models. A predicate body specifies a graph pattern; the framework evaluates it over the partial interpretation under the four-valued semantics introduced above. Negation and transitive closure extend this evaluation to richer structural queries.

::: {.formal}
Oscar: predicate evaluation semantics over partial interpretations. How four-valued logic lifts to predicate bodies, negation, transitive closure. Target length: 3--5 sentences or a compact table.
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

In credential ecosystem design, requirements arrive incrementally from independent governance sources from evolving stand and regulatory frameworks are adopted, so the designer must reason over partial specifications. +PGM evaluates constraints *during* refinement of such partial specifications, pruning inconsistent design choices before they propagate (\autoref{sec:rw-multilevel} compares this to bounded model finding alternatives).

::: {.meta}
Section: Background / Sec 2.3
Budget: was ~0.35 pages, now ~0.75--0.85 pages before Oscar's additions. Total Sec 2 ≈ 1.45 pages (0.2 over 1.25 budget). Oscar's formal content will add further; page cuts needed elsewhere.
:::
