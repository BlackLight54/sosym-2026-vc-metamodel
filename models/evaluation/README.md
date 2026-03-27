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
# 1. Generate model instances (22 files)
python generate_instances.py

# 2. Validate all instances (runs each once, checks SAT/UNSAT)
./run_measurements.sh validate

# 3. Run full measurement campaign (~290 Hyperfine invocations, ~2-3 hours)
./run_measurements.sh all

# 4. Generate figures and tables
python analyze_results.py
```

Results appear in `results/` (Hyperfine JSON) and `figures/` (PDF plots, LaTeX tables).

## Experiments

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

### E3: Constraint Sensitivity Analysis

Validates the paper's Headline 1 (governance conflict) by systematically
enabling/disabling governance framework combinations at N=3 (the CSOK
canonical instance size).

Power-set of {eIDAS, Privacy, VCDM} = 8 configurations:

| Config | eIDAS | Privacy | VCDM | Expected |
|--------|:-----:|:-------:|:----:|:--------:|
| G0 | - | - | - | SAT |
| G1 | X | - | - | SAT |
| G2 | - | X | - | SAT |
| G3 | - | - | X | SAT |
| G4 | X | X | - | SAT |
| G5 | X | - | X | SAT |
| G6 | - | X | X | SAT |
| G7 | X | X | X | **UNSAT** |

Only G7 (all three governance frameworks simultaneously) is UNSAT.
This confirms the conflict requires the triple conjunction — any
proper subset of governance requirements is satisfiable.

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
adds constant overhead (~5-7s) that does not affect the scaling shape
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
  instances/                 # Generated .problem files
    vc_metamodel.refinery      (copy of metamodel)
    governance_conflict.refinery (copy of error predicate)
    scale_{N}_{sat,unsat}.problem  (E1/E2 instances)
    sensitivity_G{0-7}.problem     (E3 instances)
  results/                   # Hyperfine JSON output
    environment.json           (hardware/software metadata)
    e1_check_S{N}_{variant}.json
    e2_generate_S{N}_sat.json
    e3_sensitivity_G{i}.json
  figures/                   # Generated artifacts
    fig_scalability_check.pdf
    fig_scalability_generate.pdf
    fig_constraint_sensitivity.pdf
    timing_summary.md
    timing_summary.tex
```

## Running individual experiments

```bash
./run_measurements.sh e1        # Only E1 (check scalability)
./run_measurements.sh e2        # Only E2 (generate scalability)
./run_measurements.sh e3        # Only E3 (constraint sensitivity)
./run_measurements.sh validate  # Quick validation (no timing)
```

## Refinery CLI reference

The metamodel source files are in the parent directory (`models/`).
Copies are placed in `instances/` for import resolution.

```bash
# Concretizability check (detects error predicates)
docker run --rm -v "$(pwd)/instances:/work" -w /work \
  ghcr.io/graphs4value/refinery-cli:latest check -k /work/<file>.problem

# Model generation (full design space exploration)
docker run --rm -v "$(pwd)/instances:/work" -w /work \
  ghcr.io/graphs4value/refinery-cli:latest generate /work/<file>.problem
```

Key distinction:
- `check` — partial model consistency (does not enforce error predicates)
- `check -k` — concretizability check (enforces error predicates, detects conflicts)
- `generate` — produces a concrete model instance (fails with `UnsatisfiableProblemException` on UNSAT)

## Regenerating instances

If the metamodel (`models/vc_metamodel.refinery`) or governance conflict
definition (`models/governance_conflict.refinery`) changes, regenerate:

```bash
python generate_instances.py
./run_measurements.sh validate   # verify SAT/UNSAT expectations still hold
```

The generator copies the current metamodel files into `instances/`.
