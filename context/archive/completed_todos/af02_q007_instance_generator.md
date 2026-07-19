---
id: "AF02"
short: "q007-generator"
title: "Richer scalability instance generator + measurement re-run (Q-007)"
status: done
completed: "2026-07-17"
priority: high
depends_on: []
binding_claims: [4]
target: "models/ (generator), sections/05_evaluation.md (scalability results), A-005 harness"
pipeline: "advisor-2026-07-06"
assigned: "claude"
created: "2026-07-13"
---

Implement Q-007, ruled into journal scope by D-021 (2026-07-13); risk R9 is closed.

Context (self-contained). Current scalability instances grow by adding credentials with
uniform structure (one property, shared subject). The interactive-time claim (sublinear to
N=30) rests on those uniform instances only. Q-007 (zettelkasten/questions/Q-007
scalability-deeper-hierarchies.md) defines the missing instance classes: deeper claim
hierarchies and multi-subject credentials, which stress different metamodel elements and may
degrade solver performance. K-004's M-011 row lists this as the scheduled journal open item.

Steps:
1. `git submodule update --init models` (the submodule is not checked out by default).
2. Extend the instance generation in the evaluation harness (A-005) with two structural axes:
   claim-hierarchy depth (nested claim properties) and subject count per credential.
3. Re-run the scalability measurements (C-030 extension) across both axes crossed with N.
4. Update F3 (fig_scalability) data and the evaluation section prose; the claim wording
   follows the numbers: if diverse instances degrade performance, the claim narrows, it never
   inflates (M-013 discipline).

Acceptance: generator code in models/, measurement data regenerated, K-004's M-011 Open cell
cleared or re-scoped with the new numbers, F3 updated or a follow-up figure todo filed.

## Completion (2026-07-17)

- **Generator:** `generate_chain_instance()` in `models/evaluation/generate_instances.py` realizes
  both axes through the credential-dependency shape — a credential can describe the *value* of its
  parent credential (validated against Refinery). `depth` = chain length (deeper claim hierarchies,
  stressing the transitive-closure predicates a diameter-2 star never exercises); breadth = parallel
  chains; each chain level is a distinct subject (multi-subject, stressing the alignment predicates).
  Note: independent disconnected subject roots are *not* expressible — the +DCL `non_connected` error
  forbids them — so multi-subject is realized within one connected tree. `config.yaml` gained a
  `diverse:` block; 20 diverse instances generated, 20/20 validate SAT/UNSAT.
- **Measurement:** experiment **ED** added to `run_measurements.sh` (depth sweep at N=12; depth-4
  N-sweep, SAT+UNSAT, check -k + generate). `analyze_results.py` gained `generate_diverse_summary`
  and `plot_diverse_comparison`. Re-run with the full campaign.
- **Result (numbers drive the claim, M-013):** structural diversity does **not** degrade the solver.
  Depth sweep flat/decreasing (check -k ≈0.3–0.4 s across depth 1→12 at fixed node count); diverse
  N-sweep at or below uniform (1.27 s vs 1.48 s concretizability at N=30). The uniform star is the
  harder case (its shared subject aligns every credential pair). §5.2 "Structural diversity"
  paragraph added; the claim **broadened** (holds beyond uniform instances). Line-143 limitation
  hedge removed. K-004 M-011 Open cell closed; D-021 resolved; spin R9 delivery recorded.
- **Figure:** `figures/fig_diverse_comparison.pdf` (uniform vs diverse overlay) produced by the
  analyzer. F3 in the paper remains the tab:scalability table; no separate figure inserted — filed
  as optional follow-up (the comparison PDF is available in supplementary if wanted).
