---
id: "T12"
short: "eval-consistency"
title: "Reconcile evaluation instances, measurements, and metamodel"
status: done
completed: "2026-07-17"
priority: high
depends_on: []
binding_claims: [4, 5, 6, 7, 9]
target: "models/evaluation/, sections/05_evaluation.md"
pipeline: "consolidation"
assigned: "claude"
created: "2026-03-28"
---

## Goal

Make the evaluation infrastructure fully consistent with the current metamodel and produce a complete, trustworthy measurement dataset that populates Sec 05.

## Problem

Three sources of drift and incompleteness exist:

### 1. Metamodel drift between main and evaluation instances

The evaluation instances import a **simplified copy** of `vc_metamodel.refinery` (in `models/evaluation/instances/`) that has drifted from the current main metamodel (`models/vc_metamodel.refinery`). Specific differences:

- **Removed from instances version:**
  - `Root_cred_entity` predicate
  - `targets_are_not_roots` propagation rule
  - `cred_points_to_root_cred_e` propagation rule
  - `root_ent_doesnt_have_cred` error predicate

- **Changed in instances version:**
  - `aligned` predicate: `shadow pred` → `pred` (visibility change)
  - `common_parent` predicate: `shadow pred` → `pred` (visibility change)
  - Acyclicity TODO comment removed

**Decision needed:** Either (a) the evaluation instances metamodel should be replaced with the current main metamodel and instances re-validated, or (b) the drift should be documented as intentional simplification for evaluation (the generator hardcodes credential structure, making Root_cred_entity constraints unnecessary). Option (a) is strongly preferred for scientific integrity — the evaluation should run against the metamodel the paper describes.

### 2. Missing experiment: plain `check` (consistency without `-k`)

Sec 05 Table (tab:scalability) has three columns:
- **Consistency** (`check`) — verifies partial model has no internal contradictions
- **Concretizability** (`check -k`) — determines whether a concrete model exists
- **Generation** (`generate`) — produces a concrete model instance

The current `run_measurements.sh` only runs E1 (`check -k`) and E2 (`generate`). **Plain `check` (no `-k`) is not benchmarked.** This is critical because the paper's argument depends on showing that consistency checking returns SAT on ALL rows (including UNSAT models), while only concretizability correctly distinguishes SAT from UNSAT.

### 3. Instance regeneration may be needed

If the metamodel is updated (item 1), the generated instances (`generate_instances.py`) must be re-run and re-validated. The generator script hardcodes structural assumptions that may not hold with the updated metamodel.

## Tasks

### Phase A: Metamodel reconciliation

1. **Diff** `models/vc_metamodel.refinery` against `models/evaluation/instances/vc_metamodel.refinery` line by line. Determine whether removed elements affect evaluation correctness.
2. **Copy** the current main metamodel to `models/evaluation/instances/vc_metamodel.refinery` (replacing the simplified version).
3. **Run validation:** `./run_measurements.sh validate` — all 22 instances must still pass SAT/UNSAT expectations.
4. If validation fails: diagnose which constraints break which instances, and fix the instances (not the metamodel).

### Phase B: Add plain `check` experiment

5. **Add E0 to `run_measurements.sh`:** Run `refinery check` (no `-k`) on all scale instances (SAT and UNSAT). This benchmarks consistency checking.
6. **Verify key property:** `check` must return SAT (exit 0) on ALL instances including `_unsat` variants. If it doesn't, something is wrong with the instances — `check` without `-k` should not enforce error predicates.
7. **Run E0** and collect results as `e0_consistency_S{N}_{sat,unsat}.json`.

### Phase C: Full measurement re-run

8. **Run the complete campaign:** `./run_measurements.sh all` (E0 + E1 + E2 + E3).
9. **Verify** result JSON files are complete and well-formed.

### Phase D: Populate Sec 05

10. **Fill tab:scalability** with mean ± σ values from E0 (consistency), E1 (concretizability), and E2 (generation).
11. **Fill tab:sensitivity** with E3 results (SAT/UNSAT + timing per governance config).
12. **Fill $|V|$ column** with node counts from instance headers.
13. **Fill environment metadata** (CPU, RAM, OS) from `results/environment.json`.
14. **Resolve TBD** in conclusion coverage fraction.

