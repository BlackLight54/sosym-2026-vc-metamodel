# Prompt: Clarify Three Refinery Usage Modes in Sec 04

**Phase:** 1 (parallel with P05)
**Execution:** Can run simultaneously with `prompts/2026-03-26_05_intro_abstract_framing.md`. Touches only `sections/04_approach.md`.
**Dependencies:** P03 (Sec 03 restructure) ✅ complete — established the three-mode definitions in Sec 3.2 (Functional Overview). This prompt must use the exact same terminology.
**Chain edits:** After completion, edit `prompts/2026-03-26_07_cpl_rename_propagate.md` — append to its file inventory any new text added to `sections/04_approach.md` that references layer names, so P07 can verify DCL usage.

---

## Context

Advisor feedback (Imre, 2026-03-25): The three Refinery usage modes must be clearly distinguished in Sec 04, not just in the Overview. Currently Sec 04 has no mention of the modes. Each layer subsection should note which mode demonstrates its constraints, and Sec 04.4 (Cross-Layer Constraints) should explicitly show all three modes on the running example.

**Terminology note:** The rename from "Claim Property Layer (CPL)" to "Domain Concept Layer (DCL)" is decided but NOT yet propagated. Any NEW text you write MUST use "domain concept layer" / "DCL". Do NOT rename existing text — P07 handles that.

## Three-mode definitions from Sec 3.2 (Functional Overview)

These are the authoritative definitions. Use these exact names and output formats:

1. **Consistency checking** — Designer submits a complete or partial design → **OK** (all constraints satisfied).
2. **Error identification** — Framework evaluates error predicates → **NOT_OK(errors)** (specific constraint violations named).
3. **Design space exploration** — Designer provides partial spec with open choices → **GENERATED(possible_design)** (diverse valid configs) or **UNVIABLE(reasons)** (no solution exists).

Refinery command mapping:
- Mode 1 (OK): `check` — partial model satisfies all constraints, no error predicates fire
- Mode 2 (NOT_OK): `check -k` — error predicates fire, violations named (e.g., `governance_conflict(IncomeCred, income_format): error`)
- Mode 3 (GENERATED/UNVIABLE): `generate` — graph solver produces concrete instances or proves UNSAT

## Current state of `sections/04_approach.md`

Read the full file. Key locations for mode insertion:

**Preamble (line 12):** Currently a `@TODO` marker — "Draft preamble — introduce the three-layer metamodel structure." The preamble is the right place for a forward reference to the three modes.

**4.1 Claim Property Layer (line 14):** Has scaffolds A1–A3, running example table. Intra-layer constraints (A2) define error predicates like `non_connected`, `no_self_loop`. These are Mode 2 targets.

**4.2 Credential Schema Layer (line 55):** Has scaffolds A4–A7. Constraints include `no_empty_cred`, `root_ent_doesnt_have_cred`. Mode 2 targets.

**4.3 Format-Specific Layer (line 95):** Has scaffolds A8–A10. Governance constraints, FCA-derived constraints. Mode 2 targets. The `governance_conflict` error predicate is the main Mode 2 demonstration.

**4.4 Cross-Layer Constraints (line 130):** Has constraint taxonomy table (C1–C9), scaffolds A11–A17. This is where all three modes should be demonstrated explicitly with the running example. The existing CPL restructuring worked example (A17, line 200) already shows cross-layer propagation.

## Task

### Step 1 — Read current state

Read:
- `sections/04_approach.md` (full file — verify locations above)
- `sections/03_motivation.md` (Sec 3.2 Functional Overview — verify mode definitions match)
- `.claude/skills/refinery/SKILL.md` or `guides/refinery/` (for accurate Refinery command semantics)

### Step 2 — Plan additions (present to Martin)

For each insertion point, state:
- Location (subsection, before/after which paragraph or marker)
- Proposed text (exact wording)
- How it references Sec 3.2 (consistent terminology check)
- Estimated length (sentences)

### Step 3 — Execute edits

**Addition 1: Preamble forward reference**

The preamble `@TODO` (line 12) asks for a draft introducing the three-layer structure. If you draft the preamble, include a forward reference to the three modes:

> The metamodel supports three usage modes defined in Section 3.2: consistency checking (**OK**), error identification (**NOT_OK(errors)**), and design space exploration (**GENERATED** / **UNVIABLE**). We demonstrate each mode as the layer definitions and constraints are introduced.

