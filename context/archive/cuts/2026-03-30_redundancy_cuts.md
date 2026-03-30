# Redundancy Cuts — 2026-03-30

Cut text from evaluation and approach sections during page budget recovery. All ideas preserved elsewhere in the paper.

## Cut 1 — Evaluation opening over-preview (05_evaluation.md, was line 10)

```
A qualitative *elaboration* (\autoref{sec:elaboration}) characterizes metamodel coverage against the W3C +VCDM 2.0 specification, constraint expressiveness against EU regulatory sources, two headline results (a governance conflict and a format expressiveness gap) demonstrating cross-layer constraint value, a catalog of structural anti-patterns, and a baseline comparison against single-layer alternatives. A quantitative *scalability measurement* (\autoref{sec:scalability}) benchmarks three Refinery solver operations across ecosystem sizes up to 30 credentials.
```

**Why cut:** Subsection headings are self-explanatory. Replaced with one-line summary.

## Cut 2 — Coverage double explanation (05_evaluation.md, was line 16)

```
These are scope boundaries of the design-time formalization, not limitations of the graph predicate approach.
```

**Why cut:** The next sentence ("These three families govern how a credential... is used, not how... is designed") says the same thing more informatively.

## Cut 3 — Headline 1 well-formed paragraph (05_evaluation.md, was line 31)

```
At the credential schema layer, IncomeCred is well-formed: its credential subject traces to Applicant, each claim traces to the corresponding domain property, and all structural constraints (C1--C3) are satisfied.
```

**Why cut:** Repeats Section 4.2 running example. Compressed to "IncomeCred passes all structural constraints (C1–C3) at the credential schema layer."

## Cut 4 — Headline 2 closing sentence (05_evaluation.md, was line 68)

```
Together, the two results instantiate the vertical and horizontal dimensions of the anti-pattern catalog (\autoref{sec:anti-patterns}): governance conflicts within a credential and capability gaps across credentials, both undetectable by single-layer inspection.
```

**Why cut:** Repeats the framing paragraph (now line 25) almost verbatim.

## Cut 5 — Constraint taxonomy prose (04_approach.md, was line 113)

```
Constraints C1–C3 are structural (metamodel-enforced). C4 is a domain rule grounded in government regulation. C5–C7 each originate from a different governance framework.
```

**Why cut:** Verbatim restatement of the table caption on the preceding line.

## Cut 6 — common_parent definition (04_approach.md, was lines 145–146)

```
common_parent — shadow predicate
:   Holds when two properties' traced claims share a source. Captures co-location within a single credential.
```

**Why cut:** Never used in headline results or evaluation body. Mentioned by name with supplementary material pointer.

## Cut 7 — Threats first sentence (05_evaluation.md, was line 129)

```
The metamodel formalizes design-time credential schemas; proof mechanisms, verifiable presentations, and credential status fall outside this scope (\autoref{sec:coverage}).
```

**Why cut:** Verbatim restatement of coverage subsection. Replaced with cross-reference.

## Cut 8 — Scalability benchmark setup details (05_evaluation.md, was line 87)

```
where each invocation starts a fresh JVM inside a Docker container. We use Hyperfine as the benchmarking harness with 10 measured runs and 1 warmup run per configuration, on an AMD Ryzen 9 7950X3D (16 cores), 96 GB RAM, Windows 11. [...] The measurement script, generated instances, and the metamodel source are provided as supplementary material for independent reproduction.
```

**Why cut:** Hardware specs and harness details moved to supplementary material. Main text retains: 10 runs, 3.9s overhead, noise floor, supplementary material pointer.
