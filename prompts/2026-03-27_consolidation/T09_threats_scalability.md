# T09: Section 05 — Threats to Validity + Scalability Measurement

**Wave:** 3 (after T08 complete)
**Execution:** Single agent. Drafts prose. INTERACTIVE for scalability data.
**Dependencies:** T08 (evaluation content must be established).
**Target file:** `sections/05_evaluation.md` — Sec 5.2 (Scalability) + Sec 5.3 (Threats).
**Downstream:** T10 (polish).

---

## Context

This task drafts the scalability measurement section and threats to validity. Scalability measurement is required by Oszkár — do not cut. However, actual Refinery measurement data may not be available yet. If not available, draft the methodology and leave results as placeholder.

## Read Before Writing

1. `sections/05_evaluation.md` — current state (after T08)
2. `models/vc_metamodel.refinery` — model size (metaclass count, predicate count)
3. `VENUE.md` — Reviewer B (methodology rigor), Reviewer D (tool dependency attack)
4. `CLAUDE.md` — writing style

## What to Draft

### 5.2 Scalability Measurement (~0.5 page)

**Methodology** (1 paragraph):
- Research questions: RQ1 — Does Refinery generate valid model instances within practical time bounds? RQ2 — How does generation time scale with model scope (number of entities, credentials)?
- Setup: Refinery version, hardware, scope parameters
- Measurement: generation time, solution count, memory usage

**Results** (1 paragraph or table):
- If Martin provides Refinery measurement data: populate with actual numbers
- If not available: draft methodology section with RQs and setup, leave results as `%% @TODO: Scalability measurement results — Martin to provide Refinery timing data %%`
- Include scope parameter table: number of Entities, CredentialSubjects, Credentials, format types → generation time

**Discussion** (2-3 sentences):
- Practical sufficiency for credential ecosystem design (typical ecosystems have O(10) credential types)
- Limitation: Refinery is research prototype, not production tool

### 5.3 Threats to Validity (~0.5 page, 4 paragraphs)

**Construct validity** (2-3 sentences):
- Metamodel coverage depends on VCDM 2.0 interpretation — concepts may be modeled at wrong granularity
- Constraint formalization choices (which constraints to include) reflect our judgment of relevance

**Internal validity** (2-3 sentences):
- Running example (CSOK) is a single scenario — different credential ecosystems may expose different constraint interactions
- FCA-derived propagation rules depend on the format capability characterization being complete

**External validity** (2-3 sentences):
- Single governance context (EU/eIDAS) — constraint catalog may not cover non-European regulatory frameworks
- Single tool (Refinery) — results may not generalize to other partial modeling frameworks
- FSL is less mature — fewer format-specific constraints formalized

**Reliability** (2-3 sentences):
- Refinery model and constraint definitions are available as supplementary material
- Replication requires Refinery tool (open source)

### DO NOT TOUCH
- Section 5.1 (Elaboration) — T08
- Evaluation preamble — T10

## Constraints

- Scalability section is REQUIRED (Oszkár directive) — do not cut
- If measurement data unavailable, draft methodology with clear `@TODO` placeholder for results
- Threats must be honest — acknowledge FSL maturity gap, single running example, EU-only governance
- Use `\ref{sec:...}` for cross-references
- Budget: ~1.0 page total (0.5 scalability + 0.5 threats)
- No LLM tells. Obsidian Markdown.
