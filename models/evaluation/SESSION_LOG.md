# Measurement Campaign — Session Log

**Date:** 2026-03-27
**Status:** Infrastructure complete, ready to run. No measurements executed yet.

## What exists

| File | Purpose | Status |
|------|---------|--------|
| `config.yaml` | All experiment parameters (scale points, reps, governance configs) | Done |
| `generate_instances.py` | Creates 22 `.problem` files from metamodel template | Done, tested |
| `run_measurements.sh` | Hyperfine orchestration: E1, E2, E3, validate | Done, single-instance tested |
| `analyze_results.py` | Reads Hyperfine JSON, produces 3 PDF figures + LaTeX/markdown tables | Done, untested (no results yet) |
| `instances/` | 22 generated `.problem` files + copied metamodel files | Generated |
| `results/` | Empty — awaiting measurement run | - |
| `figures/` | Empty — awaiting analysis | - |

## Hard-earned lessons

### 1. `check` vs. `check -k` vs. `generate`

This was the single biggest discovery and cost an hour of debugging.

- **`refinery check`** = partial model consistency. Checks if the *partial* specification has internal contradictions. Returns "Model is consistent" even when error predicates exist, because the partial model is consistent — it just has no valid *concretization*.
- **`refinery check -k`** = concretizability check. Attempts to find a concrete model. **This is the operation that detects governance conflicts.** Returns "Inconsistencies found" with the specific error predicate that fired (e.g., `governance_conflict::governance_conflict(cred_3, fmt_3): error.`). Exit code 1 on failure.
- **`refinery generate`** = full DSE. Also detects UNSAT but as an exception (`UnsatisfiableProblemException`). Exit code 1 on failure.

**Implication for experiments:**
- E1 uses `check -k` (not plain `check`) to measure concretizability checking including error predicate enforcement.
- E2 uses `generate` to measure full model generation.
- The paper should be precise: we measure "concretizability checking" not just "consistency checking."

### 2. Hyperfine on Windows + Git Bash

- Hyperfine v1.19.0 (pre-built binary) works. v1.20.0 requires rustc 1.88+ which isn't available yet. Cargo install fails due to linker conflict (Git Bash `link` shadows MSVC `link.exe`). **Solution:** Download pre-built binary from GitHub releases.
- Hyperfine on Windows defaults to `cmd.exe` as shell. Docker commands with `MSYS_NO_PATHCONV=1` prefix fail because that's bash syntax. **Solution:** Pass `--shell bash` to Hyperfine.
- `MSYS_NO_PATHCONV=1` must be exported as an environment variable before calling Hyperfine, not inlined in the command string. The `run_measurements.sh` script handles this by being a bash script (inherits the export), but **the `refinery_cmd()` function still inlines `MSYS_NO_PATHCONV=1`** — this works because Hyperfine with `--shell bash` runs each command in a bash subshell where the inline syntax is valid.
- **Alternative approach that also works:** `export MSYS_NO_PATHCONV=1` at script top and remove it from individual commands.

### 3. Hyperfine exit code handling

- UNSAT variants cause `check -k` to exit with code 1.
- Hyperfine treats non-zero exit codes as benchmark failure and aborts.
- **Solution for UNSAT benchmarks:** Append `|| true` to the command via the `allow_fail` parameter in `refinery_cmd()`. Alternatively, use Hyperfine's `-i` / `--ignore-failure` flag. The `|| true` approach is used in the current script because it's more explicit about which benchmarks expect failure.

### 4. Docker overhead dominates small instances

- A single `check -k` on the S3 instance (29 nodes) takes ~7 seconds wall-clock.
- This is almost entirely Docker container startup + JVM cold-start. Solver time is negligible at this scale.
- **Implication:** Absolute times are not meaningful for small instances. The scaling *shape* (how time grows with N) is what matters. Report Docker/JVM overhead honestly in the paper.
- **Possible improvement (not implemented):** Run measurements inside a persistent Docker container with a loop, avoiding per-invocation startup. Would isolate solver time but adds complexity and changes how Hyperfine is used.

