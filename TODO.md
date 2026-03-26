# TODO

## Current focus

- [X] Initialize project: paste CFP, run `skills/cfp_import`, write thesis
- [X] Submit abstract
- [X] Run `skills/cfp_import` → derive VENUE.md
- [X] Write thesis in CLAUDE.md (core claim, mechanism, so-what)
- [ ] Confirm VENUE.md exemplar papers → `prompts/2026-03-24_01_exemplar_papers.md`
- [X] Run `skills/reviewer_personas` → `prompts/2026-03-24_02_reviewer_personas.md`
- [X] Run `skills/abstract_scaffold` → `prompts/2026-03-24_03_abstract_scaffold.md`
- [X] Run `skills/section_scaffold` → `prompts/2026-03-24_04_section_scaffold.md`
- [X] Build pandoc pipeline → `prompts/2026-03-24_05_pandoc_pipeline.md`
- [X] Reframe paper as "Multi-level metamodeling" (no MDA) — DECISIONS.md updated, layer names chosen
- [X] Remove ifblinded from LaTeX. Anonymization handled by document style properties.

## Pre-drafting (blocks everything)

- [X] **Design simplified CSOK running example** → `prompts/2026-03-24_06_csok_running_example.md` [COMPLETED 2026-03-24]
  - [X] Research CSOK eligibility requirements and credential types
  - [X] Simplify to 4-5 entities, 3 credentials
  - [X] Identify governance conflict: eIDAS/GDPR/VCDM triple on IncomeCred
  - [X] Identify cross-credential predicate gap: property_area ≥ f(num_children)
  - [X] Update section scaffolds (Sec 01, 03, 04, 05) to reference CSOK
  - [X] Record 5 new decisions in DECISIONS.md (naming, GDPR framing, DCL restructuring, mdoc, two headlines)
