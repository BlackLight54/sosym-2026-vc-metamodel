# S04b: Approach -- CSL Review

**Reviewed:** `sections/04_approach.md`, lines 41--59 (Sec 4.2 Credential Schema Layer)
**Context files:** `sections/02_background.md`, `context/VENUE.md`, `context/DECISIONS.md`
**Date:** 2026-03-27 | **Days to deadline:** 2 (emergency mode)

## Section Assessment

- **Overall verdict:** NEEDS WORK (minor -- all issues are fixable within emergency-mode constraints)
- **Submission-blocking issues:** 1 (trace mapping definition imprecision)
- **Non-blocking but reviewer-visible:** 4

### Reviewer Scores and Reactions

| Reviewer | Score | Reaction |
|---|---|---|
| A -- Champion | Weak Accept | CSL partitioning story is clear. Cross-layer traces as the mechanism for multi-level constraint propagation lands well. The table grounds it. Would like the "entity alignment" concept introduced more explicitly before it appears in the table. |
| B -- Mathematician | Borderline | Trace mapping is described narratively but not defined with the precision of DCL's statement predicate. The `CredEntity::trace` and `Prop::trace` references are mentioned but their formal properties (multiplicity, injectivity/surjectivity) are left implicit. Propagation rule descriptions are qualitatively correct but the text conflates Refinery propagation semantics with informal derivation language. Will demand tighter definitions. |
| C -- Business Manager | Weak Accept | The CSL table is the strongest element -- immediately shows what partitioning means. The prose before the table is dense. The jump from "trace reference" to "propagation rule fires" will lose this reviewer. Needs one more bridging sentence. |
| D -- Adversarial | Weak Reject | "CSL mirrors DCL's type structure" -- this is standard refinement with renamed classes. Will argue the trace mapping is a morphism, the propagation rules are standard type-compatible refinement, and the contribution at this layer is application, not technique. The defense must be sharper: the novelty is that traces enable cross-layer constraint checking (Sec 4.4), not the traces themselves. |

## Critique

### Issue 1: Trace mapping definition is imprecise [SEVERITY: HIGH, submission-blocking]

**Problem:** The text says "the abstract metaclass `CredEntity` carries a mandatory `trace` reference to exactly one DCL `Entity`, and each DCL `Prop` contains exactly one `Claim` via `Prop::trace`." This conflates two distinct trace mechanisms:

1. `CredEntity::trace -> Entity` (CSL element traces to DCL element) -- a cross-layer reference owned by the CSL element.
2. `Prop::trace` -- described as "each DCL `Prop` contains exactly one `Claim`" -- but this means `Prop` (a DCL element) *contains* a `Claim` (a CSL element). This is a containment reference going *downward* from DCL to CSL, not a trace in the same direction as (1).

The directionality is inconsistent. In (1), CSL points up to DCL. In (2), DCL contains CSL. This is likely correct in the Refinery model (containment for structural nesting, reference for tracing), but the prose does not distinguish the two mechanisms or explain why one is containment and the other is reference.

**Reviewer impact:** B will flag this immediately. D will use it to argue the formalization is informal.

**Fix direction:** Add one sentence distinguishing the two cross-layer mechanisms: containment (Prop owns Claim, establishing structural correspondence) vs. trace reference (CredEntity points to Entity, establishing type correspondence). State multiplicity explicitly for both.

### Issue 2: Propagation rule descriptions lack Refinery-specific precision [SEVERITY: MEDIUM]

**Problem:** "The `subject_traces_to_subject` rule enforces type consistency: when a `CredEntity` traces to a DCL `Subject`, the rule infers it must be a `CredentialSubject`." This is a correct informal description, but it does not use Refinery's propagation semantics. In Refinery terms, the rule should be described as: when `trace(ce, e)` is **must** and `Subject(e)` is **must**, the rule sets `CredentialSubject(ce)` to **must** -- narrowing the three-valued interpretation. The current text reads as if it is a standard OCL derive, not a partial-model propagation.

Similarly, `root_is_cred_subj` is described as "infers CredentialSubject for any CredEntity that no Claim targets" -- but in partial model semantics, "no Claim targets" means no Claim *must* target it, which is different from "definitely not targeted." The open-world nuance is missing.

**Reviewer impact:** B will note the imprecision. Not fatal because Sec 2.3 establishes the three-valued semantics and the paper says "full definitions in supplementary material," but the body should at least use the right vocabulary.

**Fix direction:** Add "in the three-valued interpretation" or "sets ... to **must**" for at least one propagation rule to signal awareness of partial model semantics. One sentence suffices.

### Issue 3: Entity alignment introduced too late [SEVERITY: MEDIUM]

**Problem:** The concept "entity alignment" appears for the first time in the CSL table row: "$\text{aligned}(\text{CS\_Applicant}_i, \text{CS\_Applicant}_j)$ for all $i \neq j$." But the `aligned` predicate is not defined until Sec 4.4 (cross-layer constraints, line 107). The reader encounters undefined notation in the table.

**Reviewer impact:** C will be confused. B will note forward reference to undefined predicate.

