---
description: The per-paragraph alarm for paragraph engineering — judge every drafted paragraph against its scaffolded job, the spine section contract, and the M-013 guardrails, reporting sentence-anchored flags without rewriting anything. Use after drafting or revising any section file.
---

# Skill: Paragraph Contract Check

**Purpose:** Enforce the paragraph discipline the project already declares (every paragraph has a
job; every sentence defines, claims, evidences, transitions, or orients) at the only granularity
where it can be enforced: per paragraph, against that paragraph's own contract. This is the "alarm"
in paragraph engineering: it rings, it does not repair.

## Trigger

- "Check the paragraphs" / "Run the paragraph alarms on §N"
- After Stage 4 drafts or revises a section; before a section is handed to Martin for hand-writing.

## Inputs

- The drafted section file (`sections/NN_*.md`).
- Its spine block from `context/spine/SPINE.md` (the section's job, entry/exit states, element
  table) — the paragraph jobs decompose from it, via the `::: {.scaffold}` divs where present.
- `zettelkasten/moc/M-013` (guardrails) and `zettelkasten/glossary.md` (canonical terms).

## Steps

### 1. Recover each paragraph's contract

Split the section into paragraphs. For each, the contract is, in priority order: its `.scaffold`
div; else its decomposed share of the spine block's job; else UNCONTRACTED — which is itself a
finding (a paragraph nobody planned).

### 2. Judge each paragraph, three independent questions

- **Job:** does every sentence serve the contracted job? Sentences that serve a *different*
  section's job are misplaced, not bad — flag with the section they belong to.
- **Contract:** does the paragraph advance its section's exit state, and does it assume only the
  entry state plus what earlier paragraphs established? (Forward assumptions are the floating-
  concept bug at paragraph scale.)
- **Guardrails:** scan against `M-013` — vocabulary prohibitions, framing prohibitions, refuted
  claims, do-not-cite sources, paraphrased anchor quotes — and against the glossary for term drift
  (a canonical term replaced by a near-synonym).

### 3. Verdict per paragraph

**PASS**, or **FLAG(kind, sentence anchor, one-line reason)** with kind ∈ {UNCONTRACTED, OFF-JOB,
MISPLACED(→§X), FORWARD-ASSUMPTION, EXIT-GAP, GUARDRAIL(M-013 entry), TERM-DRIFT}. Style
observations (rhythm, hedging, LLM tells) are collected separately as STYLE notes and deferred to
`skills/review_prose_naturalness` — mixing them buries the contract violations this skill exists
to surface.

### 4. Aggregate

Section-level result: the flag list, plus two roll-ups — exit-state coverage (which exit-state items
no paragraph delivers) and recurring guardrail hits (two or more of the same kind → propose a new
`M-013` entry so the next draft cannot repeat it).

## Output

`context/paragraph_check_[section]_[date].md` (or inline in the working conversation for a single
section): the per-paragraph verdicts with sentence anchors, the exit-state coverage roll-up, and
proposed `M-013` additions. **No rewrites** — fixes are separate, deliberate edits under the normal
editing conventions.

## Failure modes

- **Repairing while judging.** The moment the checker rewrites, its flags stop being trustworthy
  reports and start being taste. Ring, do not repair.
- **Judging against an imagined job.** The contract is what the scaffold/spine says, not what the
  checker thinks the paragraph should do; if the contract itself is wrong, flag the *contract* and
  reopen the spine block, not the prose.
- **Style flood.** If STYLE notes outnumber contract flags, the report is doing the wrong review.
