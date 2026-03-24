# Skill: Figure Design

**Purpose:** Design, propose, track, and iterate paper figures. Figures are the most important element of a well-written paper — a reader who skims only the figures and captions should understand the contribution. This skill structures the process from proposal through refinement.

LLMs can draft figures (TikZ, SVG, Mermaid, Excalidraw, Python/matplotlib). Humans refine them. The skill produces structured proposals and drafts; Martin iterates to publication quality.

## Trigger

- "Propose a figure for [concept/claim]"
- "Design figures for the paper"
- "This needs a figure"
- "Review the figures"
- "Update figure for [changed argument]"

## Inputs

- Section files (what arguments exist that could benefit from figures).
- CLAUDE.md: thesis, domain.
- VENUE.md: format (column width matters for layout), exemplar papers (what good figures look like at this venue).
- Running example (should appear as or within a figure).
- `figures/` directory (existing figure sources).

## Design principles

### What makes a good figure

**Self-contained.** A reader should understand the figure from the figure itself plus its caption, without reading the surrounding text. The caption does the heavy lifting: it states what the figure shows, what the reader should observe, and what conclusion to draw.

**Information-dense.** Every visual element carries meaning. No decorative elements. No redundant labels. If a box, arrow, or color doesn't encode information, remove it.

**Layered.** The figure works at multiple reading speeds: a 5-second glance gives the main point; a 30-second study reveals the structure; a careful read with the caption gives the full argument.

**Consistent.** All figures in the paper use the same visual language — same colors for the same concepts, same line styles for the same relationships, same spatial conventions. Define the visual vocabulary once and apply it everywhere.

**Honest.** Figures do not exaggerate, cherry-pick, or mislead. Axis scales are appropriate. Comparisons use the same baseline. Omissions are noted.

### Nature-style figure qualities

Nature figures set the standard because they:
- **Lead with the main finding.** The most important information is the most visually prominent.
- **Use panel layouts.** Complex arguments are decomposed into labeled panels (a, b, c) that each make one point, composed into a single figure that makes the full argument.
- **Minimize text.** Labels are short. Explanations go in the caption, not the figure.
- **Use whitespace deliberately.** Figures are not cramped. Elements have room to breathe.
- **Have meaningful captions.** Nature captions are structured: first sentence states the conclusion, then each panel is described. The caption is a mini-abstract for the figure.

### What to avoid

- **Figures that restate the text.** If the figure adds nothing beyond what the prose already says, it wastes space.
- **Figures that require the text to interpret.** If a reader needs to find the paragraph that explains the figure, the figure fails.
- **Screenshot-quality figures.** No jagged edges, no low-resolution exports, no default matplotlib styling.
- **Color as the only distinguishing feature.** Figures must be readable in grayscale and by colorblind readers. Use shape, pattern, and position in addition to color.
- **Overly complex single figures.** If a figure needs more than 30 seconds to parse its structure, split it into panels or multiple figures.

## Steps

### 1. Audit the paper for figure opportunities

Read all section files. For each key concept, definition, claim, or distinction, ask:

- Would a figure carry this argument more effectively than prose?
- Is there a spatial, temporal, or structural relationship that is hard to express in text?
- Is this a comparison that would be clearer as a table or chart?
- Does the running example need visual grounding here?

Produce a figure opportunity list:

| # | Concept/Claim | Section | Figure type | Why a figure helps |
|---|--------------|---------|-------------|-------------------|
| F1 | Running example scenario | §2 | Protocol flow / BPMN | Grounds the example visually for the business manager reviewer |
| F2 | Formal model architecture | §3 | Architecture diagram | Shows relationships between definitions |
| F3 | Key distinction (X vs. Y) | §3.2 | Side-by-side comparison | The distinction is the contribution; must be visual |
| F4 | Evaluation results | §5 | Table or chart | Quantitative comparison |

### 2. Prioritize

Not every opportunity becomes a figure. Consider:

- **Page budget:** Figures consume space. A full-width figure in a two-column format costs ~1/3 page.
- **Argument weight:** Figures that support core contributions get priority over background illustrations.
- **Reviewer impact:** The business manager reviewer needs the running example figure. The adversarial reviewer needs the comparison. Prioritize by reviewer need.

Recommend: most papers need 3–6 figures. Fewer than 3 usually means the paper is under-illustrated. More than 8 usually means some figures aren't pulling their weight.

### 3. Design each figure

For each prioritized figure, produce a design spec:

