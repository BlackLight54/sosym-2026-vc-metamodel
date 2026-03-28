---
id: T09
short: "threats-scalability"
title: "Sec 05 threats to validity + scalability measurement"
status: pending
depends_on: ["T08"]
binding_claims: []
target: sections/05_evaluation.md
priority: high
pipeline: "consolidation"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Draft Sec 05.2 scalability measurement (RQs, model instances, setup, analysis) and Sec 05.3 threats to validity (internal, external, construct, conclusion). Scalability measurement is **required by Oszkár** — do not cut.

## Context

Advisor directive (Oszkár, 2026-03-25): Evaluation must include research questions, scaling approach with at least 2 instances, measurement setup, results with 2 `figure*` diagrams, analysis answering RQs, and threats to validity.

Scalability data requires interactive Refinery sessions (Martin to run). If actual measurement data is unavailable, draft methodology and leave results as `::: {.todo}` placeholder annotations.

## Read before writing

1. `sections/05_evaluation.md` — current state (after T08)
2. `models/vc_metamodel.refinery` — model size (metaclass count, predicate count)
3. `context/VENUE.md` — reviewer methodology rigor expectations

## What to draft

### 5.2 Scalability measurement (~0.5 page)

**Methodology** (1 paragraph):

- RQ1 — Does Refinery generate valid model instances within practical time bounds?
- RQ2 — How does generation time scale with model scope (number of entities, credentials)?
- Setup: Refinery version, hardware, scope parameters
- Measurement: generation time, solution count, memory usage

**Results** (1 paragraph or table):

- If Martin provides data: populate with actual numbers
- If not available: draft methodology with `::: {.todo}` placeholder
- Scope parameter table: Entities × CredentialSubjects × Credentials × format types → generation time
- **Per X06**: Anchor N=3 instance to CSOK running example ("The smallest instance corresponds to the structure of the housing subsidy running example from \autoref{sec:motivation}.")

**Discussion** (2-3 sentences):

- Practical sufficiency for credential ecosystem design (typical ecosystems have O(10) credential types)
- Limitation: Refinery is research prototype, not production tool

**Figure specs**: Design 2 `figure*` scalability diagrams: `fig_scalability_validation` and `fig_scalability_generation`. Place `::: {.figure}` annotations with specs.

### 5.3 Threats to validity (~0.5 page, 4 paragraphs)

**Construct validity** (2-3 sentences): Metamodel coverage depends on VCDM 2.0 interpretation; constraint formalization choices reflect judgment of relevance.

**Internal validity** (2-3 sentences): Single running example (CSOK); FCA-derived propagation rules depend on format capability characterization being complete.

**External validity** (2-3 sentences): Single governance context (EU/eIDAS); single tool (Refinery); FSL less mature.

**Reliability** (2-3 sentences): Model and constraints available as supplementary; replication requires Refinery (open source).

## Also absorbs

- **O-THREATS**: Threats to validity (identical scope)
- **O-FIG**: Scalability figure designs
- **X06**: Anchor N=3 to CSOK

## Constraints

- Scalability section REQUIRED (Oszkár directive) — do not cut
- Threats must be honest — acknowledge FSL maturity gap, single running example, EU-only governance
- Budget: ~1.0 page total (0.5 scalability + 0.5 threats)

## Acceptance criteria

- [ ] Scalability methodology drafted with RQs and setup
- [ ] Results populated or `::: {.todo}` placeholders with specs for Martin
- [ ] Two `figure*` annotation specs placed
- [ ] N=3 anchored to CSOK running example
- [ ] All four validity categories addressed honestly
