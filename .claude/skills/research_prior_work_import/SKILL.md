---
description: Create structured reference notes from DOIs, BibTeX entries, or paper titles, assess relevance, and propose where to integrate them. Use when importing references, adding papers to the related work, or processing search results.
---

# Skill: Prior Work Import

**Purpose:** Given DOIs, BibTeX entries, or paper titles, create structured reference notes and assess relevance to the current paper.

## Trigger

- "Import these references: [DOIs/titles]"
- "Add this paper: [DOI or title]"
- "Process these search results" (after gap analysis agent returns)
- "Import prior work from [Zotero collection / BibTeX file]"

## Inputs

One or more of:
- DOIs (e.g., `10.1007/978-3-031-12345-6_1`)
- BibTeX entries
- Paper titles with enough detail to identify
- A batch of search results from a gap analysis agent

## Steps

### 1. Resolve metadata

For each reference:
- If DOI: fetch metadata (title, authors, year, venue, abstract).
- If BibTeX: parse directly.
- If title only: search for the paper. If ambiguous, present candidates to Martin.

If Zotero MCP is connected, use it to search and retrieve. Otherwise, use web search.

### 2. Create reference note

For each paper, create a structured note in `context/references/`:

Filename: `[firstauthor_year_keyword].md` (e.g., `basin_2018_tamarin.md`)

```markdown
# [Title]

**Authors:** [authors]
**Year:** [year]
**Venue:** [venue]
**DOI:** [doi]

## Relevance to this paper

::: {.scaffold}
Fill this in. Why did we look at this paper? Which claim does it support/threaten?
:::
**Relation:** [supports groundedness / threatens novelty / background / methodology source]
**Relevant to:** [which section or claim in our paper]

## Key contributions

::: {.scaffold}
2-3 sentences. What does this paper actually do?
:::

## Key distinctions from our work

::: {.scaffold}
How does our approach differ? What do we do that they don't, and vice versa?
:::

## Useful for citing

::: {.scaffold}
Specific claims or results from this paper we might cite, with page/section references.
:::

## Notes

::: {.scaffold}
Anything else: limitations, methodology concerns, things we disagree with.
:::
```

### 3. Assess batch relevance

If processing multiple papers (e.g., gap analysis results), produce a summary:

- **Directly relevant:** Papers that must be cited and discussed.
- **Tangentially relevant:** Papers that establish context but don't need detailed discussion.
- **Not relevant:** Papers that came up in search but are off-topic. Brief note on why.

### 4. Propose integration

For directly relevant papers, suggest:
- Where in the paper they should be discussed (which section).
- Whether they threaten the novelty claim and how to differentiate.
- Draft a `[description]{.cite}` annotation or a brief reference sentence for the appropriate section.

### 5. BibTeX management

If the paper provides a BibTeX entry (from DOI resolution or the source):
- Present it to Martin for addition to Zotero / the project `.bib` file.
- Suggest a citation key following Martin's convention (if one is established) or `[firstauthor][year][keyword]`.

Do NOT modify the `.bib` file directly — Zotero owns it.

### 6. Update TODO.md

- For directly relevant papers: add "Integrate [paper] into Section [N]" tasks.
- For novelty threats: add "Differentiate from [paper] in Section [N]" tasks.

## Output

- Reference notes in `context/references/`.
- Relevance summary presented to Martin.
- Integration suggestions with section targets.
- TODO.md updated.