```markdown
## Figure: fig:[label]

**Claim it supports:** [the argument this figure carries]
**Section:** [where it appears]
**Type:** [protocol flow / architecture / BPMN / comparison table / data chart / panel figure / other]

**What the reader should see in 5 seconds:** [the main takeaway]
**What the reader should see in 30 seconds:** [the structure and relationships]

**Panels (if multi-panel):**
- (a) [what this panel shows]
- (b) [what this panel shows]

**Visual vocabulary:**
- [concept A] → [visual encoding: color, shape, line style]
- [concept B] → [visual encoding]

**Draft caption:**
[First sentence: the conclusion. Then: panel-by-panel description. Then: what to observe.]

**Source format:** [TikZ / SVG / Python+matplotlib / Excalidraw / Mermaid]
**Filename:** figures/fig_[label].[ext]

**Dependencies:** [what must be stable before this figure can be finalized]
```

### 4. Check visual consistency across figures

If multiple figures exist or are proposed:
- Do they use the same color for the same concepts?
- Do they use the same spatial conventions (e.g., time flows left-to-right, abstraction increases upward)?
- Are labels and fonts consistent?
- If the running example appears in multiple figures, is it visually recognizable across them?

Propose a visual vocabulary table if one doesn't exist:

| Concept | Color | Shape | Line style |
|---------|-------|-------|-----------|
| Participant | blue | rounded rectangle | solid |
| Credential | green | hexagon | — |
| Attack/violation | red | — | dashed |

Store in `figures/STYLE.md` for reference.

### 5. Draft the figure

Produce a draft in the chosen source format. For LLM-drafted figures:

**TikZ:** Good for protocol flows, architecture diagrams, formal structures. Precise positioning. Requires LaTeX compilation to preview.

**SVG:** Good for web-style diagrams, can be edited in Inkscape/Illustrator. Hand off to Martin for refinement.

**Python (matplotlib/seaborn):** Good for data charts, plots. Output to PDF. Avoid default styling — apply a clean style.

**Excalidraw:** Good for hand-drawn-style diagrams. Quick iteration. Export to SVG/PDF.

**Mermaid:** Good for quick flowcharts and sequence diagrams during planning. Usually not publication quality — convert to TikZ or SVG for the final paper.

The draft is a starting point. State explicitly what is approximate and what Martin should refine:
- Layout and spacing will need manual adjustment.
- Colors should be verified against the venue's printing requirements (some venues print in grayscale).
- Label text may need shortening or repositioning.
- The visual hierarchy may need tuning — what should be most prominent?

### 6. Write figure metadata to section file

Where the figure should appear in the section file, insert:

```markdown
%% @FIGURE: fig:[label] | [one-line description] %%

**Figure [N]: [Draft caption.]** [First sentence: conclusion. Panel descriptions. What to observe.]
```

The `%% @FIGURE %%` marker is picked up by `skills/pre_submission_check`. The caption text is the draft — Martin rewrites.

### 7. Present to Martin

Output in plan mode:
- Figure opportunity audit (the full table).
- Prioritized list with reasoning.
- Design specs for each prioritized figure.
- Drafted source files (if requested).
- Visual vocabulary table.

Martin selects which figures to develop, modifies designs, and refines drafts.

### 8. Update TODO.md

- "Draft figure fig:[label]" for each approved figure.
- "Refine figure fig:[label]" after LLM draft is produced.
- "Check figure consistency" after multiple figures exist.
- "Update figure fig:[label] — argument changed in Section N" when the underlying argument evolves.

## Figure iteration protocol

Figures are not static. When the argument changes, figures must change:

1. After any revision to a section, check whether its figures still match.
2. If a definition changes, any figure that visualizes that definition needs updating.
3. If the running example changes, every figure that uses it needs updating.
4. `skills/final_review` checks figure–text consistency as part of its pass.

When updating, produce a diff description: "Figure fig:X currently shows [old state]. The argument now says [new state]. Proposed change: [what to modify]."

## When to run

- **Early (after section scaffold):** Audit for figure opportunities, design the running example figure.
- **During writing:** Propose figures as claims stabilize. Draft alongside the text.
- **Before submission:** Consistency check, caption polish, verify all figures are referenced.
- **After reviews:** Update or add figures based on reviewer feedback.

## Output

- Figure opportunity audit.
- Prioritized figure list.
- Design specs.
- Draft source files in `figures/`.
- Visual vocabulary in `figures/STYLE.md`.
- Figure metadata in section files.
- TODO.md updated.
