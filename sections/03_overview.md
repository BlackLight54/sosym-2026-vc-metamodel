%% @META: Section: Overview %%
%% @META: Budget: 1.5 pages (~3 subsections: Motivation ~0.7p, Functional Overview ~0.5p, Usage Workflow ~0.3p) %%
%% @META: Goal: Introduce running example and cross-layer problem (3.1), define the three usage modes via a functional overview (3.2), and walk through a designer's workflow (3.3). %%
%% @META: Dependencies: Section 02 (VCDM concepts, multi-level modeling, Refinery). %%
%% @META: Note: The teaser figure (fig_teaser) is placed before the introduction in ACM sigconf. This section references it but does not carry the figure burden. %%

# Overview
\label{sec:overview}

## Motivation
\label{sec:motivation}

Consider a government housing subsidy where eligibility requires credentials from three independent authorities: family status from a civil registry, property records from a land registry, and income from an employer.^[Based on the Hungarian Family Housing Subsidy (Családi Otthonteremtési Kedvezmény, CSOK), simplified. Additional credentials required in practice — tax clearance, criminal record check — are omitted.] The required property size depends on the number of children %% @CITE: 518/2023. (XI. 30.) Korm. rendelet §9 — CSOK floor area requirements by number of children %% — a constraint that spans two credentials — and the income check must satisfy both EU format mandates and data protection requirements.

At the domain concept layer, the applicant's facts — number of children, property floor area, monthly income — form an information graph with domain-level constraints: the minimum floor area is a function of the number of children %% @CITE: 518/2023 Korm. rendelet §9 %%, and income must exceed a regulatory threshold. At the credential schema layer, these facts are distributed across three credentials issued by independent authorities, each with its own credential subject. All three subjects must be aligned — they refer to the same applicant — and each claim must trace to the corresponding domain-level property. At the format-specific layer, EU regulations mandate specific credential formats for government-issued attestations %% @CITE: eIDAS 2.0 ARF — SD-JWT-VC/mdoc mandate %%, while data protection law requires that privacy-sensitive checks — such as whether income exceeds a threshold — disclose only the minimum necessary information %% @CITE: GDPR Art. 5(1)(c), NAIH enforcement precedent %%.

Inspected in isolation, each layer is well-formed: the domain properties satisfy their value constraints, the credential schemas conform to VCDM structural rules, and each format meets its own specification. Cross-layer analysis, however, reveals two distinct problems. First, the income credential cannot simultaneously satisfy the eIDAS format mandate (requiring SD-JWT-VC %% @CITE: eIDAS 2.0 ARF — SD-JWT-VC/mdoc mandate %%) and GDPR data minimization (requiring predicate proof capability %% @CITE: GDPR Art. 5(1)(c) %%): SD-JWT-VC supports hash-based selective disclosure but not predicate proofs %% @CITE: SD-JWT-VC — IETF draft, hash-based selective disclosure %%. Second, the floor area constraint — minimum area as a function of number of children — requires cross-credential predicate evaluation spanning the family status and property credentials, which no deployed format supports in zero-knowledge. Neither problem is visible when any single layer is inspected alone.

%% @CITE: W3C VCDM 2.0 — structural constraints (credentialSubject, proof types) %%
%% @CITE: eIDAS 2.0 ARF — format mandate (SD-JWT-VC, mdoc) %%
%% @CITE: GDPR Art. 5(1)(c) — data minimization %%
%% @CITE: AnonCreds specification — CL-signature predicate proofs %%
%% @CITE: SD-JWT-VC — IETF draft, hash-based selective disclosure %%

The constraints in this scenario originate from governance frameworks that were not designed to be jointly satisfied: W3C VCDM %% @CITE: W3C VCDM 2.0 %% defines structural conformance rules for credentials, eIDAS %% @CITE: eIDAS 2.0 ARF %% mandates specific credential formats for government attestations, GDPR %% @CITE: GDPR Art. 5(1)(c) %% requires data minimization, and format specifications %% @CITE: SD-JWT-VC — IETF draft %% %% @CITE: AnonCreds specification %% define what each format can and cannot express. Unlike hierarchical requirement systems in safety-critical domains, where stakeholders cooperate within a defined authority structure, these governance sources are independent and their design goals may be formally irreconcilable. No existing tool or methodology checks whether their constraints can be simultaneously satisfied for a given credential ecosystem design.

%% @CITE: gap claim — no existing multi-level framework for VC ecosystems (confirmed by gap analysis 2026-03-25) %%

Credential ecosystem design requires a formal framework that captures constraints at multiple abstraction layers and from multiple governance sources, enabling designers to determine whether a given configuration is jointly satisfiable. No existing approach provides this capability %% @CITE: gap claim — no existing multi-level framework for VC ecosystems %%.

## Functional Overview
\label{sec:functional-overview}

%% @FIGURE: fig_functional_overview | Box/pipeline diagram. Input: partial design specification + constraint set → Processing box (metamodel + graph predicates) → Three output modes: (1) OK — design is consistent, (2) NOT_OK(errors) — specific constraint violations identified, (3) GENERATED(possible_design) or UNVIABLE(reasons) — design space exploration produces valid alternatives or proves none exist. Style: clean box diagram like Imre's BPM paper. Production: Excalidraw → TikZ. %%

The approach takes as input a *partial credential ecosystem design* — entities, credentials, claim mappings, subject bindings, and tentative format assignments — together with the constraint set derived from the metamodel and applicable governance frameworks. The metamodel organizes these elements across three layers (domain concepts, credential schemas, format-specific representations), and cross-layer constraints are formalized as graph predicates that the Refinery partial graph modeling framework %% @CITE: Refinery partial graph modeling framework %% can evaluate or enforce.

The framework supports three usage modes. In *consistency checking*, the designer submits a complete or partial design and receives confirmation that all constraints are satisfied (**OK**). In *error identification*, the framework evaluates error predicates against the design and returns specific constraint violations (**NOT_OK(errors)**) — for example, identifying that the income credential's format assignment violates a governance constraint. In *design space exploration*, the designer provides a partial specification with open design choices (such as unassigned credential formats) and the framework either generates diverse valid configurations (**GENERATED(possible_design)**) or proves that no configuration satisfying all constraints exists (**UNVIABLE(reasons)**).

## Usage Workflow
\label{sec:usage-workflow}

A designer specifies the housing subsidy credential ecosystem: three credentials with their claim mappings, subject bindings, and tentative format assignments. Running error identification reveals a constraint violation on the income credential — the eIDAS format mandate and GDPR data minimization requirement conflict under SD-JWT-VC, which lacks predicate proof capability. The designer adjusts the design — restructuring the income claim as a pre-computed boolean (income above threshold) — and re-checks. Finding the modified design consistent, the designer runs design space exploration with format assignments left open, generating alternative valid configurations. The framework produces two configurations that satisfy all governance constraints, or returns UNVIABLE if the full constraint set — including the original predicate proof requirement — admits no solution.
