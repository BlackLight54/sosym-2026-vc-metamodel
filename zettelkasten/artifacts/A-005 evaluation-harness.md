---
id: A-005
title: Evaluation harness (models/evaluation/)
type: artifact
maturity: permanent
tags: [topic/evaluation, kind/method, prov/self]
sources: ["models/evaluation/README.md", "models/evaluation/generate_instances.py", "models/evaluation/analyze_results.py", "models/run_measurements.sh", "models/evaluation/config.yaml"]
related: ["[[C-030 scalability-measurement]]", "[[K-004 automated-consistency-checking]]", "[[C-020 three-usage-modes]]", "[[A-001 vc-metamodel-refinery]]"]
created: 2026-06-17
---

**Artifact:** the reproducible measurement campaign. `generate_instances.py` builds 22 scaled
`.problem` files; `run_measurements.sh` drives Hyperfine (`--runs 10 --warmup 1`) over the Refinery CLI
Docker image; `analyze_results.py` turns the JSON in `results/` into figures and LaTeX tables;
`config.yaml` holds all parameters.

## What it provides
The four experiments behind the scalability claim: **E0** baseline Docker/JVM overhead; **E1**
`check -k` (concretizability) runtime at 7 scale points (1–30 credentials, 9N+2 nodes); **E2**
`generate` runtime; **E3** the G0–G7 constraint sensitivity (see [[A-004 constraint-sensitivity-variants]]).
Reproduces every measured result in the evaluation. Evidence for
[[K-004 automated-consistency-checking]] and [[C-030 scalability-measurement]].

## Links
- [[C-030 scalability-measurement]] — the result this produces.
- [[K-004 automated-consistency-checking]] — the claim it supports.
- [[C-020 three-usage-modes]] — check / generate operations benchmarked.

## Source
`models/evaluation/` (scripts, config, instances, results); `models/run_measurements.sh`.
