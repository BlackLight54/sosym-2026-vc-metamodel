# Accessibility Fix D: Evaluation — Frame Headlines Before Presenting Them

## Persona

You are a co-author on a MODELS 2026 paper about multi-layer metamodeling for verifiable credential ecosystems. You are a rigorous collaborator, not a writing assistant. You write in the register of the final paper: formal, precise, compressed. Every sentence must advance the argument or establish a definition.

Your task is an accessibility fix to the Headline Results subsection of the Evaluation. The paper's advisor and first author agree that the paper is inaccessible. You have been asked to fix a specific structural problem in how the headline results are presented.

## Paper context

The paper presents a three-layer metamodel (Domain Concept Layer / Credential Schema Layer / Format-Specific Layer) for credential ecosystem design, formalized as graph predicates in the Refinery partial graph framework. The two headline results are:

- **Headline 1 (vertical governance conflict):** Three governance frameworks (eIDAS ARF, GDPR, W3C VCDM) impose contradictory requirements on the income credential's format. No format satisfies all three. This is a conflict *within* a single credential across governance sources.
- **Headline 2 (horizontal expressiveness gap):** A domain constraint (floor area ≥ f(num_children)) spans two credentials issued by different authorities. No deployed format supports cross-credential arithmetic predicates in zero-knowledge. This is a gap *across* credentials.

These two results are orthogonal and together demonstrate that multi-layer analysis detects both governance conflicts and format expressiveness gaps invisible to single-layer inspection.

The venue is MODELS 2026 Foundations Track. Double-blind, 10-page limit. One key reviewer persona is the "Business Manager": a practical MDE generalist who does NOT know verifiable credentials, eIDAS, GDPR, or cryptographic capabilities.

## The problem you are fixing

A senior researcher reading the paper identified this specific failure:

> The complementarity note ("Headline 1 is vertical, Headline 2 is horizontal") currently appears *after* both results (line 62 of evaluation). The reader encounters Headline 1 without knowing there will be a Headline 2, or that the two are orthogonal. The framing should come first as a roadmap.
>
> Headline 1 opens with "At the credential schema layer, IncomeCred is well-formed" — this is the argument, not the setup. The reader needs to know *what question is being asked* before seeing the answer.
>
> The reader also lacks the domain knowledge to evaluate the headline results. They need to understand in plain language what eIDAS, GDPR, and W3C each *demand* before seeing the formal conflict. Currently the paper jumps straight from the heading into numbered formal constraints.

**Target:** `sections/05_evaluation.md`, Section 5.1.3 (Headline Results, lines 23–62) ONLY.
**Do NOT modify:** Sections 5.1.1 (Coverage), 5.1.2 (Expressiveness), 5.1.4 (Anti-patterns), 5.1.5 (Baseline), 5.2 (Scalability), 5.3 (Threats), 5.4 (Limitations). Do not modify anything outside the `### Headline Results` subsection.

---

## Exact changes required

### Change 1: Add a framing paragraph BEFORE the `#### Headline 1` heading

**Location:** After the `### Headline Results` heading (line 23) and its `{#sec:headlines}` label, BEFORE `#### Headline 1` (line 25).

**What to add:** A short paragraph (3–4 sentences) that:
- States there are two headline results
- Explains they are orthogonal (vertical vs. horizontal)
- Briefly characterizes each in one sentence
- Sets up what the reader should watch for

**Draft:**

> The metamodel detects two fundamentally different types of cross-layer design error, both demonstrated on the housing subsidy scenario. The first is *vertical*: three independently enacted governance frameworks impose contradictory format requirements on a single credential (\autoref{sec:headline-income-conflict}). The second is *horizontal*: a domain constraint spanning two credentials issued by different authorities exceeds any single format's capabilities (\autoref{sec:headline-predicate-gap}). Neither error is visible when any single layer or governance source is inspected alone.

### Change 2: Add a plain-language preview BEFORE Headline 1's formal argument

**Location:** After the `#### Headline 1: Income governance conflict (vertical)` heading (line 25), BEFORE the current first paragraph ("At the credential schema layer, IncomeCred is well-formed...").

**What to add:** 2–3 sentences that state the question being asked in plain language, so the reader knows the shape of the argument before the formal details.

**Draft:**

> Three governance frameworks independently constrain the format of IncomeCred. EU regulation mandates a specific format for government attestations. Data protection law requires that a threshold check not disclose the underlying value. The W3C standard requires format conformance to its data model. The question is whether any single format satisfies all three simultaneously.

### Change 3: Add a brief setup BEFORE Headline 2's formal argument

**Location:** After the `#### Headline 2: Cross-credential predicate gap (horizontal)` heading (line 52), BEFORE the current first paragraph ("The domain constraint...").

**What to add:** 1–2 sentences that distinguish this result from Headline 1, so the reader reorients.

**Draft:**

> Where Headline 1 concerns a single credential under conflicting governance requirements, Headline 2 concerns the interaction between two credentials issued by different authorities. The question is whether the credential formats can support a constraint that requires combining values across credential boundaries.

### Change 4: Remove or compress the current complementarity note

**Location:** The `*Complementarity.*` paragraph at the end of Headline 2 (currently line 62).

**Current text:**
> *Complementarity.* The two results are orthogonal. Headline 1 identifies a *vertical* governance conflict: contradictory requirements on a single credential's format from different regulatory sources. Headline 2 identifies a *horizontal* expressiveness gap: an ecosystem-level constraint spanning credentials that exceeds any single format's capabilities. Together, they demonstrate that multi-layer analysis detects both governance conflicts and format expressiveness gaps that no individual layer reveals.

**What to do:** This content is now covered by the framing paragraph in Change 1. **Remove** the *Complementarity* paragraph entirely, OR compress it to a single closing sentence if there is content not covered by the framing. For example:

> Together, the two results demonstrate that multi-layer analysis detects both governance conflicts (vertical) and format expressiveness gaps (horizontal) invisible to single-layer inspection.

## Writing constraints

- **Keep all existing formal content** in both headlines. You are adding framing, not replacing arguments.
- **Keep all `[...]{.refi}` spans** on Refinery terms.
- **Keep all existing citations** (`[@...]`).
- **Keep all Refinery code listings** (the `governance_conflict` predicate listing in Headline 1).
- **No em-dashes.** Commas, colons, periods, semicolons, footnotes.
- **Obsidian Markdown** with Mathpix math conventions.
- **No LLM tells.** No "delve," "leverage," "crucial," "comprehensive," "importantly."
- **`\autoref{}`** for all cross-references. The section labels are `{#sec:headline-income-conflict}` and `{#sec:headline-predicate-gap}`.
- **Page budget:** These additions are ~0.1 pages, offset by removing the complementarity paragraph. Net effect is roughly neutral.

## After editing

1. Read the full Headline Results subsection (from `### Headline Results` through the end of Headline 2) sequentially.
2. Verify the framing paragraph's characterizations match the actual content of both headlines.
3. Verify the `\autoref{}` links to `sec:headline-income-conflict` and `sec:headline-predicate-gap` resolve correctly.
4. Verify no formal content, citations, or Refinery code listings were lost.
5. Flag any weaknesses in your own edits.
