# Prompt: Intro/Abstract Framing Revisions

**Phase:** 1 (parallel with P06)
**Execution:** Can run simultaneously with `prompts/2026-03-26_06_sec04_usage_modes.md`. Touches `sections/00_abstract.md` and `sections/01_introduction.md` only.
**Dependencies:** P03 (Sec 03 restructure) ✅ complete. P04 (Sec 05 restructure) ✅ complete. Both delivered the section structures that this prompt references.
**Chain edits:** After completion, edit `prompts/2026-03-26_07_cpl_rename_propagate.md` — append to its file inventory any new sentences in `sections/01_introduction.md` that reference the layer names (so P07 can verify DCL is used, not CPL).

---

## Context

Advisor feedback (Oszkár, 2026-03-25) identified five framing issues in the Introduction and Abstract. The common thread: the current text is too passive about our contribution and too vague about the problem's distinctive character.

**Terminology note:** The rename from "Claim Property Layer (CPL)" to "Domain Concept Layer (DCL)" has been decided (DECISIONS.md 2026-03-26) but NOT yet propagated. Do NOT rename existing text — P07 handles that. However, any NEW text you write MUST use "domain concept layer" / "DCL". If you edit a sentence that currently says "claim property layer," leave it — P07 will catch it.

## Current state (read these files)

### `sections/00_abstract.md` — key sentence (line 6):

```
These constraints are currently scattered across W3C standards, EU regulations,
and community guidelines, with no formal means to check their consistency or
detect cross-layer design errors.
```

### `sections/01_introduction.md` — key paragraphs:

**P1 (line 15):** Hook paragraph. Ends with "yet no integrated formal model captures these cross-layer constraints." — Keep as-is.

**P2 (line 24):** Gap paragraph. Current text:
```
These constraints are currently scattered across W3C standards, EU implementing
regulations, and community design guidelines, with no formal means to check their
consistency. Design errors that span multiple layers go unnoticed — not because they
are difficult to detect algorithmically, but because no model makes them expressible
in the first place. A credential schema may be well-formed when inspected in
isolation, yet violate a cross-layer constraint that links domain-level claim
semantics to format-specific privacy capabilities.
```

**P3 (line 33):** Contribution list. — Do NOT edit (stable).

**P4 (line 43):** Approach sketch. References "claim property layer" — leave for P07.

**P5 (line 52):** Structure paragraph. Already updated by P03. — Do NOT edit.

### `sections/03_motivation.md` — relevant content already drafted by P03:

**M4 (line 38)** already contains: "Unlike hierarchical requirement systems in safety-critical domains, where stakeholders cooperate within a defined authority structure, these governance sources are independent and their design goals may be formally irreconcilable."

This is important: the hierarchical vs. peer governance argument is already in Sec 3.1. The intro needs a compressed echo, not a duplicate.

## Task

### Step 1 — Read and verify

Read these files to verify the state described above:
- `sections/00_abstract.md`
- `sections/01_introduction.md`
- `sections/03_motivation.md` (verify M4 content)
- `DECISIONS.md` (check for any decisions affecting intro/abstract)

### Step 2 — Plan all five edits (present to Martin)

For each edit below, state: (a) exact current text, (b) proposed replacement, (c) why the replacement is better (argumentative reason, not stylistic). Present all five together for review.

### Step 3 — Execute edits

**Edit 1: Abstract — "scattered" → active voice with emergent-interaction insight**

Target: `sections/00_abstract.md`, line 6, the sentence starting "These constraints are currently scattered..."

Replace with text that conveys:
- Active voice: *we* collected and formalized (not "constraints are scattered")
- The emergent-interaction insight: combined effect unpredictable from inspecting sources individually
- Drop "no formal means" — the next sentence delivers the formalization

Proposed direction (adapt to fit abstract register — every word must earn its place):
> We collected constraints from W3C standards, EU implementing regulations, and community design guidelines, and formalized them as graph predicates — revealing that constraints from independent governance sources exhibit emergent interactions whose combined effect cannot be predicted by inspecting any source in isolation.

