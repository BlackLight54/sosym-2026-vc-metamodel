---
id: "A-LST"
short: "refinery-lstlisting"
title: "Add Refinery lstlisting language definition to preamble"
status: pending
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

- [ ] `\lstdefinelanguage{refinery}` exists in `pandoc/preamble.tex`
- [ ] A test listing `\begin{lstlisting}[language=refinery]` compiles without errors
- [ ] Keywords render bold, comments render in a distinct style
