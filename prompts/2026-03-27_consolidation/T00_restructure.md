# T00: File Restructuring + LaTeX Labels + Cross-References

**Wave:** 0 (prerequisite — everything depends on this)
**Execution:** Single agent, mechanical. No prose writing.
**Dependencies:** None.
**Downstream:** T00b, then all writing tasks T01-T10.

---

## Context

The section files need structural cleanup before writing agents can work on them. Three issues: (1) one filename doesn't match its heading, (2) no LaTeX labels exist for cross-referencing, (3) hardcoded "Section X" strings in prose will break if sections renumber. Additionally, the title in `tex/main.tex` is stale, and there are stale `@META` blocks and a duplicate `@FIGURE` marker.

## Task

### Step 1 — Rename file

Rename `sections/03_motivation.md` to `sections/03_overview.md`. The heading inside is already `# Overview` (renamed per Oszkar 2026-03-25).

Update `tex/main.tex` line 70:
```
\input{tex/sections/03_motivation}
```
to:
```
\input{tex/sections/03_overview}
```

`build.sh` uses glob `sections/[0-9]*.md` — no change needed.

### Step 2 — Fix title in `tex/main.tex`

Replace line 27:
```
\title{Detecting Cross-Layer Design Errors in Digital Credential Ecosystems with a Layered Metamodel}
```
with:
```
\title{Multi-Level Metamodeling for Verifiable Credential Ecosystem Design: Formalizing Cross-Layer Constraints with Graph Predicates}
```

### Step 3 — Add `\label{sec:...}` to all headings

In every section file, add a `\label{sec:...}` line immediately after each heading. Pandoc's `raw_tex` extension passes these through unchanged to LaTeX.

Format:
```markdown
# Approach
\label{sec:approach}
```

**Complete label scheme** (apply to ALL section files):

- `01_introduction.md`: `# Introduction` -> `\label{sec:introduction}`
- `02_background.md`:
  - `# Background` -> `\label{sec:background}`
  - `## W3C Verifiable Credentials Data Model 2.0` -> `\label{sec:vcdm}`
  - `## Multi-Level Modeling` -> `\label{sec:multi-level}`
  - `## Partial Graph Modeling with Refinery` -> `\label{sec:refinery}`
- `03_overview.md` (renamed):
  - `# Overview` -> `\label{sec:overview}`
  - `## Motivation` -> `\label{sec:motivation}`
  - `## Functional Overview` -> `\label{sec:functional-overview}`
  - `## Usage Workflow` -> `\label{sec:usage-workflow}`
- `04_approach.md`:
  - `# Approach` -> `\label{sec:approach}`
  - `## Domain Concept Layer` -> `\label{sec:dcl}`
  - `## Credential Schema Layer` -> `\label{sec:csl}`
  - `## Format-Specific Layer` -> `\label{sec:fsl}`
  - `## Cross-Layer Constraints as Graph Predicates` -> `\label{sec:cross-layer}`
- `05_evaluation.md`:
  - `# Evaluation` -> `\label{sec:evaluation}`
  - `## Elaboration` -> `\label{sec:elaboration}`
  - `### Metamodel Coverage` -> `\label{sec:coverage}`
  - `### Constraint Expressiveness` -> `\label{sec:expressiveness}`
  - `### Headline Results` -> `\label{sec:headlines}`
  - `### Anti-Pattern Detection` -> `\label{sec:anti-patterns}`
  - `### Baseline Comparison` -> `\label{sec:baseline}`
  - `## Scalability Measurement` -> `\label{sec:scalability}`
  - `### Research Questions` -> `\label{sec:scalability-rqs}`
  - `### Selected Domains` -> `\label{sec:scalability-domains}`
  - `### Measurement Setup` -> `\label{sec:scalability-setup}`
  - `### Measurement Results` -> `\label{sec:scalability-results}`
  - `### Analysis of Results` -> `\label{sec:scalability-analysis}`
  - `## Threats to Validity` -> `\label{sec:threats}`
  - `### Internal Validity` -> `\label{sec:threats-internal}`
  - `### External Validity` -> `\label{sec:threats-external}`
  - `### Construct Validity` -> `\label{sec:threats-construct}`
  - `### Conclusion Validity` -> `\label{sec:threats-conclusion}`
- `06_related_work.md`:
  - `# Related Work` -> `\label{sec:related-work}`
  - `## Credential Ecosystem Design and Formalization` -> `\label{sec:rw-credential}`
  - `## Model-Driven Engineering for Security and SSI` -> `\label{sec:rw-mde}`
  - `## Multi-Level Modeling and Graph-Based Design Space Exploration` -> `\label{sec:rw-multilevel}`
- `07_conclusion.md`:
  - `# Conclusion` -> `\label{sec:conclusion}`

### Step 4 — Convert hardcoded cross-references to `\ref{}`

Replace hardcoded "Section X.Y" in **prose only** (not in `%%` markers):

In `sections/01_introduction.md`:
- `(Section 4)` -> `(Section~\ref{sec:approach})`
- `(Section 4.4)` -> `(Section~\ref{sec:cross-layer})`
- `(Section 5)` -> `(Section~\ref{sec:evaluation})`
- Structure paragraph (line 52): Replace ALL "Section 2", "Section 3", "Section 3.1", etc. with corresponding `Section~\ref{sec:...}` calls

In `sections/04_approach.md`:
- Line 163: `Section 5.3 develops C8 and C9` -> `Section~\ref{sec:headlines} develops C8 and C9`
- Line 165: `(Section 3.2)` -> `(Section~\ref{sec:functional-overview})`

In `sections/05_evaluation.md`:
- Line 84: `Section 4.4` -> `Section~\ref{sec:cross-layer}`

In `sections/03_overview.md` (renamed): Scan for any hardcoded section references in prose and convert.

**Leave `%%` markers unchanged** — they are stripped in submission mode.

### Step 5 — Fix stale metadata and duplicate markers

1. `sections/04_approach.md` line 5 (`@META`): Replace `Source: prior_work/dse-vc-refinery/vc_model.new.problem (newer Refinery model). Internal naming uses CIM/PIM/PSM — translate to domain concept / credential schema / format-specific layer names.` with `Source: models/vc_metamodel.refinery. Layers: DCL / CSL / FSL.`

2. `sections/04_approach.md` line 59: Remove the duplicate `%% @FIGURE: fig_metamodel | ... %%` marker. Keep the one at line 25.

### Step 6 — Verify

- [ ] `03_overview.md` exists, `03_motivation.md` is gone
- [ ] `tex/main.tex` references `03_overview` and has the new title
- [ ] Every section/subsection heading has a `\label{sec:...}` on the next line
- [ ] No hardcoded "Section X" remains in prose (only in `%%` markers)
- [ ] No stale CIM/PIM/PSM references in `@META`
- [ ] No duplicate `@FIGURE: fig_metamodel`

## Constraints

- Do NOT modify any prose content or scaffolds.
- Do NOT rename any section headings — only add labels after them.
- Do NOT touch `%%` marker content (cross-references inside markers are fine as-is).
- Output files in Obsidian Markdown with raw LaTeX pass-through.
