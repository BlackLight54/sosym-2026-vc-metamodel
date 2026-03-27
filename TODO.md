# TODO

## Current focus — Consolidation workflow (2026-03-27)

Plan: `prompts/2026-03-27_consolidation/` — 12 prompt files (T00–T10).
Full plan: `.claude/plans/linked-petting-prism.md`.
Pipeline & dependency diagram: `prompts/2026-03-27_consolidation/PIPELINE.md`.
Critical path: **T00 ✅ → T00b ✅ → T01 ✅/T02 ✅ → T07 → T08 → T09 → T10**

- [x] **T00b**: Scaffold/placeholder merging — merge `@SCAFFOLD`+`@TODO: PLACEHOLDER` pairs into clean `@TODO` blocks
- [x] **T01**: Sec 04 Preamble + DCL definitions (A1, A2) — [Binding #1, #3]
- [x] **T02**: Sec 04 CSL definitions (A4, A5, A6) — [Binding #1, #3]
- [x] **T03**: Sec 04 FSL definitions (A8, A9) — [Binding #1]
- [x] **T04**: Sec 02 Background (B1–B7, all) — [predicate proofs MUST be introduced here]
- [x] **T05**: Sec 06 Related Work (R1–R4, all) — [D5 preemption critical]
- [x] **T06**: Sec 07 Conclusion (C1–C4, all)
- [ ] **T07**: Sec 04 Cross-layer constraints (A12–A15) — after T01+T02 — [Binding #3 CORE]
- [ ] **T08**: Sec 05 Elaboration (coverage, expressiveness, anti-patterns, baseline) — after T01-T03+T07 — [Binding #5, #6, #7, #9]
- [ ] **T09**: Sec 05 Threats + Scalability — after T08 — [scalability data may be interactive]
- [ ] **T10**: Final polish (eval preamble, Intro P5, abstract numbers) — after T08+T09 — [Binding #10]

## Advisor feedback — remaining work

Raw notes: `archive/meeting_notes_2026-03-25.md`.
Prompts archived to `prompts/.archive/2026-03-26_*.md`.
Pipeline: `prompts/.archive/2026-03-26_pipeline.md` — all phases completed except P06 (below).

### Sec 05 scalability & measurement (from P04)

Structure completed ✅ (Elaboration 5.1 + Scalability 5.2 + Threats 5.3). Remaining:

- [x] Create 2–5 model instances of increasing size in `models/`
- [x] Run scalability measurements in Refinery
- [ ] Design 2 `figure*` scalability diagrams (fig_scalability_validation, fig_scalability_generation)
- [ ] Draft baseline comparison paragraph
- [ ] Draft threats to validity subsection
- [ ] Resolve constraint ID collision: prefix ARF IDs (ARF-C1, ARF-C4, ARF-C7) in expressiveness table; paper-internal C1–C9 unchanged. Decision from audit 2026-03-26.

### Refinery usage modes (P06)

- [ ] Clarify in Sec 04 preamble and per-subsection: OK / NOT_OK(errors) / GENERATED/UNVIABLE

### ARF gap analysis — future work (from P02)

Main analysis completed ✅ → `archive/arf_5_3_4_gap_analysis.md`. Remaining:

- [ ] (Future work) Address metamodel gaps: attestation qualification level hierarchy, per-claim SD annotation, SD mechanism distinction

### Nour's STAF/JOT paper — ⚠️ BLOCKED on double-blind decision

Reference obtained: Al-Gburi, Földvári, Marussy, Semeráth, Kocsis — "A Four-Layer Modeling Framework for Policy-Driven Design in Hyperledger Fabric" — JOT (STAF 2026), to appear. PDF in `references/STAF_2026_paper_51.pdf`.
Double-blind concern: Semeráth and Kocsis are co-authors on both papers. Citing reveals shared group. Martin discussing with Oszkár.

- [ ] Resolve double-blind citation strategy (cite in third person / omit / anonymize)
- [ ] Add to Zotero as "to appear" once strategy decided
- [ ] Cite in Sec 02.3 (Refinery — sibling layered metamodel application) and Sec 05 (measurement setup — emulate their RQ/scalability methodology) [Oszkár]

### External coordination

- [ ] **Research governance frameworks beyond ARF sectorial rulebooks** — other formal specs (ISO, NIST, sector EU regs) imposing credential design constraints? [Imre]
- [ ] **Anonymize supplementary material** — randomize naming, upload only for review period, ensure double-blind [Oszkár]
- [ ] **(Martin)** Include rendered Refinery model SVG in teaser figure [Oszkár's suggestion]
- [ ] **(Martin)** Create Teams group for paper coordination

## Claim evidence audit — remaining (2026-03-26)

Binding claims status: 1/10 delivered, 5/10 partial, 4/10 not yet. Grace period: deadline ~2026-03-29.

- [ ] Update Intro P5 structure paragraph to mention §5.2 Scalability Measurement
- [ ] Add scalability mention to abstract evidence sentence when measurements ready

### Drafting priority reference

| Priority | Section                                                    | Binding claims   | Notes                                       |
| -------- | ---------------------------------------------------------- | ---------------- | ------------------------------------------- |
| P1       | Sec 04 definitions (preamble, A1–A2, A4–A6, A8, A12–A13)  | #1, #3           | Core contribution — mathematician reviewer  |
| P2       | Sec 05.1.2 expressiveness table (ARF-prefixed IDs)         | #6 [HIGH RISK]   | Data in `archive/arf_5_3_4_gap_analysis.md`  |
| P3       | Sec 02 background (§2.1, §2.2, §2.3)                      | (explanation floor) | Reviewer C accessibility                  |
| P4       | Sec 05.1.1 coverage characterization                       | #5               | Brief soundness/completeness                |
| P5       | Sec 05.1.4 anti-pattern detection                          | #7               | Table + multi-layer visibility              |
| P6       | Intro/Abstract polish                                      | #10              | Structure paragraph, framing                |
| P7       | Sec 07 conclusion                                          | —                | Summary + future work                       |
| P8       | Sec 06 related work                                        | —                | D5 preemption at minimum                    |

## Per-section drafting — subsection details

Cross-references T01–T10 in Consolidation workflow above. Subsection-level tracking below.

- [ ] **Section 04 (Approach)** — core contribution, everything depends on it
  - [x] 4.1 Domain Concept Layer — metaclasses, constraints, CSOK DCL example (drafted)
  - [x] 4.2 Credential Schema Layer — metaclasses, trace mappings, CSOK CSL example (drafted)
  - [x] 4.3 Format-Specific Layer — metaclasses, format capability constraints, CSOK FSL example (drafted)
  - [ ] 4.4 Cross-Layer Constraints — trace consistency, entity alignment, constraint catalog (scaffolded), DCL restructuring worked example (scaffolded)
  - [X] Surface format capability results for format-specific layer constraints (done in `models/csok.problem`)
- [ ] **Section 03 (Overview)** — restructured per Oszkár feedback (was "Motivation")
  - [X] 3.1 Motivation: M1-M2 CSOK scenario (existing), M3 single-layer failure, M4 governance complication, M5 problem statement — all drafted
  - [X] 3.2 Functional Overview: figure placeholder + 2 paragraphs (3 modes: OK / NOT_OK / GENERATED|UNVIABLE)
  - [X] 3.3 Usage Workflow: designer walkthrough on CSOK example
  - [ ] Martin review: polish M3/M4/M5 prose, verify Functional Overview framing
  - [x] Verify M3 "predicate proofs" term is introduced in Sec 02 before first use in Sec 03
  - [x] Confirm "hierarchical vs. peer" governance argument lives in M4 only — tell P05 not to duplicate in Intro P2
  - [ ] Usage Workflow ending hedges ("or returns UNVIABLE") — commit to one CSOK outcome once Refinery result is known
- [ ] **Section 05 (Evaluation)** — restructured per Oszkár feedback: elaboration + structured measurement
  - [ ] 5.1 Elaboration: VCDM coverage (soundness/completeness), constraint expressiveness table + ARF 5.3.4 constraints, two headline results (scaffolded), anti-pattern detection, baseline comparison
  - [ ] 5.2 Scalability Measurement: RQs, 2–5 model instances, measurement setup, 2 `figure*` diagrams, analysis
  - [ ] 5.3 Threats to Validity: internal, external, construct, conclusion
- [x] **Section 01 (Introduction)** — fully drafted, pending fig_teaser
- [x] **Section 02 (Background)** — fully drafted, pending Oscar review of B5
  - [x] 2.1 W3C VCDM 2.0
  - [x] 2.2 Multi-Level Modeling (Atkinson & Kühne)
  - [x] 2.3 Refinery
- [x] **Sections 06-07 (Related Work, Conclusion)** — fully drafted

## Other tasks

Items duplicated in the prompt pipeline below (O01–O05) are tracked there. Unique remaining items:

- [x] Incorporate gap analysis citations into Sec 06 scaffold (Tier 1 + Tier 2 papers) — feeds T05
- [x] Write differentiation paragraphs for Sec 06.2 (ChorSSI, SecureSSI, Pattiyanon, Braun et al., King et al.) — feeds T05

## Other tasks — Prompt Pipeline

Pipeline & task details: `prompts/2026-03-27 other tasks/PIPELINE.md`.

- [ ] **O01**: Verify Ding & Sato 2023, Verify Schardong & Custodio 2024, update `[VERIFY]` markers
- [ ] **O02**: (Optional) Supplementary ACM DL/DBLP search
- [ ] **O03**: Soften C5 in abstract + intro P2 (after O01)
- [ ] **O04**: Run `skills/evaluation_design`, map contributions to evaluation questions (after T01–T03)
- [ ] **O05**: Design fig_teaser, fig_metamodel, write `figures/STYLE.md` (after T01–T03)

---

## Done

| Date       | Task                                      | Notes                                                                                                                                                                                                                                                                                              |
| ---------- | ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 2026-03-24 | Initialize project                        | Paste CFP, run `skills/cfp_import`, write thesis in CLAUDE.md                                                                                                                                                                                                                                      |
| 2026-03-24 | Submit abstract                           |                                                                                                                                                                                                                                                                                                    |
| 2026-03-24 | Paste CFP into CFP.md                     | MODELS 2026 Foundations Track                                                                                                                                                                                                                                                                      |
| 2026-03-24 | Run `skills/cfp_import` → derive VENUE.md | Deadlines, format, review type populated                                                                                                                                                                                                                                                           |
| 2026-03-24 | Run `skills/reviewer_personas`            | 4 personas populated in VENUE.md with calibration guidance (significance, rigor, explanation floor, defense points)                                                                                                                                                                                 |
| 2026-03-24 | Run `skills/abstract_scaffold`            | Draft in `sections/00_abstract.md`. 3 title candidates. 10 binding claims identified (3 high-risk).                                                                                                                                                                                                |
| 2026-03-24 | Run `skills/section_scaffold`             | 7 section files created in `sections/`. Intro has P1-P5 skeleton with structure paragraph. All sections have per-paragraph guidance with markers. DECISIONS.md updated with title, framing, terminology, examples, teaser figure decisions.                                                         |
| 2026-03-24 | Build pandoc pipeline                     | `build.sh`, `tex/main.tex`, Lua filters in `pandoc/filters/`. Citations and figures filters are stubs. Needs pandoc install to test.                                                                                                                                                               |
| 2026-03-24 | Confirm VENUE.md exemplar papers          | 2 papers from Oszkár's group (MODELS 2020, MODELS 2013)                                                                                                                                                                                                                                           |
| 2026-03-24 | Design CSOK running example               | Researched eligibility, simplified to 4-5 entities/3 credentials. Governance conflict (eIDAS/GDPR/VCDM on IncomeCred) and cross-credential predicate gap identified. 5 decisions in DECISIONS.md. → `prompts/2026-03-24_06_csok_running_example.md`                                                |
| 2026-03-24 | Develop cross-governance conflict example | Two headline results designed (Binding claim #8).                                                                                                                                                                                                                                                  |
| 2026-03-25 | Run `skills/gap_analysis`                 | 7 RQs tested. Core novelty CLEAR. C5 corrected (MDE has been applied to SSI — 4 papers). ~20 papers to cite. 5 differentiation arguments. Synthesis in `archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md`. Sec 06 scaffold updated.                                                                   |
| 2026-03-25 | Create Refinery language guide            | `.claude/skills/refinery/` — `.problem` syntax, three-layer pattern, instance writing, curated examples, `run_refinery.sh` CLI wrapper.                                                                                                                                                            |
| 2026-03-25 | CSOK Refinery formalization (Pass 2)      | `models/csok.problem` written. Evolved metamodel: single abstract format containment, 5 format classes, GovernanceAnnotation markers, format capability propagation rules. Two headline results encoded: `governance_conflict` error (UNSAT), `cross_cred_predicate_gap` shadow pred.                             |
| 2026-03-25 | Refinery testing complete                 | Syntax fixes, restructured to imports (`vc_metamodel.refinery`, `governance_conflict.refinery`, `csok_instance.refinery`). 4 entry points: `csok.problem` (UNSAT), 3 SAT variants. `check -k` and `generate` both verified.                                                                       |
| 2026-03-25 | Reframe as multi-level metamodeling       | No MDA terminology (CIM/PIM/PSM). Layer names chosen. DECISIONS.md updated.                                                                                                                                                                                                                        |
| 2026-03-25 | Remove ifblinded from LaTeX               | Anonymization handled by document style properties.                                                                                                                                                                                                                                                |
| 2026-03-26 | DCL rename (P01 research + P07 propagate) | Researched Atkinson & Kühne, de Lara et al. Proposed 5 alternatives → selected Domain Concept Layer (DCL). Propagated to all sections, CLAUDE.md, models, abstract.                                                                                                                                |
| 2026-03-26 | ARF 5.3.4 gap analysis (P02)             | Constraints extracted, classified, fed into Sec 05 table → `archive/arf_5_3_4_gap_analysis.md`. P04 chain edits completed. Future work gaps identified (remaining items above).                                                                                                                     |
| 2026-03-26 | Sec 03 restructure (P03)                  | Renamed Motivation → Overview. Added 3.1 Motivation (M1-M5 drafted), 3.2 Functional Overview, 3.3 Usage Workflow. Intro P5 updated. P05/P06 chain edits completed.                                                                                                                                |
| 2026-03-26 | Sec 05 restructure — structure (P04)      | Restructured to Elaboration (5.1) + Scalability (5.2) + Threats (5.3). VCDM coverage reframed as soundness/completeness. Baseline comparison and scalability measurement scaffolded. P08 chain edits completed. Measurement items still pending (remaining items above).                            |
| 2026-03-26 | Intro/Abstract framing (P05)              | "scattered" → "collected and formalized". Emergent interaction argument, hierarchical vs. peer governance distinction, why existing tools fail argument added.                                                                                                                                      |
| 2026-03-26 | Claim evidence audit (P08)                | 1/10 binding claims delivered, 5/10 partial, 4/10 not yet. Headline results (Claim #8) strongest section. Terminology clean (no CPL orphans). Critical: Sec 04.4 cross-ref "5.3"→"5.1.3", constraint ID collision (resolved: ARF-prefix). Scalability kept (Oszkár helping). Baseline kept as short placeholder. |
| 2026-03-26 | Run `skills/related_work_positioning`     | Scaffold updated, re-run needed after gap analysis + more drafting.                                                                                                                                                                                                                                |
| 2026-03-26 | Fix cross-ref Sec 04:155                  | "Section 5.3" → "Section 5.1.3" (headline results moved after Sec 05 restructure). Done in T00.                                                                                                                                                                                                   |
| 2026-03-27 | Create consolidation prompts (T00–T10)    | 12 prompt files in `prompts/2026-03-27_consolidation/`.                                                                                                                                                                                                                                            |
| 2026-03-27 | T00 file restructuring                    | Rename, LaTeX labels, cross-refs, stale metadata, duplicate markers. Title updated in `tex/main.tex`.                                                                                                                                                                                              |
