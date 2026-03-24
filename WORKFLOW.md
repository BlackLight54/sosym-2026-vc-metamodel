# Workflow — Task Catalog

Not a linear process. Martin identifies what to do next (or asks Claude). Claude reads TODO.md, the current draft, and relevant context, then recommends or executes.

Tasks are prepared in conversation (plan mode), then executed via Claude Code. Complex work gets split into multiple prompts. Mechanical tasks have dedicated skills in `skills/`.

## How to use this

1. Decide what to do (or ask: "Given TODO.md, what should I work on next?").
2. Find the matching task type below.
3. If a skill exists, point Claude Code to it. Otherwise, prepare the prompt using the template.
4. Execute via Claude Code.
5. Update TODO.md.

---

## Setup tasks

### Initialize project
**Skill:** `skills/cfp_import` — fetches CFP, populates CFP.md, derives VENUE.md.

Remaining manual steps:
- Write thesis in CLAUDE.md (core claim, mechanism, so-what).
- Set domain in CLAUDE.md if not formal methods.
- Set up local LaTeX pipeline (Martin — see AUTHOR_NOTES.md).
- Set up MCP servers if needed (see AUTHOR_NOTES.md).

### Generate reviewer personas
**Skill:** `skills/reviewer_personas` — generates 4 personas (weakest, strongest, adversarial, adjacent-field). Run after thesis exists; re-run after first draft for refinement.

### Scaffold the paper
**Skill:** `skills/section_scaffold` — creates format-aware section files.

### Write abstract
**Skill:** `skills/abstract_scaffold` — generates structured abstract from thesis.

---

## Research tasks

### Gap analysis
**Skill:** `skills/gap_analysis` — generates prioritized research questions for agents.

### Process agent results
**Skill:** `skills/prior_work_import` — imports findings into structured reference notes.

### Position against related work
**Skill:** `skills/related_work_positioning` — builds comparison matrix, derives positioning statements.

### Verify novelty claim
Targeted search: "no one has done X." Return evidence for or against.

### Verify groundedness claim
Targeted search: "our work builds on Y." Verify Y is correctly characterized and cited.

### Find citation for claim
**Prompt template:**
```
Claim: [the statement that needs support]
Section: [where it appears]
What I need: [foundational work / empirical evidence / definition origin]
```

### Resolve citation markers (batch)
**Skill:** `skills/bibliography` — scans all `%% @CITE: %%` markers, resolves to BibTeX keys where possible, identifies papers to add to Zotero, and generates research prompts for unresolved markers. Run before `skills/overleaf_push` to clear citation debt.

Pipeline: Zotero → Overleaf Zotero import → `.bib`. This skill resolves markers against known references; Martin adds missing papers to Zotero and re-syncs in Overleaf.

### Design evaluation
**Skill:** `skills/evaluation_design` — maps contributions to evaluation questions, selects methods, proposes section structure.

Run after the contribution list (Introduction P3) stabilizes. Produces a plan in plan mode; Martin approves before drafting.

### Track evaluation execution
**Skill:** `skills/evaluation_execution` — reads the evaluation plan and produces a concrete checklist: what to prove, run, implement, measure, or compare, with dependencies, acceptance criteria, and status tracking. Re-run to update progress.

Run after `skills/evaluation_design`. Re-run periodically during the evaluation phase to track progress and surface blockers.

### Draft limitations and threats to validity
**Skill:** `skills/limitations_threats` — derives limitations from formal model assumptions, evaluation scope, and adversarial reviewer attacks. Proposes placement based on venue conventions.

Run after the evaluation section is drafted. Feeds from `skills/evaluation_design` threat analysis.

---

## Writing tasks

### Draft a section
**Prompt template for Claude Code:**
```
Target: sections/[filename].md
Goal: Draft [section/subsection name].
Output mode: [skeleton / full draft]
  - skeleton: per-paragraph guidance (what each paragraph must do, key claims, constraints).
    Martin writes from the skeleton.
  - full draft: complete prose. Martin rewrites. Claude self-critiques before presenting.
Content guidance: [what this must accomplish, key claims, what it must NOT do]
Dependencies: [what must exist first]
Constraints: [budget sense, audience, terminology]
```
**Plan mode:** Before writing, Claude presents a plan: what each paragraph will do, what claims it will make, what evidence it will reference. Martin approves or adjusts, then Claude drafts.
**After:** Update TODO.md. Flag claims needing citations (`%% @CITE: description %%`) or formal support (`%% @FORMAL: description %%`).

