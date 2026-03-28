---
id: T07
short: "cross-layer"
title: "Sec 04 cross-layer constraints (A12-A15)"
status: pending
depends_on: []
binding_claims: [3]
target: sections/04_approach.md
priority: high
pipeline: "consolidation"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Draft Sec 04.4 cross-layer constraints: trace consistency, entity alignment, constraint catalog, DCL restructuring worked example. Core delivery for **Binding Claim #3** (cross-layer constraints as Refinery graph predicates).

## Context

Section 4.4 is the core formal contribution. It defines how cross-layer constraints are expressed as Refinery graph predicates, connecting DCL and CSL (and FSL where applicable). The constraint taxonomy table at A11 is already drafted — do NOT touch. The worked example at A17 is already drafted — do NOT touch.

## Read before writing

1. `sections/04_approach.md` — current state, especially A11 (constraint taxonomy table) and A17 (worked example)
2. `models/vc_metamodel.refinery` — authoritative source (cross-layer constraints section, approximately lines 304+)
3. `models/governance_conflict.refinery` — governance conflict predicates
4. `.claude/memory/decision_*.md` — error predicate vs. propagation rule distinction

## What to draft

### A12 — Trace consistency predicates (~5 sentences)

- Define: `trace_consistency` — every CredEntity must trace to exactly one Entity
- Define: `claim_traces_prop` — Claims must trace to Props connecting the same Entities
- These are CHECKING predicates — violations mean the design is inconsistent
- Present in prose + math notation (no code listings per decision_no_code_listings.md)
- **Mode annotation**: trace consistency is verified in all three usage modes

### A13 — Entity alignment shadow predicate (~3 sentences)

- Define: `entity_alignment` shadow predicate — records which CSL entities map to which DCL entities without constraining
- Shadow predicates record derived information; they do not trigger errors
- Explain why shadow (not error): alignment is informational, used by downstream predicates

### A14 — Anti-pattern error predicates (~5 sentences)

- Define: `missing_credential_coverage` — a DCL Entity with no CSL trace
- Define: `cross_credential_predicate_gap` — a DCL Prop connecting two Entities that trace to different CredentialSubjects
- These are ERROR predicates — if satisfied, the design has a structural problem
- **Mode annotation**: anti-patterns trigger NOT_OK() in error identification mode; guide elimination in design space exploration

### A15 — Propagation rules for cross-layer guidance (~4 sentences)

- Define: propagation rules that guide Refinery's model generation
- `propagate_format_from_credential` — if a CredentialSubject has a format assignment, propagate to contained Claims
- **Key distinction**: propagation rules GUIDE generation (negative elimination); error predicates CHECK results. This is the central mechanism that enables design space exploration.

### DO NOT TOUCH

- A11 (constraint taxonomy table) — already drafted
- A16 (usage mode prose) — separate concern
- A17 (worked example) — already drafted

## Also absorbs

- **Z01 T18**: Add novelty defense in Sec 4.4 — "our contribution is the cross-layer constraint methodology, not the individual layer definitions"
- **X10** (FSL structural defense): Add 2-3 sentences in Sec 4.3 defending FSL as metamodel layer, not lookup table (containment structure, cross-layer predicate participation, governance annotation attachment)
- **O-MODES**: Clarify usage modes (OK / NOT_OK / GENERATED) in per-subsection mode annotations

## Constraints

- All formal definitions in prose + math, NOT code listings (per decision_no_code_listings.md)
- Predicate names must match `models/vc_metamodel.refinery` exactly
- **Distinguish error predicates from propagation rules** — this is a key insight
- Use `\autoref{sec:...}` for cross-references
- Budget: A12 + A13 + A14 + A15 should use ~0.8 pages

## Acceptance criteria

- [ ] A12–A15 drafted with definitions matching the Refinery model
- [ ] Error predicate vs. propagation rule distinction is explicit
- [ ] Mode annotations present for each predicate type
- [ ] FSL structural defense added (from X10)
- [ ] Binding Claim #3 delivered
