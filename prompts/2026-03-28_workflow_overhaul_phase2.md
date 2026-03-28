# Workflow Overhaul — Phase 2

**Date:** 2026-03-28
**Context:** Phase 1 complete (skills created, renamed with category prefixes, memory migrated from monolithic files to individual `.claude/memory/` files, cross-refs updated, verification passed). Phase 2 is infrastructure/scaffold work — no section prose touched except mechanical marker migration.
**Full plan:** `.claude/plans/jiggly-twirling-wilkes.md`
**Previous prompts:** `prompts/2026-03-28_workflow_overhaul.md` (Phase 1 spec), `prompts/2026-03-28_workflow_overhaul_remaining.md` (Phase 1 remaining)
**Scope:** Scaffold only. Marker migration touches section files but is mechanical, not content.

---

## What's Done (from Phase 2 start)

1. **Todo frontmatter spec** added to `CLAUDE.md` under edit protocol — canonical YAML fields: id, short, title, status, priority, depends_on, binding_claims, target, pipeline, assigned, created.
2. **TODO.md converted to index** — now points to `context/todos/` with quick status summary. Monolithic backup at `context/archive/TODO_monolithic_backup.md`.

---

## Remaining Tasks

Execute in this order. Tasks marked ∥ can run in parallel.

### Task 1: Create `context/todos/README.md` ∥

Frontmatter spec + conventions document for the todo system. Content:
- The canonical YAML frontmatter (copy from CLAUDE.md edit protocol section)
- ID convention: prefix encodes pipeline (`T` consolidation, `O` other, `M` overhaul, `Z` synthesis triage)
- Lifecycle: `pending` → `in_progress` → `done` (move to `context/archive/completed_todos/`); `blocked` with note
- File naming: `{id}_{short}.md` (e.g., `m01_page_audit.md`)

### Task 2: Create directory READMEs ∥

Create `README.md` in each directory that lacks one:

| Directory | Purpose |
|-----------|---------|
| `context/todos/` | See Task 1 |
| `context/archive/feedback/` | Meeting notes and reviewer comments |
| `context/archive/research/` | Gap analysis results and research findings |
| `context/archive/cuts/` | Removed text with recovery context |
| `context/archive/superseded_decisions/` | Decisions that were replaced |
| `context/archive/completed_todos/` | Todos that have been completed |
| `context/references/` | Collected reference notes and PDFs |
| `.claude/memory/` | Project-level memories (decisions, claims, feedback) |

Each README: 3-5 lines explaining purpose, naming convention, what goes here / what doesn't.

### Task 3: Create page budget audit skill ∥

**File:** `.claude/skills/review_page_budget_audit/SKILL.md`

Multi-agent skill modeled on `review_paper_audit`. Three phases:

**Phase 1 — Per-section audits (parallel agents):**
Each agent reads one section file and reports:
- Word count (prose only, excluding markers/meta/scaffold)
- Budget from `@META: Budget:` marker
- Figure/table count with estimated page impact
- Display math block count
- Estimated page count (~800 words/page for ACM sigconf)
- Delta vs. budget
- Content density: prose vs. scaffold vs. placeholder
- Specific inflation/deficit sources

**Phase 2 — Cross-section analyses (parallel agents):**
- **X1: Balance analysis** — section estimates vs. venue total (from VENUE.md), disproportionate sections, contributions space
- **X2: Dependency and gap analysis** — cross-section references to unwritten content, structural holes
- **X3: Redundancy detection** — repeated explanations, duplicated definitions, wasted space

**Phase 3 — Synthesis (sequential):**
1. Budget tree table (section | budget | estimated | delta | status)
2. Top 5 inflation sources ranked by pages wasted
3. Top 5 deficit areas ranked by pages needed
4. Recommended actions — where to add, where to cut, priority order
5. Risk flags — sections that can't fit in budget, scope trade-offs

### Task 4: Create project overhaul skill ∥