## Acceptance criteria

- `models/evaluation/instances/vc_metamodel.refinery` matches `models/vc_metamodel.refinery` (single source of truth)
- Validation passes: 22/22 instances correct SAT/UNSAT
- Three experiments measured: `check`, `check -k`, `generate`
- All TBD cells in tab:scalability and tab:sensitivity populated with real data
- Key observation confirmed: `check` returns SAT on ALL rows; `check -k` correctly returns UNSAT on `_unsat` variants

## Context

### Current measurement results (2026-03-28, pre-reconciliation)

These results were obtained with the DRIFTED metamodel. They are useful as a baseline but must be re-run after reconciliation.

**Environment:** AMD Ryzen 9 7950X3D, 95.6 GB RAM, Windows 11 Education, Docker 29.2.1, Refinery CLI latest (sha256:88f1332e...), Hyperfine 1.20.0.

**E1 check -k (concretizability):**
- N=1: SAT 3.75±0.06s, UNSAT 3.86±0.05s
- N=3: SAT 3.80±0.07s, UNSAT 3.79±0.05s
- N=5: SAT 3.85±0.07s, UNSAT 3.94±0.06s
- N=10: SAT 3.96±0.10s, UNSAT 3.99±0.06s
- N=15: SAT 4.04±0.06s, UNSAT 4.19±0.08s
- N=20: SAT 4.30±0.10s, UNSAT 4.34±0.05s
- N=30: SAT 4.95±0.07s, UNSAT 4.98±0.10s

**E2 generate:**
- N=1: 4.22±0.04s → N=30: 5.68±0.12s

**E3 sensitivity (N=3):**
- G0–G6 (SAT): 3.80–3.94s range
- G7 (UNSAT): 3.96±0.07s

~3.5s is Docker+JVM startup overhead (constant). Net solver time: ~0.2s (N=1) to ~1.5s (N=30).

## Completion (2026-07-17)

- **Phase A (reconciliation):** No drift existed to fix. The harness was refactored (submodule
  commit f2cdc2e) to mount `models/` as `/work`, so instances resolve the single canonical
  `models/vc_metamodel.refinery` via `import vc_metamodel.` — there is no simplified copy in
  `instances/`. Hardened `generate_instances.py` to never copy `vc_metamodel.refinery` (only
  `governance_conflict.refinery`), preventing a stale local copy from re-introducing drift.
  Validation: 23/23 instances correct SAT/UNSAT against the full metamodel.
- **Phase B (plain check):** Added experiment **EC** (`run_ec`, files `ec_consistency_S{N}_{sat,unsat}.json`)
  to `run_measurements.sh`; fixed the `refinery_cmd` mode trap (was mapping `check`→`check -k`).
  Key property confirmed on all UNSAT instances: plain `check` returns SAT (exit 0), `check -k`
  returns UNSAT (exit 1). E0 (baseline noop) kept its name to avoid a filename collision.
- **Phase C (re-run):** Full campaign re-run (`run_measurements.sh all`) on the same CPU under
  WSL2/Ubuntu (harness made OS-detecting; Windows branch preserved). New baseline 4.06 s.
- **Phase D (Sec 05):** tab:scalability re-populated with a new Consistency column; environment
  line, overhead (≈4.1 s), noise-floor, RQ1/RQ2 numbers, and E3 sensitivity timing updated.
- **Environment note:** reporting shifted Windows→WSL2 (same silicon, same refinery digest
  88f1332e). Numbers run ~30% higher and noisier than the prior Docker-Desktop run. Reversible —
  `run_measurements.sh all` on native Windows regenerates tighter numbers into the same structure.
  Old baseline (pre-reconciliation Windows) preserved above and in git history.

### Windows compatibility notes

`run_measurements.sh` has been patched for Windows/Git Bash:
- Apostrophe in project path (`MODELS'26`) breaks hyperfine's `--export-json` — script copies instances to `$HOME/refinery_eval/` and uses Windows paths for hyperfine
- Hyperfine runs with default cmd.exe shell (not `--shell bash`) to avoid MSYS path mangling
- UNSAT cases use `--ignore-failure` instead of `|| true`
- `((pass++))` replaced with `pass=$((pass + 1))` to avoid `set -e` trap on zero-value increment
