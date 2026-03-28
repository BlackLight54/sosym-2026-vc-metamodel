---
description: Three-phase task methodology — prototype on a toy example first, write the spec from what you learned, then do the full implementation. Use when starting a non-trivial formalization, feature, figure, or any task where unknowns dominate.
---

# Skill: T3 — Prototype First

**Purpose:** Structure any non-trivial task into three gated phases: (1) build a minimal prototype on a toy example to surface unknowns, (2) write a specification grounded in what the prototype revealed, (3) execute the full implementation against the spec. The key insight (per Tio, tt.gg) is that even AI agents produce better results when they touch the problem concretely before writing specs or committing to a design. The prototype is disposable — its value is the lessons, not the artifact.

## Trigger

- "Use the T3 method"
- "Prototype first, then spec"
- "Start with a toy example"
- "I want to try before we spec"
- "Let's do a proof of concept first"

## Inputs

- **Task description** — what needs to be built, formalized, or written
- **Toy example** (optional) — a small instance, test case, or scenario to prototype against. If none exists, Phase 1 begins by constructing one.
- **Existing context** — related files, prior decisions, constraints

## When to use

- Formalizations where the right abstractions are unclear (metamodel design, constraint languages, type systems)
- Figures or diagrams where the layout depends on content that isn't finalized
- Code where the API surface depends on usage patterns not yet understood
- Any task where you'd otherwise spend significant time speccing something you haven't tried

## When NOT to use

- Mechanical tasks with known structure (notation tables, bibliography resolution, file moves)
- Tasks where a clear spec already exists and prototyping adds no information
- Polish and revision — the unknowns are already resolved

## Steps

### Phase 1 — Prototype

**Goal:** Build the smallest thing that touches the real problem. Learn what you don't know.

1. **Select or construct a toy example.** It should be small enough to build in one pass but rich enough to exercise the core difficulty. For formalizations: a 3-5 element instance. For code: a single happy-path scenario. For figures: a sketch with placeholder data.

2. **Build the prototype.** Work fast, cut corners deliberately. The prototype is disposable — optimize for learning speed, not quality. Use hardcoded values, skip edge cases, ignore style.

3. **Record a prototype log.** After building, write down:
   - **What worked** — which parts were straightforward
   - **What surprised you** — unexpected constraints, interactions, or requirements
   - **What broke** — errors, conflicts, missing capabilities
   - **What's missing from your mental model** — questions the prototype raised
   - **References touched** — files, docs, APIs you consulted
   - **Scope assessment** — is the full task larger/smaller/different than initially assumed?

4. **Present the prototype and log to the user.** Do not proceed to Phase 2 without user review. The user may redirect scope, add constraints, or decide the prototype is sufficient.

**Output:** Prototype artifact (may be temporary) + prototype log.

**Gate:** User reviews the prototype log and approves moving to Phase 2.

### Phase 2 — Spec

**Goal:** Write a specification that would have been impossible (or wrong) without the prototype.

1. **Read the prototype log.** Every surprise and breakage from Phase 1 must be addressed — either by the spec's design or by an explicit scope exclusion.

2. **Write the spec.** The format depends on the task type:
   - **Formalization:** Definitions, constraints, expected properties, edge cases identified by prototype
   - **Code:** Interface contract, data flow, error cases, test scenarios
   - **Figure:** Layout spec, data requirements, caption draft, interaction with prose
   - **Writing:** Paragraph-level outline with claim-evidence mapping, identified references

3. **Cross-reference against prototype log.** For each item in the log:
   - "What surprised you" → spec must handle it or explicitly exclude it
   - "What broke" → spec must prevent it or document it as a known limitation
   - "What's missing" → spec must answer the question or flag it as out of scope

4. **Present the spec to the user.** The spec is the contract for Phase 3.

**Output:** Spec document (format varies by task type).

**Gate:** User reviews and approves the spec before Phase 3 begins.

### Phase 3 — Implement

**Goal:** Execute the full implementation against the spec. No more discovery — the unknowns were resolved in Phases 1-2.

1. **Read the spec.** Treat it as the authoritative source. If something seems wrong during implementation, flag it rather than silently deviating.

2. **Implement.** Follow the spec. Use the prototype as reference for patterns that worked, but do not copy-paste from it — the prototype cut corners that the implementation must not.

3. **Verify against spec.** Check each spec requirement. Document any deviations with rationale.

4. **Clean up.** Remove or archive the prototype artifact if it was created as a temporary file.

**Output:** Final implementation + deviation log (if any).

## Output

A T3 plan file at `prompts/t3_[label].md` (or inline in conversation for small tasks) containing:

```markdown
# T3: [Task Title]

## Task
[One-paragraph description]

## Phase 1 — Prototype
**Toy example:** [description or file path]
**Status:** pending | in_progress | done
**Prototype log:**
- Worked: ...
- Surprised: ...
- Broke: ...
- Missing: ...
- References: ...
- Scope: ...

## Phase 2 — Spec
**Status:** pending | in_progress | done
**Spec:** [inline or file path]
**Prototype log coverage:** [checklist — each log item addressed]

## Phase 3 — Implement
**Status:** pending | in_progress | done
**Deviations from spec:** [list or "none"]
```

## Quality checks

- Phase 2 spec addresses every item from the Phase 1 prototype log (no unacknowledged surprises)
- Phase 3 implementation can be verified against the Phase 2 spec point-by-point
- User approved each gate before the next phase began
- The prototype was not gold-plated — if Phase 1 took as long as Phase 3 would, the method was misapplied
