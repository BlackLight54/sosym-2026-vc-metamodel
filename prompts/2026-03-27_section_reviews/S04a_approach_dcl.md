# S04a: Approach --- DCL Review

**Reviewed:** 2026-03-27 | **Deadline:** 2026-03-29 AoE (2 days) | **Scope:** Sec 04 preamble + Sec 04.1 (DCL)

## Section Assessment

- **Overall verdict:** NEEDS WORK (submittable with targeted fixes in <2 hours)
- **Risk level:** Medium. The DCL subsection is structurally sound but has a formal gap (acyclicity) and several precision issues that Reviewer B will attack. None are fatal if addressed before submission.

### Reviewer Scores and Reactions

**A -- Champion (MDE-for-New-Domains Advocate):** Weak Accept.
The preamble cleanly introduces the three-layer separation and connects it to multi-level modeling principles and Refinery usage modes. The DCL subsection shows a non-trivial design: the Subject/Value distinction is *inferred* structurally via propagation rules, not declared. This is the kind of modeling insight that excites a champion. Concern: the preamble references `\autoref{fig:metamodel}` but the figure is placed inside the DCL subsection (line 19), not before it. The champion wants to see the full metamodel *before* the layer-by-layer definitions, not embedded in the first layer's text.

**B -- Mathematician (Graph Modeling / Partial Models Expert):** Borderline Reject / Weak Reject.
Multiple precision issues (detailed below). The acyclicity TODO is the most dangerous: the prose *claims* "connected, acyclic information graph" but the constraint enforcing acyclicity does not exist in the Refinery encoding. If B reads the supplementary material and finds no `cyclic` error predicate, this becomes a factual error. Additionally, the `statement` predicate definition conflates the ternary predicate with a well-formedness condition in a single sentence. The propagation rule for Subject inference is described in prose but never given a precise definition -- not even semi-formally.

**C -- Business Manager (MDE Practitioner / Generalist):** Weak Accept.
The running example table (lines 29-38) is clear and accessible. The three-statement summary (line 39) is concrete. However, the paragraph after the table (line 39) introduces domain constraints ($\text{property\_area} \geq \text{min\_area}(\text{num\_children})$) that have not been motivated yet at this point in the paper -- the reader does not know where these constraints come from or why they matter until Sec 04.4. This forward reference is confusing for a non-expert.

**D -- Adversarial (Competing Formalism Advocate):** Reject tendency unchanged.
"This is a UML class diagram with five classes and three references, plus two OCL-like constraints. Where is the multi-level contribution?" The DCL metaclass hierarchy (Entity -> Subject/Value, Prop) is simple. The adversarial reviewer will argue that the *individual layer* definitions are not novel -- the novelty must come from the cross-layer interactions. The DCL subsection alone does not defend against this, which is fine as long as the preamble and Sec 04.4 do. Current preamble is adequate but could be sharper on why layered separation is load-bearing.

## Critique

### Critical Issues (must fix before submission)

**C1. Acyclicity claim without constraint (Severity: HIGH, Reviewer B)**
Line 25 claims "connected, acyclic information graph" but the `@TODO` immediately following admits the acyclicity constraint is not implemented. This is a factual error in the current text. The prose asserts a property the formalization does not enforce.
- **Fix direction:** Either (a) implement the `cyclic` error predicate in `vc_metamodel.refinery` and remove the TODO, or (b) weaken the prose to "connected information graph with clear directionality from subjects to values" and drop the acyclicity claim, adding acyclicity as a future refinement. Option (b) is safer for the 2-day deadline -- the DCL is a tree-like structure by construction (containment references in Ecore are acyclic), so the claim may be partially defensible via Ecore semantics, but this needs to be stated explicitly rather than left to an unimplemented error predicate.

**C2. `statement` predicate definition is imprecise (Severity: HIGH, Reviewer B)**
Line 21: "The ternary predicate $\text{statement}(s, p, v)$ holds when subject $s$ owns property $p$ and $p$ contains value $v$, with the well-formedness condition $s \neq v$."
- "owns" is not a defined relation. Is this `property(s, p)` (a reference from Entity to Prop)?
- The well-formedness condition $s \neq v$ is stated as part of the predicate definition but it is actually enforced by a separate mechanism (the `no_self_loop` rule, described two paragraphs later). Mixing the predicate definition with its well-formedness condition is sloppy.
- The predicate is called "ternary" but it is really a derived fact computed from two binary references (`property` and `value`). A mathematician will want: $\text{statement}(s, p, v) \iff \text{property}(s, p) \wedge \text{value}(p, v)$ with $s \neq v$ as a separate constraint.
- **Fix direction:** Define `statement` compositionally from the two binary references. State $s \neq v$ as a separate well-formedness constraint, cross-referencing `no_self_loop`.

