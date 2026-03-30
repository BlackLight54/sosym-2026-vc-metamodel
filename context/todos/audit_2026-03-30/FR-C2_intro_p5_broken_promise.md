---
id: "FR-C2"
short: "intro-p5-broken-promise"
title: "Introduction P5: structure paragraph promises content the conclusion doesn't deliver"
status: pending
priority: high
depends_on: []
binding_claims: []
target: "sections/01_introduction.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Fix the structure paragraph (P5, final paragraph of Sec 01) so that its description of the conclusion section matches what the conclusion actually contains.

## Context

Line 24 of `sections/01_introduction.md` currently ends with:

```
\autoref{sec:conclusion} examines the design-time scope boundary and identifies extensions to runtime verification.
```

The conclusion (`sections/07_conclusion.md`) contains three paragraphs:
1. Housing subsidy headline results (governance conflict + predicate gap)
2. Three-layer metamodel summary + validation results + multi-layer necessity argument
3. FSL scope as primary limitation and extension point

The conclusion does **not** "examine the design-time scope boundary" or "identify extensions to runtime verification." The scope boundary discussion and runtime/future work directions live in `sections/05_evaluation.md`, Sec 5.5 (Limitations and Future Work, `{#sec:limitations}`).

This was identified in the final review as **critical** because a reviewer who follows the structure paragraph to the conclusion expecting scope/runtime discussion will find summary paragraphs instead. It creates a promise-fulfillment gap that suggests the paper was not carefully proofread.

## Reviewer impact

The Mathematician and Adversarial reviewers track forward references; the Business Manager uses the structure paragraph for navigation. A broken promise here damages credibility across all personas.

## Action

Rewrite the `\autoref{sec:conclusion}` clause in P5 to match what the conclusion actually delivers. Two options:

**Option A (recommended):** Redirect scope/future work to limitations section:

Replace:
```
\autoref{sec:conclusion} examines the design-time scope boundary and identifies extensions to runtime verification.
```

With something like:
```
\autoref{sec:conclusion} summarizes the key results and identifies the format-specific layer's current scope as the primary extension point.
```

**Option B:** If Martin prefers to keep "scope boundary" language in the conclusion reference, add a sentence to the conclusion pointing to `\autoref{sec:limitations}` for the fuller treatment.

## Acceptance criteria

- The structure paragraph's description of the conclusion matches the conclusion's actual content.
- No forward reference in P5 points to content that doesn't exist at the referenced location.
