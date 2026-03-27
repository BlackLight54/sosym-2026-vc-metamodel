# Prompt: Create Refinery language guide

**Task type:** Documentation
**Target:** `skills/refinery/SKILL.md`
**Priority:** Blocks CSOK Refinery formalization (Pass 2)

## Context

The paper uses Refinery (a partial graph modeling framework) to formalize the multi-level metamodel for VC ecosystem design. Claude Code needs a reference guide for writing `.problem` files — the Refinery-specific syntax for classes, predicates, constraints, propagation rules, and scope declarations.

The existing model at `prior_work/dse-vc-refinery/vc_model.new.problem` is the primary source of patterns. The older model at `prior_work/dse-vc-refinery/vc_model.problem` shows an earlier version of the same metamodel.

## Instruction

Create a guide at `skills/refinery/SKILL.md` that documents:

### 1. What Refinery is

- Partial graph modeling framework for design space exploration
- Generates diverse graph instances from partial specifications (metamodel + constraints + scope)
- Key idea: partial models use 4-valued logic (must, may, must not, unknown) rather than 2-valued
- Run via Docker: `docker run --rm -it -p 8888:8888 ghcr.io/graphs4value/refinery`

### 2. `.problem` file syntax

Document each language construct with examples drawn from the existing models:

- **Classes:** `class`, `abstract class`, `extends`, containment (`contains`), `container`, `opposite`
- **Multiplicities:** `[1]`, `[0..1]`, `[1..4]`, `[]` (unbounded)
- **Predicates:** `pred name(params) <-> body.` — derived predicates from graph patterns
- **Error predicates:** `error name(params) <-> body.` — marks invalid configurations
- **Shadow predicates:** `shadow pred name(params) <-> body.` — visible in generated output but don't constrain
- **Propagation rules:** `propagation rule name(params) <-> guard ==> consequence.` — the key mechanism for cross-layer constraint enforcement. Explain `must`, `may`, `must !` in guards.
- **Scope:** `scope node = min..max, ClassName = min..max.`
- **Instance assertions:** `ClassName(instanceName).`, `pred(a, b).`, `!pred(a, b).`, `!exists(ClassName::new).`
- **Comments:** `%` for line comments

### 3. Three-layer pattern

Document the specific pattern used in this project's metamodel:

- **CIM layer:** Entity/Prop/Value information graph with `statement(subject, property, value)` triples
- **PIM layer:** CredentialSubject/Claim/Credential with `trace` references back to CIM
- **PSM layer:** Format-specific schemas (AnonCreds, JSON-LD, JWT-VC) contained by Credential
- **Cross-layer enforcement:** How propagation rules enforce CIM↔PIM alignment (trace consistency, entity alignment via `aligned()` predicate)
- **The `shadow` pattern:** Using shadow predicates to mark layer membership without constraining

### 4. How to write a new instance

Step-by-step for adding a new scenario (like CSOK) on the existing metamodel:
- Declare Subject instances
- Assert statements (triples)
- Optionally fix PIM-level structure or leave it for generation
- Set scope bounds
- What to lock (`!exists(ClassName::new)`) vs. leave open

### 5. Common pitfalls

- Forgetting that `must` in propagation guards means "definitely true in the current partial model"
- Scope too tight → unsatisfiable; too loose → combinatorial explosion
- Containment semantics (a contained object can only have one container)
- Commented-out code in existing models — explain what was tried and abandoned

## Sources

- `prior_work/dse-vc-refinery/vc_model.new.problem` — current metamodel + Tom instance
- `prior_work/dse-vc-refinery/vc_model.problem` — older version (different structure, more propagation rules)
- `prior_work/dse-vc-refinery/docs/knowledge-credential-mapping.refinery.md` — earlier iterations
- Refinery documentation (online, if accessible)

## Deliverables

1. `skills/refinery/SKILL.md` — the guide itself, structured as above

## Constraints

- Keep it practical, not exhaustive. This is a working reference for writing CSOK models, not a Refinery manual.
- Use examples from the existing models, not invented ones.
- Flag any syntax you're uncertain about — Martin can verify against Refinery docs.
