---
section: Evaluation
budget: "≥2.0 pages (target 2.5)"
goal: "Two-part evaluation (elaboration + measurement) + threats to validity."
dependencies: ["04_approach"]
---

# Evaluation

\label{sec:evaluation}

We evaluate the metamodel and its cross-layer constraint formalization along two complementary axes. A qualitative *elaboration* (\autoref{sec:elaboration}) characterizes metamodel coverage against the W3C +VCDM 2.0 specification, constraint expressiveness against EU regulatory sources, two headline results (a governance conflict and a format expressiveness gap) demonstrating cross-layer constraint value, a catalog of structural anti-patterns, and a baseline comparison against single-layer alternatives. A quantitative *scalability measurement* (\autoref{sec:scalability}) benchmarks three Refinery solver operations across ecosystem sizes up to 30 credentials. Supplementary material provides the eIDAS constraint analysis, format capability comparison, and predicate definitions referenced below.

## Elaboration

\label{sec:elaboration}

### Metamodel Coverage

\label{sec:coverage}

We characterize the metamodel's coverage of W3C +VCDM 2.0 concepts [@sporny_verifiable_2025] as a soundness–completeness pair. For soundness, every metaclass and capability predicate traces to a +VCDM concept: +DCL metaclasses formalize the claim-level information structure, +CSL metaclasses the credential packaging model, and +FSL format classes with six capability predicates the format properties relevant to governance constraint evaluation. For completeness, the metamodel deliberately excludes three +VCDM concept families outside credential *schema design*: proof mechanisms (cryptographic, orthogonal to structural modeling), verifiable presentations (runtime protocols), and credential status (lifecycle management). These are scope boundaries of the design-time formalization, not limitations of the graph predicate approach. These three families govern how a credential with a given structure is used (signed, presented, revoked), not how that structure is designed. Governance constraints from independent sources (eIDAS, +GDPR, W3C) bear on structure and format assignment; formalizing these at design time is what makes cross-source conflicts detectable.

### Constraint Expressiveness

\label{sec:expressiveness}

We collected eight normative constraints from the eIDAS +ARF v2.7.3 [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026] governing credential format assignment, and classified each as *fully expressible*, *partially expressible*, or *not expressible*. Three are fully expressible, each mapping directly to metamodel predicates: ARF-C1 (PID dual-format issuance, PID\_02) maps to `EidasMandate` annotation and format class membership; ARF-C4 (proximity presentation requires mdoc, ARB\_02) maps to `supports_offline_verification` with a propagation rule eliminating SD-JWT-VC; ARF-C7 (encoding-independent attribute definition, ARB\_06) maps to the DCL$\to$CSL$\to$FSL layer architecture. Five are partially expressible and none falls entirely outside the metamodel's capacity.
The five partially expressible constraints share two root causes. Three constraints (ARF-C2, C3: qualified vs. non-qualified attestation format restrictions; ARF-C6: +VCDM completeness as a meta-level property) condition format eligibility on the credential qualification level (PID, QEAA, or non-qualified EAA in eIDAS terminology), but the metamodel does not yet distinguish these attestation subtypes. Two constraints (ARF-C5: per-claim selective disclosability; ARF-C8: salted-hash vs. [+ZKP]{.short}-based selective disclosure) require privacy annotations at claim granularity rather than format level. Both gaps are closable by extending the metaclass hierarchy; neither requires changing the constraint formalization approach. A constraint falls outside the metamodel's capacity only when it governs runtime behavior (revocation timing, holder-binding protocols) with no design-time structural counterpart; none of the eight falls into this category. The significance of ARF-C7 for the metamodel's layered architecture is discussed in \autoref{sec:conclusion}.

### Headline Results

\label{sec:headlines}

#### Headline 1: Income governance conflict (vertical)

At the credential schema layer, IncomeCred is well-formed: $\text{CS\_Applicant}_3$ traces to Applicant, $\text{earns}_1$ traces to the $\text{earns}$ property, $\text{monthly\_income}_1$ traces to its value. All structural constraints (C1–C3) are satisfied.

At the format-specific layer, three governance sources impose requirements on IncomeCred:

1. **eIDAS ARF** (C5): EU wallet attestations must use SD-JWT-VC or mdoc [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026]; neither supports predicate proofs.
2. **+GDPR Art. 5(1)(c)** (authors' operationalization): the income threshold check requires disclosing only whether $\text{monthly\_income} \geq \text{threshold}$, not the exact value. When a threshold comparison suffices, disclosing the exact value constitutes disproportionate data collection; enforcing this at the credential layer requires predicate proof capability [@gdpr]. This reading assumes minimization must be achieved through technical means at the credential layer rather than through organizational controls; a directly analogous enforcement action supports it.^[The Hungarian data protection authority (NAIH) fined a bank 35M HUF for copying applicants' entire pregnancy booklets when only a 12-week gestation threshold check was required for a subsidized loan, finding the collection grossly disproportionate [@noauthor_naih_2020], precisely the scenario that predicate proofs address at the credential layer.]
3. **W3C VCDM 2.0**: the credential format must conform to the +VCDM data model; AnonCreds v1 does not, as its encoding is designed around the CL signature scheme rather than the +VCDM data model [@sporny_verifiable_2025; @curran2022anoncreds].

