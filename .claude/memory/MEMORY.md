# Decisions

- [Repo structure: sosym-2026-vc-metamodel is main](decision_repo_structure_sosym.md) — Overleaf attaches at the edge; ACM-MODELS-26 frozen

- [Modeling-first framing](decision_modeling_first_framing.md) — metamodeling, not detection
- [Domain: MDE](decision_domain_mde.md) — MDE venue, not formal methods
- [No MDA terminology](decision_no_mda_terminology.md) — hard constraint from advisor
- [CSOK running example](decision_csok_running_example.md) — simplified Hungarian housing subsidy scenario
- [Motivation ends with problem statement](decision_motivation_problem_statement.md) — no results in Sec 03
- [Teaser figure](decision_teaser_figure.md) — CSOK three-layer unified visual
- [C5 claim correction](decision_c5_claim_correction.md) — MDE applied to SSI, scope to intersection
- [Gap analysis confirmed](decision_gap_analysis_confirmed.md) — core novelty stands, proceed with drafting
- [CSOK naming](decision_csok_naming.md) — "family housing subsidy" in body, Hungarian in footnote
- [GDPR two-tier framing](decision_gdpr_two_tier.md) — eIDAS hard, GDPR operationally binding
- [Format-driven DCL restructuring](decision_format_driven_restructuring.md) — FSL limitation propagates upward
- [mdoc simplified away](decision_mdoc_simplified.md) — SD-JWT-VC only in running example
- [Two headline results](decision_two_headline_results.md) — income conflict (vertical) + floor area gap (horizontal)
- [DCL rename](decision_dcl_rename.md) — CPL → Domain Concept Layer
- [No code listings](decision_no_code_listings.md) — PARTIALLY SUPERSEDED: selected Refinery listings now in body
- [Refinery code in paper](decision_refinery_code_in_paper.md) — add lstlisting code in BG + approach; replaces verbose prose
- [BG notation consistency](decision_bg_notation_consistency.md) — define Refinery terms in BG, reference via autoref elsewhere
- [Shorten conclusion](decision_conclusion_shortened.md) — limitations+future work → eval; conclusion ≤2 paragraphs
- [Type graph rename](decision_type_graph_rename.md) — fig:metamodel caption "type graph" not "metamodel"; move near constraint table
- [Gap framing: formalized](decision_gap_framing_formalized.md) — "collected and formalized" not "scattered across"
- [Emergent constraint interactions](decision_emergent_constraint_interactions.md) — cross-layer interactions unpredictable without joint analysis
- [Competing peer requirements](decision_competing_peer_requirements.md) — non-hierarchical stakeholders, goals may conflict
- [Novel tooling justification](decision_novel_tooling_justification.md) — must explain why OCL/Alloy/manual insufficient
- [Sec 03 Overview restructure](decision_sec03_overview_restructure.md) — Motivation + Functional Overview + Usage Workflow
- [Evaluation measurement schema](decision_evaluation_measurement_schema.md) — ≥2 pages, fixed schema (RQs, domains, setup, results, threats)
- [VCDM coverage = elaboration](decision_vcdm_coverage_elaboration.md) — soundness/completeness, not measurement metric
- [Error detection vs. DSE](decision_error_detection_vs_dse.md) — two distinct Refinery modalities
- [Formal claims required](decision_formal_claims_required.md) — paper needs explicit formalizable claims, not vague contributions
- [Soundness/completeness](decision_soundness_completeness.md) — core guarantees: invalid=truly invalid, generated models satisfy constraints
- [CORE-DISC properties](decision_core_disc_properties.md) — Consistency primary, Diverse/Scalable addressed, Realistic out of scope
- [Range proofs = future work](decision_range_proofs_future_work.md) — out of scope, mention in conclusion
- [Three-axis validation](decision_three_axis_validation.md) — coverage + expressiveness + error detection, structures §5
- [FSL elaboration deferred](decision_fsl_elaboration.md) — intra-layer constraint deferred, defended argumentatively in §4.3
- [Venue: SoSyM committed](decision_venue_sosym.md) — ruled 2026-07-13, D-018; unblocks O-VENUE
- [RQ0 + design-error taxonomy adopted](decision_rq0_taxonomy.md) — RQ0 precedes RQ1-RQ3; X.509-motivated taxonomy closes the paper (D-019, D-020)
- [Q-007 diverse scalability instances in scope](decision_q007_in_scope.md) — R9 closed, instance generator needed (D-021)
- [F8 conflict anatomy committed](decision_f8_committed.md) — figure set gains F8, pre-empts O5 (D-022)
- [Industry 5.0 rejected as spin](decision_industry5_not_spin.md) — stays an SLR axis (c) probe; revisit only with corpus evidence (D-023)

