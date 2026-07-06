# Author Notes

Martin's workspace. Not loaded by Claude Code.

## Markdown → LaTeX → Overleaf pipeline

### Architecture

```
Obsidian (authoring)          Overleaf (collaboration + submission)
sections/*.md  ──pandoc──►  pandoc/*.tex  ──git push──►  Overleaf project
                  │                                          │
                  ├── venue template                         │
                  ├── marker filter (strips %% ... %%)       │
                  ├── citation filter (keys → \cite{})       │
                  └── environment filter (definitions, etc.) │
                                                             │
                  Collaborator edits on Overleaf ◄───────────┘
                  (pull back as .tex — LaTeX is authoritative
                   once late-stage polish begins)
```

**Source of truth transitions:**
1. During drafting: Markdown section files are authoritative. LaTeX is derived.
2. During late-stage polish (last ~5 days): LaTeX on Overleaf becomes authoritative. Markdown files become archival. Document the handoff in TODO.md when it happens.

### Setup TODO (build with Claude Code)

- [x] Create `build.sh` with pandoc conversion per section
- [x] Create `pandoc/main.tex` with preamble, `\input{}` per section (adapted from authordraft)
- [x] Create pandoc Lua filter: strip `%% ... %%` markers or convert to `\todo{}` (`pandoc/filters/markers.lua`). Handles both standalone markers (→ `\todo[inline]{...}`) and inline markers embedded in prose (→ `\todo{...}` margin notes).
- [ ] Create pandoc Lua filter: map `%% @CITE: key %%` to `\cite{key}` where key exists in `.bib` (`pandoc/filters/citations.lua` — stub)
- [x] Create pandoc Lua filter: pass through `\begin{definition}` etc. as raw LaTeX (handled by pandoc `raw_tex` extension — no filter needed)
- [ ] Create pandoc Lua filter: convert figure metadata blocks to `\begin{figure}...\end{figure}` (`pandoc/filters/figures.lua` — stub)
- [ ] Set up Overleaf git remote (requires Overleaf premium or institutional access)
- [x] Create `.gitignore` for build artifacts (already existed)
- [ ] Test round-trip: Markdown → LaTeX → PDF matches expected output (requires pandoc install)
- [ ] Document any Markdown constructs that pandoc handles poorly (workarounds in this file)

### Known pandoc considerations

- `$...$` math passes through to LaTeX unchanged — no filter needed.
- `$$...$$` display math: pandoc converts to `\[...\]` by default. If venue template expects `$$`, use `--wrap=preserve` or a filter.
- Markdown tables → `\begin{tabular}`. May need `booktabs` filter for venue style.
- Fenced code blocks → `\begin{verbatim}` or `lstlisting` depending on template.
- Obsidian `%%` comments are not standard pandoc Markdown — the Lua filter must strip them before pandoc processes the file, or preprocess with `sed`.
- Cross-references (`\ref{fig:...}`, `\label{...}`): pass through as raw LaTeX in Markdown. Pandoc preserves raw LaTeX by default.

### Repository structure (post-migration, 2026-07-06)

This repo (`sosym-2026-vc-metamodel`) is the main authoring repo; it carries the full history of
`ACM-MODELS-26`, which stays as the frozen conference record. Submodules: `models/`
(ACM-MODELS-26-code), `prior_work/dse-vc-refinery`, `prior_work/ese-vc-fca` (all https URLs).
The Overleaf project attaches under `overleaf/` (see `overleaf/README.md`); until its git URL is
configured, Option 1 below is not wired and builds stay local.

### Overleaf integration

**Option 1: Git sync (recommended if available)**
- Overleaf premium provides a git remote per project.
- Local workflow: `make build && cd build && git add -A && git commit && git push overleaf main`
- Collaborators edit on Overleaf. Pull with `git pull overleaf main`.
- Merge conflicts happen in `.tex` files — resolve in LaTeX.

**Option 2: Manual upload**
- Run `make build`, then upload `pandoc/*.tex` + `pandoc/assets/` + `.bib` to Overleaf.
- Download from Overleaf for collaborator changes.
- More error-prone but works without premium.

**Option 3: Overleaf CLI (community tool)**
- `npm install -g overleaf-cli` or similar. Check current state of tooling.

### Versioning

Version history is tracked by Overleaf. No local git for Markdown files.

**Push workflow:** Use `skills/project_overleaf_push` to build LaTeX from Markdown and push to the Overleaf git remote. This is the only git usage in the project — it's a deployment mechanism, not a version control workflow.

**Milestone labels (Martin — in Overleaf History → Label this version):**
- `first-draft` — all sections have prose, markers may remain.
- `pre-submission` — after final review, before polish.
- `submitted` — the exact version sent to the venue.
- `camera-ready` — after revisions, before final upload.

Label in Overleaf immediately after pushing at these milestones.

## Local setup

- **Editor:** Obsidian for writing, VS Code for Claude Code edits
- **Shell:** Fish
- **References:** Zotero → Overleaf Zotero import (`.bib` managed on Overleaf side). Use `skills/draft_bibliography` to resolve `%% @CITE: %%` markers and track what needs to be added to Zotero. Better BibTeX plugin recommended for Zotero.

## MCP servers for Claude Code

### Zotero (optional — search library, pull citations, extract annotations)
```fish
# Install
pip install git+https://github.com/54yyyu/zotero-mcp.git
# or: uv tool install "git+https://github.com/54yyyu/zotero-mcp.git"

# Setup (interactive, auto-detects Claude Desktop)
zotero-mcp setup

# Add to Claude Code
claude mcp add-json zotero '{"command":"zotero-mcp","env":{"ZOTERO_LOCAL":"true"}}'
```
Requires: Zotero running with local API enabled, or Zotero API key. Recommended: Better BibTeX plugin.
Docs: https://github.com/54yyyu/zotero-mcp

