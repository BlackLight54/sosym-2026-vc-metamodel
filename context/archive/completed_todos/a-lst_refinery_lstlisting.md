---
id: "A-LST"
short: "refinery-lstlisting"
title: "Add Refinery lstlisting language definition to preamble"
status: done
priority: high
depends_on: []
binding_claims: []
target: "pandoc/preamble.tex"
pipeline: "advisor-2026-03-29"
assigned: "claude"
created: "2026-03-29"
---

## Goal

Add a `\lstdefinelanguage{refinery}` block to `pandoc/preamble.tex` so that Refinery `.problem` code listings render with syntax highlighting in the paper. This unblocks A-BG1 and A-CODE.

## Context

Advisor feedback (2026-03-29): "refinery lstlisting syntax highlight kell -> refinery filter" and "rebus cikkjéből preambulum cuccokat copyzni."

The `listings` package is already loaded in `pandoc/preamble.tex` (line 26). No language definition exists yet.

## What to do

Add a `\lstdefinelanguage{refinery}` block with:

**Keywords (from `models/vc_metamodel.refinery` syntax):**
- Declarations: `class`, `abstract`, `extends`, `contains`, `refers`, `opposite`, `container`, `enum`
- Predicates: `pred`, `error`, `shadow`, `propagation`, `rule`
- Logic: `must`, `may`, `true`, `false`, `unknown`
- Control: `scope`, `import`

**Style:**
- Monospace font (matching ACM sigconf `\ttfamily`)
- Keywords bold
- Comments: `%` line comments (Refinery uses `%` for comments)
- Strings: none (Refinery doesn't use string literals in the relevant syntax)
- Small font size (`\small` or `\footnotesize`) to fit in two-column layout

**Also:** Add a `\lstset` default or named style `\lstdefinestyle{refinery}` for consistent formatting across all listings.

**Related:** A-REBUS asks Martin to provide the Rebus paper preamble for additional elements. If the Rebus preamble arrives first, integrate from there instead.

## Acceptance criteria

- [x] `\lstdefinelanguage{refinery}` exists in `pandoc/preamble.tex`
- [x] A test listing `\begin{lstlisting}[language=refinery]` compiles without errors
- [x] Keywords render bold, comments render in a distinct style

## Completion note (2026-07-13)

A base definition had already landed in commit 1b7244e (copied from the Rebus
preamble, closing the A-REBUS route for listings), but it was incomplete and
carried latent defects. This task finished and verified it:

- **Keywords added:** `refers`, `shadow`, `import` (all three in the todo spec;
  `shadow` appears in three listings in Sections 02, 04). Builtin types kept,
  `real` added.
- **Rebus leftovers removed:** `Person`, `friend` from keyword class 1; the
  train-domain names (`Switch`, `Segment`, `connectsTo`, `reachable`, ...) from
  keyword class 2. Class 2 now holds this paper's metamodel type names
  (`Entity`, `Prop`, ..., `Formatted_Credential`, `EidasMandate`,
  `PrivacyRequirement`), with `alsoletter={_}` so underscored names match.
- **Latent compile error fixed:** `emphColor` was referenced by `emphstyle` and
  `\dslStyle` but never defined; now defined as RGB 166,38,164.
- **Stray package removed:** `\usepackage{listing}` (singular; unused, only
  `listings` is needed and it is loaded separately).

**Verification:** compiled with MiKTeX pdflatex (Windows toolchain via WSL),
both a minimal acmart test document exercising every keyword class, `%`
comments, literate operators, and inline `\refi`, and the full paper
(`main.tex`, 12 pages, zero errors). Page renders inspected: keywords teal
bold, type names dark bold, comments gray. A-BG1 and A-CODE are unblocked;
their listings in `pandoc/02_background.tex`, `04_approach.tex`, and
`05_evaluation.tex` already render correctly with `style=refinery`.
