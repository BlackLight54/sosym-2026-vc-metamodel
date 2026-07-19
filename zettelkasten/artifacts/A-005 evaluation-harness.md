---
id: A-005
title: Evaluation harness (models/evaluation/)
type: artifact
maturity: permanent
tags: [topic/evaluation, kind/method, prov/self]
sources: ["models/evaluation/README.md", "models/evaluation/generate_instances.py", "models/evaluation/analyze_results.py", "models/run_measurements.sh", "models/evaluation/config.yaml"]
related: ["[[C-030 scalability-measurement]]", "[[K-004 automated-consistency-checking]]", "[[C-020 three-usage-modes]]", "[[A-001 vc-metamodel-refinery]]", "[[Q-007 scalability-deeper-hierarchies]]", "[[D-021 q007-structurally-diverse-instances]]", "[[A-004 constraint-sensitivity-variants]]"]
created: 2026-06-17
---

**Artifact:** the reproducible measurement campaign. `generate_instances.py` builds 42 scaled
`.problem` files (22 uniform + 20 structurally diverse); `run_measurements.sh` drives Hyperfine
(`--runs 10 --warmup 1`) over the Refinery CLI Docker image; `analyze_results.py` turns the JSON in
`results/` into figures and LaTeX tables; `config.yaml` holds all parameters.

## What it provides
The six experiments behind the scalability claim: **E0** baseline Docker/JVM overhead; **EC** plain
`check` (consistency) runtime at 7 scale points, SAT and UNSAT; **E1** `check -k` (concretizability)
runtime at the same points (1–30 credentials, 9N+2 nodes); **E2** `generate` runtime; **E3** the
G0–G7 constraint sensitivity (see [[A-004 constraint-sensitivity-variants]]); **ED** structurally
diverse chained instances (depth sweep at fixed N, plus a depth-four N-sweep) answering
[[Q-007 scalability-deeper-hierarchies]]. Reproduces every measured result in the evaluation.
Evidence for [[K-004 automated-consistency-checking]] and [[C-030 scalability-measurement]].

## Changes (2026-07-17, T12 + AF02)
`generate_instances.py` no longer copies `vc_metamodel.refinery` into `instances/`: the harness mounts
`models/` as `/work`, so instances resolve the single canonical metamodel at the repository root
([[A-001 vc-metamodel-refinery]]). It gained `generate_chain_instance()` for the diverse family.
`run_measurements.sh` gained `run_ec` and `run_ed`, a corrected `refinery_cmd` mode mapping (it
previously rewrote `check` to `check -k`, making plain consistency unmeasurable), and OS detection so
the campaign runs on Linux as well as Git Bash. `analyze_results.py` gained `generate_diverse_summary`
and `plot_diverse_comparison`. See [[D-021 q007-structurally-diverse-instances]] for the ruling and
outcome. The reference campaign was re-run on WSL2 rather than native Windows; same CPU and same
Refinery image digest, but ~30% higher and noisier than the prior Docker Desktop run.

## Links
- [[C-030 scalability-measurement]] — the result this produces.
- [[K-004 automated-consistency-checking]] — the claim it supports.
- [[C-020 three-usage-modes]] — check / generate operations benchmarked.

## Source
`models/evaluation/` (scripts, config, instances, results); `models/run_measurements.sh`.
