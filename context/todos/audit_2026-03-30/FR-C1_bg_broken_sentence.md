---
id: "FR-C1"
short: "bg-broken-sentence"
title: "Background Sec 2.3: sentence broken across paragraph boundary"
status: pending
priority: high
depends_on: []
binding_claims: []
target: "sections/02_background.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Fix a sentence in Sec 2.3 (Partial Graph Modeling with Refinery) that is split across a Markdown paragraph boundary, causing pandoc to render two incomplete paragraphs.

## Context

Lines 33–35 of `sections/02_background.md` currently read:

```
Refinery [@marussy_refinery_2024] is a modeling methodology in which design specifications are expressed as partial models and graph predicates serve as a first-class constraint language. Refinery uses a four-valued logic interpretation[@Belnap77useful]

to every node, edge, attribute value, enabling reasoning over incomplete (or inconsistent) specifications where both structural and data-level decisions remain open.
```

The blank line between "interpretation[@Belnap77useful]" and "to every node" creates a paragraph break in Markdown. Pandoc will render this as two separate paragraphs — the first ending mid-sentence ("...interpretation") and the second starting with a dangling fragment ("to every node..."). A reviewer reading the PDF will see incoherent prose.

This was identified in the final review (2026-03-30) as a **critical** issue because it produces visibly broken text in the rendered output.

## Reviewer impact

All four reviewer personas (Champion, Mathematician, Business Manager, Adversarial) will notice broken prose. The Mathematician will be particularly sensitive to imprecise language around the formal foundation.

## Action

Merge lines 33–35 into a single coherent sentence. Suggested rewrite:

```
Refinery [@marussy_refinery_2024] is a modeling methodology in which design specifications are expressed as partial models and graph predicates serve as a first-class constraint language. Refinery uses a four-valued logic interpretation [@Belnap77useful] that assigns one of four truth values to every node, edge, and attribute value, enabling reasoning over incomplete (or inconsistent) specifications where both structural and data-level decisions remain open.
```

Note: also add a space before the citation bracket (`[@Belnap77useful]`), which is currently missing.

## Acceptance criteria

- Lines 33–35 form a single paragraph with no blank-line break.
- The sentence is grammatically complete.
- The Belnap citation is preserved with proper spacing.
