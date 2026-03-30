---
id: "PA-H7"
short: "soundness-completeness"
title: "Fill soundness/completeness formal stub in Sec 02.3"
status: pending
priority: high
depends_on: ["PA-B1"]
binding_claims: [4, 9, 10]
target: "sections/02_background.md"
pipeline: "audit_2026-03-30"
assigned: "claude"
created: "2026-03-30"
---

## Goal

Fill the `::: {.formal}` placeholder at `sections/02_background.md` lines 109-111 with a cited formal claim about Refinery's soundness and completeness guarantees. This is the **single most damaging unfixed issue** across all four reviewer personas (Z01 synthesis, X03 reviewer simulation).

## Context

The placeholder currently reads something like "Oscar: soundness/completeness guarantees for Refinery." The mathematician reviewer (Persona B) requires that the background section establish the formal properties that the evaluation later relies on. Without this, the automated checking claim (#4) and the multi-layer invisibility claim (#9) are formally unanchored.

Decision `decision_soundness_completeness` requires: "Core formal contribution: soundness (invalid designs stay invalid, generated models satisfy all constraints) + completeness (detects all flaws) on partial models; compare vs. random/LLM baselines."

The paper need not re-prove Refinery's properties — it can cite them. The key reference is Semerath et al.'s work on Refinery's graph generation (MODELS 2018/2020). The claim should state what Refinery guarantees and what the paper inherits from those guarantees.

## What to write

Replace the `.formal` div with 2-3 sentences structured as:

1. **State the property:** Refinery's graph generation satisfies [soundness property]: every generated partial model instance refines into a well-formed model satisfying all metamodel constraints and graph predicates.
2. **State the completeness property:** If a specification is satisfiable, Refinery will find a satisfying instance within the bounded scope.
3. **Cite:** Reference Semerath et al. (whichever paper establishes these properties — check `pandoc/references.bib` for existing entries like `semerath2018` or `semerath2020`).

## Read before writing

1. `sections/02_background.md` — the full Sec 2.3 for context around the placeholder
2. `pandoc/references.bib` — find the correct Semerath et al. citation key
3. `.claude/memory/decision_soundness_completeness.md` — the full decision text
4. The venue exemplar papers mentioned in VENUE.md use similar formal property statements — match that register

## Constraints

- Do NOT re-prove the properties. Cite and state what the paper inherits.
- Use the paper's established terminology (partial model, graph predicate, refinement).
- Keep to 2-3 sentences — this is background, not a contribution claim.
- If the `.formal` div should remain as a div (for Oszkar to review), write the content inside the div. If it should become regular prose, replace the div entirely.
- Depends on PA-B1: if `.formal` divs are confirmed stripped in submission mode, content inside will be invisible. In that case, replace the div with regular prose instead.

## Acceptance criteria

- [ ] Soundness property stated with citation
- [ ] Completeness property stated with citation
- [ ] Correct Semerath et al. reference used
- [ ] Prose fits within 2-3 sentences
- [ ] Consistent with decision_soundness_completeness