**C3. Subject inference rule is informal (Severity: MEDIUM-HIGH, Reviewer B)**
Line 21: "a propagation rule classifies any Entity with no incoming value reference as a Subject." This is prose, not a definition. The reader cannot verify it. At minimum, state it semi-formally: $\forall e : \text{Entity}.\ (\nexists p : \text{Prop}.\ \text{value}(p, e)) \implies e : \text{Subject}$. The background section (Sec 02.3) defines propagation rules as a Refinery mechanism; the DCL should use that mechanism precisely.
- **Fix direction:** Add a one-line semi-formal definition. No need for full Refinery syntax (Decision 15: no code listings), but the logical content must be stated.

### Significant Issues (should fix)

**C4. Figure placement (Severity: MEDIUM, all reviewers)**
The metamodel figure (`fig:metamodel`) is placed at line 19, inside the DCL subsection. But the preamble (line 11) references it as showing "the complete metamodel" across all three layers. The figure should logically appear at the end of the preamble or float to the top of the approach section, not be embedded in the first subsection. In the LaTeX output, pandoc may float it anyway, but the Markdown source should reflect intended placement.
- **Fix direction:** Move the figure inclusion to immediately after the preamble paragraph (after line 11, before `## Domain Concept Layer`).

**C5. `non_connected` error predicate: definition by description, not specification (Severity: MEDIUM, Reviewer B)**
Line 25: "it flags any pair of entities not transitively reachable through the `neighbours` relation, where two entities are neighbours if a `statement` connects them in either direction." This is a natural-language specification. For a Foundations Track paper, the reader needs: $\text{neighbours}(e_1, e_2) \iff \exists p.\ \text{statement}(e_1, p, e_2) \lor \text{statement}(e_2, p, e_1)$ and $\text{non\_connected}(e_1, e_2) \iff \neg \text{neighbours}^*(e_1, e_2)$.
- **Fix direction:** Add the two-line formal definition. This costs ~2 lines and eliminates a Reviewer B attack surface.

**C6. `no_self_loop` described as propagation rule, not error predicate (Severity: MEDIUM, Reviewer B)**
Line 25: "The `no_self_loop` propagation rule prevents an entity from serving as both the owner and the value of the same property." In the Refinery mechanism taxonomy (Sec 02.3), error predicates *detect* violations and propagation rules *derive* facts. If `no_self_loop` is a propagation rule, it eliminates self-loops during generation (negative elimination). If it is an error predicate, it reports them. The text calls it a "propagation rule" but its function sounds like error detection. Which is it? This distinction matters for Reviewer B.
- **Fix direction:** Clarify: if it is a propagation rule using negative elimination (setting self-referencing value bindings to **false**), say so explicitly and connect to the negative elimination mechanism from Sec 02.3. If it is an error predicate, relabel it.

**C7. Running example table is incomplete (Severity: MEDIUM, Reviewer C)**
The table (lines 29-38) lists 7 elements but does not show the `statement` triples. The paragraph after says "Three statements capture the domain facts" but does not list them. For Reviewer C, the table should either include a `Statement` column or the three statements should be listed explicitly: $\text{statement}(\text{Applicant}, \text{has\_children}, \text{num\_children})$, etc.
- **Fix direction:** Add a row or a follow-up sentence listing the three statement triples explicitly.

### Minor Issues

**C8. "The complete Refinery encoding is provided in the supplementary material" (line 21) -- first of five such references in Sec 04.** Reviewer D will count these and argue the paper is a summary of supplementary material rather than a self-contained contribution. This is acceptable if each in-paper definition is precise enough to stand alone. Currently, the DCL definitions are *not* precise enough (C2, C3, C5), which makes the supplementary deferral feel like a crutch.