# Claims

- [Claim 1: Three-layer metamodel](claim_01_three_layer.md) — DCL + CSL + FSL (partial)
- [Claim 2: VCDM grounding](claim_02_vcdm_grounding.md) — mapping to W3C VCDM 2.0 (partial)
- [Claim 3: Cross-layer constraints](claim_03_cross_layer_constraints.md) — Refinery graph predicates (partial)
- [Claim 4: Automated consistency](claim_04_automated_consistency.md) — design space exploration demo (partial)
- [Claim 5: Coverage validation](claim_05_coverage_validation.md) — vs. W3C spec (partial)
- [Claim 6: Expressiveness validation](claim_06_expressiveness_validation.md) — vs. EU regulatory sources (partial)
- [Claim 7: Anti-pattern detection](claim_07_antipattern_detection.md) — error detection vs. known anti-patterns (partial)
- [Claim 8: Contradictory constraints](claim_08_contradictory_constraints.md) — cross-framework formal contradiction (partial)
- [Claim 9: Multi-layer invisibility](claim_09_multilayer_invisibility.md) — errors invisible to single-layer inspection (partial)
- [Claim 10: Necessity argument](claim_10_necessity_argument.md) — multi-layer modeling as prerequisite (delivered)

# Feedback

- [Edit Markdown not LaTeX](feedback_edit_markdown_not_latex.md) — always edit sections/*.md
- [Todos as prompts](feedback_todos_as_prompts.md) — todos must be self-contained, executable by a fresh agent
- [No plan-mode instructions](feedback_no_plan_mode_instructions.md) — Martin uses Claude Code's built-in plan mode
- [Conversation title = todo ID](feedback_conversation_title_todo_id.md) — first message starts with todo ID
- [Justify tooling concretely](feedback_justify_tooling.md) — Refinery guarantees on partial models, not generic "we need a tool"
- [Introduce all notation](feedback_notation_introduction.md) — no Refinery concept or math symbol without prior definition
- [Concrete not abstract](feedback_concrete_not_abstract.md) — use examples and plain language, not dense abstract compression
- [Show context in plan edits](feedback_plan_edits_show_context.md) — always show surrounding text when proposing edits in plans
- [Defensive one-liners work](feedback_defensive_one_liners.md) — 1-2 sentence additions mapped to reviewer archetypes, validated by Martin+Oszkár
- [Keep cutcandidate wrappers](feedback_keep_cutcandidates.md) — don't remove .cutcandidate annotations without explicit approval
- [Explain why, not just what](feedback_explain_why_not_just_what.md) — comparative claims need mechanism, not just difference
- [Keep annotation divs](feedback_keep_annotation_divs.md) — fill .formal/.todo divs with content inside the div, don't replace with prose
- [Deliver on claims, don't cut](feedback_deliver_not_cut.md) — ground ungrounded claims in existing content before removing them
- [Prefer Pandoc-compliant solutions](feedback_pandoc_compliant_solutions.md) — Lua filters over raw LaTeX workarounds
- [figures.lua filter active](project_figures_lua_filter.md) — emits ACM \Description{} from image description attribute

Superseded memories → `context/archive/`, never deleted
