# Skills

Automated skills for mechanical parts of the paper writing process. Each skill is a folder with a `SKILL.md` entry point.

## Available skills

### Setup
| Skill | Trigger | What it does |
|-------|---------|-------------|
| `cfp_import` | "Import CFP from [URL]" | Fetches CFP, populates context/CFP.md, derives context/VENUE.md |
| `section_scaffold` | "Scaffold the paper" | Creates format-aware section files with budget |
| `abstract_scaffold` | "Draft the abstract" | Thesis → abstract + champion test + title candidates |
| `reviewer_personas` | "Generate reviewer personas" | 4 context-dependent personas, improves with more paper |

### Research
| Skill | Trigger | What it does |
|-------|---------|-------------|
| `gap_analysis` | "Generate research questions" | Thesis → agent-ready prompt files in `prompts/` |
| `prior_work_import` | "Import these references" | DOIs/BibTeX → structured reference notes |
| `related_work_positioning` | "Build comparison matrix" | Positioning statements + comparison matrix |

### Writing support
| Skill | Trigger | What it does |
|-------|---------|-------------|
| `evaluation_design` | "Design the evaluation" | Maps contributions → evaluation questions → methods |
| `evaluation_execution` | "Evaluation checklist" / "What do I still need to run?" | Tracks proof/tool/case-study execution status, dependencies, acceptance criteria |
| `limitations_threats` | "Write the limitations" | Derives limitations from assumptions, evaluation scope, reviewer attacks |
| `figure_design` | "Propose a figure" / "Design figures" | Audit, design, draft, and iterate figures with Nature-style guidance |
| `structure_paragraph` | "Update the structure paragraph" | Generates/updates intro P5 from section inventory |
| `notation_table` | "Check notation" / "Generate notation table" | Scans sections for symbols, checks consistency |
| `bibliography` | "Resolve citations" / "Fix CITE markers" | Resolves `@CITE` markers → BibTeX keys, tracks Zotero sync needs |

### Quality
| Skill | Trigger | What it does |
|-------|---------|-------------|
| `paper_status` | "Where are we?" / session start | Lightweight dashboard: section maturity, markers, figures, time-to-deadline |
| `champion_test` | "Would anyone champion this paper?" | Evaluates whether the paper has a champion-worthy insight and whether it's visible |
| `prior_decision_audit` | "Are our early decisions still right?" | Surfaces cross-cutting decisions and checks whether they still serve the paper |
| `claim_evidence_audit` | "Audit claims" / "Map contributions" | Contribution mapping + full claim–evidence check |
| `pre_submission_check` | "Check the paper" | Markers, broken refs, anonymity leaks |
| `final_review` | "Final review" | Orchestrator: coherence, champion test, reviewer sim |

### Revision
| Skill | Trigger | What it does |
|-------|---------|-------------|
| `budget_cut` | "Page budget usage tree" / "We need major reengineering" | Diagnoses page inflation per section; proposes phased cuts with `@CUT-START`/`@CUT-END` markers |
| `revision_orchestration` | "This change affects multiple sections" | Decomposes cross-cutting changes into ordered prompts |

### Post-submission
| Skill | Trigger | What it does |
|-------|---------|-------------|
| `rebuttal` | "Prepare rebuttal" | Parse reviews, classify points, draft response |

### Reference
| Skill | Trigger | What it does |
|-------|---------|-------------|
| `refinery` | Reading/writing `.problem` files | Refinery language guide, three-layer pattern, examples, CLI script |

### Infrastructure
| Skill | Trigger | What it does |
|-------|---------|-------------|
| `pandoc_convert` | "Convert to LaTeX" / "Run pandoc" | Convert Markdown sections to LaTeX via pandoc + Lua filters |
| `overleaf_push` | "Push to Overleaf" | Build LaTeX from Markdown, push to Overleaf git remote |

## Usage

In Claude Code: "Read `skills/[name]/SKILL.md` and execute it" or use trigger phrases.

**Plan mode first.** Most skills produce analysis, proposals, or drafts that Martin reviews before anything is committed. Claude presents the skill's output and waits for Martin's decision before making changes to files. Exceptions: purely mechanical skills (`pre_submission_check`, `paper_status`, `notation_table`, `overleaf_push`) can execute directly.

Skills that delegate work produce **prompt files** in `prompts/`. Each is a self-contained instruction for a research agent or Claude Code. See `prompts/README.md`.

**Task decomposition:** Cross-cutting changes and multi-section tasks are decomposed into ordered prompt files before starting (see `skills/revision_orchestration`). Single-section and mechanical tasks run directly.

Martin reviews all outputs in plan mode.
