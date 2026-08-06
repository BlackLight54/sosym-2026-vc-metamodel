# Task runner for the supplementary-material repository.
# Recipes wrap the commands documented in README.md and evaluation/README.md.
# Scripts are invoked via `bash` (exec bits are not preserved by every sync).

refinery := "ghcr.io/graphs4value/refinery-cli:latest"

# List available recipes
default:
    @just --list

# Launch the Refinery web editor (http://localhost:8888)
editor:
    bash run_editor.sh

# Concretizability-check one .problem file (enforces error predicates)
check file:
    docker run --rm -v "$PWD":/work -w /work {{refinery}} check -k /work/{{file}}

# Canonical CSOK example under full governance (expected: UNSAT)
csok: (check "csok.problem")

# Ablations: each drops one governance framework (expected: all SAT)
ablations: (check "csok_no_eidas.problem") (check "csok_no_gdpr.problem") (check "csok_no_conflict.problem")

# Regenerate scaled/sensitivity/diverse instances into evaluation/instances/
instances:
    cd evaluation && python generate_instances.py

# Tier 1: smoke test — toolchain, headline conflict, one probe pair, generation (<30s)
smoke:
    bash run_tests.sh smoke

# Tier 2: validate declared SAT/UNSAT expectations for every instance (no timing)
validate:
    bash run_tests.sh validate

# Tier 3 (quick): reduced timing sweep + wall-clock ceiling gate (~5 min)
perf:
    bash run_tests.sh perf quick

# Tier 3 (full): archival campaign + ceiling gate (~1 hour)
perf-full:
    bash run_tests.sh perf full

# Full measurement campaign (E0+EC+E1+E2+E3+ED, ~1 hour)
measure:
    bash run_measurements.sh all

# Run one experiment: e0 | ec | e1 | e2 | e3 | ed
measure-one exp:
    bash run_measurements.sh {{exp}}

# Figures and tables from results (evaluation/figures/)
figures:
    cd evaluation && python analyze_results.py

# Baseline-corrected paper figure (evaluation/figures/fig_scalability.pdf)
paper-figure:
    cd evaluation && python generate_paper_figure.py
