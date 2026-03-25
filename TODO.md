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
- [x] Remove ifblinded from LaTeX. Anonymization handled by document style properties.

## Pre-drafting (blocks everything)

- [x] **Design simplified CSOK running example** → `prompts/2026-03-24_06_csok_running_example.md` [COMPLETED 2026-03-24]
  - [x] Research CSOK eligibility requirements and credential types
  - [x] Simplify to 4-5 entities, 3 credentials
  - [x] Identify governance conflict: eIDAS/GDPR/VCDM triple on IncomeCred
  - [x] Identify cross-credential predicate gap: property_area ≥ f(num_children)
  - [x] Update section scaffolds (Sec 01, 03, 04, 05) to reference CSOK
  - [x] Record 5 new decisions in DECISIONS.md (naming, GDPR framing, CPL restructuring, mdoc, two headlines)
- [x] **Develop cross-governance conflict example** (binding claim #8) [TWO HEADLINE RESULTS DESIGNED]
- [x] **Create Refinery language guide** → `.claude/skills/refinery/` [Blocks Pass 2]
  - [x] Document `.problem` file syntax (classes, predicates, propagation rules, scope)
  - [x] Document three-layer pattern from existing models
  - [x] Document how to write new instances
  - [x] Curate examples from Refinery tutorials (File System, Project Planning, DLT)
  - [x] Create `run_refinery.sh` CLI wrapper (generate, check, concretize commands)
- [ ] **CSOK Refinery formalization (Pass 2)** → `prompts/2026-03-24_08_csok_refinery_formalization.md` [Depends on Pass 1 + Refinery guide]
  - [ ] Evolve metamodel (governance annotations, format capability predicates)
  - [ ] Write CSOK instance on evolved metamodel
  - [ ] Encode governance conflict (eIDAS SD-JWT-VC vs. AnonCreds ZKP)
  - [ ] Surface Martin's FCA results for format-specific layer
  - [ ] Test in Refinery — verify conflict manifests

## Per-section drafting (priority order)

- [ ] **Draft Section 04 (Approach)** — core contribution, everything depends on it
  - [ ] 4.1 Claim Property Layer — metaclasses, constraints, CSOK CPL example (scaffolded)
  - [ ] 4.2 Credential Schema Layer — metaclasses, trace mappings, CSOK CSL example (scaffolded)
  - [ ] 4.3 Format-Specific Layer — metaclasses, FCA-derived constraints, CSOK FSL example (scaffolded)
  - [ ] 4.4 Cross-Layer Constraints — trace consistency, entity alignment, constraint catalog (scaffolded), CPL restructuring worked example (scaffolded)
  - [ ] Surface Martin's FCA results for format-specific layer constraints
- [ ] **Draft Section 03 (Motivation)** — CSOK running example, cross-layer problem
  - [ ] M1-M2: CSOK scenario (scaffolded — needs polish)
  - [ ] M3: Why single-layer inspection fails (TODO marker)
  - [ ] M4-M5: Governance complication + problem statement (TODO markers)
- [ ] **Draft Section 05 (Evaluation)** — three-axis validation
  - [ ] 5.1 W3C Coverage table
  - [ ] 5.2 Constraint expressiveness table + EU constraint collection [HIGH RISK]
  - [ ] 5.3 Two headline results: income governance conflict + cross-credential predicate gap (scaffolded)
  - [ ] 5.4 Anti-pattern detection results
- [ ] **Draft Section 01 (Introduction)** — finalize after approach stabilizes
- [ ] **Draft Section 02 (Background)** — determined by what approach needs reader to know
  - [ ] 2.1 W3C VCDM 2.0
  - [ ] 2.2 Multi-Level Modeling (Atkinson & Kühne)
  - [ ] 2.3 Refinery
- [ ] **Draft Sections 06-07 (Related Work, Conclusion)** — last

## Other tasks

- [ ] Confirm VENUE.md exemplar papers → `prompts/2026-03-24_01_exemplar_papers.md`
- [x] Run `skills/gap_analysis` → 7 RQs tested, synthesis in `archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md`
- [x] Run `skills/related_work_positioning` — scaffold updated, re-run after gap analysis + more drafting
- [ ] **Verify Ding & Sato 2023** — "Model-Driven Security Analysis of SSI Systems" IEEE TrustCom 2023 [found via web search, confirm existence and details]
- [ ] **Verify Schardong & Custodio 2024** — "RAF Framework for Understanding Digital Identity Models" ER 2024 [found via web search, confirm existence and details]
- [ ] Incorporate gap analysis citations into Sec 06 scaffold (Tier 1 + Tier 2 papers)
- [ ] Soften C5 claim in introduction P2 and abstract — per DECISIONS.md 2026-03-25
- [ ] Write differentiation paragraphs for Sec 06.2 (ChorSSI, SecureSSI, Pattiyanon, Braun et al., King et al.)
- [ ] (Optional) Run supplementary ACM DL/DBLP search: "metamodel" AND "verifiable credential", "model-driven" AND "decentralized identity"
- [ ] **Draft Section 06 (Related Work)** using positioning from scaffold — 0.75 pages, 3 groups + synthesis
- [ ] Run `skills/evaluation_design`
- [ ] Design teaser figure (unified CSOK three-layer visual — see Sec 01 figure spec)
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
| 2026-03-25 | Run `skills/gap_analysis` | 7 RQs tested. Core novelty CLEAR. C5 corrected (MDE has been applied to SSI — 4 papers). ~20 papers to cite. 5 differentiation arguments. Synthesis in `archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md`. Sec 06 scaffold updated. |
