# Skills

Automated skills for mechanical parts of the paper writing process. Each skill is a folder with a `SKILL.md` entry point. Skills are organized by category prefix.

## Available skills

### `setup_` — Project initialization

| Skill | Trigger | What it does |
|-------|---------|-------------|
| [`setup_abstract_scaffold`](setup_abstract_scaffold/SKILL.md) | "Draft the abstract" | Thesis → abstract + champion test + title candidates |
| [`setup_cfp_import`](setup_cfp_import/SKILL.md) | "Import CFP from [URL]" | Fetches CFP, populates context/CFP.md, derives context/VENUE.md |
| [`setup_reviewer_personas`](setup_reviewer_personas/SKILL.md) | "Generate reviewer personas" | 4 context-dependent personas, improves with more paper |
| [`setup_section_scaffold`](setup_section_scaffold/SKILL.md) | "Scaffold the paper" | Creates format-aware section files with budget |

### `research_` — Literature & gap analysis

| Skill | Trigger | What it does |
|-------|---------|-------------|
| [`research_gap_analysis`](research_gap_analysis/SKILL.md) | "Generate research questions" | Thesis → agent-ready prompt files in `prompts/` |
| [`research_prior_work_import`](research_prior_work_import/SKILL.md) | "Import these references" | DOIs/BibTeX → structured reference notes |
| [`research_related_work_positioning`](research_related_work_positioning/SKILL.md) | "Build comparison matrix" | Positioning statements + comparison matrix |

### `draft_` — Drafting & writing

| Skill | Trigger | What it does |
|-------|---------|-------------|
| [`draft_bibliography`](draft_bibliography/SKILL.md) | "Resolve citations" / "Fix cite markers" | Resolves `.cite` annotation markers → BibTeX keys, tracks Zotero sync needs |
| [`draft_evaluation_design`](draft_evaluation_design/SKILL.md) | "Design the evaluation" | Maps contributions → evaluation questions → methods |
| [`draft_evaluation_execution`](draft_evaluation_execution/SKILL.md) | "Evaluation checklist" / "What do I still need to run?" | Tracks proof/tool/case-study execution status, dependencies, acceptance criteria |
| [`draft_figure_design`](draft_figure_design/SKILL.md) | "Propose a figure" / "Design figures" | Audit, design, draft, and iterate figures with Nature-style guidance |
| [`draft_limitations_threats`](draft_limitations_threats/SKILL.md) | "Write the limitations" | Derives limitations from assumptions, evaluation scope, reviewer attacks |
| [`draft_notation_table`](draft_notation_table/SKILL.md) | "Check notation" / "Generate notation table" | Scans sections for symbols, checks consistency |
| [`draft_structure_paragraph`](draft_structure_paragraph/SKILL.md) | "Update the structure paragraph" | Generates/updates intro P5 from section inventory |

### `review_` — Quality & audits

| Skill | Trigger | What it does |
|-------|---------|-------------|
| [`review_champion_test`](review_champion_test/SKILL.md) | "Would anyone champion this paper?" | Evaluates whether the paper has a champion-worthy insight and whether it's visible |
| [`review_claim_evidence_audit`](review_claim_evidence_audit/SKILL.md) | "Audit claims" / "Map contributions" | Contribution mapping + full claim–evidence check |
| [`review_final_review`](review_final_review/SKILL.md) | "Final review" | Orchestrator: coherence, champion test, reviewer sim |
| [`review_integrity_audit`](review_integrity_audit/SKILL.md) | "Run integrity audit" / "Ethics check" | Factual accuracy, citation honesty, anonymity, overclaiming, LLM tells |
| [`review_paper_audit`](review_paper_audit/SKILL.md) | "Full paper audit" | Reads all sections, cross-references claims, decisions, gaps, personas |
| [`review_paper_status`](review_paper_status/SKILL.md) | "Where are we?" / session start | Lightweight dashboard: section maturity, markers, figures, time-to-deadline |
| [`review_pre_submission_check`](review_pre_submission_check/SKILL.md) | "Check the paper" | Markers, broken refs, anonymity leaks |
| [`review_page_budget_audit`](review_page_budget_audit/SKILL.md) | "How many pages per section?" | Multi-agent page budget audit with inflation diagnosis and cut recommendations |
| [`review_prior_decision_audit`](review_prior_decision_audit/SKILL.md) | "Are our early decisions still right?" | Surfaces cross-cutting decisions and checks whether they still serve the paper |
| [`review_prose_naturalness`](review_prose_naturalness/SKILL.md) | "Check for LLM tells" | Scans for excess vocabulary, em-dash overuse, template phrases, structural monotony |

