---
section: Evaluation
budget: "≥2.0 pages (target 2.5)"
goal: "Two-part evaluation (elaboration + measurement) + threats to validity."
dependencies: ["04_approach"]
---

# Evaluation

\label{sec:evaluation}

We evaluate the metamodel and its cross-layer constraint formalization along two complementary axes. A qualitative *elaboration* (\autoref{sec:elaboration}) characterizes metamodel coverage against the W3C VCDM 2.0 specification, constraint expressiveness against EU regulatory sources, two headline results — a governance conflict and a format expressiveness gap — demonstrating cross-layer constraint value, a catalog of structural anti-patterns, and a baseline comparison against single-layer alternatives. A quantitative *scalability measurement* (\autoref{sec:scalability}) benchmarks three Refinery solver operations across ecosystem sizes up to 30 credentials.

## Elaboration

\label{sec:elaboration}

### Metamodel Coverage

\label{sec:coverage}

We characterize the metamodel's coverage of W3C VCDM 2.0 concepts [@sporny_verifiable_2025] as a soundness–completeness pair. For soundness, every metaclass and capability predicate traces to a VCDM concept: DCL metaclasses formalize the claim-level information structure, CSL metaclasses the credential packaging model, and FSL format classes with six capability predicates the format properties relevant to governance constraint evaluation. For completeness, the metamodel deliberately excludes three VCDM concept families outside credential *schema design*: proof mechanisms (cryptographic, orthogonal to structural modeling), verifiable presentations (runtime protocols), and credential status (lifecycle management). These are scope boundaries of the design-time formalization, not limitations of the graph predicate approach. These three families govern how a credential with a given structure is used (signed, presented, revoked), not how that structure is designed. Governance constraints from independent sources (eIDAS, GDPR, W3C) bear on structure and format assignment; formalizing these at design time is what makes cross-source conflicts detectable.

```{=latex}
\begin{figure}
\centering
\fbox{\parbox{0.85\columnwidth}{\centering\vspace{1.5cm}\small Coverage mapping: VCDM 2.0 concept $\to$ metamodel element $\to$ layer. In-scope / out-of-scope marks.\vspace{1.5cm}}}
\caption{Metamodel coverage of W3C VCDM 2.0 concepts. Each concept maps to a metamodel element at a specific layer; three concept families (proof mechanisms, presentations, credential status) are explicitly out of scope.}
\label{fig:coverage_table}
\end{figure}
```

### Constraint Expressiveness

\label{sec:expressiveness}

We collected eight normative constraints from the eIDAS Architecture Reference Framework (ARF) v2.7.3 [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026] governing credential format assignment, and classified each as *fully expressible*, *partially expressible*, or *not expressible*. Three are fully expressible (\autoref{tab:expressiveness}), five partially, and none falls entirely outside the metamodel's capacity. The full constraint analysis is provided in the supplementary material.

Table: Fully expressible eIDAS ARF constraints. Each maps directly to metamodel predicates or architecture. \label{tab:expressiveness}

| ID | Constraint | Source | Predicate / Mechanism |
|----|-----------|--------|----------------------|
| ARF-C1 | PID must be issued in both ISO 18013-5 and SD-JWT-VC | PID\_02 | `EidasMandate` annotation + format class membership |
| ARF-C4 | Proximity presentation requires mdoc format | ARB\_02 | `supports_offline_verification`; propagation rule eliminates SD-JWT-VC |
| ARF-C7 | Attributes defined encoding-independently, then per-format | ARB\_06 | DCL$\to$CSL$\to$FSL layer architecture |

```{=latex}
\begin{figure}
\centering
\fbox{\parbox{0.85\columnwidth}{\centering\vspace{1.5cm}\small Extended constraint expressiveness table: all 8 eIDAS ARF constraints with expressibility classification and predicate mappings.\vspace{1.5cm}}}
\caption{Constraint expressiveness classification for eight eIDAS ARF constraints. Three are fully expressible, five partially expressible, none falls outside the metamodel's capacity.}
\label{fig:expressiveness_table}
\end{figure}
```

