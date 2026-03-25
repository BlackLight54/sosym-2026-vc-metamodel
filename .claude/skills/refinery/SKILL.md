# Refinery Language Guide

**Purpose:** Reference for writing Refinery `.problem` files — partial graph specifications that define metamodels, constraints, and scenario instances for design space exploration.

**When to reference:** Any task that reads, writes, or modifies `.problem` files. Specifically: CSOK Refinery formalization, metamodel evolution, writing new scenario instances, drafting Section 04 code listings.

**Supporting files:**

- [three_layer_pattern.md](three_layer_pattern.md) — project-specific metamodel architecture (CIM/PIM/PSM layers, cross-layer constraints, Tom instance walkthrough)
- [examples.md](examples.md) — curated complete `.problem` files from Refinery tutorials
- [run_refinery.sh](run_refinery.sh) — run `.problem` files via `refinery-cli` Docker image

## What Refinery is

Refinery is a partial graph modeling framework for design space exploration. It generates diverse graph instances from partial specifications (metamodel + constraints + scope). Partial models use 4-valued logic (`true`, `false`, `unknown`, `error`) rather than classical 2-valued logic — nodes and edges can be `unknown` until the solver refines them.

Key insight: Refinery *generates* all valid model instances consistent with a partial specification. It does not validate a single model.

- **Web UI:** `docker run --rm -it -p 8888:8888 ghcr.io/graphs4value/refinery`
- **CLI:** `docker run --rm ghcr.io/graphs4value/refinery-cli:latest <command> <file>` (see [run_refinery.sh](run_refinery.sh))
- **Home:** <https://refinery.tools/>
- **GitHub:** <https://github.com/graphs4value/refinery>
- **Language reference:** <https://refinery.tools/learn/language/>
- **CLI reference:** <https://refinery.tools/learn/docker/cli/>

## `.problem` file syntax

### Classes and inheritance

```refinery
abstract class Entity {
    contains Prop[] property
}
class Subject extends Entity {}
class Value extends Entity {}
```

`abstract class` cannot be instantiated directly. `extends` declares inheritance. Empty body uses `{}` or `.` (trailing dot for one-liners: `class Subject extends Entity.`).

### References and containment

```refinery
class Prop {
    contains Value[1] value       % containment: Prop owns the Value
    contains Claim[1] trace       % containment: Prop owns the Claim
}
class Credential {
    container CredentialSubject credentialSubject opposite _
    contains AnoncredsCredentialSchema[1] anoncreds
}
class CredentialSubject extends CredEntity {
    contains Credential[0..1] _ opposite credentialSubject
}
```

- `contains` — composition (parent owns child; child has at most one container; deleted with parent)
- `container` — inverse end of containment (no multiplicity allowed)
- `opposite` — bidirectional reference (must be declared in both directions)
- Multiplicities: `[1]` exactly one, `[0..1]` optional, `[1..4]` range, `[]` unbounded (0..*)

### Predicates

```refinery
pred statement(Entity subject, Prop property, Entity value) <->
    subject != value,
    property(subject, property),
    value(property, value).
```

Derived boolean predicate. Body operators:

- `,` conjunction (AND)
- `;` disjunction (OR) — separates clauses in DNF
- `!` negation
- `+` transitive closure (`neighbours+(n, m)` = reachable in 1+ steps)
- `==`, `!=` identity/inequality
- `_` wildcard (existential quantification)
- `count{relation(x, *)} >= n` cardinality constraint

### Error predicates

```refinery
error non_connected(Entity n, Entity m) <-> n != m, !neighbours+(n, m).
error no_empty_cred(CredentialSubject cs) <-> !source(_, cs).
```

Models where the body holds are rejected. Use for hard constraints that must never be satisfied.

### Shadow predicates

```refinery
shadow pred CIM(e) <-> Entity(e); Prop(e).
shadow pred PIM(e) <-> CredEntity(e); Claim(e); Credential(e).
shadow pred PSM(e) <-> Formatted_Credential(e).
```

Computed and displayed in the Refinery visualizer (node coloring) but do not constrain generation. Use for layer markers and auxiliary annotations.

> **Note:** Shadow predicates are not fully documented in Refinery's public docs. Behavior described here is inferred from working models and the DLT tutorial.

### Propagation rules

```refinery
propagation rule root_is_subj(Entity e) <->
    must !value(_, e)
    ==>
    Subject(e).

propagation rule prop_t(Claim c, CredEntity t) <->
    must Prop::trace(p, c),
    must Prop::value(p, e),
    must !CredEntity::trace(t, e),
    may Claim::target(c, t)
    ==>
    !Claim::target(c, t).
```

