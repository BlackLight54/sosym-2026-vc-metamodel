# Zettelkasten — credential-ecosystem metamodel knowledge base

A linked, atomic knowledge base distilled from this repository's accumulated knowledge
(`.claude/memory/`, `sections/`, the gap analysis, `prior_work/`, `context/references/`),
plus content ingested from Notion and Todoist (see `INGESTION.md`). The base is the source
from which a journal-length article on the three-layer verifiable-credential metamodel can be drafted.

This is a standalone Obsidian-compatible vault. It is **not** part of the LaTeX build
(`build.sh` only globs `sections/[0-9]*.md`), so wikilinks here do not affect the paper pipeline.

## Start here

1. `index.md` — master map of content (entry point).
2. `PIPELINE.md` — the stage contract: what each pipeline stage reads here and what it owes.
3. `moc/M-001 journal-paper-outline.md` — proposed journal structure, each section linking the notes that feed it.
4. `moc/M-007 writing-gaps.md` — open questions and the `maturity: seed` worklist: what to write next.
5. `dashboards.md` — live Dataview queries (claims by status, orphans, seed worklist).

MOCs split into two planes: **argument maps** (M-001..M-009, what the paper knows and claims) and
**production maps** (M-010..M-014: objection ledger, claim delivery matrix, journal delta, drafting
guardrails, figure plan). Drafting work loads `M-013` first.

## Note types and ID scheme

Each note is one idea. Filename = `<ID> <kebab-title>.md`. Links use the filename stem:
`[[C-001 domain-concept-layer]]`.

| Prefix | Type       | Folder        | Holds |
|--------|------------|---------------|-------|
| `C-`   | concept    | `concepts/`   | one technical concept (a layer, a predicate, a guarantee) |
| `K-`   | claim/argument | `claims/` | a binding claim or a differentiation argument |
| `S-`   | source     | `sources/`    | one cited paper: bib data, key claim, relation |
| `D-`   | decision   | `decisions/`  | a design-framing decision with rationale |
| `Q-`   | question   | `questions/`  | an open question that drives new writing |
| `A-`   | artifact   | `artifacts/`  | one model file, script, dataset, or figure source, mapped to the claim it is evidence for |
| `M-`   | MOC        | `moc/`        | a structure note threading atomic notes |

IDs are zero-padded sequential within type. They are stable: never renumber a note; deprecate instead.

## Frontmatter

Every atomic/MOC note begins with a YAML block (templates in `templates/`). Fields are
Dataview-queryable, so keep them consistent:

```yaml
id: C-001
title: Domain Concept Layer (DCL)
type: concept            # concept|claim|source|decision|question|artifact|moc
maturity: permanent      # seed|developing|permanent
tags: [layer/dcl, metamodel]   # only from tags.md
status:                  # claims only: delivered|partial
citekey:                 # sources only: Zotero/BibTeX key (or blank)
sources: ["sections/04_approach.md §4.1"]   # repo provenance
related: ["[[C-002 credential-schema-layer]]"]
created: 2026-06-16
```

### Maturity

- `seed` — stub or raw ingestion, not yet distilled into one clean idea.
- `developing` — distilled but incomplete (missing links, unresolved citekey).
- `permanent` — atomic, linked, source-traced. Ready to cite into prose.

## Rules

- **One idea per note.** If a note states two ideas, split it.
- **No orphans.** Every note must be reachable from at least one MOC.
- **Reciprocal links where load-bearing.** If the A→B relation matters in both directions (claim↔evidence, decision↔affected note), both list each other. Hub→leaf and note→source links may stay one-directional; `check_links.sh` reports one-way links as warnings, not errors.
- **Tags from `tags.md` only.** The controlled vocabulary keeps filtering consistent.
- **Trace provenance.** `sources:` records the repo artifact (or Notion/Todoist item) the note distills.

Run `./check_links.sh` after edits: it validates link targets, flags orphans and one-directional
links, checks tags against `tags.md`, and prints a maturity summary.
