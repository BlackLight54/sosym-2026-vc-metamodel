---
section: Overview
budget: "1.5 pages (~3 subsections: Motivation ~0.7p, Functional Overview ~0.5p, Usage Workflow ~0.3p)"
goal: "Introduce running example and cross-layer problem (3.1), define the three usage modes via a functional overview (3.2), and walk through a designer's workflow (3.3)."
dependencies: ["02_background"]
note: "The teaser figure (fig_teaser) is placed before the introduction in ACM sigconf. This section references it but does not carry the figure burden."
---

# Overview
\label{sec:overview}

## Motivation
\label{sec:motivation}

Consider a government housing subsidy where eligibility requires credentials from three independent authorities: family status from a civil registry, property records from a land registry, and income from an employer.^[Based on the Hungarian Family Housing Subsidy (Családi Otthonteremtési Kedvezmény, CSOK), simplified. Additional credentials required in practice (tax clearance, criminal record check) are omitted; these involve simple status checks that do not introduce cross-credential arithmetic or predicate proof requirements, and their inclusion would not affect the headline results.] The required property size depends on the number of children [@noauthor_5182023_2023] (the decree prescribes minimum floor areas of 40, 50, 60, 70, and 80 m² for one through five or more children, respectively), a constraint that spans two credentials, and the income check must satisfy both EU format mandates and data protection requirements.

\autoref{fig:teaser} illustrates this scenario across three metamodel layers. At the domain concept layer, the applicant's facts (number of children, property floor area, monthly income) form an information graph with domain-level constraints: the minimum floor area is a function of the number of children [@noauthor_5182023_2023], and income must exceed a regulatory threshold. At the credential schema layer, these facts are distributed across three credentials issued by independent authorities, each with its own credential subject. All three subjects must be aligned (they refer to the same applicant) and each claim must trace to the corresponding domain-level property. At the format-specific layer, EU regulations mandate specific credential formats for government-issued attestations [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026], while data protection law requires that privacy-sensitive checks, such as whether income exceeds a threshold, disclose only the minimum necessary information [@gdpr] [@noauthor_naih_2020].

Inspected in isolation, each layer is well-formed: domain properties, credential schemas, and format assignments each pass their own validation. Cross-layer analysis, however, reveals two problems. The income credential cannot simultaneously satisfy the eIDAS ARF format mandate (requiring SD-JWT-VC [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026]) and GDPR data minimization (requiring predicate proof capability [@gdpr]); SD-JWT-VC supports selective disclosure but not predicate proofs. The floor area constraint requires cross-credential predicate evaluation spanning two credentials, which no widely used format supports in zero-knowledge. Neither problem is visible when any single layer is inspected alone.

The constraints in this scenario originate from governance frameworks that were not designed to be jointly satisfied: W3C VCDM [@sporny_verifiable_2025] defines structural conformance rules for credentials, the eIDAS ARF [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026] mandates specific credential formats for government attestations, GDPR [@gdpr] requires data minimization, and format specifications [@terbu_sd-jwt-based_2026] [@curran2022anoncreds] define what each format can and cannot express. In the housing subsidy scenario, these four sources (a W3C data model, an EU implementing regulation, a data protection law, and format-specific capability boundaries) were enacted independently and without mutual coordination. No single governance source anticipates the constraints imposed by the others.

The remainder of this section defines a framework that captures constraints across these layers and governance sources (\autoref{sec:functional-overview}) and demonstrates its usage on the housing subsidy scenario (\autoref{sec:usage-workflow}).

## Functional Overview
\label{sec:functional-overview}

```{=latex}
\begin{figure}
\centering
\fbox{\parbox{0.85\columnwidth}{\centering\vspace{1.5cm}\small Functional overview: partial design + constraints $\to$ metamodel + graph predicates $\to$ OK / NOT\_OK(errors) / GENERATED(design) / UNVIABLE(reasons)\vspace{1.5cm}}}
\caption{Functional overview of the framework. A partial credential ecosystem design and constraint set are evaluated against the three-layer metamodel via graph predicates, producing one of three outcomes: consistency confirmed, specific violations identified, or valid configurations generated (or proven nonexistent).}
\label{fig:functional_overview}
\end{figure}
```

A credential ecosystem designer provides a *partial design* (entities, credentials, claim mappings, subject bindings, and tentative format assignments) together with governance constraints from applicable regulatory and technical sources. A design is *partial* when some elements remain unspecified: for example, format assignments may be left open for the framework to resolve. The metamodel (\autoref{sec:approach}) organizes these elements across three layers (domain concepts, credential schemas, format-specific representations), and cross-layer constraints are formalized as graph predicates that the Refinery partial graph modeling framework [@marussy_refinery_2024] evaluates.

The framework supports three usage modes. In *consistency checking*, the designer has a complete or near-complete design and wants to verify that it satisfies all constraints; the framework confirms consistency (**OK**) or reports that the design is unsatisfiable (**UNSAT**). In *error identification*, the designer has a partial or complete design that is known or suspected to contain problems; the framework evaluates error predicates and returns the specific constraint violations (**NOT_OK(errors)**), for example reporting that the income credential's format assignment simultaneously violates a governance mandate and a data protection requirement. In *design space exploration*, the designer provides a partial specification with open design choices (such as unassigned credential formats) and the framework either produces diverse valid completions^[Refinery's diversity mechanism yields multiple distinct graph completions; the designer inspects a representative sample rather than an exhaustive enumeration.] (**GENERATED(possible_design)**) or proves that no configuration satisfying all constraints exists (**UNVIABLE(reasons)**). \autoref{fig:teaser} shows the three usage modes applied to the housing subsidy scenario: the INPUT column provides the partial design and governance constraints, the MODEL column shows the three-layer instance, and the OUTPUT column shows the results of each mode.

## Usage Workflow
\label{sec:usage-workflow}

A designer specifies the ecosystem and runs error identification, which reveals the income credential governance conflict (\autoref{fig:teaser}). The designer restructures the income claim as a pre-computed boolean and runs design space exploration to generate valid configurations. The framework returns GENERATED configurations or UNVIABLE under the original constraint set.
