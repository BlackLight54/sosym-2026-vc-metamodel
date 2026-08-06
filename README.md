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
├── csok_no_eidas.problem          # eIDAS governance removed (UNSAT since 2026-08-05)
├── csok_no_gdpr.problem           # Privacy governance removed (SAT)
├── csok_standalone.problem        # Self-contained version for web editor
├── spec_ambiguity.refinery        # C7 (VCDM conformance) as an enforced error
├── spec_ambiguity.problem         # Dedicated C7 scenario (UNSAT)
├── revocation_mismatch.refinery   # C11 revocation-mismatch error predicate
├── revocation_mismatch_instance.problem  # C11 probe: static+dynamic pair (UNSAT)
├── revocation_mismatch_control.problem   # C11 control: both static (SAT)
├── probe_c11_separated_design.problem    # C11 re-scoping probe: mismatched cadence, separate credentials (SAT)
├── probe_c11_separated_design_control.problem  # ... same design, single cadence (SAT)
├── probe_common_parent.problem    # common_parent vacuity probe (UNSAT under generate)
├── probe_common_parent_control.problem   # Vacuity probe control (SAT)
├── probe_cyclic.problem           # Acyclicity probe (UNSAT)
├── probe_cyclic_control.problem   # Acyclicity control (SAT)
├── probe_cross_cred_gap.problem   # C9 shadow-predicate true-positive probe (UNSAT)
├── probe_cross_cred_gap_control.problem  # C9 probe control (SAT)
├── probe_c4_domain_dependency.problem    # C4 x C9 firing probe: the one domain-linked pair (UNSAT)
├── probe_c4_domain_dependency_control.problem  # ... error block disabled (SAT)
├── probe_trace_misalign_target.problem   # prop_t propagation probe (UNSAT)
├── probe_trace_misalign_source.problem   # prop_s propagation probe (UNSAT)
├── probe_trace_misalign_control.problem  # Shared trace-alignment control (SAT)
├── coverage_instance_map.md       # Constraint-coverage-to-instance bucket map
├── expectations.tsv               # Declared verdicts for the entry points above (tiers 1-2)
├── run_tests.sh                   # Three-tier test harness (smoke / validate / perf)
├── scripts/pre-push-smoke.sh      # Optional warn-only push guard running tier 1
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

To see which governance frameworks the conflict actually needs. Removing the
eIDAS mandate does **not** resolve it: the surviving {privacy, VCDM} pair is
itself unsatisfiable (see E3 below and vault A-004).

```bash
# UNSAT since 2026-08-05 ({privacy, VCDM} is a conflicting pair on its own):
docker run --rm -v "$(pwd):/work" -w /work \
  ghcr.io/graphs4value/refinery-cli:latest check -k /work/csok_no_eidas.problem

# SAT (SD-JWT VC satisfies the eIDAS mandate and VCDM conformance jointly):
docker run --rm -v "$(pwd):/work" -w /work \
  ghcr.io/graphs4value/refinery-cli:latest check -k /work/csok_no_gdpr.problem

# SAT (governance_conflict, and with it governance_sources, is not imported):

docker run --rm -v "$(pwd):/work" -w /work \
  ghcr.io/graphs4value/refinery-cli:latest check -k /work/csok_no_conflict.problem
```

### Testing

Three tiers, each answering a different question at a different cost. All three
are `just` recipes over `run_tests.sh`.

| Tier | Command | Cost | What it answers |
|------|---------|------|-----------------|
| 1 Smoke | `just smoke` | ~7 s | Does the toolchain work, does the governance conflict still fire, and does the solver still produce a model? |
| 2 Validation | `just validate` | ~2 min | Does every instance still produce its declared verdict, under both `check -k` and `generate`? |
| 3 Performance | `just perf` / `just perf-full` | ~3 min / ~1 h | Do runtimes hold, and does any benchmark breach the wall-clock ceiling? |

Tier 1 runs six solver invocations concurrently: the canonical CSOK check, the
no-conflict ablation, the acyclicity probe and its control, one generation, and
one generate-side unsatisfiability probe. Both operations appear because they
answer different questions — `check -k` says concretization is not excluded,
`generate` says a model was actually produced, and `probe_common_parent.problem`
is in the repository precisely because the two can diverge.

Tier 2 reads two manifests: `expectations.tsv` for the hand-authored entry points
here, and `evaluation/instances/expectations.tsv`, which `generate_instances.py`
emits for the measurement corpus. **A `.problem` file with no row in either
manifest fails the tier.** Adding an instance means declaring what it should do.
Verdicts are `SAT`, `UNSAT`, or `UNKNOWN` (run and report, never fail); the
`generate` column may be `SKIP` where an instance is not a generation entry point.

