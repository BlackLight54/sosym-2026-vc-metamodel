# Todo Index

## Critical path — paper content

| ID | Title | Binding | Status | Assigned |
|----|-------|---------|--------|----------|
| T07 | [Sec 04 cross-layer constraints](t07_cross_layer.md) | #3 | done | claude |
| T08 | [Sec 05 elaboration](t08_evaluation.md) | #5,6,7,9 | done | claude |
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
| O-MODES | [Usage modes (Sec 03 + 04)](o-modes_usage_modes.md) | #4 | pending | claude |
| O-REFBG | [Refinery BG — code examples + missing concepts](o-refinery-bg.md) | #3,4 | pending | oszkár |
| O-4VAL | [Fix three→four-valued throughout](o-4val.md) | #3 | pending | oszkár |

## Writing fixes (cross-cutting)

| ID | Title | Status | Assigned |
|----|-------|--------|----------|
| X01 | [GDPR hedge in abstract](x01_abstract_gdpr_hedge.md) | pending | claude |
| X04 | [Concrete Refinery output](x04_tool_demonstration.md) | pending | martin |
| X05 | [Sec 4→5 transition](x05_sec4_to_sec5_bridge.md) | pending | claude |
| X07 | [Income variable drift](x07_income_variable_drift.md) | done (Z-P2) | claude |
| X11 | [Prior work extension substance](x11_prior_work_extension_substance.md) | pending | claude |
| X14 | [Refinery terminology introduction](x14_refinery_terminology_introduction.md) | pending | claude |
| O03 | [Soften C5 claim](o03_soften_c5.md) | pending | claude |

## References and citations

| ID | Title | Status | Assigned |
|----|-------|--------|----------|
| O01 | [Verify Ding & Sato, Schardong](o01_verify_refs.md) | pending | claude |
| M00a | [Noor ECMFA differentiation](m00a_noor_ecmfa_differentiation.md) | pending | martin |
| O-STAF | [STAF citation strategy](o-staf_staf_citation.md) | blocked | martin |

## External / human tasks

| ID | Title | Status | Assigned |
|----|-------|--------|----------|
| O-GOV | [Governance research beyond ARF](../archive/completed_todos/o-gov_gov_research.md) | deferred → future work | imre |
| O-ANON | [Anonymize supplementary](o-anon_anonymize.md) | pending | oszkár |
| O-S03 | [Sec 03 polish](../archive/completed_todos/o-s03_sec03_review.md) | done | martin |

## Z01 triage pipeline

Execution order: Z-P2 → Z-P1 → Z-P3 → Z-P4.

| ID | Title | Depends on | Status | Assigned |
|----|-------|------------|--------|----------|
| Z-P2 | [BG + Related Work + multi-layer rename](z-p2_bg_rw_rename.md) | — | done | claude |
| Z-P1 | [Abstract + Intro fixes](z-p1_abstract_intro.md) | Z-P2 | pending | claude |
| Z-P3 | [Approach — FSL elaboration + gaps](z-p3_approach_fsl.md) | Z-P2 | pending | claude |
| Z-P4 | [Eval polish + Conclusion](z-p4_eval_conclusion.md) | T08 | done | claude |

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
| M00 | [Process Oszkár notes](m00_process_advisor_notes_from_oszkár.md) | pending | claude |
| M22 | [Migrate to native Tasks](m22_migrate_to_native_tasks.md) | pending | claude |

## Absorbed (merged into surviving todos)

Archived to `context/archive/completed_todos/`. Parent todo noted below.

- O-THREATS → T09, O-FIG → T09, O-BASE → T08, O-ARF → T08, O-P5 → T10
- X03 → T08, X06 → T09, X08 → T10, X09 → T08, X10 → T07, X12 → O-MODES, X13 → T08
