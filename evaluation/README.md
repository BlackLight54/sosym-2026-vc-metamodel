# Evaluation: Scalability and Constraint Sensitivity Measurements

Reproducible measurement campaign for the VC ecosystem metamodel.
Measures concretizability checking and model generation performance
across scaled model instances using the Refinery graph solver.

## Prerequisites

| Tool | Version | Purpose |
|------|---------|---------|
| Docker | >= 24.0 | Runs Refinery CLI container |
| Hyperfine | >= 1.18 | Benchmarking harness |
| Python | >= 3.10 | Instance generation and analysis |
| matplotlib | any | Figure generation (`pip install matplotlib`) |
| PyYAML | any | Config parsing (`pip install pyyaml`) |

Refinery is pulled automatically as a Docker image (`ghcr.io/graphs4value/refinery-cli:latest`).
No local Java installation is required.

## Quick start

```bash
# 1. Generate model instances (42 files: 22 uniform + 20 diverse)
python generate_instances.py

# 2. Validate all instances (runs each once, checks SAT/UNSAT)
#    Delegates to ../run_tests.sh validate (tier 2); `just validate` is equivalent.
../run_measurements.sh validate

# 3. Run full measurement campaign (E0+EC+E1+E2+E3+ED, ~1 hour)
../run_measurements.sh all

# 4. Generate figures and tables
python analyze_results.py
```

Results appear in `results/` (Hyperfine JSON) and `figures/` (PDF plots, LaTeX tables).

### Paper figure

`generate_paper_figure.py` produces the baseline-corrected scalability figure
used in the paper (E0-corrected E1/E2 curves, square PDF for a `figure*`
minipage):

```bash
python generate_paper_figure.py    # writes figures/fig_scalability.pdf
```

The paper build does not read this repository. After regenerating, copy the
figure manually into the paper repository's asset directory:

```bash
cp figures/fig_scalability.pdf ../../paper-latex-overleaf/assets/fig_scalability.pdf
```

(the relative path assumes this repository is checked out as the `models/`
submodule of the paper workspace; adjust otherwise).

## Experiments

### E0: Baseline Overhead

Measures Docker + JVM startup cost using a minimal no-op problem (`noop.problem`).
This constant overhead is reported alongside E1/E2 results so that solver time can be
isolated from container startup. On the reference machine (Ryzen 9 7950X3D, WSL2) it
measures 4.06 s ± 0.11 s over 10 runs (2026-08-03); the ~5–7s previously quoted here came
from the retired native-Windows Docker Desktop campaign.

### EC: Consistency Check Scalability

