~~revievwer persona-archetype ambiguity. fix~~ ✅ Done — `review_reviewer_archetypes` skill separated from `setup_reviewer_personas`

~~pandoc pipeline shoudl be exported and improved~~ ✅ Done — `project_pandoc_convert` and `project_overleaf_push` skills
~~Maybe more todo/filter types, maybe obsidian filters~~ ✅ Decided against — current 6 annotation classes cover all needs; adding more is trivial if needed later

~~As code for multiple prompts, uh, to cut up a big task in chunks, I should ask him to create, uh, parallel and, uh, serial and, uh, dependency-informed pipeline because that way he can make... A- and, uh, tell him that he can make, uh, um... The prompts change the depended ones. That way he can make a whole workflow. I should include this in the system prompt~~ ✅ Done — `plan_consolidation_pipeline` skill with wave-based parallelism and dependency tracking

~~Also we should devise a naming convention to capture such dependencies and parallelisms. The thought of Claude was to use phases. I think that's a good first start but if one step takes really longer then it can block the other parts of the phase. So I think we should construct a directed graph instead and somehow put it in the naming convention of the prompts.~~ ✅ Done — consolidation pipeline uses directed dependency graph with waves, not rigid phases

~~Claude should put all sequences of prompt flows into their own directory, with some diagram and explanation on how they should be run and concatenated.~~ ✅ Done — `plan_consolidation_pipeline` generates PIPELINE.md with dependency diagram per prompt directory

~~When drafting with draft prompts that I write and with draft prompts that I ask from Claude, when in plan mode, he should show me how the existing paragraph plans to do scaffolding transforms into the draft and also show me his edits within the plan with cross-through text.~~ ✅ Done — hybrid diff convention added to CLAUDE.md drafting mode: `diff` blocks for paragraph rewrites, `[→ new]` inline for word-level edits

~~We should not have a TODO.md that should be like in the paper, but for global to-dos or long running things, I think we should include a single page of just to-dos at the beginning of the paper, like a global to-do list which contains check marks and everything. That should be the authoritative copy, still a different file but included in the paper so we can see it in our leaf. Thus we move the done todos to a change log or the decisions file or something.~~ ✅ Done — TODO.md decomposed into `context/todos/` with INDEX.md. Completed todos archived to `context/archive/completed_todos/`. Decisions migrated to `.claude/memory/decision_*.md`.

~~When editing drafted text in the plan, Claude should use strikethrough to signal the changes from the previous version.~~ ✅ Done — merged with line 12 into hybrid diff convention

per section meta table
Line Marker Disposition
1 %% @META: Section: Background %% Preserve
2 %% @META: Budget: 1.25 pages (~7 paragraphs, 3 subsections) %% Preserve
3 %% @META: Goal: Establish the three conceptual pillars the reader needs. Nothing more. %% Preserve
4 %% @META: Dependencies: None. %% Preserve

Should use pandoc citations for citations, but we have to refine the system to do that.

~~Should use Pandoc definitions. Definition lists~~ ✅ Decided against — math-mode definitions with prose are the right format for metamodel papers; definition lists suit glossary content

Should use Pandoc divs with custom attributes
Here are the Pandoc features that, rather than processing things internally (like citeproc does), translate Pandoc Markdown structures directly into their LaTeX counterparts and let LaTeX handle the processing:
Citations via --natbib / --biblatex. The most direct parallel. Instead of --citeproc, you pass --natbib or --biblatex, and Pandoc converts [@key] syntax into \citep{key}, \citet{key}, \autocite{key}, etc. LaTeX's own bibliography engine (bibtex/biber) then resolves them.
Math. Pandoc passes $...$ and $$...$$ content directly through as \(...\) and \[...\] (or $...$ with --wrap=preserve). No internal processing — LaTeX handles the typesetting.
Code listings via --listings. Instead of Pandoc generating its own syntax-highlighted output, this flag converts fenced code blocks into \lstlisting environments, delegating highlighting to the listings LaTeX package.
Cross-reference labels. Header identifiers like ## Methods {#sec:methods} become \hypertarget{sec:methods}{} / \label{sec:methods}. With pandoc-crossref (https://github.com/lierdakil/pandoc-crossref), references like @sec:methods convert to \ref{} or \cref{} calls. Consider using pandoc-crossref to clean up cross-references in Markdown (currently raw \label{}/\autoref{} in source), but must configure or filter to produce \autoref{} instead of \ref{}. The "reference labels" feature is unsupported for LaTeX output, but basic section cross-refs work with --number-sections. Filter must run before citeproc. External binary dependency, version-locked to pandoc.
Footnotes. [^1] footnote syntax maps directly to \footnote{...}.
Block quotes. Pandoc > block quotes become \begin{quote}...\end{quote}.
Ordered/unordered lists. Map to \begin{enumerate} / \begin{itemize} environments.
Definition lists. Map to \begin{description}...\end{description}.
Images. ![caption](path) becomes \includegraphics{} wrapped in a figure environment with \caption{}.
Tables. Pandoc's various table syntaxes become longtable, booktabs, or other LaTeX table environments depending on options.
Divs with custom attributes. Fenced divs like ::: {.theorem} can be mapped to custom LaTeX environments via --include-in-header or filters, producing \begin{theorem}...\end{theorem}.
Spans with LaTeX commands. [text]{.smallcaps} → \textsc{text}, [text]{.underline} → \underline{text}.
Raw LaTeX pass-through. Any content marked with `\command`{=latex} or a ```{=latex} block is passed through verbatim — Pandoc doesn't touch it at all.
Metadata → LaTeX preamble. YAML fields like title, author, date, documentclass, classoption, header-includes, fontsize, etc. map directly to \title{}, \author{}, \documentclass[]{}, and preamble content.
The key distinction is: citeproc is Pandoc doing the work itself (format-agnostic), while the items above are Pandoc acting as a structural translator, emitting LaTeX commands and letting the LaTeX toolchain do the heavy lifting. For your workflow — authoring in Obsidian and compiling to LaTeX/PDF — the --biblatex or --natbib route is often preferable since it gives you full access to your LaTeX bibliography style and keeps the .bib handling consistent with a pure LaTeX pipeline.

Use Obsidian pandoc Plugin.

Define specific environments in LaTeX preamble and then use them as classes in pandoc. Like Meta, Scaffold, Scythe, and all the others.

~~Remove node for plan mode as default. I want to set which mode I get.~~ ✅ Done — plan mode removed from operating modes list and rule #8 removed
