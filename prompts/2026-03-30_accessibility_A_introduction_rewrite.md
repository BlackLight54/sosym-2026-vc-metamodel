# Accessibility Fix A: Introduction — Open Concretely

**Target:** `sections/01_introduction.md`
**Goal:** Rewrite P1–P3 so the reader encounters the concrete problem before any jargon or acronyms.
**Do NOT modify:** P4 (contributions C1–C3), P5 (Refinery + usage modes), P6 (structure paragraph). Only tighten these if wording depends on P1–P3 changes.

---

## Problem

The introduction opens with "Emerging digital credential ecosystems allow persons and organizations to receive, hold, and selectively present cryptographically verifiable claims." A reader who doesn't already know what verifiable credentials are gets nothing from this sentence. The paper's best result — the income governance conflict — doesn't appear until Section 3. The reader has no reason to keep reading.

## What to do

### P1 — Open with the problem, not the technology

Rewrite P1 to lead with the concrete problem in 2–3 sentences. Something like:

> A government housing subsidy requires credentials from three independent authorities. EU regulation mandates a specific credential format for government attestations. Privacy law requires that an income threshold check not disclose the exact value — a capability the mandated format does not provide. No existing tool detects this conflict; each layer passes its own validation.

Then define what credentials are in 1–2 sentences (tamper-evident claims, issuer/holder/verifier model, W3C VCDM 2.0). The definition should serve the example, not precede it.

### P2 — The governance interaction problem

Keep the eIDAS/GDPR/W3C interaction argument but restructure:

1. Lead with the *consequence*: credential ecosystem designs can contain undetectable errors because governance frameworks impose requirements that conflict across abstraction layers.
2. Then name the three governance sources, each in its own clause with its concern:
   - W3C VCDM defines structural conformance.
   - eIDAS ARF mandates credential formats for government attestations.
   - GDPR requires data minimization, operationalized as a format capability requirement.
3. State that these sources were enacted independently; no single source anticipates the constraints imposed by the others.

Do NOT stack all three acronyms in one sentence. Introduce each with its concern.

### P3 — Gap statement

Keep the "existing tools operate at a single layer" argument. Add: "A credential schema may be well-formed in isolation, yet violate a cross-layer constraint that links domain-level claim semantics to format-specific privacy capabilities. Detecting such errors requires a formalization that spans all three concern spaces." (This sentence already exists in the current P3 — keep it, but make sure the gap statement clearly follows from the concrete example in P1.)

## Constraints

- **Academic integrity:** Martin writes the final prose. Draft aggressively, then flag weaknesses.
- **No LLM tells:** No "In today's landscape," "delve," "leverage," or throat-clearing.
- **No em-dashes.** Use commas, colons, periods, semicolons, or footnotes.
- **Register:** Formal, compressed, precise. Every sentence advances the argument.
- **Obsidian Markdown** with Mathpix math conventions. Use `\autoref{}` for cross-references.
- **Page budget:** Introduction is budgeted at 1.25 pages (~7 paragraphs). The rewrite should be roughly the same length as the current P1–P3.

## Current content for reference

Read `sections/01_introduction.md` before editing. The current P1 is line 10, P2 is line 12, P3 is line 14. Contributions start at line 16.

## After editing

- Read the full introduction sequentially to verify internal coherence.
- Verify that `\autoref{}` references in P5–P6 still resolve.
- Check that the contributions (C1–C3) still follow logically from the new P1–P3.