Runs plain `refinery check` (no `-k`) on SAT and UNSAT variants at all 7 scale
points. Consistency checking verifies that the *partial* model has no internal
contradictions; it does **not** enforce error predicates. The key property this
experiment demonstrates: plain `check` returns SAT (exit 0, "Model is
consistent") on **every** instance, including the `_unsat` variants, because the
governance conflict only becomes a definite error after concretization. Only
`check -k` (E1) returns UNSAT on the `_unsat` variants. EC is therefore the
quantitative counterpart to E1 — same instances, weaker operation, and it
separates "the partial model is coherent" from "a concrete model exists."

### E1: Concretizability Check Scalability

**Research question (RQ1):** How does concretizability checking runtime scale with model size?

Runs `refinery check -k` on SAT and UNSAT variants at 7 scale points
(1, 3, 5, 10, 15, 20, 30 credentials). The `-k` flag checks whether
the partial model can be concretized — this is the operation that
enforces error predicates and detects governance conflicts.

- SAT variants: no governance conflict imported; all formats acceptable.
- UNSAT variants: governance conflict active; last credential has
  contradictory eIDAS + GDPR + VCDM requirements (no format satisfies all three).

### E2: Model Generation Scalability

**Research question (RQ2):** How does design space exploration runtime scale with model size?

Runs `refinery generate` on SAT variants at the same 7 scale points.
Overlay with E1-SAT times shows the overhead of full generation vs.
concretizability checking alone.

### ED: Structurally Diverse Instances (AF02 / GAPQ-scalability_deeper_hierarchies)

**Research question (RQ3):** Does the sublinear-in-N scaling of the uniform
instances survive when instances are structurally diverse?

The E1/E2 instances are a **uniform depth-1 star**: N credentials each describing
the single `Applicant` with one property. ED introduces *chained* instances,
where a credential can describe the *value* of its parent credential. This
realizes the two phenomena GAPQ-scalability_deeper_hierarchies flags:

- **Deeper claim hierarchies** — a chain of length `depth` produces a domain path
  `Applicant -> v1 -> v2 -> ...`, stressing the transitive-closure predicates
  (`neighbours+`, `directed_edge+`, `non_connected`, `cyclic`) that a diameter-2
  star never exercises.
- **Multi-subject credentials** — each chain level is a distinct subject; a
  child credential's subject and its parent's value trace the same domain entity,
  exercising the alignment predicates (`aligned`, `cross_cred_predicate_gap`) on
  a different topology.

Two families:

- **Depth sweep** at fixed N=12: chain depth ∈ {1, 2, 3, 4, 6, 12} (breadth =
  12/depth), holding node count constant while the domain-graph diameter grows.
  Isolates the effect of depth on `check -k` and `generate`.
- **Depth-fixed N-sweep** at depth=4: the same 7 scale points as E1/E2, SAT and
  UNSAT, chained. Overlays against the uniform E1 curve at matched node counts.

Per the MOC-drafting_guardrails discipline, the scalability claim wording follows these numbers: it
narrows if diverse instances degrade solver performance and never inflates.

### E3: Constraint Sensitivity Analysis

Validates the paper's Headline 1 (governance conflict) by systematically
enabling/disabling governance framework combinations at N=3 (the CSOK
canonical instance size).

Power-set of {eIDAS, Privacy, VCDM} = 8 configurations:

| Config | eIDAS | Privacy | VCDM | Verdict | Pre-2026-08-05 |
|--------|:-----:|:-------:|:----:|:-------:|:--------------:|
| G0 | - | - | - | SAT | SAT |
| G1 | X | - | - | SAT | SAT |
| G2 | - | X | - | SAT | SAT |
| G3 | - | - | X | SAT | SAT |
| G4 | X | X | - | **UNSAT** | SAT |
| G5 | X | - | X | SAT | SAT |
| G6 | - | X | X | **UNSAT** | SAT |
| G7 | X | X | X | **UNSAT** | **UNSAT** |

The conflict is **not** minimal at the triple. Two proper subsets are
already unsatisfiable, and both are pairs containing the GDPR privacy
requirement: G4 {eIDAS, privacy} (the eIDAS format mandate admits only
SD-JWT VC and mdoc, GDPR predicate proofs admit only AnonCreds) and G6
{privacy, VCDM} (GDPR admits only AnonCreds, W3C VCDM 2.0 excludes it).
G5 {eIDAS, VCDM} is satisfiable via SD-JWT VC, so no single framework and
no pair without the privacy requirement produces a conflict. The three
frameworks bear on the credential independently; VCDM conformance is a
third, separate obstruction rather than a conjunct the conflict needs.

The pre-2026-08-05 column is the superseded reading. Until that date C5,
C6 and C7 had no independent encoding: enforcement ran only through
`governance_conflict`, every clause of which requires all three annotation
targets at once, so G0–G6 were satisfiable by construction and the column
measured the predicate's syntax rather than format availability (mock
review 2026-08-03, Mathematician findings 1–3; stress-test CLM-contradictory_cross_framework_constraints). The
current column is measured against `governance_sources.refinery`, which
encodes each source as its own elimination rules plus a named error
predicate. Verdicts taken 2026-08-05 with `check -k` (refinery-cli digest
`sha256:88f1332e9aae...`); verbatim output in vault ART-constraint_sensitivity_variants.

Timings were also re-measured on 2026-08-03 under `check -k` (the E3
benchmark previously ran plain `check`): 4.16–4.45 s wall clock per
configuration against a 4.06 s no-op baseline, i.e. 0.10–0.39 s
baseline-corrected, flat within cold-start jitter for all eight
including the UNSAT G7. The conflict is visible in the verdict, not in
the runtime.

**Timing staleness (2026-08-05).** Those timings predate
`governance_sources.refinery`. Every instance that imports
`governance_conflict` now also loads nine propagation rules and three error
predicates, so the E1/E2/E3 wall-clock numbers were measured against a
different model and must be re-measured before any timing claim is
re-stated. Verdicts are unaffected: the full `run_measurements.sh validate`
pass was re-run on 2026-08-05 and every instance outside E3 kept its
recorded SAT/UNSAT verdict.

## Scaling model

Each credential with K=1 property adds to the model:

| Layer | Nodes added |
|-------|-------------|
| DCL (Domain Concept) | 1 Prop + 1 Value = 2 |
| CSL (Credential Schema) | 1 CredentialSubject + 1 Claim + 1 CredentialValue + 1 Credential = 4 |
| FSL (Format-Specific) | 1 Formatted_Credential = 1 |
| Governance | ~2.5 annotations (eIDAS + VCDM per credential, Privacy on one) |

Total nodes = 9N + 2 for N credentials with full governance. All
credential subjects trace to a shared Subject (Applicant). The last
credential's format is left unassigned for the solver.

| Instance | N | Total nodes | Governance annotations |
|----------|--:|------------:|-----------------------:|
| S1 | 1 | 11 | 3 |
| S3 | 3 | 29 | 7 |
| S5 | 5 | 47 | 11 |
| S10 | 10 | 92 | 21 |
| S15 | 15 | 137 | 31 |
| S20 | 20 | 182 | 41 |
| S30 | 30 | 272 | 61 |