**C9. Preamble uses "derived from" (line 11: "each layer is derived from the one above").** This implies a generative relationship (upper layer generates lower). The actual relationship is trace-based (lower layer elements carry trace links to upper layer elements). "Derived from" could mislead Reviewer B into expecting a model transformation. Consider "grounded in" or "traced to."

**C10. `@FORMAL` markers at lines 17 and 23 are still open.** These mark exactly the definitions that are missing (C2, C3, C5). The markers themselves should be resolved by the fixes above.

## Unresolved @TODO and @FORMAL Inventory

| Marker | Line | Content | Risk |
|--------|------|---------|------|
| `@FORMAL` | 17 | Metaclass definitions: Entity, Subject, Value, Prop, statement | HIGH -- C2, C3 |
| `@FORMAL` | 23 | DCL constraints: connectivity, no self-loops, statement WF | HIGH -- C5, C6 |
| `@TODO` | 25 | Acyclicity constraint not in Refinery encoding | HIGH -- C1 |

All three are in the DCL subsection. This is the highest concentration of unresolved formal markers in any subsection of the paper.

## Fix-It Prompt

```
# Fix-It: DCL Subsection Formalization (Sec 04.1)

## Target file
sections/04_approach.md — lines 13-39 (DCL subsection only)

## Context files to read first
- context/DECISIONS.md (Decision 15: no code listings; Decision 14: DCL naming)
- sections/02_background.md lines 29-35 (Refinery mechanism definitions)

## Goal
Resolve the three @FORMAL/@TODO markers in the DCL subsection by tightening
definitions to semi-formal precision. No code listings (Decision 15). All
definitions in prose + math notation.

## Specific changes

### 1. Move fig_metamodel (MEDIUM priority)
Move the figure inclusion block (current line 19-20) to immediately after line 11
(end of preamble paragraph), before the `## Domain Concept Layer` heading.

### 2. Define `statement` predicate precisely (HIGH priority)
Replace the current single-sentence definition with:

- State the two binary references: `property : Entity -> Prop` (containment)
  and `value : Prop -> Value` (containment).
- Define: $\text{statement}(s, p, v) \iff \text{property}(s, p) \wedge \text{value}(p, v)$
- State $s \neq v$ as a SEPARATE well-formedness constraint, not part of the
  predicate definition. Cross-reference `no_self_loop`.

### 3. Define Subject inference rule semi-formally (HIGH priority)
Add after the `statement` definition:
$\forall e : \text{Entity}.\ (\nexists p : \text{Prop}.\ \text{value}(p, e)) \implies e : \text{Subject}$
Label this as a propagation rule (per Sec 02.3 taxonomy). Note that it uses
structural inference -- Subject status is derived, not declared.

### 4. Define `non_connected` and `no_self_loop` semi-formally (HIGH priority)
Replace prose descriptions with:
- $\text{neighbours}(e_1, e_2) \iff \exists p.\ \text{statement}(e_1, p, e_2) \lor \text{statement}(e_2, p, e_1)$
- $\text{non\_connected}(e_1, e_2) \iff \neg \text{neighbours}^*(e_1, e_2)$ (error predicate)
- Clarify `no_self_loop`: is it a propagation rule (negative elimination) or
  error predicate? State which Refinery mechanism it uses per Sec 02.3.

### 5. Resolve acyclicity claim (HIGH priority, time-sensitive)
Option A (preferred if time permits): implement `cyclic` error predicate in
vc_metamodel.refinery and state it here.
Option B (safe fallback): weaken the claim. Replace "connected, acyclic
information graph" with "connected information graph with tree-structured
containment" and note that Ecore containment references are inherently acyclic.
Remove the @TODO if Option B is chosen.

### 6. Complete the running example table (MEDIUM priority)
After the table, list the three statement triples explicitly:
$\text{statement}(\text{Applicant}, \text{has\_children}, \text{num\_children})$, etc.

### 7. Remove resolved markers
Delete @FORMAL markers at lines 17 and 23 once the definitions above are in place.
Delete @TODO at line 25 once acyclicity is resolved (Option A or B).

## Constraints
- No code listings (Decision 15)
- Use Obsidian Markdown with Mathpix math conventions
- Preserve existing running example content -- only extend, do not restructure
- Budget: DCL subsection should not grow by more than ~5 lines net
- Do not touch CSL, FSL, or cross-layer subsections
```
