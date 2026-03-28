# TODO

> **Authoritative todo tracking lives in `context/todos/`.**
> Each todo is a separate file with YAML frontmatter.
> See `context/todos/README.md` for the frontmatter spec and conventions.

## Quick status

### Critical path (consolidation)

- **T07** — Sec 04 cross-layer constraints (A12-A15) [Binding #3]
- **T08** — Sec 05 elaboration (coverage, expressiveness, headline results) [Binding #5, #6, #7, #9]
- **T09** — Sec 05 threats + scalability
- **T10** — Final polish (eval preamble, Intro P5, abstract numbers) [Binding #10]

### Advisor feedback

- **M00** — Process Oszkár's 2026-03-25 notes into decisions, feedback, and todos

### High priority (overhaul phase 2)

- **M20** — **Execute Phase 2: marker migration, citations, Z01 extraction** (see `prompts/2026-03-28_workflow_overhaul_phase2.md`)
- ~~**M11** — Create page budget audit skill~~ ✅
- **M12** — Migrate markers from `%%` to Pandoc divs/spans
- **M13** — Update citation workflow to `--biblatex` + `[@key]`
- **M04** — Extract todos from Z01 synthesis analysis
- ~~**M05** — Create project overhaul skill~~ ✅
- ~~**M06** — Consolidate todos with enhanced frontmatter~~ ✅
- **M07** — Final migration verification pass
- ~~**M08** — Create README.md in all directories~~ ✅
- **M09** — Set up pandoc-crossref for `\autoref` references
- **M10** — Move `@META` markers to YAML frontmatter in sections

### Infrastructure

- **M22** — Migrate todo pipeline to Claude Code native Tasks

### See also

- `context/todos/INDEX.md` — full categorized listing
- `context/archive/TODO_monolithic_backup.md` — original monolithic TODO
