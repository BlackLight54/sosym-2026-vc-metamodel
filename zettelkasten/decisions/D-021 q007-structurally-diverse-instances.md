---
id: D-021
title: Q-007 structurally diverse scalability instances enter journal scope
type: decision
maturity: permanent
tags: [topic/evaluation, topic/refinery, kind/method, prov/self]
sources: ["context/spin_2026-07-06.md §4 and §11 Decision C", "Martin ruling 2026-07-13"]
related: ["[[Q-007 scalability-deeper-hierarchies]]", "[[K-004 automated-consistency-checking]]", "[[M-011 claim-delivery-matrix]]"]
created: 2026-07-13
---

Q-007 (structurally diverse scalability instances: deeper claim hierarchies, multi-subject
credentials) **enters the journal scope** (spin §4 Tier 2 selections). The spin default
excluded it as accepted risk R9; the ruling reverses the default and closes R9.

## Rationale
K-004's own M-011 row names richer instances as its journal-level open item; the current
interactive-time claim (sublinear to N=30) rests on uniform instances only. Journal review
depth sharpens objection O3 (synthetic evaluation); diverse instances give the O3 rebuttal an
empirical leg instead of a purely argumentative one. The cost is an instance generator,
engineering work rather than research risk.

## Commits the paper to
A richer instance generator over `models/` and a re-run of the scalability measurement
(C-030 extension); K-004's M-011 Open cell moves from "open" to "scheduled"; spin §4 lists
Q-007 in scope and §8 drops R9; the scalability claim wording follows the new measurements,
narrowing if diverse instances degrade solver performance.

## Resolution (2026-07-17, AF02 + T12)
Delivered. The generator (`models/evaluation/generate_instances.py`) gained a
`generate_chain_instance` function that realizes both phenomena as *chained*
credentials (a credential can describe the value of a parent credential): chain
depth gives deeper claim hierarchies, and each chain level is a distinct subject.
A depth sweep (depth 1–12 at fixed N=12) and a depth-four N-sweep (N=1–30, SAT and
UNSAT) were added as experiment ED and re-run with the rest of the campaign. Outcome:
structural diversity does **not** degrade solver performance — concretizability time
is flat across depth and at or below the uniform figures across N (1.27 s vs 1.48 s
at N=30). Per the M-013 discipline the claim wording *broadened* rather than
narrowed: §5.2 now states the interactive-time result holds beyond uniform
instances. K-004's M-011 Open cell is closed; spin R9 stays closed. The
measurement environment shifted from native Windows to WSL2 on the same CPU (T12
mandated one coherent re-run); figures are absolute-comparable (same refinery image
digest) but run ~30% higher and noisier than the prior Docker-Desktop run.

## Links
- [[Q-007 scalability-deeper-hierarchies]] defines the instance classes.
- [[K-004 automated-consistency-checking]] is the claim this protects at journal depth.

## Source
Spin §11 Decision C, ruled opposite to the default per the spin's own recommendation, by
Martin (2026-07-13 session).