If the preamble `@TODO` is not yet ready to draft fully (it depends on Sec 04 drafting), add a shorter note after the `@TODO` marker instead. Do not draft the full preamble unless the content is ready.

**Addition 2: Per-subsection mode annotations**

At each layer subsection, after presenting intra-layer constraints, add a brief (1–2 sentence) annotation noting which mode catches violations. Examples:

- **4.1 (after A2 constraints):** "The `non_connected` error predicate is evaluated in Mode 2 (error identification): running `check -k` on a disconnected information graph returns **NOT_OK(non_connected(e1, e2))**."
- **4.2 (after A6 constraints):** "Mode 2 catches structural violations such as empty credentials (**NOT_OK(no_empty_cred(cs))**) before format assignment begins."
- **4.3 (after A9/A10):** "The governance annotations at this layer are the primary input for Mode 2's cross-governance analysis and Mode 3's format-assignment exploration."

Place these AFTER the constraint definitions and BEFORE the running example tables, so the reader sees the constraint, then immediately knows how it is used.

**Addition 3: Sec 04.4 — Explicit three-mode demonstration**

This is the main addition. In Sec 04.4, after the constraint taxonomy table (C1–C9) and before the existing trace consistency scaffolds, add a subsection or paragraph block that explicitly walks through all three modes on the CSOK example:

**Mode 1 — Consistency checking:**
> Running consistency checking on the well-formed housing subsidy instance — with FamilyStatusCred and PropertyCred assigned to SD-JWT-VC and IncomeCred left unassigned — returns **OK**: all structural constraints (C1–C3) and domain constraints (C4) are satisfied in the partial specification.

**Mode 2 — Error identification:**
> Assigning IncomeCred to SD-JWT-VC and enforcing all governance constraints triggers error identification: `governance_conflict(IncomeCred, income_format): error` (**NOT_OK**). The error predicate names the specific credential and format slot where constraints C5, C6, and C7 cannot be simultaneously satisfied.

**Mode 3 — Design space exploration:**
> Leaving IncomeCred's format assignment open and running design space exploration, the framework attempts to find a concrete format assignment satisfying all constraints. With the full constraint set (C5 ∧ C6 ∧ C7), no assignment exists — the framework returns **UNVIABLE**. Relaxing C6 (dropping the predicate proof requirement), the framework **GENERATED** two valid configurations: both assign SD-JWT-VC to all three credentials, differing in selective disclosure granularity.

This demonstration should be ~0.3 pages. Place it where it has maximum argumentative impact — either as a new paragraph block after the C1–C9 table (before A12), or as a dedicated `### Three Usage Modes on the Running Example` mini-subsection within 4.4.

### Step 4 — Verify consistency

After all edits:
1. Mode names in Sec 04 exactly match Sec 3.2: OK, NOT_OK(errors), GENERATED(possible_design), UNVIABLE(reasons). No variants.
2. Refinery commands referenced are accurate (`check`, `check -k`, `generate`).
3. The demonstration doesn't over-explain the modes (Sec 3.2 defines them, Sec 04 demonstrates them).
4. No new content introduces claims not supported elsewhere (e.g., don't claim the framework "automatically resolves" conflicts — it identifies or proves unsatisfiability).

### Step 5 — Chain edit

**Edit `prompts/2026-03-26_07_cpl_rename_propagate.md`:**

Append a note at the end of the "Files to update" section:

```
Note from P06: New text was added to sections/04_approach.md in the preamble,
per-subsection mode annotations, and a three-mode demonstration in Sec 04.4.
Verify that new text uses "domain concept layer" / "DCL", not "claim property
layer" / "CPL". The existing subsection header "## Claim Property Layer"
(line 14) and all existing CPL references still need renaming.
```

## Constraints

- Do NOT restructure Sec 04 — only ADD text about usage modes.
- Do NOT duplicate Sec 3.2 content — reference it, demonstrate it.
- Total added text ≤ 0.3 pages across all subsections.
- Preserve all existing scaffolds, `@TODO`, `@CITE`, `@FORMAL`, `@FIGURE` markers.
- Use Refinery terminology accurately: **error predicate** (not "error constraint"), **propagation rule** (not "inference rule"), **graph predicate** (the paper's term).
- Any new text uses "domain concept layer" / "DCL". Existing CPL references left for P07.
- Output in Obsidian Markdown with Mathpix math conventions.
- No LLM tells. No filler.