### Revise a section
**Prompt template for Claude Code:**
```
Target: sections/[filename].md
Goal: [specific revision]
Constraints: [what must not change, terminology to preserve]
```
**Plan mode:** Claude presents the proposed changes and their rationale before editing. For non-trivial revisions, identify what will change, what will stay, and what downstream effects to expect.
**After:** If significant text removed, move to `archive/` with recovery context. Update TODO.md.

### Cut to page budget
**Prompt template:**
```
Target: sections/[filename].md (or "all sections")
Goal: Identify prose that can be cut without losing argument structure.
Criteria: filler, redundant transitions, over-explained concepts, stated-but-unused claims.
Output: Numbered list of candidates with reasoning. Do not apply cuts.
```

### Update structure paragraph
**Skill:** `skills/structure_paragraph` — regenerates intro P5 from current section inventory. Run whenever sections are added, removed, or reordered.

### Check notation consistency
**Skill:** `skills/notation_table` — scans all sections for math symbols, flags inconsistencies, generates reference table.

---

## Modeling tasks

### Draft formal definition
**Prompt template for Claude Code:**
```
Target: sections/[filename].md
Goal: Define [concept] formally.
Existing sketch: [informal description or code block from first draft]
Constraints: [notation conventions, consistency with existing definitions]
After: Check if prose elsewhere references this concept and update if needed.
```

### Generate tool-specific encoding
**Prompt template for Claude Code:**
```
Target: [code file or code block within section]
Goal: Encode [definition/property] in [tool language].
Source: [reference to math-mode definition]
Constraints: [tool conventions, naming, consistency]
Output: Code block with language tag. Math-mode definition unchanged.
```

### Check model–prose consistency
Verify formal definitions match the claims made about them in prose.

---

## Review tasks

### Claim audit (contributions + evidence)
**Skill:** `skills/claim_evidence_audit` — contribution mapping + full claim–evidence check in one pass.

### Champion test
**Skill:** `skills/champion_test` — evaluates whether the paper has a champion-worthy insight and whether it's visible in the abstract, introduction, and title. Run after abstract, after first draft, and during final review.

### Reviewer simulation
**Prompt template:**
```
Target: sections/[filename].md
Reviewer persona: [from VENUE.md, or specific]
Evaluate: [specific concerns]
Output: Numbered issues, each with location, problem, suggested fix.
```

### Pre-submission check
**Skill:** `skills/pre_submission_check` — automated scan for markers, broken refs, anonymity.

### Final review
**Skill:** `skills/final_review` — orchestrator: delegates to pre_submission_check and claim_evidence_audit, then does coherence, champion test, and reviewer simulation.

---

## Revision tasks

### Multi-section revision
**Skill:** `skills/revision_orchestration` — decomposes a cross-cutting change into ordered prompt files in `prompts/`.

Use when a change touches multiple sections: terminology renames, claim removals, definition changes, argument restructuring, reviewer feedback fixes.

---

## Post-submission tasks

### Rebuttal
**Skill:** `skills/rebuttal` — parses reviews, classifies points, drafts structured response. Produces a revision plan that feeds into `skills/revision_orchestration`.

---

## Figure tasks

### Audit and design figures
**Skill:** `skills/figure_design` — audits the paper for figure opportunities, designs each figure with Nature-style principles, drafts source files, manages visual consistency.

Run early (after section scaffold) for the running example figure, then during writing as claims stabilize.

### Iterate a figure
When prose or model changes, check whether existing figures still match. Use `skills/figure_design` iteration protocol: describe what changed, what the figure currently shows, and what it should show now.

### Check figure consistency
Before submission: verify visual vocabulary is consistent across all figures, all figures are referenced in text, all captions are self-contained. Part of `skills/final_review`.

---

## Infrastructure tasks

### Push to Overleaf
**Skill:** `skills/overleaf_push` — builds LaTeX from Markdown via pandoc, pushes to Overleaf git remote. Run after productive sessions, before collaborator reviews, and at milestones.

---

## Maintenance tasks

### Archive removed content
**Convention:** `archive/YYYY-MM-DD_description.md` containing: the text, where it was, why it was cut, conditions for reintroduction.

### Record cross-cutting decision
Add an entry to DECISIONS.md with date, decision, rationale, affected sections, and revisit condition.

### Audit past decisions
**Skill:** `skills/prior_decision_audit` — surfaces cross-cutting decisions from DECISIONS.md and checks whether they still serve the paper. Run every 3–5 sessions, after major sections are drafted, or when something feels off.

### Session start
1. Run `skills/paper_status` — produces snapshot with time-to-deadline, section maturity, risk flags, and recommended next actions.
2. Ask Martin what to work on, or recommend based on the status report.
3. Prepare prompts for chosen tasks.
