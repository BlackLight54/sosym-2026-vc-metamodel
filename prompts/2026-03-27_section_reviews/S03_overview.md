# S03: Overview Review

**Reviewed:** 2026-03-27 | **Deadline:** 2026-03-29 AoE (2 days) | **Mode:** Emergency — polish only

## Section Assessment

- **Overall verdict:** NEEDS WORK (minor — fixable in one focused pass)
- **Reviewer A (Champion):** Weak Accept. The CSOK scenario is vivid and the cross-layer tension lands. The problem statement in the final paragraph of 3.1 is clear. However, the champion argument ("independent governance sources with formally irreconcilable constraints") is slightly diluted by the dense regulatory citation chain in paragraph 4 — the punch line arrives late.
- **Reviewer B (Mathematician):** Borderline. The three usage modes in 3.2 are named but not precisely defined. "Complete or partial design" is left vague — what counts as complete? The mapping to Refinery operations is gestural ("Refinery partial graph modeling framework can evaluate or enforce") rather than precise. The mathematician will want to know: consistency checking = evaluating all error predicates and finding none? Exploration = Refinery generation with open nodes? These are one-sentence clarifications but their absence is noticed.
- **Reviewer C (Business Manager):** Weak Accept. The housing subsidy scenario is accessible without VC expertise — the three-authority structure is intuitive. The floor area table (40-80 m^2) is a nice concrete detail. Weakness: the third paragraph (format layer) assumes familiarity with "SD-JWT-VC," "predicate proofs," and "hash-based selective disclosure" — terms not yet defined at this point in the paper. Sec 02 defines them, but a reader encountering Sec 03 first (via teaser figure) will stumble.
- **Reviewer D (Adversarial):** Neutral. The problem statement is not rigged — it acknowledges independent governance sources and does not presuppose a metamodeling solution. However, the adversarial reviewer will note that the "no existing tool or methodology" claim in paragraph 4 is supported only by two surveys. If those surveys did not specifically search for multi-layer constraint checking tools, the claim is under-supported.

## Critique

### HIGH severity

**H1. Usage modes in 3.2 are insufficiently precise for the mathematician.**
The three modes are described in plain English but lack operational definitions. "Consistency checking" could mean anything from type-checking to full constraint evaluation. "Error identification" is described as "evaluates error predicates" but does not state what happens with propagation rules or shadow predicates. "Design space exploration... generates diverse valid configurations" — diverse in what sense? These terms are load-bearing: Sec 04 uses them extensively. The mathematician reviewer will flag this as hand-waving in the section that promises to be the functional overview.

**Fix direction:** Add one parenthetical or clause per mode mapping it to the Refinery mechanism. Consistency checking = all error predicates evaluate to false under the current partial interpretation. Error identification = at least one error predicate is satisfied, returned with its binding. Exploration = Refinery generation with unresolved nodes, producing concrete completions or proving no completion exists. Three sentences, no page budget risk.

**H2. Forward-reference dependency: Sec 03 paragraph 3 uses format-layer terminology before Sec 02 defines it.**
"SD-JWT-VC supports hash-based selective disclosure but not predicate proofs" appears in 3.1 paragraph 3. These terms are defined in Sec 02.2 (Background: VCDM). A reader following the paper linearly has seen these definitions. But the teaser figure is placed before Sec 01 in ACM sigconf, and the overview is the first section to develop the example — a reader may jump here from the teaser. The business manager reviewer will lose the thread at "hash-based selective disclosure."

**Fix direction:** This is borderline — Sec 02 does define these terms, so the linear reader is fine. At most, add a brief gloss on first use in 3.1: "SD-JWT-VC supports selective disclosure (revealing a subset of claims) but not predicate proofs (proving a comparison without disclosing the value)." This costs ~15 words and saves the business manager.

### MEDIUM severity

**M1. The "to the best of our knowledge" claim needs tighter scoping.**
Paragraph 4: "To the best of our knowledge, no existing tool or methodology checks whether their constraints can be simultaneously satisfied for a given credential ecosystem design." This is supported by citation to two surveys (Mazzocca et al. 2025, Naghmouchi et al. 2025). Per DECISIONS.md (2026-03-25 gap analysis), the defensible claim is narrower: "No prior work applies multi-level metamodeling to VC credential design with formalized cross-layer constraints spanning domain semantics, credential structure, and format-specific representation." The current phrasing is broader ("no existing tool or methodology") and risks the adversarial reviewer attacking it.

**Fix direction:** Tighten to match the gap analysis decision. Replace "no existing tool or methodology checks whether their constraints can be simultaneously satisfied" with "no existing approach formalizes constraints spanning domain semantics, credential structure, and format-specific capabilities for joint satisfiability analysis." Cite the two surveys as evidence, not proof.

**M2. 3.3 Usage Workflow is thin and partially redundant with 3.2.**
The workflow paragraph repeats the error identification example from 3.1 (income credential conflict) and the exploration example implied by 3.2. It adds one new element: the designer's adjustment (restructuring income as pre-computed boolean). But this adjustment is the worked example from Sec 04.4 (DECISIONS.md: "Format-driven CPL restructuring as worked example"). Previewing it here without the formal grounding risks the mathematician dismissing it as hand-waving, and Sec 04.4 then feels repetitive.

