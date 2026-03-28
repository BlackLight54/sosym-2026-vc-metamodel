---
id: "Z-P2"
short: "bg-rw-rename"
title: "Background + Related Work fixes + multi-layer rename"
status: done
depends_on: []
binding_claims: [3, 10]
target: "sections/02_background.md, sections/06_related_work.md, all sections (rename)"
priority: high
pipeline: "z01-triage"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Execute the "multi-level" → "multi-layer" terminology rename across all sections, fix background precision issues, strengthen related work positioning, and clean up unused concepts. This todo bundles Z01 items T12, T23, T24, T25, T30, T33, T49, T50, T51, plus Decision C (terminology switch) and X07 (income variable drift).

**This todo should run first** in the Z-pipeline because the rename is cross-cutting and must stabilize before other section edits.

## Read before writing

1. `sections/02_background.md` — current background text
2. `sections/06_related_work.md` — current related work text
3. All `sections/*.md` — for rename scan
4. `sections/00_abstract.md` lines 18-21 — title candidates (rename needed there too)

## What to draft

### Decision C: Multi-level → multi-layer rename

**Strategic decision:** The paper uses "multi-level metamodel" throughout, but Atkinson/Kühne multi-level modeling assumes instantiation-based levels. Our layers are independently governed concern spaces connected by trace relations, not instantiation. Martin has decided to switch to "multi-layer."

**Mechanical rename:**
- Search all `sections/*.md` for "multi-level" and replace with "multi-layer"
- Update title candidates in `sections/00_abstract.md` frontmatter
- Exception: keep "multi-level" when quoting or citing Atkinson/Kühne's framework directly (e.g., "Multi-level metamodeling, as established by Atkinson and Kühne" in Sec 6.3 — this refers to their framework, not ours)

**Defense paragraph in Sec 2.2 (currently `\label{sec:multi-level}`):**
- Rename subsection to "Multi-Layer Modeling" and update label to `\label{sec:multi-layer}`
- After the sentence about Atkinson/Kühne and potency, add distinction: "The present metamodel departs from instantiation-based multi-level modeling in two respects. First, the three layers represent independently governed concern spaces — domain semantics, credential structure, format capabilities — rather than successive instantiation levels. Second, cross-layer relationships are formalized as typed trace references and graph predicates, not potency annotations. The term *multi-layer* reflects this distinction: layers are connected by coverage and capability constraints, not by instantiation."
- This subsumes T51 (multi-level vs. multi-viewpoint framing)

**Defense paragraph in Sec 6.3 (line 36):**
- The existing paragraph already makes this distinction. Update terminology from "multi-level" to "multi-layer" where it refers to our work. Keep "multi-level" when referring to Atkinson/Kühne's framework.

### Background fixes

**T23 — "open-world assumption" imprecise (Sec 2.3, line 36):**
The phrase "evaluates them under an open-world assumption" is imprecise for Refinery. Replace with: "evaluates them over partial interpretations; a constraint violation is confirmed only when the error predicate evaluates to *must* — that is, it holds under every possible refinement of the partial model."

**T24 — Tool justification (Sec 2.3, before line 36):**
Add 1-2 sentences before the Refinery introduction: "Alternative model finders — Alloy [@jackson_alloy_2012] for bounded model checking, USE/OCL for constraint validation on UML models — operate on fully specified instances. Credential ecosystem designs are inherently incomplete: not all schema elements, format assignments, or governance constraints are known at design time. Partial graph modeling provides the semantic foundation for reasoning over such specifications."

**T25 — Sec 2.2 detail migration:**
The second paragraph of Sec 2.2 (line 27) contains detail about Ecore-style class diagrams, partial models, and trace relationships that belongs in Sec 04 (approach), not background. Move this detail to the approach preamble. In Sec 2.2, keep only the general claim that multi-layer modeling separates independently governed concern spaces.

**T33 — Keep governance paragraph (line 18-20):**
Remove the `::: {.cutcandidate ...}` wrapper from the governance paragraph in Sec 2.1. Keep the paragraph — it anchors the eIDAS/GDPR interaction that motivates the entire analysis.

**T49 — Remove "potency" (line 25):**
The concept of *potency* is introduced ("a mechanism called *potency* controls how many such instantiation steps each element can undergo") but never used again in the paper. Since we are switching to "multi-layer" and our layers are not instantiation-based, remove the potency reference. Replace with a brief note that standard multi-level modeling uses potency for instantiation control, but our layers use trace references instead.

**T50 — BBS+ predicate proof citation (line 16):**
The claim "BBS+ signatures can in principle support predicate proofs, and specification work is ongoing" lacks a citation. Add a citation to the BBS specification or relevant working group document. If no suitable citation exists, soften to "BBS+ signatures have been proposed for predicate proof support" without the "specification work is ongoing" claim.

**X07 — Income variable drift:**
Sec 02 (line 16) uses `$\mathit{income} \geq \mathit{threshold}$` while Sec 04 (line 116) uses `$\text{monthly\_income} \geq \text{threshold}$`. Unify to `monthly\_income` throughout — it is the more specific term used in the Refinery model.

### Related work fixes

**T12 — Alloy/OCL differentiation (Sec 6.3, around line 32):**
Add differentiation after the Refinery positioning: "Alloy [@jackson_alloy_2012] performs bounded model finding but operates on fully specified models without partial model semantics; constraint violations are binary, not three-valued. OCL constraints on multi-level metamodels [@goos_essence_2001] similarly assume fully instantiated models. Neither supports reasoning over incomplete designs where some structural decisions remain open — a requirement for credential ecosystems where format assignments and claim groupings are decided incrementally."

**T30 — Strengthen novelty defense (Sec 6.3, line 36):**
The final paragraph of Sec 6.3 is assertion rather than argument. After "independently governed concern spaces," add: "where constraints originate from normative sources — W3C specifications, EU regulations, national privacy legislation — that impose requirements independently and may formally conflict. The contribution is therefore the cross-layer constraint methodology under multi-source governance, not the layering technique itself."

## Constraints

- Sec 02 budget: 1.25 pages (3 subsections)
- Sec 06 budget: 0.75 pages (3 subsections)
- Double-blind compliance — no author self-identification
- No LLM tells
- `\autoref{}` for cross-references
- No invented references — if BBS+ citation is uncertain, flag it

## Acceptance criteria

- [ ] Zero occurrences of "multi-level" referring to our metamodel (grep verification)
- [ ] "Multi-level" preserved only when citing Atkinson/Kühne's framework
- [ ] Sec 2.2 renamed to "Multi-Layer Modeling" with defense paragraph
- [ ] "open-world assumption" replaced with precise Refinery semantics
- [ ] Tool justification (why Refinery, not Alloy/OCL) present in Sec 2.3
- [ ] Sec 2.2 detail (Ecore notation, partial models, traces) moved to Sec 04
- [ ] Governance paragraph in Sec 2.1 kept, cutcandidate wrapper removed
- [ ] "potency" removed or contextualized as contrast
- [ ] BBS+ claim cited or softened
- [ ] `income` unified to `monthly_income` across Sec 02 and Sec 04
- [ ] Alloy/OCL differentiated in Sec 6.3
- [ ] Novelty defense in Sec 6.3 strengthened with governance source argument
- [ ] Sec 6.3 label updated if subsection renamed