Verdict classification separates three outcomes, not two. Exit status alone does
not distinguish an unsatisfiable model from a broken one — `check -k` returns 1
for both a real UNSAT and a parse failure — so each operation is matched against
its own unsatisfiability signal (`Inconsistencies found in model:` for `check -k`,
`UnsatisfiableProblemException` for `generate`). Anything else nonzero is `ERROR`,
which fails the tier whatever the expectation says.

Tier 3 is serial by construction (parallel timing is meaningless). `just perf`
runs E0+E1+E2 at `RUNS=3` over scale points 1/10/30; `just perf-full` delegates to
the archival campaign. Both end in `evaluation/check_ceilings.py`, which fails if
any benchmark mean exceeds `CEILING_SECONDS` (default 60).

Environment knobs: `JOBS` (concurrent containers, default 4), `TIMEOUT` (per
invocation, default 300 s), `CEILING_SECONDS`.

Optional push guard, warn-only and never blocking:

```bash
ln -sf "$(git rev-parse --show-toplevel)/scripts/pre-push-smoke.sh" \
       "$(git rev-parse --git-common-dir)/hooks/pre-push"
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

**E3 — Constraint sensitivity:** Systematically enables/disables governance framework combinations (power-set of {eIDAS, Privacy, VCDM} = 8 configurations) at the canonical instance size (N=3). Measures which framework subsets admit a format assignment. Result since the 2026-08-05 per-source encoding: UNSAT at G4 {eIDAS, privacy}, G6 {privacy, VCDM} and G7, SAT elsewhere, so the two minimal conflicting provision sets are the pairs containing the GDPR privacy requirement (`evaluation/README.md` § E3).

**ED — Structurally diverse instances (AF02 / Q-007):** Measures `check -k` and `generate` on *chained* instances (a credential can describe the value of its parent credential), realizing deeper claim hierarchies and multi-subject credentials. A depth sweep at fixed N=12 and a depth-fixed N-sweep test whether the sublinear-in-N scaling of the uniform instances survives structural diversity.

## Key files

- **`vc_metamodel.refinery`** — The three-layer metamodel. Defines all classes, relations, propagation rules, derived predicates, and format capability constraints. This is the primary artifact.

- **`governance_conflict.refinery`** — The governance conflict error predicate (constraint C8). Fires when a credential carries all three governance mandates (eIDAS mandate, privacy requirement, VCDM-conformance mandate) and no single format satisfies them jointly; the three-clause body partitions the failure condition (D-039). It is the credential-granularity diagnostic that names the joint conflict in one atom, and since 2026-08-05 it is no longer the sole carrier of the UNSAT verdict: C5 and C6 alone already make the CSOK instance unsatisfiable. Imports `governance_sources.refinery`.

- **`governance_sources.refinery`** — C5 (eIDAS/ARF format mandate), C6 (GDPR predicate-proof requirement) and C7 (W3C VCDM conformance) as independent per-source constraints, each gated on its own annotation class: nine `propagation rule` declarations that eliminate the inadmissible format classes, plus one named `error` predicate per source (`eidas_format_violation`, `privacy_format_violation`, `vcdm_format_violation`) so an empty format design space produces an attributable verdict atom. Added 2026-08-05 to replace the syntactic minimality reading of the G0–G7 battery with a measured one. Probe pair: `probe_governance_sources.problem` (eIDAS + privacy, UNSAT) against `probe_governance_sources_control.problem` (eIDAS only, SAT).

- **`csok_instance.refinery`** — The CSOK running example: three credentials (FamilyStatusCred, PropertyCred, IncomeCred) for a shared applicant, with domain properties and credential schemas instantiated.

- **`csok.problem`** — Canonical entry point that imports the metamodel, governance conflict, and CSOK instance with full governance annotations. Expected result: UNSAT.

- **`spec_ambiguity.refinery` / `spec_ambiguity.problem`** — The specification-ambiguity instrument: constraint C7 (VCDM conformance) as an enforced error predicate, plus a dedicated scenario that pins the income format to mdoc and violates it. Deliberately not imported by any CSOK entry point, so C7 is an available instrument demonstrated in its own scenario rather than a constraint enforced across the delivered instances. Verdict (`check -k`, 2026-07-28): UNSAT, `spec_ambiguity::vcdm_conformance_violation(IncomeCred, income_format): error.`

- **`revocation_mismatch.refinery`** — The C11 status/revocation-propagation mismatch error predicate: two claims with mismatched revocation lifespans (one static-, one dynamic-marked) must not be co-located on the same credential chain. Co-location is a `cred_neighbors` edge or a chain link (a parent credential's claim target aligned with a child credential's `credentialSubject` root); sibling credentials of one subject are *not* co-located, which is what makes the separated design a valid repair. Adds two minimal marker classes (`StaticRevocation`, `DynamicRevocation`) on top of the metamodel; kept standalone, not imported by any CSOK entry point.

- **`revocation_mismatch_instance.problem` / `revocation_mismatch_control.problem`** — Probe pair for C11. The instance (chained two-claim pair, one static- and one dynamic-marked) is UNSAT, reporting `revocation_mismatch::revocation_mismatch(claim_0_0, claim_0_1): error.`; the control (same structure, both static-marked) is SAT, isolating the error predicate rather than the chained structure as the cause. Verdicts from `check -k`, 2026-07-28, reproduced 2026-08-05 after the `colocated_step` re-scoping.

- **`probe_c11_separated_design.problem` / `probe_c11_separated_design_control.problem`** — Negative probe pair for C11, added 2026-08-05. Both import `csok_instance.refinery` unchanged and mark two claims that already sit in *separate* credentials of the same subject: the first with mismatched cadence, the second with a single cadence. Both are SAT, so the predicate stays silent on the separated-credential design that repairs a C11 bundling error. Before the `colocated_step` chain-link restriction of the same date the first probe was UNSAT, which was the defect the restriction fixes.

- **`probe_common_parent.problem` / `probe_common_parent_control.problem`** — Vacuity probe pair for the retired `common_parent` shadow predicate (D-045). The probe inlines the predicate body as `witness/2` and forces a witness via `error missing_witness() <-> !some_witness()`; it is UNSAT under `generate` (`UnsatisfiableProblemException`), while the identical control without the forcing error generates a model (SAT). This shows the original predicate could never hold: both `Prop::trace` and `Claim::source` are containments, so distinct props force distinct source entities. Verdicts from `generate`, 2026-07-28, reproduced 2026-08-03 after the retirement edit.

- **`probe_cyclic.problem` / `probe_cyclic_control.problem`** — Acyclicity probe pair for the `cyclic` error predicate. The control is a minimal DCL path `a → b → c` (SAT); the probe adds one edge closing a length-two cycle and is UNSAT, reporting `vc_metamodel::cyclic(b)` / `vc_metamodel::cyclic(c)`. Verdicts from `check -k`, 2026-08-03.

- **`probe_cross_cred_gap.problem` / `probe_cross_cred_gap_control.problem`** — True-positive probe pair for the cross-credential predicate gap (C9), which the metamodel carries as a *shadow* predicate and which therefore never fires on its own. The probe is `csok_no_conflict.problem` plus the same body re-declared as an enforced error (the shadow pred `aligned` inlined, since shadow relations may not be referenced from non-shadow contexts); it is UNSAT, reporting the three gapped CSOK credential pairs as six ordered atoms (`cross_cred_gap_witness(IncomeCred, FamilyStatusCred): error.` and so on). The control, identical with the error commented out, is SAT. Verdicts from `check -k`, 2026-08-03. Since 2026-08-05 this pair doubles as the discrimination control for the C4 probe below: same base, same error minus the C4 conjuncts.

- **`probe_c4_domain_dependency.problem` / `probe_c4_domain_dependency_control.problem`** — Firing probe pair for `domain_dependency_gap`, the C4 × C9 conjunction, added 2026-08-05. C9 fires for every subject-aligned pair, which is correct about format capability but cannot say which pair a domain rule actually spans; C4 (`depends_on`, uninterpreted) supplies that. The probe re-declares `domain_dependency_gap` as an enforced error over the same base as the C9 probe and is UNSAT with exactly one atom, `domain_dependency_gap_witness(PropertyCred, FamilyStatusCred): error.` — one ordered pair against C9's three. The control, identical with the error commented out, is SAT; it still carries the `depends_on` assertion, so an asserted domain dependency is by itself inert. A third run, with `depends_on(owns_property, has_children)` ablated from `csok_instance.refinery`, makes the probe SAT, which is what establishes that the C4 assertion carries the discrimination. Verdicts from `check -k`, 2026-08-05.

- **`probe_trace_misalign_target.problem` / `probe_trace_misalign_source.problem` / `probe_trace_misalign_control.problem`** — True-positive probes for the two cross-layer trace-consistency propagation rules `prop_t` and `prop_s`. Propagation rules remove `may` edges rather than raising error atoms, so each probe moves exactly one `CredEntity::trace` edge away from the domain entity its Prop relates and asserts the edge the rule then concludes false; both are UNSAT, reporting `vc_metamodel::Claim::target(cl_ab, cv_b): error.` and `vc_metamodel::Claim::source(cl_bc, cs_b): error.` respectively. The shared control (aligned traces, otherwise identical) is SAT. Verdicts from `check -k`, 2026-08-03.