**File:** `.claude/skills/project_overhaul/SKILL.md`

Reusable skill for structural reorganization:
1. Audit current project structure (skills, memory, todos, archive)
2. Identify gaps between usage patterns and documented workflow
3. Propose categorization/reorganization
4. Execute migration with `git mv`, cross-reference updates, verification
5. Run `review_consistency_check` post-migration

### Task 5: Create M-prefixed todo files

Create 10 todo files in `context/todos/` with full frontmatter:

| ID | Short | Title | Priority | Pipeline |
|----|-------|-------|----------|----------|
| M11 | page-audit | Create page budget audit skill | high | overhaul-p2 |
| M12 | marker-migration | Migrate markers from `%%` to Pandoc divs/spans | high | overhaul-p2 |
| M13 | citation-workflow | Update citation workflow to `--biblatex` + `[@key]` | high | overhaul-p2 |
| M04 | z01-extract | Extract todos from Z01 synthesis analysis | high | overhaul-p2 |
| M05 | overhaul-skill | Create project overhaul skill | medium | overhaul-p2 |
| M06 | todo-consolidate | Consolidate all todos with enhanced frontmatter | medium | overhaul-p2 |
| M07 | migration-check | Final migration verification pass | medium | overhaul-p2 |
| M08 | dir-readmes | Create README.md in all directories | medium | overhaul-p2 |
| M09 | crossref-pandoc | Set up pandoc-crossref for `\autoref` references | medium | overhaul-p2 |
| M10 | meta-to-yaml | Move `@META` markers to YAML frontmatter in sections | high | overhaul-p2 |

All: `status: pending`, `assigned: "claude"`, `created: "2026-03-28"`.

Mark M11/M13/M04/M05/M08 as done if Tasks 1-4 and Task 2 completed by then.

### Task 6: Consolidate existing todo frontmatter

Update all ~17 existing todo files in `context/todos/` to include full frontmatter spec. Add missing fields: `short`, `priority`, `pipeline`, `assigned`, `created`.

Read each file, infer appropriate values:
- `pipeline`: most are `"consolidation"` (T-prefixed) or unlabeled
- `priority`: infer from position in INDEX.md categories (critical path = high)
- `assigned`: default `"claude"` unless clearly Martin's task
- `created`: use `"2026-03-28"` (date of decomposition)

### Task 7: Marker migration — Pandoc constructs

**This is the largest task.** Replace `%% @TYPE: content %%` markers with Pandoc Markdown constructs.

**Step 7a: Define LaTeX environments** in `pandoc/preamble.tex`:
- `\newenvironment{todo}` — colored box for draft, hidden for submission
- `\newenvironment{formal}` — green annotation
- `\newenvironment{scaffold}` — draft-only scaffold markers
- `\newenvironment{figurePlaceholder}` — figure placeholder with label

**Step 7b: Create `pandoc/filters/annotations.lua`** replacing `pandoc/filters/markers.lua`:
Handle Pandoc div/span classes → LaTeX environments/commands:
- `.todo` div → `\begin{todo}...\end{todo}`, span → `\todo{...}`
- `.cite` span → `\todo[color=blue!20]{cite: ...}` (draft) or stripped (submission)
- `.formal` div/span → `\todo[color=green!20]{formal: ...}` or stripped
- `.figure` div → figure placeholder environment
- `.scaffold` div → draft-only scaffold block or stripped
- Read draft/submission mode from metadata or environment variable

**Step 7c: Migrate all section files** — mechanical find-and-replace:
- `%% @TODO: text %%` (standalone line) → `::: {.todo}\ntext\n:::`
- `%% @TODO: text %%` (inline) → `[text]{.todo}`
- `%% @CITE: text %%` → `[text]{.cite}`
- `%% @FORMAL: text %%` → `[text]{.formal}` or div equivalent
- `%% @FIGURE: label | desc %%` → `::: {.figure label="fig:label"}\ndesc\n:::`
- `%% @SCAFFOLD: content %%` → `::: {.scaffold}\ncontent\n:::`
- `%% @META: key: value %%` → move to YAML frontmatter (see Task 9/M10)

