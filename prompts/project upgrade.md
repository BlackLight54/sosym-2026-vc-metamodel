One last thing that we should add is a page budget audit pipeline so that we can see where we need to add and where we need to cut. We should do:

- One pass over the paper with one agent or a few.
- With an agent, either by section or by some time subsection; let Claude decide how he cuts it up.
- We should do a per-section audit.
- Also do some cross-section audits alongside that, like how do sections relate, what are missing things like that.
- Similarly to the other partner.
- Finally, synthesize the results of what is our current page budget and where should we focus on adding or cutting?

Also, instead of using a to-do index in the to-do directory, maybe you should use the TODO.md in the project root as an index with a pointer to the directory.

We just made a great observation: To-dos can have a proper front matter and have a lot of information in them, like:

- ID
- Short ID for Short Identification
- Title
- Status
- Dependencies
- Binding Claims
- Any other references to the paper or the section (which section do they target)
- What pipeline are they part of
- Any other things in the front matter in the YAML in the front that should be included somewhere with regards to how to write to those

It is also important that the ID can be constituted through multiple characters and numbers and anything else so that we can run the pipelines.

Finally, remind me to extract the to-do's from the latest analysis.

P.S. We should add the project overhaul as a skill. And any other very prominent prompts.

I also want to update the project from the Obsidian Mudpicks analytic bullshit to only use Pandoc LaTeX and to replace the markers with Pandoc md Constructs such as Spans and Divs.  

> Here are the Pandoc features that, rather than processing things internally (like `citeproc` does), translate Pandoc Markdown structures directly into their LaTeX counterparts and let LaTeX handle the processing:
>
> **Citations via `--natbib` / `--biblatex`.** The most direct parallel. Instead of `--citeproc`, you pass `--natbib` or `--biblatex`, and Pandoc converts `[@key]` syntax into `\citep{key}`, `\citet{key}`, `\autocite{key}`, etc. LaTeX's own bibliography engine (bibtex/biber) then resolves them.
>
> **Math.** Pandoc passes `$...$` and `$$...$$` content directly through as `\(...\)` and `\[...\]` (or `$...$` with `--wrap=preserve`). No internal processing — LaTeX handles the typesetting.
>
> **Code listings via `--listings`.** Instead of Pandoc generating its own syntax-highlighted output, this flag converts fenced code blocks into `\lstlisting` environments, delegating highlighting to the `listings` LaTeX package.
>
> **Cross-reference labels.** Header identifiers like `## Methods {#sec:methods}` become `\hypertarget{sec:methods}{}` / `\label{sec:methods}`. With `pandoc-crossref`, references like `@sec:methods` convert to `\ref{}` or `\cref{}` calls.
>
> **Footnotes.** `[^1]` footnote syntax maps directly to `\footnote{...}`.
>
> **Block quotes.** Pandoc `>` block quotes become `\begin{quote}...\end{quote}`.
>
> **Ordered/unordered lists.** Map to `\begin{enumerate}` / `\begin{itemize}` environments.
>
> **Definition lists.** Map to `\begin{description}...\end{description}`.
>
> **Images.** `![caption](path)` becomes `\includegraphics{}` wrapped in a `figure` environment with `\caption{}`.
>
> **Tables.** Pandoc's various table syntaxes become `longtable`, `booktabs`, or other LaTeX table environments depending on options.
>
> **Divs with custom attributes.** Fenced divs like `::: {.theorem}` can be mapped to custom LaTeX environments via `--include-in-header` or filters, producing `\begin{theorem}...\end{theorem}`.
>
> **Spans with LaTeX commands.** `[text]{.smallcaps}` → `\textsc{text}`, `[text]{.underline}` → `\underline{text}`.
>
> **Raw LaTeX pass-through.** Any content marked with `` `\command`{=latex} `` or a ```` ```{=latex} ```` block is passed through verbatim — Pandoc doesn't touch it at all.
>
> **Metadata → LaTeX preamble.** YAML fields like `title`, `author`, `date`, `documentclass`, `classoption`, `header-includes`, `fontsize`, etc. map directly to `\title{}`, `\author{}`, `\documentclass[]{}`, and preamble content.
>
> The key distinction is: `citeproc` is Pandoc doing the work itself (format-agnostic), while the items above are Pandoc acting as a structural translator, emitting LaTeX commands and letting the LaTeX toolchain do the heavy lifting. For your workflow — authoring in Obsidian and compiling to LaTeX/PDF — the `--biblatex` or `--natbib` route is often preferable since it gives you full access to your LaTeX bibliography style and keeps the `.bib` handling consistent with a pure LaTeX pipeline.

To verify your work and to complete the task, do a migration check:

- All references
- Grab every little replace string
Please consolidate the project after you've done working both in the workflow and in the paper sense.

I've said a lot of things in this prompt. I want you to create a to-do for each task, starting with M, which will be high priority tomorrow from each of it in the plan, and also consolidate the to-do so that every one of them has an id and the attributes that I mentioned.
