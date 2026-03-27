# T02: Credential Schema Layer Definitions

**Wave:** 1 (parallel with T01, T03-T06)
**Execution:** Single agent. Drafts prose + Refinery code listings.
**Dependencies:** T00b (clean `@TODO` blocks must be in place).
**Target file:** `sections/04_approach.md` — paragraphs A4, A5, A6 only.
**Downstream:** T07 (cross-layer constraints) depends on CSL metaclass names and trace definitions from this task.

---

## Context

This task drafts the Credential Schema Layer subsection of Section 04. The running example at A7 is already drafted — do NOT touch it. The trace mapping mechanism is the central cross-layer mechanism — it must be precisely defined here.

**Binding claims delivered:** #1 (three-layer metamodel), #3 (cross-layer constraints — CSL portion).

## Read Before Writing

1. `sections/04_approach.md` — current state, especially existing prose at A7
2. `models/vc_metamodel.refinery` — authoritative source (CSL section, approximately lines 76-168)
3. `context/DECISIONS.md` — layer naming, no MDA
4. `CLAUDE.md` — writing style

## What to Draft

### A4 — CSL Metamodel Definition (~5 sentences + Refinery code listing)
- Define: CredEntity (abstract), CredentialSubject and CredentialValue subclasses
- Define: Claim (with source and target CredEntity references)
- Define: Credential (contained by CredentialSubject)
- **Trace mappings** (central mechanism): `CredEntity::trace -> Entity`, `Prop::trace -> Claim`
- Include a Refinery code listing from `models/vc_metamodel.refinery`

### A5 — Trace Mappings (~4 sentences + Refinery code listing)
- Every CredEntity traces to exactly one Entity
- Subject inference: CredEntity tracing to a Subject becomes a CredentialSubject
- Propagation rule: `subject_traces_to_subject`
- Include Refinery listing showing the propagation rule

### A6 — CSL Intra-Layer Constraints (~4 sentences + Refinery code listing)
- Define: `credential_statement` well-formedness (source != target, proper containment)
- Define: `no_empty_cred` error — CredentialSubject must have at least one outgoing Claim
- Define: `Root_cred_entity` — entities not targeted by any Claim are roots, must have a Credential
- Include Refinery code listing
- **Mode annotation**: structural violations caught before format assignment — empty credential triggers NOT_OK(no_empty_cred(cs))

### DO NOT TOUCH
- A7 (running example table + prose) — already drafted
- All other paragraphs

## Constraints

- Refinery code listings MUST match `models/vc_metamodel.refinery` exactly
- Use `\ref{sec:...}` for cross-references
- Trace mapping is the central mechanism — must be precise and unambiguous
- Budget: A4 + A5 + A6 should use ~0.6 pages
- No LLM tells. Obsidian Markdown with Mathpix math.
