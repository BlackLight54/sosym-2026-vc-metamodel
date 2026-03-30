---
id: "FR-I1"
short: "rw-cite-wrapper"
title: "Related Work: .cite wrapper on Famelis/Chechik reference may block citation"
status: pending
priority: medium
depends_on: []
binding_claims: []
target: "sections/06_related_work.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Verify and fix the Famelis/Salay/Chechik citation in Related Work Sec 6.3.

## Context

Line 27 of `sections/06_related_work.md` contains:

```
[These semantics extend the partial model framework of Famelis, Salay, and Chechik [@famelis_partial_2012], who formalized reasoning under structural uncertainty for model-driven engineering]{.cite}.
```

The `.cite` annotation wrapper indicates this citation may not be resolved. Two issues:

1. **Is `@famelis_partial_2012` in the .bib file?** If yes, the `.cite` wrapper should be removed so the sentence renders as normal prose with a citation. If no, the BibTeX key needs to be added.

2. **The `.cite` annotation behavior:** Per CLAUDE.md, `annotations.lua` converts `.cite` divs/spans to `\todo{}` in draft mode and strips them in submission mode. If this is a submission build, the **entire sentence will be stripped**, leaving a gap in the Refinery/partial-model discussion that the Mathematician reviewer will notice. If this is a draft build, it renders as a `\todo{}` command in the PDF — also visible to reviewers.

This was identified in the final review as **important** because the Famelis/Chechik lineage is directly relevant to the paper's formalism (Refinery's partial model semantics extend their work). The Mathematician reviewer (persona B, familiar with Semerath/Varro/Chechik) will look for this citation.

## Action

1. Check whether `@famelis_partial_2012` exists in the project's `.bib` file (likely `pandoc/references.bib` or similar).
2. If the key exists: remove the `{.cite}` wrapper so the sentence renders as normal prose.
3. If the key does not exist: add a BibTeX entry for Famelis, Salay, and Chechik (2012), "Partial Models: Towards Modeling and Reasoning with Uncertainty" (likely ICSE 2012 or similar — verify the correct venue). The entry previously tracked in memory as `famelisPartialModelsModeling2012` may already be present under that key.

## Acceptance criteria

- The sentence appears as normal prose in both draft and submission builds.
- The citation resolves to a valid bibliography entry.
- No `.cite` wrapper remains on this sentence.