## Measurement protocol

- **Harness:** Hyperfine with `--runs 10 --warmup 1`
- **Output:** JSON per benchmark (`results/e{1,2,3}_*.json`)
- **Statistics:** Mean, standard deviation, min, max (from Hyperfine)
- **Shell:** Hyperfine invoked with `--shell bash` (required on Windows/Git Bash)
- **Environment:** Captured automatically in `results/environment.json`

Each invocation starts a fresh Docker container (cold JVM). This
adds constant overhead (~4.1s on the reference machine; ~5-7s on the retired
Docker Desktop setup) that does not affect the scaling shape
but inflates absolute times. Reported honestly in the paper.

## File structure

```
evaluation/
  README.md                  # This file
  SESSION_LOG.md             # Development notes and debugging history
  config.yaml                # All experiment parameters
  generate_instances.py      # Instance generator
  run_measurements.sh        # Hyperfine orchestration
  analyze_results.py         # Results -> figures + tables
  check_ceilings.py          # Tier-3 wall-clock ceiling gate (CEILING_SECONDS)
  instances/                 # Generated .problem files
    expectations.tsv             (GENERATED verdict manifest read by ../run_tests.sh)
    governance_conflict.refinery (copy of error predicate)
    noop.problem                 (E0 baseline — minimal no-op)
    scale_{N}_{sat,unsat}.problem  (EC/E1/E2 uniform instances)
    sensitivity_G{0-7}.problem     (E3 instances)
    diverse_depth_D{d}_N12_sat.problem       (ED depth sweep)
    diverse_scale_D4_S{N}_{sat,unsat}.problem (ED N-sweep)
  results/                   # Hyperfine JSON output
    environment.json           (hardware/software metadata)
    e0_baseline.json
    ec_consistency_S{N}_{variant}.json
    e1_check_S{N}_{variant}.json
    e2_generate_S{N}_sat.json
    e3_sensitivity_G{i}.json
    ed_depth_{check,generate}_D{d}_N12.json
    ed_scale_check_D4_S{N}_{variant}.json
    ed_scale_generate_D4_S{N}.json
  figures/                   # Generated artifacts
    fig_scalability.pdf        (paper figure — generate_paper_figure.py)
    fig_scalability_check.pdf
    fig_scalability_generate.pdf
    fig_constraint_sensitivity.pdf
    timing_summary.md
    timing_summary.tex
```

## Running individual experiments

```bash
../run_measurements.sh e0        # Only E0 (baseline overhead)
../run_measurements.sh ec        # Only EC (plain-check consistency scalability)
../run_measurements.sh e1        # Only E1 (check -k concretizability scalability)
../run_measurements.sh e2        # Only E2 (generate scalability)
../run_measurements.sh e3        # Only E3 (constraint sensitivity)
../run_measurements.sh ed        # Only ED (diverse chained instances)
../run_measurements.sh validate  # Quick validation (no timing)
```

## Refinery CLI reference

The metamodel source files are in the parent directory (repository root).
`run_measurements.sh` mounts the repository root as `/work`, so `import vc_metamodel.` resolves against the root-level `.refinery` files.

```bash
# Concretizability check (detects error predicates)
docker run --rm -v "$(pwd)/..:/work" -w /work \
  ghcr.io/graphs4value/refinery-cli:latest check -k /work/evaluation/instances/<file>.problem

# Model generation (full design space exploration)
docker run --rm -v "$(pwd)/..:/work" -w /work \
  ghcr.io/graphs4value/refinery-cli:latest generate /work/evaluation/instances/<file>.problem
```

Key distinction:
- `check` — partial model consistency (does not enforce error predicates)
- `check -k` — concretizability check (enforces error predicates, detects conflicts)
- `generate` — produces a concrete model instance (fails with `UnsatisfiableProblemException` on UNSAT)

## Regenerating instances

If the metamodel (`vc_metamodel.refinery`) or governance conflict
definition (`governance_conflict.refinery`) in the repository root changes, regenerate:

```bash
python generate_instances.py
../run_measurements.sh validate   # verify SAT/UNSAT expectations still hold
```

`generate_instances.py` also writes `instances/expectations.tsv`, the verdict
manifest tier 2 reads. It is generated output: the expectations come from the
`variant` each instance was built with, so regenerating instances and
regenerating their expectations cannot drift apart. Do not hand-edit it; the
hand-authored entry points at the repository root declare their expectations in
`../expectations.tsv` instead.

The generator copies `governance_conflict.refinery` into `instances/` for import
resolution. It does **not** copy `vc_metamodel.refinery`: the harness mounts
`models/` as `/work`, so `import vc_metamodel.` resolves against the single
canonical metamodel at the repository root. Keeping one copy avoids the metamodel
drift T12 eliminated (a stale local copy shadowing the root).
The metamodel itself resolves via the Docker volume mount (repository root as `/work`).
