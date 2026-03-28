# S06: Related Work Review

## Section Assessment

- **Overall verdict:** NEEDS WORK
- **Days to deadline:** 2 (submission 2026-03-29 AoE, grace period)

### Reviewer Scores and Reactions

**Reviewer A (Champion):** Weak Accept. The three-subsection structure is clean, the gap claim at the end is precise, and the champion argument ("no prior work combines multi-level metamodeling with formalized cross-layer constraints for VC ecosystem design under multi-source governance") is recoverable. However, the section reads as a literature survey rather than an argument. Each subsection catalogs works but does not build toward a clear "and therefore this paper is the right next step."

**Reviewer B (Mathematician):** Borderline. Refinery is cited (Marussy et al. 2024), and Diskin et al. on multi-view consistency is cited. However: (1) Chechik's partial model work is NOT cited -- and Chechik is on the Program Board. Famelis is on the Program Board. Neither's partial model contributions appear. This is a serious omission for a paper that uses partial models as its core mechanism. (2) The characterization of Refinery in 6.3 is thin -- "generates diverse model instances that satisfy structural and relational constraints" undersells the three-valued semantics and does not distinguish Refinery from any other model finder. (3) Semerath/Varro's earlier partial model work (beyond the Refinery tool paper) is not cited. Reviewer B would note these gaps.

**Reviewer C (Business Manager):** Weak Accept. The section is readable without deep knowledge of every cited paper. The three-subsection organization provides clear categories. The positioning statements at the end of each subsection are accessible. No major issues for this reviewer.

**Reviewer D (Adversarial):** Weak Reject. Two attacks land: (1) The "novelty reduction" defense in 6.3 paragraph 3 is present but unconvincing -- it says the layers "represent independently governed concern spaces" connected by "coverage and capability constraints," but does not explain why this is harder than standard multi-level modeling with OCL constraints across levels. The adversarial reviewer will say "you could do this with potency + OCL, what does Refinery add?" (2) The "tool dependency" attack is not pre-empted. The section says Refinery is the "solver infrastructure" but does not argue that the metamodel contribution is separable from the tool. If Refinery disappeared, what remains? (3) OCL-based multi-level constraint approaches are not cited or differentiated against (e.g., Gogolla's USE tool, Kuehne's work on deep constraints). (4) Alloy is not mentioned at all -- a graph-based model finder that Reviewer D would consider the obvious alternative.

## Critique

### Critical Issues (must fix before submission)

**C1. Missing partial model community citations.** Severity: HIGH. Chechik (merging partial models), Famelis (partial models for uncertainty), and Semerath/Varro (partial model generation before Refinery) are uncited. Chechik and Famelis are on the Program Board. Reviewer B will notice. This is not just courtesy -- the paper uses partial model semantics as a core mechanism, and the related work must show awareness of the partial model lineage. Fix: Add 1-2 sentences in 6.3 citing Chechik/Famelis on partial models and explaining how this work differs (partial models here represent incomplete credential designs, not merged model views or variability).

**C2. No Alloy/OCL differentiation.** Severity: HIGH. Reviewer D's most natural attack is "why not Alloy?" or "why not OCL constraints on a multi-level metamodel?" The related work never mentions either. Fix: Add a sentence or two in 6.3 differentiating from Alloy (bounded model finding without partial model semantics -- cannot reason over incomplete designs) and from OCL-based multi-level approaches (OCL constraints operate on fully instantiated models, not on partial specifications with three-valued semantics).

**C3. Novelty defense in 6.3 is assertion, not argument.** Severity: MEDIUM-HIGH. The paragraph starting "Unlike standard multi-level modeling..." makes the right claim but does not give the adversarial reviewer enough to work with. It says layers are "independently governed concern spaces" but does not explain what "independently governed" means technically or why it makes constraint formalization harder than standard potency-based approaches. Fix: One sentence clarifying that independent governance means constraints originate from different normative sources (W3C, EU, GDPR) that cannot be reconciled at design time, unlike potency constraints which are structurally derived from the metamodel hierarchy.

### Moderate Issues

**C4. Taentzer uncited.** Severity: MEDIUM. Gabriele Taentzer (graph transformations, graph constraints) is on the Program Board. The paper uses graph predicates as its constraint mechanism. Not citing graph constraint work from Taentzer's group (e.g., Habel/Pennemann/Taentzer on nested graph constraints) misses an opportunity to position the graph predicate formalization. Fix: Brief citation in 6.3 if space permits.

**C5. Prior short paper (CSCS 2024) third-person handling.** Severity: LOW. The reference `[@farkas_prolog-based_2024]` is cited as "A prior short paper applied Refinery to credential schema validation with a single-layer prototype." This is correct third-person phrasing for double-blind. However, "the present work extends this" could be read as revealing authorship. Fix: Rephrase to "the present work extends that approach" or "the approach presented here extends that prototype."