- [X] **Develop cross-governance conflict example** (binding claim #8) [TWO HEADLINE RESULTS DESIGNED]
- [X] **Create Refinery language guide** → `.claude/skills/refinery/` [Blocks Pass 2]
  - [X] Document `.problem` file syntax (classes, predicates, propagation rules, scope)
  - [X] Document three-layer pattern from existing models
  - [X] Document how to write new instances
  - [X] Curate examples from Refinery tutorials (File System, Project Planning, DLT)
  - [X] Create `run_refinery.sh` CLI wrapper (generate, check, concretize commands)
- [X] **CSOK Refinery formalization (Pass 2)** → `models/csok.problem` [COMPLETED 2026-03-25]
  - [X] Evolve metamodel: single abstract format containment, 5 format classes, GovernanceAnnotation markers
  - [X] Write CSOK instance: 3 credentials, 7 governance markers, format assignments
  - [X] Encode governance conflict: `governance_conflict` error predicate (Headline 1 → UNSAT)
  - [X] Encode cross-credential gap: `cross_cred_predicate_gap` shadow pred (Headline 2 → flagged)
  - [X] Surface FCA results: 3 FCA-derived propagation rules (predicate→ZKP, offline→SD)
  - [X] **Test in Refinery** — predicate removal evaluation complete
    - [X] Syntax fixes: qualified `Claim::target`, concrete `!exists` for governance subclasses
    - [X] Restructured to imports: `vc_metamodel.refinery`, `governance_conflict.refinery`, `csok_instance.refinery`
    - [X] 4 entry points: `csok.problem` (UNSAT), `csok_no_conflict` / `csok_no_gdpr` / `csok_no_eidas` (all SAT)
    - [X] `check -k` confirms `governance_conflict(IncomeCred, income_format): error`
    - [X] `generate` confirms SAT variants produce valid models

## Advisor feedback (2026-03-25) — Prompt Pipeline

Raw notes archived to `archive/meeting_notes_2026-03-25.md`.
Prompts in `prompts/2026-03-26_01` through `_08`. Execute in phases below.

### Execution pipeline

```
Phase 1 (parallel):   P01 DCL rename research     → prompts/2026-03-26_01_cpl_rename_research.md
                      P02 ARF 5.3.4 gap analysis   → prompts/2026-03-26_02_arf_gap_analysis.md

Phase 2 (parallel):   P03 Sec 03 restructure       → prompts/2026-03-26_03_sec03_restructure.md
                      P04 Sec 05 restructure       → prompts/2026-03-26_04_sec05_restructure.md

Phase 3 (parallel):   P05 Intro/Abstract framing   → prompts/2026-03-26_05_intro_abstract_framing.md
                      P06 Sec 04 usage modes       → prompts/2026-03-26_06_sec04_usage_modes.md

Phase 4 (sequential): P07 DCL rename propagate     → prompts/2026-03-26_07_cpl_rename_propagate.md

Phase 5 (sequential): P08 Claim evidence audit     → prompts/2026-03-26_08_claim_evidence_audit.md
```

Each prompt edits downstream prompts in the chain (see “Chain edits” in each prompt).

### Critical (blocks submission)

**Sec 03 restructure → P03** ✅

- [X] Rename header “Motivation” → “Overview”, update `@META` budget (1.0 → ~1.5 pages)
- [X] Add `## Motivation` (3.1) — consolidate M1–M5, draft M3/M4/M5
- [X] Add `## Functional Overview` (3.2) — box/pipeline diagram, three usage modes
- [X] Add `## Usage Workflow` (3.3) — designer walkthrough on CSOK
- [X] Update Intro P5 to reference “Overview”
- [X] Chain edits: P05 placeholders filled (`<<SEC03_STRUCTURE>>`, `<<STRUCTURE_PARA_CURRENT>>`)
- [X] Chain edits: P06 placeholders filled (`<<THREE_MODES_DEFINITION>>`, `<<SEC03_MODE_NAMES>>`)

**Intro/Abstract framing → P05**

- [ ] “scattered” → “collected and formalized” in abstract and intro P2
- [ ] Add emergent interaction argument
- [ ] Add hierarchical vs. peer governance distinction (defense against Reviewer D)
- [ ] Add why existing tools fail argument

### High priority

**Sec 05 restructure → P04** ✅

- [X] Restructure: Elaboration (5.1) + Scalability Measurement (5.2) + Threats to Validity (5.3)
- [X] Reframe VCDM coverage as soundness/completeness (elaboration, not measurement)
- [X] Add baseline comparison scaffold
- [X] Add scalability measurement fixed schema (RQs, domains, setup, results, analysis)
- [X] Chain edit P08 placeholders (`<<EVALUATION_STRUCTURE>>`, `<<EVALUATION_CLAIMS>>`)
- [ ] Create 2–5 model instances of increasing size in `models/`
- [ ] Run scalability measurements in Refinery
- [ ] Design 2 `figure*` scalability diagrams (fig_scalability_validation, fig_scalability_generation)
- [ ] Draft baseline comparison paragraph
- [ ] Draft threats to validity subsection
- [ ] Resolve constraint ID collision: Sec 05 headline prose uses C5/C6/C7 (Sec 04 metamodel constraints) while expressiveness table uses C1/C4/C7 (ARF IDs). "C7" means two different things. Disambiguate during Sec 04 or expressiveness table drafting.

**DCL rename → P01 (research) + P07 (propagate)**

- [X] Research Atkinson & Kühne, de Lara et al. for domain-level layer terminology
- [X] Propose 3–5 alternatives, record in DECISIONS.md → **Domain Concept Layer (DCL)**
- [X] Propagate to all sections, CLAUDE.md, models, abstract → P07

**Three Refinery usage modes → P06**

- [ ] Clarify in Sec 04 preamble and per-subsection: OK / NOT_OK(errors) / GENERATED/UNVIABLE

**ARF 5.3.4 gap analysis → P02** ✅

- [X] Extract constraints from ARF 5.3.4, classify expressibility, feed into Sec 05 table → `archive/arf_5_3_4_gap_analysis.md`
- [X] Chain-edit P04 placeholders (`<<ARF_CONSTRAINTS>>`, `<<METAMODEL_GAPS>>`)
- [ ] (Future work) Address metamodel gaps: attestation qualification level hierarchy, per-claim SD annotation, SD mechanism distinction

**Cite Nour's STAF/JOT paper** — ⚠️ BLOCKED on double-blind decision (Martin checking with Oszkár)

- Reference obtained: Al-Gburi, Földvári, Marussy, Semeráth, Kocsis — "A Four-Layer Modeling Framework for Policy-Driven Design in Hyperledger Fabric" — JOT (STAF 2026), to appear. PDF in `references/STAF_2026_paper_51.pdf`.
- Double-blind concern: Semeráth and Kocsis are co-authors on both papers. Citing reveals shared group. Martin discussing with Oszkár.
- [ ] Resolve double-blind citation strategy (cite in third person / omit / anonymize)
- [ ] Add to Zotero as "to appear" once strategy decided
- [ ] Cite in Sec 02.3 (Refinery — sibling layered metamodel application) and Sec 05 (measurement setup — emulate their RQ/scalability methodology) [Oszkár]

**Claim evidence audit → P08 (last)**

- [ ] Re-run `skills/claim_evidence_audit` against abstract after all restructuring

### Medium / External

- [ ] **Research governance frameworks beyond ARF sectorial rulebooks** — other formal specs (ISO, NIST, sector EU regs) imposing credential design constraints? [Imre]
- [ ] **Anonymize supplementary material** — randomize naming, upload only for review period, ensure double-blind [Oszkár]
- [ ] **(Martin)** Include rendered Refinery model SVG in teaser figure [Oszkár's suggestion]
- [ ] **(Martin)** Create Teams group for paper coordination

## Per-section drafting (priority order)

- [ ] **Draft Section 04 (Approach)** — core contribution, everything depends on it
  - [ ] 4.1 Domain Concept Layer — metaclasses, constraints, CSOK DCL example (scaffolded)
  - [ ] 4.2 Credential Schema Layer — metaclasses, trace mappings, CSOK CSL example (scaffolded)
  - [ ] 4.3 Format-Specific Layer — metaclasses, FCA-derived constraints, CSOK FSL example (scaffolded)
  - [ ] 4.4 Cross-Layer Constraints — trace consistency, entity alignment, constraint catalog (scaffolded), DCL restructuring worked example (scaffolded)
  - [X] Surface FCA results for format-specific layer constraints (done in `models/csok.problem`)
- [ ] **Draft Section 03 (Overview)** — restructured per Oszkár feedback (was "Motivation")
  - [X] 3.1 Motivation: M1-M2 CSOK scenario (existing), M3 single-layer failure, M4 governance complication, M5 problem statement — all drafted
  - [X] 3.2 Functional Overview: figure placeholder + 2 paragraphs (3 modes: OK / NOT_OK / GENERATED|UNVIABLE)
  - [X] 3.3 Usage Workflow: designer walkthrough on CSOK example
  - [ ] Martin review: polish M3/M4/M5 prose, verify Functional Overview framing
  - [ ] Verify M3 "predicate proofs" term is introduced in Sec 02 before first use in Sec 03
  - [ ] Confirm "hierarchical vs. peer" governance argument lives in M4 only — tell P05 not to duplicate in Intro P2
  - [ ] Usage Workflow ending hedges ("or returns UNVIABLE") — commit to one CSOK outcome once Refinery result is known
- [ ] **Draft Section 05 (Evaluation)** — restructured per Oszkár feedback: elaboration + structured measurement
  - [ ] 5.1 Elaboration: VCDM coverage (soundness/completeness), constraint expressiveness table + ARF 5.3.4 constraints, two headline results (scaffolded), anti-pattern detection, baseline comparison
  - [ ] 5.2 Scalability Measurement: RQs, 2–5 model instances, measurement setup, 2 `figure*` diagrams, analysis
  - [ ] 5.3 Threats to Validity: internal, external, construct, conclusion
- [ ] **Draft Section 01 (Introduction)** — finalize after approach stabilizes
- [ ] **Draft Section 02 (Background)** — determined by what approach needs reader to know
  - [ ] 2.1 W3C VCDM 2.0
  - [ ] 2.2 Multi-Level Modeling (Atkinson & Kühne)
  - [ ] 2.3 Refinery
- [ ] **Draft Sections 06-07 (Related Work, Conclusion)** — last

## Other tasks

- [ ] Confirm VENUE.md exemplar papers → `prompts/2026-03-24_01_exemplar_papers.md`
- [X] Run `skills/gap_analysis` → 7 RQs tested, synthesis in `archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md`
- [X] Run `skills/related_work_positioning` — scaffold updated, re-run after gap analysis + more drafting
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

| Date       | Task                                      | Notes                                                                                                                                                                                                                                                                                              |
| ------------ | ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 2026-03-24 | Paste CFP into CFP.md                     | MODELS 2026 Foundations Track                                                                                                                                                                                                                                                                      |
| 2026-03-24 | Run`skills/cfp_import` → derive VENUE.md | Deadlines, format, review type populated                                                                                                                                                                                                                                                           |
| 2026-03-24 | Run`skills/abstract_scaffold`             | Draft in`sections/00_abstract.md`. 3 title candidates. 10 binding claims identified (3 high-risk).                                                                                                                                                                                                 |
| 2026-03-24 | Run`skills/reviewer_personas`             | 4 personas populated in VENUE.md with calibration guidance (significance, rigor, explanation floor, defense points)                                                                                                                                                                                |
| 2026-03-24 | Build pandoc pipeline                     | `build.sh`, `tex/main.tex`, Lua filters in `pandoc/filters/`. Citations and figures filters are stubs. Needs pandoc install to test.                                                                                                                                                               |
| 2026-03-24 | Run`skills/section_scaffold`              | 7 section files created in`sections/`. Intro has P1-P5 skeleton with structure paragraph. All sections have per-paragraph guidance with markers. DECISIONS.md updated with title, framing, terminology, examples, teaser figure decisions.                                                         |
| 2026-03-25 | Run`skills/gap_analysis`                  | 7 RQs tested. Core novelty CLEAR. C5 corrected (MDE has been applied to SSI — 4 papers). ~20 papers to cite. 5 differentiation arguments. Synthesis in`archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md`. Sec 06 scaffold updated.                                                                   |
| 2026-03-25 | CSOK Refinery formalization (Pass 2)      | `models/csok.problem` written. Evolved metamodel: single abstract format containment, 5 format classes, GovernanceAnnotation markers, FCA propagation rules. Two headline results encoded: `governance_conflict` error (UNSAT), `cross_cred_predicate_gap` shadow pred. Awaiting Refinery testing. |
