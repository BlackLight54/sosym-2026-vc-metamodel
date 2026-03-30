---
section: Conclusion
budget: "0.75 pages (~4 paragraphs)"
goal: "Summary, key results, limitations, future work."
dependencies: ["all"]
---

# Conclusion {#sec:conclusion}

In the housing subsidy scenario, the metamodel revealed that no credential format simultaneously satisfies the eIDAS ARF format mandate, GDPR data minimization, and W3C VCDM 2.0 conformance on the income credential: three governance frameworks, each internally consistent, whose joint requirements are unsatisfiable. The floor area constraint further exposed that cross-credential predicate evaluation across two independently issued credentials exceeds the capabilities of every deployed format.

The three-layer metamodel (+DCL, +CSL, +FSL), grounded in +VCDM 2.0 and formalized as graph predicates in Refinery (\autoref{sec:approach}), makes cross-layer constraints from heterogeneous governance frameworks jointly evaluable. Validation confirmed coverage against the W3C specification, expressiveness against regulatory and standards sources, and error visibility against known design anti-patterns (\autoref{sec:evaluation}). Both headline results and two of five anti-pattern categories require predicates that reference elements from independently governed layers; no single-layer formalization can express them without collapsing the governance-source distinction that makes the constraints meaningful.