### `plan_` — Planning & orchestration

| Skill | Trigger | What it does |
|-------|---------|-------------|
| [`plan_advisor_feedback`](plan_advisor_feedback/SKILL.md) | "Process advisor feedback" | Parse feedback into decisions, tasks, and execution pipeline |
| [`plan_budget_cut`](plan_budget_cut/SKILL.md) | "Page budget usage tree" / "We need major reengineering" | Diagnoses page inflation per section; proposes phased cuts with `@CUT-START`/`@CUT-END` markers |
| [`plan_consolidation_pipeline`](plan_consolidation_pipeline/SKILL.md) | "Build consolidation pipeline" | Maps binding claims to ordered prompt files with dependency tracking |
| [`plan_rebuttal`](plan_rebuttal/SKILL.md) | "Prepare rebuttal" | Parse reviews, classify points, draft response |
| [`plan_revision_orchestration`](plan_revision_orchestration/SKILL.md) | "This change affects multiple sections" | Decomposes cross-cutting changes into ordered prompts |
| [`plan_t3_prototype_first`](plan_t3_prototype_first/SKILL.md) | "Prototype first, then spec" | Three-phase method: prototype on toy example → spec from learnings → full implementation |

### `ref_` — Domain reference

| Skill | Trigger | What it does |
|-------|---------|-------------|
| [`ref_refinery`](ref_refinery/SKILL.md) | Reading/writing `.problem` files | Refinery language guide, three-layer pattern, examples, CLI script |
| [`ref_reviewer_archetypes`](ref_reviewer_archetypes/SKILL.md) | Reference guide | Reviewer archetype definitions for persona instantiation |
| [`ref_running_example`](ref_running_example/SKILL.md) | "Running example" | Running example guide and specifications |

### `project_` — Infrastructure & cleanup

| Skill | Trigger | What it does |
|-------|---------|-------------|
| [`project_consistency_check`](project_consistency_check/SKILL.md) | "Check project consistency" | Verify todos, decisions, claims, cross-references, and skill references across all artifacts |
| [`project_overleaf_push`](project_overleaf_push/SKILL.md) | "Push to Overleaf" | Build LaTeX from Markdown, push to Overleaf git remote |
| [`project_pandoc_convert`](project_pandoc_convert/SKILL.md) | "Convert to LaTeX" / "Run pandoc" | Convert Markdown sections to LaTeX via pandoc + Lua filters |
| [`project_session_close`](project_session_close/SKILL.md) | "Wrapping up" / session end | Extract lessons learned, update project state before context ends |

## Usage

In Claude Code: "Read `skills/[name]/SKILL.md` and execute it" or use trigger phrases.

**Plan mode first.** Most skills produce analysis, proposals, or drafts that Martin reviews before anything is committed. Claude presents the skill's output and waits for Martin's decision before making changes to files. Exceptions: purely mechanical skills (`review_pre_submission_check`, `review_paper_status`, `draft_notation_table`, `project_overleaf_push`) can execute directly.

Skills that delegate work produce **prompt files** in `prompts/`. Each is a self-contained instruction for a research agent or Claude Code. See `prompts/README.md`.

**Task decomposition:** Cross-cutting changes and multi-section tasks are decomposed into ordered prompt files before starting (see `plan_revision_orchestration`). Single-section and mechanical tasks run directly.

Martin reviews all outputs in plan mode.