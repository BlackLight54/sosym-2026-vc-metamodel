# Prompt: Sec 03 Restructure — "Motivation" → "Overview"

**Phase:** 2 (parallel with P04)
**Execution:** Can run simultaneously with `2026-03-26_04_sec05_restructure.md`. Do NOT run in parallel with P05 or P06 (they depend on this prompt's output).
**Dependencies:** None strictly required, but if P01/P02 have completed, read their outputs from DECISIONS.md and `archive/arf_5_3_4_gap_analysis.md` for context.
**Chain edits:** After completion, edit both:
  - `prompts/2026-03-26_05_intro_abstract_framing.md` — update structure paragraph guidance and section references
  - `prompts/2026-03-26_06_sec04_usage_modes.md` — insert the three mode definitions as established in the new Functional Overview

---

## Context

Advisor feedback (Oszkár, 2026-03-25): Section 03 should be restructured from "Motivation" to "Overview" with three subsections. The motivation content is retained but becomes 3.1. Two new subsections are added: a Functional Overview with a box/pipeline diagram (3.2) and a Usage Workflow walkthrough (3.3).

Current state of `sections/03_motivation.md`: Contains scaffolds M1–M5 with partial prose for M1, M2, and placeholders for M3–M5. The section is titled "Motivation" with `@META` budget 1.0 page.

Three Refinery usage modes (from advisor meeting, both Oszkár and Imre):
1. **Consistency checking** — Input: partial design + constraints → Output: **OK** (model is consistent). Fast, editor-like.
2. **Error identification** — Input: partial design + constraints → Output: **NOT_OK(errors)** (specific error predicates that fire). Fast, editor-like.
3. **Design space exploration** — Input: partial design + constraints → Output: **GENERATED(possible_design)** or **UNVIABLE(reasons)**. Generates diverse concrete models or proves none exist.

## Task

### Step 1 — Read current state

Read these files:
- `sections/03_motivation.md` (current content)
- `sections/01_introduction.md` (P5 structure paragraph — will need updating)
- `DECISIONS.md` (current decisions affecting Sec 03)
- `archive/meeting_notes_2026-03-25.md` (raw advisor feedback)

### Step 2 — Plan the restructure (present to Martin)

Present a detailed plan before executing. The plan must show:

**New structure:**
```
# Overview                               ← renamed from "Motivation"
@META: Budget: ~1.5 pages

## Motivation (3.1)                      ← consolidates M1–M5
  - M1: Housing subsidy scenario setup   ← existing prose (keep)
  - M2: Cross-layer constraints          ← existing prose (keep)
  - M3: Single-layer failure             ← draft (was @TODO)
  - M4: Governance complication           ← draft (was @TODO)
  - M5: Problem statement                ← draft (was @TODO)

## Functional Overview (3.2)             ← NEW
  - Box/pipeline diagram figure
  - Input: partial design specification + constraint set
  - Three output modes: OK / NOT_OK(errors) / GENERATED or UNVIABLE
  - ~1–2 paragraphs + figure

## Usage Workflow (3.3)                  ← NEW
  - Designer walkthrough on CSOK example
  - Sees error → fixes design → re-checks → generates alternatives
  - ~1 paragraph
```

For each part, state what prose exists, what needs drafting, and what the paragraph's job is.

### Step 3 — Execute the restructure

After Martin approves (or if you judge this is mechanical enough to proceed — the advisor's instructions are explicit):

1. **Rename section header** from `# Motivation` to `# Overview`
2. **Update `@META`**: rename section, increase budget from 1.0 to ~1.5 pages
3. **Wrap existing M1–M5 content** under `## Motivation` subsection heading
4. **Draft M3** (single-layer failure): Each layer is consistent in isolation. Cross-layer analysis reveals two problems: (1) income credential format conflict, (2) cross-credential predicate gap. Both invisible to single-layer inspection. ~3-4 sentences. Use the content from the existing `@TODO` marker.
5. **Draft M4** (governance complication): Constraints from W3C VCDM, eIDAS, GDPR, format specs. Not designed to be jointly satisfied. No existing tool checks simultaneous satisfaction. ~3-4 sentences. Use existing `@TODO` marker content.
6. **Draft M5** (problem statement): "Credential ecosystem design requires a formal framework that captures constraints at multiple abstraction layers and from multiple governance sources, enabling designers to determine whether a given configuration is jointly satisfiable." ~2 sentences. Use existing `@TODO` marker.
7. **Create `## Functional Overview` subsection** with:
   - A figure placeholder using the `@FIGURE` marker:
     ```
     %% @FIGURE: fig_functional_overview | Box/pipeline diagram. Input: partial design specification + constraint set → Processing box (metamodel + graph predicates) → Three output modes: (1) OK — design is consistent, (2) NOT_OK(errors) — specific constraint violations identified, (3) GENERATED(possible_design) or UNVIABLE(reasons) — design space exploration produces valid alternatives or proves none exist. Style: clean box diagram like Imre's BPM paper. Production: Excalidraw → TikZ. %%
     ```
   - ~2 paragraphs of prose explaining: what goes in (a partial credential ecosystem design — entities, credentials, format assignments, governance annotations — plus the constraint set from the metamodel), what comes out (three modes), and why this matters (designers get feedback at design time, before deployment).
8. **Create `## Usage Workflow` subsection** with:
   - ~1 paragraph walkthrough: "A designer specifies the CSOK credential ecosystem: three credentials with their claim mappings, subject bindings, and tentative format assignments. Running consistency checking reveals an error on IncomeCred — the eIDAS format mandate and GDPR data minimization requirement conflict. The designer adjusts the design — for example, restructuring the income claim as a boolean — and re-checks. Finding consistency, the designer uses design space exploration to generate alternative valid configurations, discovering that..."
   - Keep this concrete and tied to the running example.

### Step 4 — Update Intro P5 (structure paragraph)

In `sections/01_introduction.md`, update the structure paragraph (P5) to reference "Overview" instead of "Motivation." The current text says:
> "Section 3 motivates the problem through a running example..."

Change to something like:
> "Section 3 presents an overview: a running example motivates the problem, a functional overview describes the three usage modes of the approach, and a usage workflow walks through a designer's interaction with the tool."

### Step 5 — Chain edits (CRITICAL)

After completing the restructure, edit these downstream prompts:

**Edit `prompts/2026-03-26_05_intro_abstract_framing.md`:**
1. Find placeholder `<<SEC03_STRUCTURE>>` and replace with the actual new subsection structure (3.1 Motivation, 3.2 Functional Overview, 3.3 Usage Workflow).
2. Find placeholder `<<STRUCTURE_PARA_CURRENT>>` and replace with the actual updated P5 text from Step 4.
3. Adjust any references to "Motivation section" → "Overview section" or "Section 3.1 (Motivation)" as appropriate.

**Edit `prompts/2026-03-26_06_sec04_usage_modes.md`:**
1. Find placeholder `<<THREE_MODES_DEFINITION>>` and replace with the exact three-mode definitions as written in the new Functional Overview (3.2). Copy the precise wording so P06 can reference it consistently.
2. Find placeholder `<<SEC03_MODE_NAMES>>` and replace with the specific output names used (OK, NOT_OK(errors), GENERATED/UNVIABLE).

## Constraints

- Preserve existing drafted prose in M1 and M2 — do not rewrite what exists unless it conflicts with the new structure.
- The `@TODO` markers for M3, M4, M5 contain content guidance — use it when drafting, then remove the `@TODO` markers.
- Keep `@CITE` markers — do not resolve citations.
- Budget is ~1.5 pages. The Motivation subsection (3.1) should be ~0.7 pages (existing content + M3/M4/M5 drafts). Functional Overview (3.2) ~0.5 pages (figure + 2 paragraphs). Usage Workflow (3.3) ~0.3 pages (1 paragraph).
- Output in Obsidian Markdown with Mathpix math conventions.
- No LLM tells. No throat-clearing. Every sentence defines, claims, evidences, transitions, or orients.