**Fix direction:** Either (a) keep the workflow but remove the restructuring detail, leaving it for Sec 04.4 — the workflow then shows: specify → check → conflict found → explore alternatives → UNVIABLE or GENERATED; or (b) make the workflow more concrete by naming the specific constraints (C5, C6, C7 from Sec 04's constraint table) — but those are not yet defined, so this is risky. Option (a) is cleaner.

**M3. CSOK naming: body text says "government housing subsidy" in first mention, not "family housing subsidy."**
DECISIONS.md specifies: "family housing subsidy" in all body text. Paragraph 1 of 3.1 says "a government housing subsidy." The footnote correctly introduces the Hungarian name. Minor but a decision violation.

**Fix direction:** Change "a government housing subsidy" to "a family housing subsidy" in the first sentence of 3.1.

### LOW severity

**L1. Figure placeholder for fig_functional_overview is adequate but could be sharper.**
The description mentions "Box/pipeline diagram" with three output modes. This is sufficient for production. Consider adding: the input box should show "partial design" with some elements marked as "unknown" (the three-valued interpretation) to visually connect to Refinery's partial model semantics.

**L2. The final paragraph of 3.1 has four citations in one sentence.**
"Recent surveys of the credential ecosystem landscape [Mazzocca et al. 2025; Naghmouchi et al. 2025] identify no existing approach..." — this is fine. But the preceding sentence has the "to the best of our knowledge" hedge AND the surveys sentence. One or the other, not both.

**Fix direction:** Drop the "to the best of our knowledge" sentence and let the survey citation do the work. Or merge: "Recent surveys [refs] identify no existing approach that formalizes constraints spanning..."

**L3. Sec 03 does not explicitly forward-reference Sec 04.**
The motivation ends with the problem statement, and 3.2 mentions "the metamodel organizes these elements across three layers" with a reference to Refinery. But there is no explicit "Section 4 presents our approach" bridge. The reader transitions from "this is the problem" to "here is the functional overview" without being told that the formalization follows. This is minor because the functional overview implicitly introduces the approach, but an explicit bridge sentence at the end of 3.1 or beginning of 3.2 would help the business manager.

## Checks per DECISIONS.md

| Decision | Status | Note |
|---|---|---|
| CSOK naming: "family housing subsidy" in body | VIOLATION | First sentence says "government housing subsidy" |
| Motivation ends with problem statement | OK | Final paragraph of 3.1 is a clear problem statement |
| Teaser figure referenced but not carried | OK | @META note correctly states fig_teaser is placed before intro |
| No code listings | OK | No code in Sec 03 |
| DCL/CSL/FSL terminology | OK | Not yet used in Sec 03 (appropriate — layers are introduced in Sec 04) |
| Modeling-first framing | OK | 3.2 frames around metamodel + graph predicates, not error detection |

## Transition Quality

**02 → 03:** Good. Sec 02 ends with Refinery mechanisms (error predicates, propagation rules, shadow predicates, scope constraints). Sec 03 opens with the running example and uses these concepts implicitly. The business manager can follow without recalling Sec 02's details.

**03 → 04:** Adequate but could be tighter. Sec 03.2 mentions "three layers (domain concepts, credential schemas, format-specific representations)" and Sec 04 opens with the same three concerns and introduces DCL/CSL/FSL. The mapping is clear. Sec 04's @META lists Sec 03 as a dependency and expects the running example, which is established. The three usage modes (OK / NOT_OK / GENERATED|UNVIABLE) defined in 3.2 are used throughout Sec 04 — their definitions must be precise enough to carry that weight (see H1).

## Fix-It Prompt

```
# Fix S03 Overview — Minor Revisions

## Target file
sections/03_overview.md

## Goal
Address review findings H1, M1, M2, M3, L2 from S03 review. Do not restructure — refine in place.

## Constraints
- Stay within 1.5-page budget
- Obsidian Markdown with Mathpix math conventions
- No code blocks
- All changes must be surgical — do not rewrite paragraphs that are working

## Changes (in order)

### 1. CSOK naming fix (M3)
First sentence of 3.1: change "a government housing subsidy" to "a family housing subsidy".

### 2. Precision on usage modes (H1)
In 3.2, after each mode description, add a parenthetical mapping to Refinery operations:
- Consistency checking: "(all error predicates evaluate to false under the current partial interpretation)"
- Error identification: "(at least one error predicate is satisfied; the framework returns the predicate name and its variable binding)"
- Design space exploration: "(Refinery generates concrete model completions from the partial specification, or proves no completion satisfying all constraints exists)"

### 3. Tighten the novelty claim (M1)
In 3.1 paragraph 5 (final paragraph), replace:
"To the best of our knowledge, no existing tool or methodology checks whether their constraints can be simultaneously satisfied for a given credential ecosystem design."
With:
"Recent surveys of the credential ecosystem landscape [@mazzocca_survey_2025; @naghmouchi_systematic_2025] identify no existing approach that formalizes constraints spanning domain semantics, credential structure, and format-specific capabilities for joint satisfiability analysis."
This merges the current "to the best of our knowledge" sentence with the survey sentence, eliminating the redundancy (L2).

### 4. Trim 3.3 workflow (M2)
Remove the restructuring detail ("restructuring the income claim as a pre-computed boolean (income above threshold)") from 3.3. Replace with a generic adjustment: "The designer adjusts the design and re-checks." The restructuring is Sec 04.4's worked example and should not be previewed here.

### 5. Optional: brief gloss on format terms (H2)
In 3.1 paragraph 3, on first mention of the income credential conflict, consider adding a brief parenthetical: "SD-JWT-VC supports selective disclosure (revealing chosen claims) but not predicate proofs (proving a value satisfies a condition without disclosing it)." Only if Martin judges the business manager needs it — Sec 02 already defines these terms.

## Verify after edits
- "family housing subsidy" appears in first sentence, not "government housing subsidy"
- No "to the best of our knowledge" phrasing remains
- 3.3 does not preview the boolean restructuring workaround
- Three usage modes each have an operational parenthetical
- No new @TODO markers introduced
```
