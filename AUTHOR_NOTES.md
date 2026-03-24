# Author Notes

Martin's workspace. Not loaded by Claude Code.

## Markdown → LaTeX → Overleaf pipeline

### Architecture

```
Obsidian (authoring)          Overleaf (collaboration + submission)
sections/*.md  ──pandoc──►  build/*.tex  ──git push──►  Overleaf project
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
- [x] Create `tex/main.tex` with preamble, `\input{}` per section (adapted from authordraft)
- [x] Create pandoc Lua filter: strip `%% ... %%` markers or convert to `\todo{}` (`pandoc/filters/markers.lua`)
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

### Overleaf integration

**Option 1: Git sync (recommended if available)**
- Overleaf premium provides a git remote per project.
- Local workflow: `make build && cd build && git add -A && git commit && git push overleaf main`
- Collaborators edit on Overleaf. Pull with `git pull overleaf main`.
- Merge conflicts happen in `.tex` files — resolve in LaTeX.

**Option 2: Manual upload**
- Run `make build`, then upload `build/*.tex` + `figures/` + `.bib` to Overleaf.
- Download from Overleaf for collaborator changes.
- More error-prone but works without premium.

**Option 3: Overleaf CLI (community tool)**
- `npm install -g overleaf-cli` or similar. Check current state of tooling.

### Versioning

Version history is tracked by Overleaf. No local git for Markdown files.

**Push workflow:** Use `skills/overleaf_push` to build LaTeX from Markdown and push to the Overleaf git remote. This is the only git usage in the project — it's a deployment mechanism, not a version control workflow.

**Milestone labels (Martin — in Overleaf History → Label this version):**
- `first-draft` — all sections have prose, markers may remain.
- `pre-submission` — after final review, before polish.
- `submitted` — the exact version sent to the venue.
- `camera-ready` — after revisions, before final upload.

Label in Overleaf immediately after pushing at these milestones.

## Local setup

- **Editor:** Obsidian for writing, VS Code for Claude Code edits
- **Shell:** Fish
- **References:** Zotero → Overleaf Zotero import (`.bib` managed on Overleaf side). Use `skills/bibliography` to resolve `%% @CITE: %%` markers and track what needs to be added to Zotero. Better BibTeX plugin recommended for Zotero.

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

Note: The primary `.bib` pipeline is Overleaf's Zotero import. This MCP server is an optional convenience for Claude Code to search the Zotero library when resolving `%% @CITE: %%` markers via `skills/bibliography`.

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
3. Run `skills/cfp_import` → CFP.md + VENUE.md (budget, format, exemplars).
4. Confirm VENUE.md exemplar papers and supplementary strategy.
5. Write thesis in CLAUDE.md.
6. Run `skills/reviewer_personas` → 4 personas in VENUE.md (rough, will refine later).
7. Choose a running example (see `guides/running_example/SKILL.md`). Record in DECISIONS.md.
8. Run `skills/abstract_scaffold` → abstract contract + champion test + title candidates.
9. Run `skills/gap_analysis` → prompt files in `prompts/` for research agents.
10. Execute research prompts. Import results with `skills/prior_work_import`.
11. Run `skills/related_work_positioning` → comparison matrix.
12. Run `skills/section_scaffold` → section files.
13. Run `skills/evaluation_design` → evaluation structure.
14. Start writing (TODO.md tracks what's next).
15. Build pandoc pipeline (see "Setup TODO" above).

### During writing
- Use WORKFLOW.md task templates for drafting, revising, modeling.
- Run `skills/paper_status` at session start for a snapshot.
- Run `skills/claim_evidence_audit` periodically to catch overclaims and check contribution mapping.
- Re-run `skills/reviewer_personas` after first draft to refine personas with full paper context.
- For multi-section changes, run `skills/revision_orchestration` → ordered prompts in `prompts/`.
- Thread the running example through each section.
- Iterate figures with `skills/figure_design`.
- Run `skills/prior_decision_audit` when something feels off.

### Preparing to submit
1. Run `skills/evaluation_execution` → confirm all evaluation items are done (written).
2. Run `skills/claim_evidence_audit` → all claims delivered, no overclaims.
3. Run `skills/limitations_threats` → limitations section is honest and complete.
4. Run `skills/bibliography` → all `%% @CITE: %%` markers resolved.
5. Run `skills/pre_submission_check` → markers, refs, anonymity.
6. Run `skills/final_review` → coherence, champion test, reviewer simulation.
7. Manual read-through and rewrite.
8. Revisit abstract and title with `skills/abstract_scaffold` in revision mode.
9. Handoff to LaTeX on Overleaf for final polish (document in TODO.md).
10. Submit.

### After reviews
1. Run `skills/rebuttal` → parse reviews, draft response, revision plan.
2. Run `skills/revision_orchestration` → ordered prompts for the revision.
3. Execute revision prompts. Re-run quality skills.

### Resuming a session
1. Open Claude Code in project directory (auto-loads CLAUDE.md).
2. "Read TODO.md — what should I work on?" (Claude runs `skills/paper_status` automatically.)
3. Work through tasks.

## Conventions

- Section files numbered: `sections/01_introduction.md`, etc.
- Removed text: `archive/YYYY-MM-DD_description.md`
- Collected references: `archive/references/`
- Generated prompts: `prompts/YYYY-MM-DD_[skill]_[desc].md`
- Figure sources: `figures/`
- Cross-cutting decisions: DECISIONS.md

## Customize for each paper

- [ ] Build pandoc pipeline (see "Setup TODO" above)
- [ ] Add author names to `skills/pre_submission_check/check.sh` for anonymity scan
- [ ] Set domain in CLAUDE.md if not formal methods
- [ ] Add domain-specific guides to `guides/` as needed
