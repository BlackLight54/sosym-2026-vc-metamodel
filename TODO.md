# TODO

## Current focus

- [x] Initialize project: paste CFP, run `skills/cfp_import`, write thesis
- [x] Submit abstract
- [x] Run `skills/cfp_import` → derive VENUE.md
- [x] Write thesis in CLAUDE.md (core claim, mechanism, so-what)
- [ ] Confirm VENUE.md exemplar papers → `prompts/2026-03-24_01_exemplar_papers.md`
- [x] Run `skills/reviewer_personas` → `prompts/2026-03-24_02_reviewer_personas.md`
- [x] Run `skills/abstract_scaffold` → `prompts/2026-03-24_03_abstract_scaffold.md`
- [x] Run `skills/section_scaffold` → `prompts/2026-03-24_04_section_scaffold.md`
- [x] Build pandoc pipeline → `prompts/2026-03-24_05_pandoc_pipeline.md`
- [x] Reframe paper as "Multi-level metamodeling" (no MDA) — DECISIONS.md updated, layer names chosen
- [ ] Remove ifblinded from LaTeX. Anonymization handled by document style properties.

## Pre-drafting (blocks everything)

- [ ] **Design simplified CSOK running example** → `prompts/2026-03-24_06_csok_running_example.md` [CRITICAL PATH — advisor directed, replaces Diploma+Alice]
  - [ ] Research CSOK eligibility requirements and credential types
  - [ ] Simplify to 4-5 entities, 2-3 credentials
  - [ ] Identify governance conflict candidate (binding claim #8)
  - [ ] Update section scaffolds (Sec 03, 04) to reference CSOK
- [ ] **Develop cross-governance conflict example** (binding claim #8) [DOES NOT EXIST YET — may emerge from CSOK design]
- [ ] **Create Refinery language guide** → `prompts/2026-03-24_07_refinery_guide.md` [Blocks Pass 2]
  - [ ] Document `.problem` file syntax (classes, predicates, propagation rules, scope)
  - [ ] Document three-layer pattern from existing models
  - [ ] Document how to write new instances
- [ ] **CSOK Refinery formalization (Pass 2)** → `prompts/2026-03-24_08_csok_refinery_formalization.md` [Depends on Pass 1 + Refinery guide]
  - [ ] Evolve metamodel (governance annotations, format capability predicates)
  - [ ] Write CSOK instance on evolved metamodel
  - [ ] Encode governance conflict (eIDAS SD-JWT-VC vs. AnonCreds ZKP)
  - [ ] Surface Martin's FCA results for format-specific layer
  - [ ] Test in Refinery — verify conflict manifests

## Per-section drafting (priority order)

- [ ] **Draft Section 04 (Approach)** — core contribution, everything depends on it
  - [ ] 4.1 Claim Property Layer — metaclasses, constraints, Alice example
  - [ ] 4.2 Credential Schema Layer — metaclasses, trace mappings, Alice example
  - [ ] 4.3 Format-Specific Layer — metaclasses, FCA-derived constraints, Diploma example
  - [ ] 4.4 Cross-Layer Constraints — trace consistency, entity alignment, anti-patterns
  - [ ] Surface Martin's FCA results for format-specific layer constraints
- [ ] **Draft Section 03 (Motivation)** — running examples, cross-layer problem
  - [ ] Diploma example (vertical constraint)
  - [ ] Alice example (horizontal constraint)
  - [ ] Why single-layer inspection fails
- [ ] **Draft Section 05 (Evaluation)** — three-axis validation
  - [ ] 5.1 W3C Coverage table
  - [ ] 5.2 Constraint expressiveness table + EU constraint collection [HIGH RISK]
  - [ ] **CRITICAL: Develop cross-governance conflict example** (binding claim #8) [DOES NOT EXIST YET]
  - [ ] 5.3 Anti-pattern detection results
- [ ] **Draft Section 01 (Introduction)** — finalize after approach stabilizes
- [ ] **Draft Section 02 (Background)** — determined by what approach needs reader to know
  - [ ] 2.1 W3C VCDM 2.0
  - [ ] 2.2 Multi-Level Modeling (Atkinson & Kühne)
  - [ ] 2.3 Refinery
- [ ] **Draft Sections 06-07 (Related Work, Conclusion)** — last

## Other tasks

- [ ] Confirm VENUE.md exemplar papers → `prompts/2026-03-24_01_exemplar_papers.md`
- [ ] Run `skills/gap_analysis` → research prompts
- [ ] Run `skills/related_work_positioning`
- [ ] Run `skills/evaluation_design`
- [ ] Design teaser figure (split panel: Diploma + Alice)
- [ ] Design fig_metamodel (three-layer class diagram)
- [ ] Update title in tex/main.tex to new title

## Done

| Date | Task | Notes |
|------|------|-------|
| 2026-03-24 | Paste CFP into CFP.md | MODELS 2026 Foundations Track |
| 2026-03-24 | Run `skills/cfp_import` → derive VENUE.md | Deadlines, format, review type populated |
| 2026-03-24 | Run `skills/abstract_scaffold` | Draft in `sections/00_abstract.md`. 3 title candidates. 10 binding claims identified (3 high-risk). |
| 2026-03-24 | Run `skills/reviewer_personas` | 4 personas populated in VENUE.md with calibration guidance (significance, rigor, explanation floor, defense points) |
| 2026-03-24 | Build pandoc pipeline | `build.sh`, `tex/main.tex`, Lua filters in `pandoc/filters/`. Citations and figures filters are stubs. Needs pandoc install to test. |
| 2026-03-24 | Run `skills/section_scaffold` | 7 section files created in `sections/`. Intro has P1-P5 skeleton with structure paragraph. All sections have per-paragraph guidance with markers. DECISIONS.md updated with title, framing, terminology, examples, teaser figure decisions. |