The five partially expressible constraints share two root causes: the metamodel lacks a credential qualification subtype hierarchy (three constraints condition format eligibility on credential type), and its privacy predicates operate at format level rather than per-claim (two constraints require finer annotation). Both gaps are closable by extending the metaclass hierarchy; neither requires changing the constraint formalization approach. We call a constraint partially expressible when the metamodel captures its intent but lacks the metaclasses to encode it fully. For instance, three ARF constraints condition format eligibility on the type of electronic attestation (PID, QEAA, or non-qualified EAA in eIDAS terminology), but the metamodel does not yet distinguish these attestation types. A constraint falls outside capacity only when it governs runtime behavior (revocation timing, holder-binding protocols) with no design-time structural counterpart. Closing both gaps requires adding metaclasses, not redesigning the constraint formalization.

*Remark.* ARF-C7 provides external validation of the metamodel's layered architecture. The ARF requires that attestation attributes be defined encoding-independently before being specified per-format (ARB\_06 [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026]). The metamodel was designed from the W3C VCDM structure, not from the ARF; that the EU governance framework independently mandates the same DCL$\to$CSL$\to$FSL separation confirms the layering reflects a structural property of credential ecosystem design rather than an artifact of the formalization.

### Headline Results

\label{sec:headlines}

#### Headline 1: Income governance conflict (vertical)

At the credential schema layer, IncomeCred is well-formed: $\text{CS\_Applicant}_3$ traces to Applicant, $\text{earns}_1$ traces to the $\text{earns}$ property, $\text{monthly\_income}_1$ traces to its value. All structural constraints (C1–C3) are satisfied.

At the format-specific layer, three governance sources impose requirements on IncomeCred:

1. **eIDAS ARF** (normative, SHALL): $\text{format}(\text{IncomeCred}) \in \{\text{SD-JWT-VC}, \text{mdoc}\}$ — neither supports predicate proofs [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026].
2. **GDPR Art. 5(1)(c)** (authors' operationalization): the income threshold check requires disclosing only whether $\text{monthly\_income} \geq \text{threshold}$, not the exact value. We interpret the data minimization principle as requiring that, when a threshold comparison suffices, disclosing the exact value constitutes disproportionate data collection — and that enforcing this at the credential layer requires predicate proof capability [@gdpr]. Neither inferential step is self-evident: the first is a reading of data minimization for threshold-check scenarios; the second assumes minimization must be achieved through technical means at the credential layer rather than through organizational or procedural controls. A directly analogous enforcement action illustrates the operational weight of this principle: the Hungarian data protection authority (NAIH) fined a bank 35M HUF for copying applicants' entire pregnancy booklets when only a 12-week gestation threshold check was required for a subsidized loan. NAIH found the collection grossly disproportionate [@noauthor_naih_2020], establishing that collecting exact values when a threshold check suffices violates data minimization — precisely the scenario that predicate proofs address at the credential layer.
3. **W3C VCDM 2.0**: the credential format must conform to the VCDM data model — AnonCreds v1 does not, as its encoding is designed around the CL signature scheme rather than VCDM's data model [@sporny_verifiable_2025] [@curran2022anoncreds].

No format satisfies all three requirements. SD-JWT-VC satisfies (1) and (3) but not (2). AnonCreds satisfies (2) but not (1) or (3). The configuration is unsatisfiable: constraints C5, C6, and C7 cannot be simultaneously satisfied on IncomeCred.

This contradiction is invisible to single-layer inspection. At the credential schema layer alone, IncomeCred is well-formed. At the format-specific layer under the eIDAS ARF alone, SD-JWT-VC is compliant. At the format-specific layer under GDPR alone, AnonCreds provides the needed capability. Only the joint, cross-governance, cross-layer analysis reveals the conflict.

::: {.todo}
After Refinery formalization (Pass 2) — show the error predicates firing and the model generator producing no valid instance.
:::

*Remark.* An issuer-precomputed boolean claim ($\text{income\_above\_threshold}: \text{true}$) can approximate a predicate proof within SD-JWT-VC. However, this workaround requires the issuer to anticipate every verifier threshold at issuance time, produces combinatorial explosion for multi-threshold scenarios, and remains static — a credential issued with threshold $X$ cannot serve a verifier requiring threshold $Y$ without reissuance. As shown in \autoref{sec:cross-layer}, this workaround restructures the domain concept layer — itself a cross-layer propagation that confirms the need for multi-layer analysis.

#### Headline 2: Cross-credential predicate gap (horizontal)

The domain constraint $\text{property\_area} \geq \text{min\_area}(\text{num\_children})$ (C4) requires combining values from two credentials issued by independent authorities: $\text{property\_area}$ from PropertyCred (land registry) and $\text{num\_children}$ from FamilyStatusCred (civil registry).

No credential format with a stable specification and production-ready implementations supports cross-credential arithmetic predicates in zero-knowledge. Among the five such formats (SD-JWT-VC, JSON-LD with BBS+, JWT-VC, mdoc, AnonCreds v1), only AnonCreds v1 offers any predicate support — single-credential range proofs ($\text{attr} \geq \text{const}$) under CL signatures — but even it cannot combine values across credentials issued by independent authorities. ZK-SNARK-based research prototypes such as zk-creds [@rosenberg_zk-creds_2023] demonstrate cross-credential predicates but lack EU wallet ecosystem adoption and W3C VCDM conformance. AnonCreds v2 plans BBS+ signature support with range proof capabilities, but no stable specification is available for independent verification.

To verify the floor area constraint, the verifier must see both raw values from two separate credentials, defeating the privacy properties that ZKP-capable formats promise. The metamodel captures this: a domain-concept-layer constraint (C4) that spans credentials cannot be enforced privacy-preservingly at the format-specific layer because no deployed format supports cross-credential predicate proofs (C9).

This gap is again invisible to single-layer inspection: the domain concept layer constraint is well-defined, both credentials are well-formed at the credential schema layer, and each credential's format is individually valid at the format-specific layer. Only the cross-layer analysis — checking whether the DCL constraint can be enforced given the FSL format capabilities — reveals the expressiveness gap.

*Complementarity.* The two results are orthogonal. Headline 1 identifies a *vertical* governance conflict: contradictory requirements on a single credential's format from different regulatory sources. Headline 2 identifies a *horizontal* expressiveness gap: an ecosystem-level constraint spanning credentials that exceeds any single format's capabilities. Together, they demonstrate that multi-layer analysis detects both governance conflicts and format expressiveness gaps invisible to single-layer inspection.

### Anti-Pattern Detection

\label{sec:anti-patterns}

\autoref{tab:antipatterns} catalogues five structural anti-patterns formalized as graph predicates over the partial model.

| Anti-pattern | Description | Graph predicate | Layer(s) | Kind |
|---|---|---|---|---|
| Disconnected domain graph | Entity pair not transitively reachable | `non_connected` | DCL | error |
| Empty credential | `CredentialSubject` with no outgoing `Claim` | `no_empty_cred` | CSL | error |
| Orphaned root entity | Root `CredEntity` without associated `Credential` | `root_ent_doesnt_have_cred` | CSL | error |
| Trace misalignment | `Claim` target traces to wrong DCL `Entity` | `prop_t` / `prop_s` | DCL$\leftrightarrow$CSL | propagation |
| Cross-credential predicate gap | Aligned credential pair lacks cross-credential proof support | `cross_cred_predicate_gap` | DCL$\leftrightarrow$FSL | shadow |

\label{tab:antipatterns}

```{=latex}
\begin{figure}
\centering
\fbox{\parbox{0.85\columnwidth}{\centering\vspace{1.5cm}\small Anti-pattern catalog: name $\times$ description $\times$ graph predicate $\times$ layer(s) $\times$ kind (error / propagation / shadow).\vspace{1.5cm}}}
\caption{Five structural anti-patterns formalized as graph predicates, spanning intra-layer errors, cross-layer trace inconsistencies, and ecosystem-level capability gaps.}
\label{fig:antipattern_table}
\end{figure}
```

The first three anti-patterns are detectable by single-layer inspection: `non_connected` operates within the DCL, `no_empty_cred` and `root_ent_doesnt_have_cred` within the CSL. Trace misalignment requires cross-layer analysis. Each layer is individually well-formed, but the propagation rules `prop_t` and `prop_s` eliminate any binding where a `Claim`'s target `CredEntity` traces to a different DCL `Entity` than the `Prop` it was derived from. The cross-credential predicate gap is invisible at any single layer: the domain constraint is well-defined at the DCL, both credentials are structurally valid at the CSL, and each format is individually compliant at the FSL. Only the cross-layer shadow predicate, which checks `aligned` credential subjects against their formats' `supports_multi_credential_proof` capability, surfaces the gap. This graduated visibility, from intra-layer errors through cross-layer trace inconsistencies to ecosystem-level capability gaps, is the central argument for multi-layer formalization over single-layer alternatives. The catalog is extensible: adding an anti-pattern requires a new graph predicate over the existing metamodel, not structural changes to layers or trace links.

### Baseline Comparison

\label{sec:baseline}

The multi-layer advantage for cross-layer detection is partly definitional. The comparison's purpose is to identify which issue classes fall into this detection gap and to confirm that current practice cannot cover them. We compare analytically against three baselines of increasing formality; no existing tool implements cross-layer credential ecosystem checking, so the comparison is structural rather than empirical. Manual expert review, the current industry practice for credential ecosystem design, can identify single-credential format conflicts but lacks systematic coverage of cross-credential dependencies and provides no guarantee that all governance sources have been jointly checked. Formalization adds systematicity: the model checks all constraint combinations exhaustively (the G0–G7 sensitivity experiment confirms only the full conjunction produces unsatisfiability), scales beyond what manual analysis can track, and yields a reproducible artifact. Single-layer metamodeling (e.g., a UML class diagram with OCL constraints per layer) detects intra-layer structural violations such as empty credentials or disconnected domain graphs, but cannot express the cross-layer trace predicates (`prop_t`, `prop_s`) or the cross-layer capability checks (`cross_cred_predicate_gap`) that link domain constraints to format capabilities. Only the integrated multi-layer formalization with cross-layer graph predicates detects all five anti-pattern categories, including the two headline results (\autoref{sec:headlines}) that are invisible to any single-layer approach. No alternative multi-layer credential ecosystem formalization exists in the literature; the three baselines represent the state of practice, not a weakened comparison set.

## Scalability Measurement

\label{sec:scalability}

We evaluate the scalability of the Refinery-based formalization across three solver operations of increasing cost. *Consistency checking* (`check` in Refinery) verifies that the partial model specification has no internal contradictions. *Concretizability checking* (`check -k`) goes further: it determines whether a concrete model satisfying all constraints, including error predicates, exists — this is the operation that detects governance conflicts such as the income format unsatisfiability in \autoref{sec:headlines}. *Model generation* (`generate`) produces a fully resolved model instance, enumerating valid credential ecosystem designs for design space exploration. We measure all three to answer two research questions. **RQ1:** How does conflict detection (concretizability checking) scale with model size? **RQ2:** How does design space exploration (model generation) scale with model size? Consistency checking serves as a baseline: it should scale well but cannot detect cross-layer conflicts, because the partial model is internally consistent even when no valid concretization exists.

We construct synthetic instances from $N{=}1$ to $N{=}30$ credentials. Each credential contributes one `Prop`–`Value` pair at the DCL, one `CredentialSubject`–`Claim`–`CredentialValue`–`Credential` group at the CSL, and one `Formatted_Credential` node at the FSL, yielding a total of 11 to 272 graph nodes (\autoref{tab:scalability}). All credential subjects trace to a shared `Subject`; the last credential's format class is left unresolved for the solver. Each scale point has two variants: a satisfiable (SAT) variant without governance conflicts, and an unsatisfiable (UNSAT) variant that imports the Headline 1 governance conflict predicate, requiring the solver to detect that no format assignment satisfies all three governance frameworks simultaneously. As a secondary *constraint sensitivity* experiment, we fix $N{=}3$ and vary governance framework combinations over the power-set $\mathcal{P}(\{\text{eIDAS}, \text{Privacy}, \text{VCDM}\})$, yielding eight configurations (G0–G7). Instance definitions and Refinery encodings are provided as supplementary material.

All instances are evaluated using the Refinery CLI,^[Container image `ghcr.io/graphs4value/refinery-cli`, pulled via Docker.] where each invocation starts a fresh JVM inside a Docker container. We use Hyperfine as the benchmarking harness with 10 measured runs and 1 warmup run per configuration, on an AMD Ryzen 9 7950X3D (16 cores), 96 GB RAM, Windows 11. Cold JVM startup inside the Docker container adds a constant overhead of ${\approx}3.9\text{s}$ per invocation (measured via a no-op baseline instance); reported times subtract this overhead to isolate solver computation. At small scales ($N \leq 5$), solver time is below the measurement noise floor (${\approx}0.1\text{s}$). The measurement script, generated instances, and the metamodel source are provided as supplementary material for independent reproduction.

```{=latex}
\begin{figure*}
\centering
\fbox{\parbox{0.85\textwidth}{\centering\vspace{2cm}\small Scalability plot: wall-clock time (s) vs.\ model size ($N$ credentials). Lines: consistency check, concretizability-SAT, concretizability-UNSAT, model generation-SAT.\vspace{2cm}}}
\caption{Runtime of three Refinery solver operations across ecosystem sizes from $N{=}1$ to $N{=}30$ credentials. Consistency checking serves as baseline; concretizability checking detects governance conflicts; model generation produces valid configurations.}
\label{fig:scalability}
\end{figure*}
```

Table: Scalability measurements for two Refinery operations, baseline-corrected (3.9s Docker+JVM overhead subtracted). *Concretizability* (`check -k`): determines whether a concrete model satisfying all constraints exists. *Generation* (`generate`): produces a concrete model instance. Seconds, mean $\pm\sigma$ over 10 runs. \label{tab:scalability}

| $N$ | $|V|$ | Concretizability SAT (s) | Concretizability UNSAT (s) | Generation SAT (s) |
|----:|------:|-------------------------:|---------------------------:|-------------------:|
| 1   | 11    | ${<}0.1$                 | ${<}0.1$                   | $0.55 \pm 0.11$   |
| 3   | 29    | ${<}0.1$                 | $0.18 \pm 0.07$            | $0.56 \pm 0.05$   |
| 5   | 47    | $0.13 \pm 0.10$          | $0.11 \pm 0.05$            | $0.69 \pm 0.08$   |
| 10  | 92    | $0.14 \pm 0.05$          | $0.22 \pm 0.07$            | $0.77 \pm 0.06$   |
| 15  | 137   | $0.42 \pm 0.12$          | $0.40 \pm 0.08$            | $0.94 \pm 0.05$   |
| 20  | 182   | $0.51 \pm 0.06$          | $0.58 \pm 0.09$            | $1.23 \pm 0.07$   |
| 30  | 272   | $1.09 \pm 0.06$          | $1.19 \pm 0.06$            | $1.85 \pm 0.07$   |

**RQ1** (conflict detection scaling): Concretizability checking scales sublinearly with model size, rising from below the measurement noise floor at $N{=}1$ to 1.09\,s at $N{=}30$ (SAT). SAT and UNSAT instances exhibit comparable timing at each scale point, with differences within measurement noise ($\sigma$); at the largest scale ($N{=}30$), the UNSAT overhead is 0.10\,s, confirming that unsatisfiability detection does not incur significant additional cost. At $N{=}30$ (272 graph nodes), conflict detection completes in under 1.2\,s — well within interactive use for credential ecosystem sizes an order of magnitude beyond current EU wallet specifications. **RQ2** (design space exploration scaling): Model generation follows the same growth trend, rising from 0.55\,s to 1.85\,s. The higher baseline reflects the cost of producing a fully resolved model instance rather than merely determining satisfiability.

Table: Constraint sensitivity at $N{=}3$: governance framework power-set. Result column reports concretizability (`check -k`). All configurations complete in under 0.1s of solver time (below the measurement noise floor at this scale). \label{tab:sensitivity}

| Config | eIDAS | Privacy | VCDM | Result |
|--------|:-----:|:-------:|:----:|--------|
| G0     |       |         |      | SAT    |
| G1     | x     |         |      | SAT    |
| G2     |       | x       |      | SAT    |
| G3     |       |         | x    | SAT    |
| G4     | x     | x       |      | SAT    |
| G5     | x     |         | x    | SAT    |
| G6     |       | x       | x    | SAT    |
| G7     | x     | x       | x    | UNSAT  |

The constraint sensitivity experiment confirms that only G7, the conjunction of all three governance frameworks, yields unsatisfiability; all seven proper subsets are satisfiable (\autoref{tab:sensitivity}). This validates the Headline 1 finding (\autoref{sec:headlines}): the income governance conflict requires the simultaneous imposition of eIDAS ARF format mandates [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026], GDPR data minimization requirements [@gdpr], and W3C VCDM conformance [@sporny_verifiable_2025]. No proper subset of these three sources produces a conflict. The measurements cover $N$ up to 30 credentials (272 graph nodes); for reference, the EU Digital Identity Wallet Architecture Reference Framework defines fewer than 10 attestation types in its current version [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026], though future ecosystem growth may increase this number. The contribution is the metamodel and its cross-layer constraint formalization; Refinery serves as the validation vehicle, and absolute performance numbers are tool-specific.

## Threats to Validity

\label{sec:threats}

#### Construct validity

The metamodel formalizes credential *schema design*, not the full credential lifecycle. Three VCDM 2.0 concept families fall outside this scope: proof mechanisms (cryptographic layer, orthogonal to structural modeling), verifiable presentations (runtime holder-verifier protocols), and credential status (issuance and revocation lifecycle). These boundaries constrain the class of expressible governance requirements to those that condition format assignment on structural or capability properties of credentials. Within this scope, five of eight eIDAS ARF constraints are classified as partially expressible (\autoref{sec:expressiveness}). The two root causes are a missing attestation-type subclass hierarchy (three constraints condition format eligibility on credential qualification level) and per-claim rather than per-format privacy annotation (two constraints require claim-level selective disclosure control). Both gaps are closable by metaclass extension without changing the constraint formalization approach, but the partially-expressible classification itself rests on our judgment of what constitutes a structural versus a runtime property. Additionally, the DCL's structural inference rule classifies any Entity with no incoming value reference as a Subject; if a modeler omits a property edge by mistake, the entity may be silently promoted to Subject rather than flagged as incomplete.

#### Internal validity

The running example (housing subsidy) was selected for structural completeness: it exhibits both a vertical governance conflict (Headline 1) and a horizontal expressiveness gap (Headline 2) within a single, independently documented domain. A randomly sampled credential ecosystem might expose neither or might expose interaction patterns not covered by the current anti-pattern catalog (\autoref{sec:anti-patterns}). The eight eIDAS ARF constraints were extracted from a specific version (ARF v2.7.3 [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026]); the constraint landscape may shift as the regulatory framework evolves. Format capability predicates depend on the characterization being both complete and current: an emerging format with novel capability combinations (e.g., BBS+ credentials with partial predicate support) would require extending the format class hierarchy and the derived propagation rules. The scalability instances grow by adding credentials with uniform structure (one property per credential, shared subject), which reflects the common multi-issuer credential ecosystem pattern but does not exercise deeper claim hierarchies or multi-subject credentials that may arise in domains such as healthcare or supply chain management.

#### External validity

The evaluation operates within a single governance context: EU regulations (eIDAS 2.0 [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026], GDPR [@gdpr]) applied to Hungarian administrative procedures. The `GovernanceAnnotation` mechanism is designed to be governance-agnostic: new regulatory sources require adding annotation subclasses and error predicates, not restructuring the three-layer architecture. However, the evaluation demonstrates this only for the EU context. Governance traditions that impose constraints not reducible to format-capability requirements, such as organizational trust hierarchies or issuer accreditation rules, would require extending the metamodel beyond annotation markers. The single-domain scenario exercises a three-credential, single-subject ecosystem; domains with richer claim structures or multi-subject credentials may stress different metamodel elements. The intended user is a credential ecosystem designer who specifies the domain graph, credential decomposition, and governance requirements in a graph-based formalism; whether a domain expert without metamodeling experience could use the approach effectively remains untested.

#### Conclusion validity

The scalability instances are synthetic: each adds a credential with one property to the preceding configuration. This linear, homogeneous growth pattern is representative of the common case where independent issuers each contribute one credential to a shared ecosystem, but it does not capture ecosystems where a few credentials carry many claims while others are minimal. Concretizability checking scales sublinearly over the measured range, though growth is uneven — a step around $N{=}15$ suggests phase transition behavior in the solver's search strategy. Model generation also scales sublinearly (3.4$\times$ increase across a 25$\times$ growth in model size), though superlinear growth may emerge at larger scales as the combinatorial format assignment search dominates. [Oszkár: please verify the scaling characterization (sublinear, phase transition hypothesis) against your experience with Refinery solver behavior.]{.todo} The constraint sensitivity analysis partially compensates for the homogeneous scaling by varying governance complexity at fixed model size, but the power-set covers three governance frameworks only. Refinery-specific performance results establish that the formalization is computationally feasible at practical ecosystem scales; they do not generalize to other partial modeling tools. The contribution is the metamodel and its cross-layer constraints, with Refinery as the validation vehicle. Model definitions, constraint encodings, and all measurement artifacts are provided as supplementary material for independent reproduction.
