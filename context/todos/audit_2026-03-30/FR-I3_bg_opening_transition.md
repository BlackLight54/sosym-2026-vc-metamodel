---
id: "FR-I3"
short: "bg-opening-transition"
title: "Background section lacks opening transition sentence"
status: pending
priority: low
depends_on: []
binding_claims: []
target: "sections/02_background.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Add a 1-sentence preamble to Sec 2 (Background) that names the three foundations before diving into the first subsection.

## Context

`sections/02_background.md` currently jumps directly from the section heading to the first subsection:

```
# Background {#sec:background}

## W3C Verifiable Credentials Data Model 2.0 {#sec:vcdm}
```

There is no transition sentence after the section heading. The section has three subsections (VCDM, Multi-Layer Modeling, Partial Graph Modeling with Refinery), and the reader benefits from knowing what the three pillars are before encountering the first one.

The transition at the *end* of the section (line 28) does connect the three: "These three concerns, format-dependent privacy capabilities, independently governed layers, and partial graph reasoning, together enable the cross-layer analysis." Moving a version of this to the top as well would frame the section.

## Reviewer impact

- **Business Manager:** Navigates by section structure. A framing sentence helps orientation.
- **Mathematician:** Neutral — reads linearly regardless.

## Action

Add a single sentence between the section heading and first subsection:

```
# Background {#sec:background}

Three foundations underpin the cross-layer analysis: the credential data model that defines the structural vocabulary (\autoref{sec:vcdm}), multi-layer modeling that organizes the concern spaces (\autoref{sec:multi-layer}), and partial graph modeling that provides the constraint language (\autoref{sec:refinery}).

## W3C Verifiable Credentials Data Model 2.0 {#sec:vcdm}
```

## Acceptance criteria

- One sentence between section heading and first subsection.
- Names all three subsection topics.
- Does not exceed 2 sentences.
