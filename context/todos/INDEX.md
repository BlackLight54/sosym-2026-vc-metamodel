# Todo Index

## Critical path — paper content

| ID | Title | Binding | Status | Assigned |
|----|-------|---------|--------|----------|
| T09 | [Sec 05 threats + scalability](t09_threats_scalability.md) | — | pending | claude |
| T10 | [Final polish](t10_polish.md) | #10 | pending | claude |
| **T12** | **[Reconcile eval instances, measurements, metamodel](t12_eval_consistency.md)** | **#4,5,6,7,9** | **pending** | **claude** |
| O-SOUND | [Soundness/completeness properties](o-soundness-eval.md) | #4,9 | pending | claude |

## Figures

| ID | Title | Status | Assigned |
|----|-------|--------|----------|
| O05 | [Teaser + metamodel figures](o05_teaser_fig.md) | pending | claude |
| T11 | [6 remaining figure placeholders](t11_figure_production.md) | pending | martin |

## Approach refinement

| ID | Title | Binding | Status | Assigned |
|----|-------|---------|--------|----------|
| O-REFBG | [Refinery BG — code examples + missing concepts](o-refinery-bg.md) | #3,4 | pending | oszkár |
| X14 | [Refinery terminology introduction](x14_refinery_terminology_introduction.md) | #3,4 | pending | claude |
| Z-P3 | [Approach — FSL elaboration + gaps](z-p3_approach_fsl.md) | #1,3 | pending | claude |

## Writing fixes (cross-cutting)

| ID | Title | Status | Assigned |
|----|-------|--------|----------|
| X04 | [Concrete Refinery output](x04_tool_demonstration.md) | pending | martin |
| X05 | [Sec 4→5 transition](x05_sec4_to_sec5_bridge.md) | pending | claude |
| X11 | [Prior work extension substance](x11_prior_work_extension_substance.md) | pending | claude |

## References and citations

| ID | Title | Status | Assigned |
|----|-------|--------|----------|
| O01 | [Verify Ding & Sato, Schardong](o01_verify_refs.md) | pending | claude |
| M00a | [Noor ECMFA differentiation](m00a_noor_ecmfa_differentiation.md) | pending | martin |
| O-STAF | [STAF citation strategy](o-staf_staf_citation.md) | blocked | martin |

## External / human tasks

| ID | Title | Status | Assigned |
|----|-------|--------|----------|
| O-ANON | [Anonymize supplementary](o-anon_anonymize.md) | pending | oszkár |

## Integrity audit items

| ID | Title | Binding | Status | Assigned |
|----|-------|---------|--------|----------|
| IA01 | [Placeholder figures](ia01_placeholder_figures.md) | #4,7,9 | pending | martin |
| IA02 | [Headline 1 demonstration](ia02_headline1_demonstration.md) | #4,8 | pending | martin |
| IA03 | [Supplementary readiness](ia03_supplementary_readiness.md) | #3,4 | pending | martin |

## Advisor feedback (2026-03-29)

Execution order: A-LST → A-BG1 → A-CODE, A-FIG, A-CONC → A-BG2 + A-SHORT.

| ID | Title | Depends on | Status | Assigned |
|----|-------|------------|--------|----------|
| A-LST | [Refinery lstlisting language](a-lst_refinery_lstlisting.md) | — | pending | claude |
| A-REBUS | [Rebus preamble elements](a-rebus_preamble.md) | — | pending | martin |
| A-BG1 | [Refinery code example in BG](a-bg1_refinery_bg_example.md) | A-LST | pending | oszkár |
| A-CODE | [Refinery code listings in Sec 04](a-code_refinery_approach_listings.md) | A-LST, A-BG1 | pending | claude |
| A-FIG | [Move figure + rename type graph](a-fig_move_rename_figure.md) | — | pending | claude |
| A-CONC | [Shorten conclusion → eval](a-conc_shorten_conclusion.md) | — | pending | claude |
| A-BG2 | [BG notation consistency in Sec 04](a-bg2_notation_consistency.md) | A-BG1 | pending | claude |
| A-SHORT | [Approach redundancy check](a-short_approach_redundancy.md) | A-BG1, A-BG2 | pending | claude |

Absorbs: X14 → A-BG2. Overlaps: O-REFBG (A-BG1 is the unblocking step).

## Infrastructure

| ID | Title | Status | Assigned |
|----|-------|--------|----------|
| M22 | [Migrate to native Tasks](m22_migrate_to_native_tasks.md) | pending | claude |
| O-MPE | [MPE + Pandoc in-editor preview](o-mpe_markdown_preview_enhanced.md) | pending | martin |

## Completed / Archived

All completed todos are in `context/archive/completed_todos/`. Key completions:

- T07 (cross-layer constraints), T08 (eval elaboration), Z-P1 (abstract+intro), Z-P2 (BG+RW rename), Z-P4 (eval+conclusion)
- O-MODES (usage modes), O-4VAL (four-valued fix), X01 (GDPR hedge), X07 (income variable drift)
- M00 (advisor notes processing), plus 60+ infrastructure and consolidation todos
