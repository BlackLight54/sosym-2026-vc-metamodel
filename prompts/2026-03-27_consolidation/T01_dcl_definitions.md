# T01: Sec 04 Preamble + Domain Concept Layer Definitions

**Wave:** 1 (parallel with T02-T06)
**Execution:** Single agent. Drafts prose + Refinery code listings.
**Dependencies:** T00b (clean `@TODO` blocks must be in place).
**Target file:** `sections/04_approach.md` — Preamble + paragraphs A1, A2 only.
**Downstream:** T07 (cross-layer constraints) depends on DCL metaclass names from this task.

---

## Context

Section 04 is the core contribution (3.0 pages). This task drafts the preamble and the first subsection (Domain Concept Layer). The running example at A3 is already drafted — do NOT touch it. The constraint taxonomy at A11 and the worked example at A17 are also drafted — do NOT touch them.

**Binding claims delivered:** #1 (three-layer metamodel), #3 (cross-layer constraints as graph predicates — DCL portion).

## Read Before Writing

1. `sections/04_approach.md` — current state, especially existing prose at A3, A7, A10, A11, A17
2. `models/vc_metamodel.refinery` — authoritative Refinery source (DCL section, approximately lines 20-73)
3. `sections/03_overview.md` — Section~\ref{sec:functional-overview} defines the three usage modes (OK / NOT_OK / GENERATED|UNVIABLE)
4. `DECISIONS.md` — layer naming (DCL/CSL/FSL), no MDA, modeling-first framing
5. `CLAUDE.md` — writing style, anti-persona, persona

## What to Draft

### Preamble (2-3 sentences)
- Name the three layers: domain concept layer (DCL), credential schema layer (CSL), format-specific layer (FSL)
- State that cross-layer constraints are formalized as Refinery graph predicates
- Forward-reference the three usage modes from Section~\ref{sec:functional-overview}
- Reference multi-level modeling from Section~\ref{sec:multi-level}

### A1 — DCL Metamodel Definition (~5 sentences + Refinery code listing)
- Define: Entity (abstract), Subject and Value subclasses, Prop (with source and target references to Entity, value containment)
- Define the statement predicate: statement(s, p, v)
- Root inference: Entity with no incoming target is a Subject
- Include a Refinery code listing extracted from `models/vc_metamodel.refinery` showing the class declarations

### A2 — DCL Intra-Layer Constraints (~4 sentences + Refinery code listing)
- Define: error `non_connected(e1, e2)` — all entities must be reachable
- Define: propagation rule `no_self_loop` — no entity references itself
- Define: statement well-formedness (subject != value)
- Include a Refinery code listing showing the error predicate syntax
- **Mode annotation**: DCL constraints are targets for error identification — evaluating them on a disconnected graph returns NOT_OK(non_connected(e1, e2))

### DO NOT TOUCH
- A3 (running example table + prose) — already drafted
- A4-A17 — handled by other tasks

## Constraints

- Refinery code listings MUST match `models/vc_metamodel.refinery` exactly — do not invent syntax
- Use `\ref{sec:...}` for all cross-references (labels were added in T00)
- Layer names: Domain Concept Layer (DCL), Credential Schema Layer (CSL), Format-Specific Layer (FSL)
- No MDA terminology (no CIM/PIM/PSM)
- Obsidian Markdown with Mathpix math conventions. Fenced code blocks with `refinery` language tag.
- No LLM tells. Every sentence defines, claims, evidences, transitions, or orients.
- Budget: Preamble + A1 + A2 should use ~0.5 pages of the 3.0 page section budget.
