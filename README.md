# VC Ecosystem Metamodel — Supplementary Material

Three-layer partial graph metamodel for verifiable credential ecosystem design, implemented in [Refinery](https://refinery.tools/).
The metamodel captures domain semantics, credential structure, and format-specific capabilities as distinct layers with cross-layer constraints formalized as graph predicates.
This repository accompanies the paper and provides all artifacts needed to reproduce the evaluation.

## Overview

The metamodel is organized into three layers:

- **DCL (Domain Concept Layer):** Domain-level information graph — subjects, properties, and values representing the data a credential ecosystem must handle.
- **CSL (Credential Schema Layer):** Abstract credential schemas — credentials, claims, and credential subjects that bind domain properties to verifiable assertions.
- **FSL (Format-Specific Layer):** Format classes (W3C VC, SD-JWT-VC, mDL/mdoc), capability predicates (selective disclosure, predicate proofs, VCDM conformance), and governance annotations (eIDAS mandates, privacy requirements).

Cross-layer constraints propagate requirements between layers.
A governance conflict error predicate detects when multiple governance frameworks (e.g., eIDAS + GDPR privacy + W3C VCDM conformance) impose jointly unsatisfiable format requirements on a credential.

The running example models the Hungarian Family Housing Subsidy (CSOK) application, a real-world credential ecosystem involving three credentials under overlapping EU and W3C governance.

## Repository structure

```
.
├── vc_metamodel.refinery          # Three-layer metamodel definition
├── governance_conflict.refinery   # Governance conflict error predicate
├── csok_instance.refinery         # CSOK running example (3 credentials)
├── csok_instance_2x.refinery      # Scaled instance (6 credentials)
├── csok_instance_3x.refinery      # Scaled instance (9 credentials)
├── csok.problem                   # Canonical entry point (UNSAT — conflict active)
├── csok_2x.problem                # 2x scale with conflict (UNSAT)
├── csok_3x.problem                # 3x scale with conflict (UNSAT)
├── csok_generated.problem         # Canonical entry point for generation (SAT)
├── csok_2x_gen.problem            # 2x scale for generation (SAT)
├── csok_3x_gen.problem            # 3x scale for generation (SAT)
├── csok_no_conflict.problem       # No governance conflict imported (SAT)
├── csok_no_eidas.problem          # eIDAS governance removed (SAT)
├── csok_no_gdpr.problem           # Privacy governance removed (SAT)
├── csok_standalone.problem        # Self-contained version for web editor
├── spec_ambiguity.refinery        # C7 (VCDM conformance) as an enforced error
├── spec_ambiguity.problem         # Dedicated C7 scenario (UNSAT)
├── revocation_mismatch.refinery   # C11 revocation-mismatch error predicate
├── revocation_mismatch_instance.problem  # C11 probe: static+dynamic pair (UNSAT)
├── revocation_mismatch_control.problem   # C11 control: both static (SAT)
├── probe_common_parent.problem    # common_parent vacuity probe (UNSAT under generate)
├── probe_common_parent_control.problem   # Vacuity probe control (SAT)
├── probe_cyclic.problem           # Acyclicity probe (UNSAT)
├── probe_cyclic_control.problem   # Acyclicity control (SAT)
├── probe_cross_cred_gap.problem   # C9 shadow-predicate true-positive probe (UNSAT)
├── probe_cross_cred_gap_control.problem  # C9 probe control (SAT)
├── probe_trace_misalign_target.problem   # prop_t propagation probe (UNSAT)
├── probe_trace_misalign_source.problem   # prop_s propagation probe (UNSAT)
├── probe_trace_misalign_control.problem  # Shared trace-alignment control (SAT)
├── coverage_instance_map.md       # Constraint-coverage-to-instance bucket map
├── eidas_arf_supplement.md        # eIDAS ARF constraint supplement notes
├── justfile                       # Task runner wrapping the commands below
├── run_editor.sh                  # Launch Refinery web editor (Docker)
├── run_measurements.sh            # Evaluation measurement campaign (Hyperfine)
└── evaluation/
    ├── README.md                  # Detailed evaluation documentation
    ├── config.yaml                # Experiment parameters
    ├── generate_instances.py      # Scaled instance generator
    ├── analyze_results.py         # Results → figures and tables
    ├── generate_paper_figure.py   # Paper figure generation
    ├── instances/                 # Generated .problem files (EC/E1–E3, ED)
    └── results/                   # Hyperfine JSON output
```

## Prerequisites

| Tool | Version | Purpose |
|------|---------|---------|
| Docker | >= 24.0 | Runs the Refinery solver (no local Java needed) |
| Hyperfine | >= 1.18 | Benchmarking harness (evaluation only) |
| Python | >= 3.10 | Instance generation and analysis (evaluation only) |
| matplotlib | any | Figure generation (`pip install matplotlib`) |
| PyYAML | any | Config parsing (`pip install pyyaml`) |

Refinery is pulled automatically as a Docker image. No local installation is required beyond Docker.

## Quick start

### Interactive exploration

Launch the Refinery web editor to browse and modify the metamodel interactively:

```bash
./run_editor.sh
# Opens http://localhost:8888
```

Load `csok_standalone.problem` in the editor to see the full metamodel with the CSOK running example. The solver will assign formats to credentials and visualize the result.

### Run the canonical example

Check whether the CSOK instance under full governance is satisfiable (expected: UNSAT):

```bash
docker run --rm -v "$(pwd):/work" -w /work \
  ghcr.io/graphs4value/refinery-cli:latest check -k /work/csok.problem
```

The `-k` flag performs a concretizability check that enforces error predicates. The governance conflict predicate fires because no single credential format simultaneously satisfies eIDAS, GDPR privacy, and W3C VCDM conformance requirements.

To confirm that removing any one governance framework resolves the conflict:

```bash
# Each of these is SAT:
docker run --rm -v "$(pwd):/work" -w /work \
  ghcr.io/graphs4value/refinery-cli:latest check -k /work/csok_no_eidas.problem

docker run --rm -v "$(pwd):/work" -w /work \
  ghcr.io/graphs4value/refinery-cli:latest check -k /work/csok_no_gdpr.problem

docker run --rm -v "$(pwd):/work" -w /work \
  ghcr.io/graphs4value/refinery-cli:latest check -k /work/csok_no_conflict.problem
```

### Full evaluation campaign

Reproduce all experiments from the paper:

```bash
# 1. Generate scaled model instances
cd evaluation
python generate_instances.py

# 2. Validate SAT/UNSAT expectations
cd ..
./run_measurements.sh validate

# 3. Run full measurement campaign (E0+EC+E1+E2+E3+ED, ~1 hour)
./run_measurements.sh all

# 4. Generate figures and tables
cd evaluation
python analyze_results.py
```

See `evaluation/README.md` for detailed experiment descriptions and configuration.

## Experiments

The evaluation comprises six experiments:

**E0 — Baseline overhead:** Measures Docker + JVM startup cost using a minimal no-op problem (`noop.problem`). Reported as constant overhead in all subsequent experiments.

**EC — Consistency check scalability:** Measures plain `refinery check` (no `-k`) runtime on SAT and UNSAT variants at 7 scale points. Plain `check` returns SAT on every instance, including the `_unsat` variants (it does not enforce error predicates); only `check -k` (E1) distinguishes them. Separates partial-model consistency from concretizability.

**E1 — Concretizability check scalability:** Measures `refinery check -k` runtime on SAT and UNSAT variants at 7 scale points (1–30 credentials). Demonstrates that governance conflict detection scales with model size.

**E2 — Model generation scalability:** Measures `refinery generate` runtime on SAT variants at the same scale points. Shows the overhead of full design space exploration versus concretizability checking alone.

**E3 — Constraint sensitivity:** Systematically enables/disables governance framework combinations (power-set of {eIDAS, Privacy, VCDM} = 8 configurations) at the canonical instance size (N=3). Confirms the conflict requires the triple conjunction — any proper subset of governance requirements is satisfiable.

**ED — Structurally diverse instances (AF02 / Q-007):** Measures `check -k` and `generate` on *chained* instances (a credential can describe the value of its parent credential), realizing deeper claim hierarchies and multi-subject credentials. A depth sweep at fixed N=12 and a depth-fixed N-sweep test whether the sublinear-in-N scaling of the uniform instances survives structural diversity.

## Key files

- **`vc_metamodel.refinery`** — The three-layer metamodel. Defines all classes, relations, propagation rules, derived predicates, and format capability constraints. This is the primary artifact.

- **`governance_conflict.refinery`** — The governance conflict error predicate. Fires when a credential carries all three governance mandates (eIDAS mandate, privacy requirement, VCDM-conformance mandate) and no single format satisfies them jointly; the three-clause body partitions the failure condition (D-039). Verdicts (`check -k`, 2026-07-28 battery + 2026-08-03 re-run): canonical CSOK instances and sensitivity G7 UNSAT, every proper governance subset G0–G6 SAT with the predicate loaded.

- **`csok_instance.refinery`** — The CSOK running example: three credentials (FamilyStatusCred, PropertyCred, IncomeCred) for a shared applicant, with domain properties and credential schemas instantiated.

- **`csok.problem`** — Canonical entry point that imports the metamodel, governance conflict, and CSOK instance with full governance annotations. Expected result: UNSAT.

- **`spec_ambiguity.refinery` / `spec_ambiguity.problem`** — The specification-ambiguity instrument: constraint C7 (VCDM conformance) as an enforced error predicate, plus a dedicated scenario that pins the income format to mdoc and violates it. Deliberately not imported by any CSOK entry point, so C7 is an available instrument demonstrated in its own scenario rather than a constraint enforced across the delivered instances. Verdict (`check -k`, 2026-07-28): UNSAT, `spec_ambiguity::vcdm_conformance_violation(IncomeCred, income_format): error.`

- **`revocation_mismatch.refinery`** — The C11 status/revocation-propagation mismatch error predicate: two claims with mismatched revocation lifespans (one static-, one dynamic-marked) must not be co-located on the same credential chain. Adds two minimal marker classes (`StaticRevocation`, `DynamicRevocation`) on top of the metamodel; kept standalone, not imported by any CSOK entry point.

- **`revocation_mismatch_instance.problem` / `revocation_mismatch_control.problem`** — Probe pair for C11. The instance (chained two-claim pair, one static- and one dynamic-marked) is UNSAT, reporting `revocation_mismatch::revocation_mismatch(claim_0_0, claim_0_1): error.`; the control (same structure, both static-marked) is SAT, isolating the error predicate rather than the chained structure as the cause. Verdicts from `check -k`, 2026-07-28.

- **`probe_common_parent.problem` / `probe_common_parent_control.problem`** — Vacuity probe pair for the retired `common_parent` shadow predicate (D-045). The probe inlines the predicate body as `witness/2` and forces a witness via `error missing_witness() <-> !some_witness()`; it is UNSAT under `generate` (`UnsatisfiableProblemException`), while the identical control without the forcing error generates a model (SAT). This shows the original predicate could never hold: both `Prop::trace` and `Claim::source` are containments, so distinct props force distinct source entities. Verdicts from `generate`, 2026-07-28, reproduced 2026-08-03 after the retirement edit.

- **`probe_cyclic.problem` / `probe_cyclic_control.problem`** — Acyclicity probe pair for the `cyclic` error predicate. The control is a minimal DCL path `a → b → c` (SAT); the probe adds one edge closing a length-two cycle and is UNSAT, reporting `vc_metamodel::cyclic(b)` / `vc_metamodel::cyclic(c)`. Verdicts from `check -k`, 2026-08-03.

- **`probe_cross_cred_gap.problem` / `probe_cross_cred_gap_control.problem`** — True-positive probe pair for the cross-credential predicate gap (C9), which the metamodel carries as a *shadow* predicate and which therefore never fires on its own. The probe is `csok_no_conflict.problem` plus the same body re-declared as an enforced error (the shadow pred `aligned` inlined, since shadow relations may not be referenced from non-shadow contexts); it is UNSAT, reporting the three gapped CSOK credential pairs as six ordered atoms (`cross_cred_gap_witness(IncomeCred, FamilyStatusCred): error.` and so on). The control, identical with the error commented out, is SAT. Verdicts from `check -k`, 2026-08-03.

- **`probe_trace_misalign_target.problem` / `probe_trace_misalign_source.problem` / `probe_trace_misalign_control.problem`** — True-positive probes for the two cross-layer trace-consistency propagation rules `prop_t` and `prop_s`. Propagation rules remove `may` edges rather than raising error atoms, so each probe moves exactly one `CredEntity::trace` edge away from the domain entity its Prop relates and asserts the edge the rule then concludes false; both are UNSAT, reporting `vc_metamodel::Claim::target(cl_ab, cv_b): error.` and `vc_metamodel::Claim::source(cl_bc, cs_b): error.` respectively. The shared control (aligned traces, otherwise identical) is SAT. Verdicts from `check -k`, 2026-08-03.
