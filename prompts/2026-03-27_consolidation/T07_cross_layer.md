# T07: Section 04 — Cross-Layer Constraints as Graph Predicates

**Wave:** 2 (after T01 + T02 complete)
**Execution:** Single agent. Drafts prose + Refinery code listings.
**Dependencies:** T01 (DCL metaclass names), T02 (CSL metaclass names, trace definitions).
**Target file:** `sections/04_approach.md` — paragraphs A12, A13, A14, A15 only.
**Downstream:** T08 (evaluation uses cross-layer constraint definitions for anti-pattern analysis).

---

## Context

Section 4.4 is the core formal contribution. It defines how cross-layer constraints are expressed as Refinery graph predicates, connecting DCL and CSL (and FSL where applicable). The constraint taxonomy table at A11 is already drafted — do NOT touch it. The worked example at A17 is already drafted — do NOT touch it.

**Binding claims delivered:** #3 (cross-layer constraints as graph predicates — CORE DELIVERY).

## Read Before Writing

1. `sections/04_approach.md` — current state, especially A11 (constraint taxonomy table) and A17 (worked example)
2. `models/vc_metamodel.refinery` — authoritative source (cross-layer constraints section, approximately lines 304+)
3. `models/governance_conflict.refinery` — governance conflict predicates
4. Output from T01 — DCL metaclass names (Entity, Subject, Prop, etc.)
5. Output from T02 — CSL metaclass names (CredEntity, CredentialSubject, Claim, Credential) and trace mappings
6. `DECISIONS.md` — error predicate vs. propagation rule distinction
7. `CLAUDE.md` — writing style

## What to Draft

### A12 — Trace Consistency Predicates (~5 sentences + Refinery code listing)
- Define: `trace_consistency` — every CredEntity must trace to exactly one Entity
- Define: `claim_traces_prop` — Claims must trace to Props connecting the same Entities
- These are CHECKING predicates — violations mean the design is inconsistent
- Include Refinery code listing from the model file
- **Mode annotation**: trace consistency is verified in all three usage modes (error identification, design space exploration, conformance checking)

### A13 — Entity Alignment Shadow Predicate (~3 sentences + Refinery code listing)
- Define: `entity_alignment` shadow predicate — records which CSL entities map to which DCL entities without constraining
- Shadow predicates record derived information; they do not trigger errors
- Explain why shadow (not error): alignment is informational, used by downstream predicates
- Include Refinery code listing

### A14 — Anti-Pattern Error Predicates (~5 sentences + Refinery code listing)
- Define: `missing_credential_coverage` — a DCL Entity with no CSL trace (domain concept exists but no credential captures it)
- Define: `cross_credential_predicate_gap` — a DCL Prop connecting two Entities that trace to different CredentialSubjects (requires cross-credential verification, may break format assumptions)
- These are ERROR predicates — if satisfied, the design has a structural problem
- **Mode annotation**: anti-patterns trigger NOT_OK() in error identification mode; guide elimination in design space exploration
- Include Refinery code listing

### A15 — Propagation Rules for Cross-Layer Guidance (~4 sentences + Refinery code listing)
- Define: propagation rules that guide Refinery's model generation
- `propagate_format_from_credential` — if a CredentialSubject has a format assignment, propagate to contained Claims
- Cross-layer propagation: trace mappings enable format constraints to propagate up to DCL entities
- **Key distinction**: propagation rules GUIDE generation (negative elimination); error predicates CHECK results. This is the central mechanism that enables design space exploration.
- Include Refinery code listing

### DO NOT TOUCH
- A11 (constraint taxonomy table) — already drafted
- A16 (usage mode prose integrating all three modes) — separate concern
- A17 (worked example) — already drafted
- All other paragraphs

## Constraints

- Refinery code listings MUST match `models/vc_metamodel.refinery` exactly
- **Distinguish error predicates from propagation rules** — this is a key insight. Error predicates check; propagation rules guide. Do not blur this.
- Use `\ref{sec:...}` for cross-references
- Budget: A12 + A13 + A14 + A15 should use ~0.8 pages (including code listings)
- No LLM tells. Obsidian Markdown with Mathpix math.