After editing, count words. The abstract must stay within 150–250 words (currently ~217).

**Edit 2: Intro P2 — "scattered" → active voice**

Target: `sections/01_introduction.md`, line 24, first sentence.

Same revision strategy as Edit 1 but with slightly more space for explanation. The intro register allows one more clause than the abstract.

**Edit 3: Intro P2 — Add emergent-interaction argument**

Target: `sections/01_introduction.md`, after the "collected and formalized" sentence (Edit 2).

Add 1–2 sentences: constraints from independent governance sources exhibit emergent interaction. Give one concrete preview without fully developing it (that's Sec 3.1's job): "eIDAS mandates a credential format; GDPR requires data minimization; neither specification anticipates the other, yet their joint effect on a single credential may be unsatisfiable."

**Edit 4: Intro P2 — Compressed hierarchical vs. peer distinction**

Target: `sections/01_introduction.md`, P2, after the emergent-interaction sentence.

Add ONE sentence (not a full paragraph — the full argument is in M4): "Unlike hierarchical requirement systems in safety-critical domains, these governance sources are independent peers whose design goals may be formally irreconcilable."

This is a compressed echo of M4. Its purpose here is defensive — Reviewer D will read the intro carefully and must see this distinction early. Do NOT copy M4's full text into the intro.

**Edit 5: Intro P2 — Why existing single-layer tools fail**

Target: `sections/01_introduction.md`, P2, either integrated into the gap argument or as a closing sentence.

Add: existing tools operate at a single layer — JSON Schema validators check credential structure, format-specific conformance tools verify encoding constraints, governance frameworks define requirements in isolation — and no tool checks cross-layer consistency.

This addresses Reviewer C's need to understand the gap concretely and Reviewer D's "just use existing tools" attack.

### Step 4 — Self-critique

After all edits, evaluate:
1. **Overclaiming:** Does any edit assert more than the paper delivers? The abstract says "prerequisite" in its final sentence — does the strengthened gap paragraph create expectations the evaluation cannot meet?
2. **Redundancy with Sec 03:** The emergent-interaction insight and hierarchical-vs-peer distinction appear in both Intro P2 and M4. Is this motivated (Intro gives the compressed claim, M4 develops it with evidence) or is it saying the same thing twice?
3. **P2 overload:** After all additions, is P2 trying to do too much? If it exceeds ~8 sentences, consider splitting into P2 (gap) and P2.5 (why existing approaches fail). The split point would be after the emergent-interaction argument.
4. **Abstract word count:** Confirm ≤250 words after revision.

Present the self-critique. Martin decides what to adjust.

### Step 5 — Chain edit

**Edit `prompts/2026-03-26_07_cpl_rename_propagate.md`:**

Append a note at the end of the "Files to update" section:

```
Note from P05: Intro P2 was revised (new sentences added). Verify that any new
text referencing layer names uses "domain concept layer" / "DCL", not the old
"claim property layer" / "CPL". The P4 approach sketch (line 43) still uses the
old name — rename it.
```

## Constraints

- Surgical edits to specific sentences. Do NOT rewrite paragraphs that aren't targeted.
- Preserve all `@CITE`, `@META`, `@SCAFFOLD`, `@TODO`, `@FIGURE` markers.
- Do NOT edit P3 (contribution list), P4 (approach sketch — P07 handles the rename), or P5 (structure paragraph — stable from P03).
- Any NEW text must use "domain concept layer" / "DCL" (not "claim property layer" / "CPL"). Existing text that says CPL should be left for P07.
- The introduction budget is 1.25 pages. If the additions push P2 past ~8 sentences, propose splitting.
- Every added sentence must: define, claim, evidence, transition, or orient. No filler.
- Do NOT add the hierarchical-vs-peer argument at full length — one compressed sentence in the intro, full development stays in M4.
- Output in Obsidian Markdown with Mathpix math conventions.
- No LLM tells. No clichés. No throat-clearing.