### 5. Instance generation verified

- `generate_instances.py` produces files structurally equivalent to the canonical `csok.problem` + `csok_instance.refinery`.
- S3-UNSAT correctly triggers `governance_conflict(cred_3, fmt_3)` — matches the canonical `governance_conflict(IncomeCred, income_format)`.
- S3-SAT correctly returns "Model is consistent."
- Import resolution works: metamodel files are copied to `instances/` alongside generated problems.

## Loose ends

### Must-do before running

1. ~~**`--shell bash` not yet in `run_measurements.sh`**.~~ **FIXED.** Added `SHELL_FLAG="--shell bash"` and `export MSYS_NO_PATHCONV=1` to all Hyperfine invocations.

2. **Validation pass not yet run on all 22 instances.** Only S3-SAT and S3-UNSAT were validated manually. Run `./run_measurements.sh validate` before the full campaign to catch any generation bugs at larger scale points.

3. **analyze_results.py untested.** No result JSON files exist yet. After the first measurement run, test with `python analyze_results.py` and inspect the figures.

### Nice-to-have

4. **`run_measurements.py` (Python alternative) not written.** The plan mentioned a Python wrapper for Windows compatibility. The bash script works in Git Bash, so this is not blocking, but would be cleaner for artifact reviewers on other platforms.

5. **Sensitivity instances G0–G6 expected-outcome detection in validation.** The validation pass uses filename patterns (`*_unsat*`, `*G7*`) to infer expected outcome. Sensitivity files like `sensitivity_G4.problem` are named without `_sat`/`_unsat` suffix. The validation logic correctly falls through to "SAT" as default for non-G7 configs, but this is fragile. Consider adding an expected-outcome comment in each generated file header.

6. **Extended scale points.** If all measurements complete in under 10 seconds (plausible given Docker overhead dominance), consider extending to N=50 or N=100 to see actual solver-time scaling. The generator supports arbitrary N.

7. **Memory measurement.** Hyperfine measures wall-clock time only. Docker `--memory` limits and `docker stats` could capture memory usage, but this requires a different harness. Not planned for this campaign.

## Verified commands (copy-paste ready)

```bash
# Generate all instances
python models/evaluation/generate_instances.py

# Test single instance (SAT)
MSYS_NO_PATHCONV=1 docker run --rm \
  -v "c:/ObsidianVaults/BME/Research/Submisions/MODELS26/models/evaluation/instances:/work" \
  -w /work ghcr.io/graphs4value/refinery-cli:latest \
  check -k /work/scale_3_sat.problem

# Test single instance (UNSAT — expect exit 1 + error message)
MSYS_NO_PATHCONV=1 docker run --rm \
  -v "c:/ObsidianVaults/BME/Research/Submisions/MODELS26/models/evaluation/instances:/work" \
  -w /work ghcr.io/graphs4value/refinery-cli:latest \
  check -k /work/scale_3_unsat.problem

# Single Hyperfine benchmark (SAT, 2 runs for quick test)
export MSYS_NO_PATHCONV=1
export PATH="$HOME/bin:$PATH"
INST_DIR="c:/ObsidianVaults/BME/Research/Submisions/MODELS26/models/evaluation/instances"
hyperfine --shell bash --runs 2 --warmup 1 \
  --export-json results/test.json \
  "docker run --rm -v '$INST_DIR:/work' -w /work \
   ghcr.io/graphs4value/refinery-cli:latest check -k /work/scale_3_sat.problem"

# Single Hyperfine benchmark (UNSAT, needs -i for non-zero exit)
hyperfine --shell bash --runs 2 --warmup 1 -i \
  --export-json results/test_unsat.json \
  "docker run --rm -v '$INST_DIR:/work' -w /work \
   ghcr.io/graphs4value/refinery-cli:latest check -k /work/scale_3_unsat.problem"
```
