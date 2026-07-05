---
description: Run the reviewer personas against the frozen spine before any prose exists — structural attacks, claim-rejection risks, missing or misplaced elements. Use right after the spine freezes (Stage 3), before the advisor gate; the cheapest review the paper will ever get.
---

# Skill: Spine Mock Review

**Purpose:** Attack the paper's structure while it is still cheap to change. A persona that cannot
find a claim's evidence in the spine, or finds a section whose job no reviewer needs done, has found
a real defect for the price of reading two pages of structure. Prose review after drafting costs ten
times more per finding.

## Trigger

- "Mock-review the spine" / "Run the personas on the spine"
- Immediately after the spine's `FROZEN` marker is set, before Gate 3→4 (advisor check).

## Inputs

- `context/spine/SPINE.md` (must carry the `FROZEN` marker — reviewing a moving spine wastes the pass).
- Reviewer personas from `context/VENUE.md`. If VENUE.md is stale (wrong venue), run
  `skills/setup_reviewer_personas` first; persona calibration is what makes attacks specific.
- `zettelkasten/moc/M-010` (existing objections), `M-011` (what each claim owes).

## Steps

### 1. Persona attack passes (one agent per persona, independent)

Each persona reads `SPINE.md` linearly and must produce, with **section anchors** on every item:

- The three strongest structural attacks (not style, not wording — structure: missing evidence,
  wrong order, unearned claim, section without a job a reviewer needs done).
- The claim they would reject the paper on, and which spine cell fails to protect it.
- One element that is missing entirely, and one that is homed in the wrong section.
- Whether the champion argument is recoverable from the introduction block alone (Champion persona
  answers this; the others answer whether their floor is met by the entry states).

Instruct personas to attack, not to advise; an attack without a section anchor is discarded.

### 2. Merge and map

Deduplicate attacks across personas. Map each surviving attack to:
- an existing objection in `M-010` (the spine failed to place its committed rebuttal — placement bug), or
- a **new objection** → add it to `M-010` with rebuttal TBD, or
- a structural defect → name the spine pass that must reopen (Pass 2 homing, Pass 3 ordering,
  Pass 4 contract, Pass 5 placement).

### 3. Verdict

- **Proceed** to Gate 3→4, listing accepted residual risks, or
- **Reopen** the named passes; re-freeze; re-run this review on the diff only.

## Output

`context/spine/mock_review_[date].md`: attacks table (attack, persona, section anchor, mapping,
disposition), new `M-010` entries, reopened-pass list, verdict.

## Failure modes

- **Reviewing prose that does not exist.** Any finding about wording or flow between sentences is
  out of scope; discard it.
- **Unanchored attacks.** "The evaluation feels thin" is useless; "§5 exit state claims K-006
  delivered but no cell carries the re-verification result" is the format.
- **Persona consensus treated as ground truth.** Four agents can share a blind spot; the review
  bounds risk, it does not certify. Note what no persona could check (e.g., domain facts only the
  advisor knows) and push those to the advisor brief's Asks.