**Step 7d: Update `build.sh` and `pandoc/defaults.yaml`** if filter paths changed.

**Step 7e: Update CLAUDE.md** — replace marker syntax documentation with new Pandoc constructs.

**Step 7f: Update all skills** that reference `%% @TYPE:` syntax (grep for `%%` across `.claude/skills/`).

**Step 7g: Test** — `./build.sh draft` and `./build.sh submission` produce correct output.

### Task 8: Citation workflow update

Adopt `[@citekey]` Pandoc citation syntax:
- Update `pandoc/defaults.yaml` or `build.sh` to add `--biblatex` flag
- Replace any `\cite{key}` in section files with `[@key]`
- Update `pandoc/filters/citations.lua` (currently a stub) or remove if `--biblatex` handles it
- Update CLAUDE.md citation conventions

### Task 9: Move `@META` to YAML frontmatter

For each section file:
- Extract `%% @META: key: value %%` lines
- Add YAML frontmatter block at top of file with those key-value pairs
- Remove the `@META` marker lines
- Update skills that read `@META` markers to read YAML frontmatter instead

### Task 10: Extract Z01 synthesis todos

Read `prompts/2026-03-27_section_reviews/Z01_synthesis.md` and create todo files:
- CRITICAL (T01-T08) → `priority: high`, ID prefix `Z-T` (e.g., `Z-T01`)
- IMPORTANT (T09-T31) → `priority: medium`
- POLISH (T32-T51) → `priority: low`
- All: `pipeline: "z01-triage"`, `assigned: "claude"`, `created: "2026-03-28"`

### Task 11: Final migration check

After all tasks:
- Grep for remaining `%% @` markers in `sections/` (should be zero post-migration)
- Grep for old skill name references (pre-rename names)
- Grep for `context/DECISIONS.md` references (should all point to `.claude/memory/decision_*.md`)
- Verify all skill directories have `SKILL.md`
- Verify all non-empty directories have `README.md`
- Run `./build.sh draft` to verify pandoc pipeline works
- Run `./build.sh submission` to verify clean output

---

## Parallelization Guide

```
Batch 1 (parallel): Tasks 1, 2, 3, 4
Batch 2 (sequential): Task 5 (creates M-todos, marks some done from Batch 1)
Batch 3 (parallel): Tasks 6, 10
Batch 4 (sequential): Task 7 (marker migration — largest, touches all section files)
Batch 5 (parallel): Tasks 8, 9
Batch 6 (sequential): Task 11 (final verification)
```

---

## Verification Checklist

- [ ] `context/todos/README.md` exists with frontmatter spec
- [ ] All 8 directories have `README.md`
- [ ] `.claude/skills/review_page_budget_audit/SKILL.md` exists and follows multi-agent pattern
- [ ] `.claude/skills/project_overhaul/SKILL.md` exists
- [ ] 10 M-prefixed todo files in `context/todos/` with full frontmatter
- [ ] All existing todos have complete frontmatter (short, priority, pipeline, assigned, created)
- [ ] Z01 synthesis todos extracted (51 items as individual files)
- [ ] No `%% @` markers remain in `sections/` (post marker migration)
- [ ] `pandoc/filters/annotations.lua` handles all div/span classes
- [ ] `pandoc/preamble.tex` defines required LaTeX environments
- [ ] `[@citekey]` syntax works with `--biblatex` flag
- [ ] CLAUDE.md updated with new marker syntax documentation
- [ ] All skills updated to reference new marker syntax
- [ ] `./build.sh draft` produces correct output
- [ ] `./build.sh submission` produces clean output
- [ ] No stale references to old skill names or `context/DECISIONS.md`