**C6. .cutcandidate material.** Severity: LOW. Two `.cutcandidate` spans exist (Mazzocca survey, Garcia-Rodriguez + Schardong). Given the 0.75-page budget, these should probably be cut. They add breadth but no differentiation. Cutting them frees ~2 lines for the missing citations above.

**C7. The final novelty statement is strong but could be more precise.** Severity: LOW. "No prior work combines multi-level metamodeling with formalized cross-layer constraints for verifiable credential ecosystem design under multi-source governance" is good. It could be sharpened by specifying what "multi-source governance" means in one clause -- "where constraints originate from independent regulatory, standards, and community governance frameworks."

### Observations (no fix needed)

- The section correctly implements Decision 7 (C5 correction): it does NOT claim MDE has not been applied to SSI. It cites all four MDE-for-SSI works (ChorSSI, Ding/Sato, Pattiyanon, Barclay) and differentiates them correctly.
- The positioning claim "None of these works defines a multi-level metamodel or formalizes cross-layer constraints" in 6.2 is accurate given the gap analysis.
- King et al. (multi-level governance compliance) is a good inclusion -- shows awareness of structurally related problems outside the VC domain.
- De Lara and Guerra (MetaDepth) are cited, satisfying the deep instantiation reference.
- Atkinson and Kuhne are cited with both key references (2001, 2008).

## Fix-It Prompt

```
# Task: Patch S06 Related Work — Address Review Findings

## Target file
`sections/06_related_work.md`

## Context
Review of S06 identified critical gaps: missing partial model community citations (Chechik, Famelis, Semerath/Varro pre-Refinery), no Alloy/OCL differentiation, and weak novelty defense against adversarial reviewer. Budget is 0.75 pages; space must come from cutting .cutcandidate material.

## Constraints
- Double-blind: no author identification
- Obsidian Markdown with Mathpix math conventions
- No academic filler — every added sentence must carry differentiation weight
- Do not expand beyond current budget
- Preserve existing correct citations and differentiation

## Changes (in order)

### 1. Cut both .cutcandidate spans
Remove the two `{.cutcandidate}` spans in 6.1 (Mazzocca survey reference; Garcia-Rodriguez + Schardong). This frees ~2-3 lines.

### 2. Add partial model citations to 6.3
After the Diskin et al. sentence, add ~2 sentences:
- Cite Chechik and Devereux (2003, merging partial behavioral models) and Famelis et al. (2012, partial models for managing uncertainty in requirements). Note that partial models in those works represent incompleteness in behavioral specifications or requirements; in the present work, partiality represents incomplete credential ecosystem designs where format assignments and constraint satisfaction are not yet determined.
- Cite Semerath and Varro (2017 or 2020, consistent model generation with graph solver) as the foundation for Refinery's generation capabilities.

### 3. Add Alloy/OCL differentiation to 6.3
After the paragraph starting "Unlike standard multi-level modeling...", add 1-2 sentences:
- Alloy (Jackson 2012) performs bounded relational model finding but operates on fully specified specifications without partial model semantics — it cannot represent or reason over designs where some elements remain undetermined.
- OCL constraints on multi-level metamodels (e.g., in MetaDepth or melanee) enforce well-formedness on instantiated models; they do not support three-valued evaluation over partial specifications or generation of diverse completions.

### 4. Strengthen the "independently governed" argument
In the paragraph starting "Unlike standard multi-level modeling...", after "independently governed concern spaces," add a clause: "— where constraints originate from normative sources (W3C specifications, EU regulations, national privacy law) that impose requirements independently and may formally conflict —"

### 5. Fix third-person phrasing
Change "the present work extends this" to "the present work extends that single-layer approach" to avoid implying authorship.

### 6. (Optional, if space permits) Add Taentzer graph constraint reference
In 6.3, briefly note that graph constraints (Habel, Pennemann, Taentzer) provide a foundation for the predicate-based constraint formalization used here, and differentiate: those works define constraint languages over typed graphs; the present work applies graph predicates specifically to cross-layer credential design constraints with partial model semantics.

## Verification
After edits, check:
- [ ] All four MDE-for-SSI works still cited (ChorSSI, Ding/Sato, Pattiyanon, Barclay)
- [ ] Chechik, Famelis now cited
- [ ] Alloy or OCL differentiated
- [ ] No .cutcandidate spans remain
- [ ] Third-person handling correct for CSCS 2024
- [ ] Final novelty statement preserved or sharpened
- [ ] Section fits within ~0.75 page budget
```
