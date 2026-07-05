---
description: One adversarial agent per binding claim attempts refutation — counterexample designs, mis-mapped concepts, inexpressible constraints, benchmark artifacts, overclaimed wording. Use before paragraph engineering starts, and again before submission; verdicts flow back into M-011 and the K-notes.
---

# Skill: Claim Stress-Test

**Purpose:** Find the design that breaks the soundness story, the VCDM concept the mapping misses,
or the ARF constraint that resists the claimed expressiveness *before* a reviewer does. Reviewers
refute claims; this skill does it first, on our schedule, while the fix is still an edit and not a
rebuttal.

## Trigger

- "Stress-test the claims" / "Try to refute the claims"
- Before Stage 4 (paragraph engineering) starts; again as part of pre-submission review.

## Inputs

- `zettelkasten/moc/M-011` (the claim inventory with evidence trails) and the `K-` notes.
- The model artifacts for executable claims: `models/` (a git submodule — see Prerequisites).
- `zettelkasten/moc/M-013` (the already-refuted list; re-asserting a refuted claim is an instant fail).

## Prerequisites

`git submodule update --init models` — the models directory is a submodule
(`ACM-MODELS-26-code`) and is empty in a fresh clone. Executable checks against an empty checkout
prove nothing.

## Steps

### 1. Spawn one skeptic per binding claim (K-001..K-010), independent

Each skeptic receives the claim text, its evidence trail from `M-011`, and a refutation brief keyed
to the claim's kind:

- **Structural claims** (K-001, K-002, K-003): construct a credential-ecosystem design or VCDM
  concept the metamodel cannot represent, or a mapping that is claimed sound but is not. The
  three excluded VCDM families are declared scope, not gaps — attacking them is attacking D-noted
  scope, which is allowed but must be labeled as a scope attack.
- **Executable claims** (K-004, K-008, K-009): run the models. Attempt to build an instance the
  claim says cannot exist (a G7 SAT instance; a cross-layer error the predicates miss; a
  single-layer check that does catch a headline error). A refutation here must include the
  `.problem` file that reproduces it.
- **Evaluation claims** (K-005, K-006, K-007): audit the classification judgments — is a
  "partially expressible" actually inexpressible? Is an excluded concept actually design-time? Is
  an anti-pattern predicate weaker than the anti-pattern it claims to detect?
- **Argument claims** (K-010, K-011..K-015): find the prior work or the reading under which the
  differentiation collapses or the necessity argument overclaims.

Skeptics are instructed to refute, and when uncertain, to return WEAKENED rather than SURVIVES.
A polite confirmation is a failed run; rerun with a sharper brief.

### 2. Verdicts

Per claim: **REFUTED** (with reproduction — file, instance, or citation), **WEAKENED** (the claim
overclaims as worded; calibrated wording proposed), or **SURVIVES** (the attack attempted and why it
failed, so the rebuttal can reuse it).

### 3. Adjudicate and propagate

- REFUTED → status change in `M-011` and the K-note; a todo for the fix; if the fix changes framing,
  a `D-` note.
- WEAKENED → wording fix into the spine/scaffold; if the calibration is load-bearing (like K-010's
  "conditional, not necessity"), record it in the K-note so it survives redrafting.
- SURVIVES → the attack and its failure go into the K-note's evidence or `M-010` as a pre-tested
  rebuttal.

## Output

`context/stress_test_[date].md`: one block per claim (attack, verdict, reproduction or failure
reason, disposition). Updated `M-011` rows. New todos for every REFUTED/WEAKENED.

## Failure modes

- **Confirmation theater.** A skeptic that summarizes the evidence and agrees has not run. The
  brief says refute; default-to-WEAKENED under uncertainty is the calibration backstop.
- **Testing the prose instead of the claim.** Wording bugs are WEAKENED; only the claim's substance
  can be REFUTED.
- **Skipping executable checks.** If the submodule will not build, that is itself a finding
  (reproducibility risk) — record it, do not silently downgrade to prose-only review.