No format satisfies all three requirements. SD-JWT-VC satisfies (1) and (3) but not (2). AnonCreds satisfies (2) but not (1) or (3). The configuration is unsatisfiable: constraints C5, C6, and C7 cannot be simultaneously satisfied on IncomeCred. The constraint sensitivity analysis (\autoref{sec:scalability}) confirms this: of eight governance subsets, only the full conjunction yields unsatisfiability; every proper subset admits at least one valid format assignment. The only available workaround, pre-computing boolean threshold claims in SD-JWT-VC, requires changing the domain concept layer's information model (\autoref{sec:cross-layer}), a cross-layer design consequence visible only under multi-layer analysis.

#### Headline 2: Cross-credential predicate gap (horizontal)

The domain constraint $\text{property\_area} \geq \text{min\_area}(\text{num\_children})$ (C4) requires combining values from two credentials issued by independent authorities: $\text{property\_area}$ from PropertyCred (land registry) and $\text{num\_children}$ from FamilyStatusCred (civil registry).

No widely used credential format supports cross-credential arithmetic predicates in zero-knowledge; a detailed format capability analysis accompanies this result.

To verify the floor area constraint, the verifier must see both raw values from two separate credentials, defeating the privacy properties that [+ZKP]{.short}-capable formats promise. The metamodel captures this as `cross_cred_predicate_gap` (C9).

No layer-internal check reveals the gap: the +DCL constraint is well-defined, both credentials are well-formed at the +CSL, and each format is individually valid at the +FSL.

*Complementarity.* The two results are orthogonal. Headline 1 identifies a *vertical* governance conflict: contradictory requirements on a single credential's format from different regulatory sources. Headline 2 identifies a *horizontal* expressiveness gap: an ecosystem-level constraint spanning credentials that exceeds any single format's capabilities. Together, they demonstrate that multi-layer analysis detects both governance conflicts and format expressiveness gaps that no individual layer reveals.

### Anti-Pattern Detection

\label{sec:anti-patterns}

Five structural anti-patterns are encoded as graph predicates over the partial model (\autoref{sec:refinery}). Three require only single-layer inspection: disconnected domain graph (`non_connected`, +DCL error), empty credential (`no_empty_cred`, +CSL error), and orphaned root entity (`root_ent_doesnt_have_cred`, +CSL error). Two require cross-layer analysis: trace misalignment (`prop_t`/`prop_s`, DCL$\leftrightarrow$CSL propagation) and the cross-credential predicate gap (`cross_cred_predicate_gap`, DCL$\leftrightarrow$FSL shadow). This graduated visibility, from intra-layer errors through cross-layer trace inconsistencies to ecosystem-level capability gaps, is the central argument for multi-layer formalization. The catalog is extensible: adding an anti-pattern requires a new graph predicate over the existing metamodel, not structural changes to layers or trace links.

### Baseline Comparison

\label{sec:baseline}

No existing tool implements cross-layer credential ecosystem checking. Single-layer metamodeling (a UML class diagram with OCL constraints per layer) detects intra-layer violations but cannot express cross-layer trace predicates (`prop_t`, `prop_s`) or capability checks (`cross_cred_predicate_gap`). The integrated multi-layer formalization detects all five anti-pattern categories (\autoref{sec:anti-patterns}), including both headline results (\autoref{sec:headlines}) that single-layer approaches cannot express. We are not aware of an alternative multi-layer credential ecosystem formalization in the literature.

## Scalability Measurement

\label{sec:scalability}

We evaluate three Refinery solver operations (\autoref{sec:refinery}). *Consistency checking* (`check`) verifies no internal contradictions. *Concretizability checking* (`check -k`) determines whether a concrete model satisfying all constraints exists, the operation that detects governance conflicts. *Model generation* (`generate`) produces a fully resolved model instance for +DSE. **RQ1:** How does conflict detection scale with model size? **RQ2:** How does model generation scale?

We construct synthetic instances from $N{=}1$ to $N{=}30$ credentials, with 11 to 272 graph nodes (\autoref{tab:scalability}). Each scale point has a satisfiable (SAT) and unsatisfiable (UNSAT) variant. A secondary *constraint sensitivity* experiment fixes $N{=}3$ and varies governance framework combinations over $\mathcal{P}(\{\text{eIDAS}, \text{Privacy}, \text{VCDM}\})$, yielding eight configurations (G0–G7).

All instances are evaluated using the Refinery CLI,^[Container image `ghcr.io/graphs4value/refinery-cli`, pulled via Docker.] where each invocation starts a fresh JVM inside a Docker container. We use Hyperfine as the benchmarking harness with 10 measured runs and 1 warmup run per configuration, on an AMD Ryzen 9 7950X3D (16 cores), 96 GB RAM, Windows 11. Cold JVM startup inside the Docker container adds a constant overhead of ${\approx}3.9\text{s}$ per invocation (measured via a no-op baseline instance); reported times subtract this overhead to isolate solver computation. At small scales ($N \leq 5$), solver time is below the measurement noise floor (${\approx}0.1\text{s}$). The measurement script, generated instances, and the metamodel source are provided as supplementary material for independent reproduction.