The key mechanism for constraint enforcement. Guards test 4-valued truth:

- `must expr` — `expr` is definitely true in the current partial model
- `may expr` — `expr` is possibly true (could become true or false)
- `must !expr` — `expr` is definitely false

When all guard conditions hold, consequences are asserted. Consequences can be positive (`Subject(e)`) or negative (`!Claim::target(c, t)`).

> **Note:** Propagation rules are not fully documented in Refinery's public docs (the rules page returns 404). Semantics described here are inferred from working models and the DLT tutorial. See [examples.md](examples.md) for additional propagation rule patterns.

### Scope declarations

```refinery
scope node = 1..20
    , Prop = 2
    , Entity = 3
    , Credential = 2.
```

Bounds the search space. `node` is the total object count. Per-class bounds restrict individual types. Exact value (`= 2`) means exactly that many. Range (`= 1..20`) allows the solver to choose. Use `+=` to add instances beyond already-declared ones (leaf classes only).

### Instance assertions

```refinery
Subject(Tom).                              % create typed instance
statement(Tom, owns_plot, plot_num_387).    % assert relation (creates Prop and Value implicitly)
!exists(Subject::new).                     % close the world: no new Subjects can be generated
!common_parent(owns_plot, id_number).      % assert negative relation
CredEntity(id_num_142536EE_1).             % assert existence of a CredEntity
```

- `ClassName(name).` — create a named instance of that type
- `pred(a, b).` — assert a relation holds
- `!pred(a, b).` — assert a relation does not hold
- `!exists(ClassName::new).` — prevent solver from generating new instances of this class
- `?exists(name).` — mark existence as unknown (0 or 1 instances)
- `default !relation(*, *).` — closed-world default for a relation

### Qualified references

```refinery
CredEntity::trace(t, e)    % disambiguates from Prop::trace
Claim::source(prop, source)
Claim::target(prop, target)
```

When multiple classes define references with the same local name (e.g., `trace` on both `CredEntity` and `Prop`), use `ClassName::refName` to disambiguate. Unqualified form causes ambiguity errors.

### Comments

```refinery
% This is a line comment
```

`%` for line comments. The existing models use commented-out code extensively for experimental alternatives — these are not dead code.

## How to write a new instance

Step-by-step for adding a new scenario (e.g., CSOK) on the existing metamodel:

1. **Declare Subjects.** `Subject(Applicant).` Named atoms create typed instances automatically.

2. **Assert domain statements.** `statement(Applicant, age, age_value).` This creates `Prop` and `Value` instances via the `statement` predicate. The propagation rules (`statement_rule`, `root_is_subj`) classify entities automatically.

3. **Close the domain world.** `!exists(Subject::new).` prevents the solver from inventing new subjects. Close what is known; leave open what should be explored.

4. **Optionally fix PIM structure.** Assert `Prop::trace(prop_name, claim_name).` and `credential_statement(...)` if you want a specific credential decomposition. Leave unasserted to let Refinery explore all valid decompositions — that is the point of DSE.

5. **Set scope bounds.** `scope node = 1..N, Credential = min..max.` Start with the minimum that fits your domain assertions, then widen. Rule of thumb: `node` >= (named instances) + (expected generated instances) × 1.5.

6. **What to lock vs. leave open.** Lock CIM-layer facts (these are given). Lock trace mappings only if you want a specific credential decomposition. Leave PIM/PSM structure open for exploration.

## Common pitfalls

- **`must`/`may` confusion.** `must expr` means "definitely true in the current partial model." A propagation rule with `must` in the guard fires only when the solver has committed to that fact. `may expr` fires when the fact is still possible. Getting these wrong causes rules to fire incorrectly or never fire at all.

- **Scope too tight.** If the solver finds zero solutions, check scope first. The `node` count must accommodate all named instances plus any the solver needs to create. Named instances in assertions count toward the total.

- **Scope too loose.** Large bounds cause combinatorial explosion. Bound each class individually when possible rather than relying on `node` alone.

- **Containment semantics.** Each object has at most one container. Asserting an object in two containers is unsatisfiable. `container` is always the inverse end.

- **Qualified vs. unqualified references.** When two classes define a reference with the same local name (e.g., `trace`), you must use `ClassName::refName`. The error message for this is not obvious.

- **Commented-out code.** The existing models contain extensive commented-out rules (lines 115–155 in `vc_model.new.problem`). These are experimental alternatives that were superseded or caused performance issues — not dead code. Do not delete without understanding why they were commented out.