**Fix direction:** Either (a) add a forward-reference sentence before the table: "Entity alignment -- the condition that distinct CredEntities trace to the same DCL Entity -- is formalized in \autoref{sec:cross-layer}; it holds for all three credential subjects here." Or (b) move the alignment sentence from the table paragraph to after the table with an explicit forward-ref.

### Issue 4: Error predicates motivation could be stronger [SEVERITY: LOW]

**Problem:** `no_empty_cred` and `root_ent_doesnt_have_cred` are described procedurally ("catches structural violations that would otherwise propagate silently to downstream format assignment") but the motivation is generic. Why would a credential subject with no claims arise in practice? In partial model generation, this is natural -- Refinery may instantiate a CredentialSubject before assigning its claims. The error predicate prevents this partial state from being refined into a complete model. Stating this connection to the generation process would strengthen the motivation.

**Reviewer impact:** B might ask "why is this interesting?" D might call it trivial well-formedness.

**Fix direction:** Add half a sentence: "During generation, these predicates prevent partial models with structurally incomplete credentials from being refined further."

### Issue 5: CSL table -- "Issuer (informal)" column [SEVERITY: LOW]

**Problem:** The table includes an "Issuer (informal)" column that is not part of the CSL metamodel. This is useful for the reader but blurs the boundary between what the metamodel captures and what is external context. No issuer metaclass is defined.

**Reviewer impact:** D might note that issuer assignment is a key credential ecosystem design decision not captured by the metamodel. B might ask whether this is intentional scope limitation.

**Fix direction:** Either (a) add a footnote: "Issuer assignment is outside the current metamodel scope; shown here for domain context." Or (b) remove the column. Option (a) is preferable -- it acknowledges the limitation honestly.

## Submission-Blocking @TODO Markers

From the full Sec 04 file, the following markers affect CSL or interact with it:

1. **Line 113 (@TODO A16):** "Apply complete constraint set to housing subsidy example." This is in Sec 4.4, not CSL proper, but the CSL table feeds into it. The paragraph at line 101 already covers the usage mode demonstration. A16 appears to be partially addressed. **Verdict:** Not blocking if the existing paragraph at line 101 is considered sufficient; the @TODO can be converted to a note for supplementary material.

2. **Line 117 (@TODO):** "Polish -- this paragraph may need tightening for page budget." This is about the FSL-to-DCL restructuring paragraph. Not CSL-specific. **Verdict:** Not blocking, but the paragraph is long and could be trimmed.

No CSL-specific @TODO markers exist. The @FORMAL markers at lines 17 and 23 are DCL-specific.

## Fix-It Prompt

```
# Fix: CSL Subsection Precision Pass

## Target
`sections/04_approach.md`, lines 41--59 (Credential Schema Layer subsection)

## Goal
Address the submission-blocking trace mapping imprecision and the two medium-severity
issues (propagation rule vocabulary, entity alignment forward reference) in a single
editing pass. Emergency mode: minimal edits, no restructuring.

## Constraints
- Do not restructure the subsection or change its paragraph count.
- Do not add more than ~3 sentences total across all fixes.
- Preserve all existing notation and terminology.
- Do not touch the CSL table content (lines 53--58) except to add a
  forward-reference sentence before or after it.
- Mathematical notation must be consistent with DCL subsection conventions.

## Specific Edits

### Edit 1: Trace mapping precision (line 45, first paragraph)

In the sentence beginning "the abstract metaclass `CredEntity` carries a mandatory
`trace` reference...", replace the current formulation with one that:
- Distinguishes the two cross-layer mechanisms: (a) `CredEntity::trace -> Entity`
  is a non-containment reference from CSL to DCL (type tracing), and (b) `Prop`
  contains `Claim` via containment (structural correspondence -- each domain property
  owns exactly one credential-layer claim).
- States multiplicity: both are [1..1].
- Keeps to 1--2 sentences.

### Edit 2: Propagation rule vocabulary (line 47, second paragraph)

In the description of `subject_traces_to_subject`, add a clause that connects to
Refinery's three-valued interpretation. For example, after "the rule infers it must
be a `CredentialSubject`", add: "-- setting `CredentialSubject(ce)` to *must* in
the three-valued interpretation and eliminating `CredentialValue` as a possible
type for that element."

### Edit 3: Entity alignment forward reference (line 59, after the table)

Before the sentence beginning "All three credential subjects trace to the same
claim-layer entity," add or integrate: "Entity alignment -- the condition that
distinct CredEntities trace to the same DCL Entity -- is formalized in
\autoref{sec:cross-layer}."

### Edit 4 (optional, if quick): Issuer column footnote

After the table, add a parenthetical or footnote: "(Issuer assignment is outside
the current metamodel scope; shown for domain context.)"

## Verification
After editing, check:
- [ ] `CredEntity::trace` and `Prop` containment of `Claim` are clearly distinguished
- [ ] At least one propagation rule description uses three-valued vocabulary
- [ ] `aligned` predicate has a forward reference before first use
- [ ] No new @TODO markers introduced
- [ ] Line count increase is <= 5 lines
```