```{=latex}
\begin{table}[htb]
\caption{Scalability measurements, baseline-corrected (3.9s Docker+JVM overhead subtracted). \textit{Concretizability} (\texttt{check -k}): determines whether a concrete model satisfying all constraints exists. \textit{Generation} (\texttt{generate}): produces a concrete model instance. Seconds, mean $\pm\sigma$ over 10 runs.}
\label{tab:scalability}
\small
\begin{tabular}{rrrrr}
\toprule
$N$ & $|V|$ & SAT (s) & UNSAT (s) & Gen.\ (s) \\
\midrule
1  & 11  & ${<}0.1$          & ${<}0.1$           & $0.55 \pm 0.11$ \\
3  & 29  & ${<}0.1$          & $0.18 \pm 0.07$    & $0.56 \pm 0.05$ \\
5  & 47  & $0.13 \pm 0.10$   & $0.11 \pm 0.05$    & $0.69 \pm 0.08$ \\
10 & 92  & $0.14 \pm 0.05$   & $0.22 \pm 0.07$    & $0.77 \pm 0.06$ \\
15 & 137 & $0.42 \pm 0.12$   & $0.40 \pm 0.08$    & $0.94 \pm 0.05$ \\
20 & 182 & $0.51 \pm 0.06$   & $0.58 \pm 0.09$    & $1.23 \pm 0.07$ \\
30 & 272 & $1.09 \pm 0.06$   & $1.19 \pm 0.06$    & $1.85 \pm 0.07$ \\
\bottomrule
\end{tabular}
\end{table}
```

<!-- Runtime figure removed — data already in tab:scalability.
```{=latex}
\begin{figure}[htb]
\centering
\includegraphics[width=\columnwidth]{assets/fig_scalability.pdf}
\caption{Runtime of Refinery solver operations across ecosystem sizes from $N{=}1$ to $N{=}30$ credentials. Concretizability checking detects governance conflicts; model generation produces valid configurations.}
\label{fig:scalability}
\end{figure}
```
-->

**RQ1**: Concretizability checking scales sublinearly, reaching 1.09\,s at $N{=}30$ (272 graph nodes), well within interactive use for ecosystem sizes exceeding current EU wallet specifications. SAT and UNSAT instances exhibit comparable timing, confirming that unsatisfiability detection does not incur significant additional cost. **RQ2**: Model generation reaches 1.85\,s at the same scale, reflecting the additional cost of producing a fully resolved instance.

A constraint sensitivity experiment at $N{=}3$ varies governance framework combinations over $\mathcal{P}(\{\text{eIDAS}, \text{Privacy}, \text{VCDM}\})$: of the eight configurations, only the full conjunction $G_7 = \text{eIDAS} \wedge \text{Privacy} \wedge \text{VCDM}$ yields unsatisfiability; all seven proper subsets are satisfiable (all complete in ${<}0.1\text{s}$). This confirms the Headline 1 finding (\autoref{sec:headlines}): no proper subset produces a conflict.

## Threats to Validity

\label{sec:threats}

The metamodel formalizes design-time credential schemas; proof mechanisms, verifiable presentations, and credential status fall outside this scope (\autoref{sec:coverage}). The +DCL's structural inference rule classifies any Entity with no incoming value reference as a Subject; a modeler who omits a property edge may find the entity silently promoted rather than flagged. The running example (housing subsidy) was selected for structural completeness (it exhibits both headline results within a single domain), but a randomly sampled ecosystem might expose interaction patterns not covered by the current anti-pattern catalog. The eight eIDAS +ARF constraints were extracted from a specific version (v2.7.3); the constraint set may shift as the regulatory framework evolves. The evaluation operates within a single governance context (EU regulations applied to Hungarian administrative procedures); governance traditions that impose constraints not reducible to format-capability requirements would require extending the metamodel beyond annotation markers. Scalability instances grow by adding credentials with uniform structure (one property, shared subject); deeper claim hierarchies or multi-subject credentials may stress different metamodel elements. The partially-expressible classification (\autoref{sec:expressiveness}) rests on our judgment of what constitutes a structural versus runtime property. The formalization depends on Refinery as the sole validation tool; portability to other partial-model solvers has not been assessed.

## Limitations and Future Work

\label{sec:limitations}

The approach has not been evaluated empirically with credential ecosystem designers in practice; whether domain experts without metamodeling experience, such as credential architects or policy officers specifying governance requirements, can use the approach effectively remains an open question.

Four directions follow from the limitations identified above and in \autoref{sec:threats}. First, the format-specific layer should be extended with additional formats and richer capability constraints to match the maturity of the upper layers. Second, the constraint catalog should be broadened beyond EU regulatory sources to include national eIDAS implementations and sector-specific governance. Third, an empirical case study with credential ecosystem designers would evaluate whether the formalization improves design decision-making in practice. Fourth, portability to other constraint-based toolchains (Alloy, USE/OCL) merits consideration to reduce the current single-tool dependency.