Note: The primary `.bib` pipeline is Overleaf's Zotero import. This MCP server is an optional convenience for Claude Code to search the Zotero library when resolving `%% @CITE: %%` markers via `skills/draft_bibliography`.

### GitHub (access repos with prior work code)
```fish
claude mcp add-json github '{"command":"npx","args":["-y","@modelcontextprotocol/server-github"],"env":{"GITHUB_PERSONAL_ACCESS_TOKEN":"[token]"}}'
```
Docs: https://github.com/github/github-mcp-server

### Finding other MCP servers
- https://playbooks.com/mcp — curated, per-client setup
- https://mcp.so — community directory
- GitHub: search `[tool] mcp server`

### Building a custom server
- Python: `pip install mcp` — https://github.com/modelcontextprotocol/python-sdk
- TypeScript: `npm install @modelcontextprotocol/sdk`
- Tutorial: https://modelcontextprotocol.io/tutorials/building-mcp-with-llms

## How to use skills

See `skills/README.md` for the full list with triggers.

In Claude Code, say "Read `skills/[name]/SKILL.md` and execute it" or use trigger phrases. Always review in plan mode before accepting changes.

Some skills produce **prompt files** in `prompts/` — ready-to-execute instructions for research agents or Claude Code. Execute each prompt, then delete or archive it.

**Multi-session tasks:** Complex tasks — especially cross-cutting changes, multi-section revisions, or tasks combining research and drafting — are decomposed into separate prompt files rather than attempted in one pass. Execute each prompt in a fresh Claude Code session.

## Typical session flow

### Starting a new paper
1. Drop this scaffold into the project directory.
2. Paste CFP or give Claude Code the URL.
3. Run `skills/setup_cfp_import` → `context/CFP.md` + `context/VENUE.md` (budget, format, exemplars).
4. Confirm `context/VENUE.md` exemplar papers and supplementary strategy.
5. Write thesis in CLAUDE.md.
6. Run `skills/setup_reviewer_personas` → 4 personas in `context/VENUE.md` (rough, will refine later).
7. Choose a running example (see `skills/ref_running_example/SKILL.md`). Record in `.claude/memory/` as a decision memory.
8. Run `skills/setup_abstract_scaffold` → abstract contract + champion test + title candidates.
9. Run `skills/research_gap_analysis` → prompt files in `prompts/` for research agents.
10. Execute research prompts. Import results with `skills/research_prior_work_import`.
11. Run `skills/research_related_work_positioning` → comparison matrix.
12. Run `skills/setup_section_scaffold` → section files.
13. Run `skills/draft_evaluation_design` → evaluation structure.
14. Start writing (TODO.md tracks what's next).
15. Build pandoc pipeline (see "Setup TODO" above).

### During writing
- Use `context/WORKFLOW.md` task templates for drafting, revising, modeling.
- Run `skills/review_paper_status` at session start for a snapshot.
- Run `skills/review_claim_evidence_audit` periodically to catch overclaims and check contribution mapping.
- Re-run `skills/setup_reviewer_personas` after first draft to refine personas with full paper context.
- For multi-section changes, run `skills/plan_revision_orchestration` → ordered prompts in `prompts/`.
- Thread the running example through each section.
- Iterate figures with `skills/draft_figure_design`.
- Run `skills/review_prior_decision_audit` when something feels off.

### Preparing to submit
1. Run `skills/draft_evaluation_execution` → confirm all evaluation items are done (written).
2. Run `skills/review_claim_evidence_audit` → all claims delivered, no overclaims.
3. Run `skills/draft_limitations_threats` → limitations section is honest and complete.
4. Run `skills/draft_bibliography` → all `%% @CITE: %%` markers resolved.
5. Run `skills/review_pre_submission_check` → markers, refs, anonymity.
6. Run `skills/review_paper_audit` → full-paper audit against binding claims, decisions, and reviewer personas.
7. Run `skills/review_final_review` → coherence, champion test, reviewer simulation.
8. Manual read-through and rewrite.
9. Revisit abstract and title with `skills/setup_abstract_scaffold` in revision mode.
10. Handoff to LaTeX on Overleaf for final polish (document in TODO.md).
11. Submit.

### After reviews
1. Run `skills/plan_rebuttal` → parse reviews, draft response, revision plan.
2. Run `skills/plan_revision_orchestration` → ordered prompts for the revision.
3. Execute revision prompts. Re-run quality skills.

### Ending a session

- Run `skills/project_session_close` before wrapping up to persist lessons learned and update project state.

### Resuming a session
1. Open Claude Code in project directory (auto-loads CLAUDE.md).
2. "Read TODO.md — what should I work on?" (Claude runs `skills/review_paper_status` automatically.)
3. Work through tasks.

## Conventions

- Section files numbered: `sections/01_introduction.md`, etc.
- Removed text: `context/archive/YYYY-MM-DD_description.md` (archive is the single destination for all retired state: superseded decisions, completed todos, cut text)
- Collected references: `context/references/`
- Generated prompts: `prompts/YYYY-MM-DD_[skill]_[desc].md`
- Figure sources: `pandoc/assets/`
- Cross-cutting decisions: `.claude/memory/decision_*.md` (indexed in `.claude/memory/MEMORY.md`)

## Customize for each paper

- [ ] Build pandoc pipeline (see "Setup TODO" above)
- [ ] Add author names to `skills/review_pre_submission_check/check.sh` for anonymity scan
- [ ] Set domain in CLAUDE.md if not formal methods
