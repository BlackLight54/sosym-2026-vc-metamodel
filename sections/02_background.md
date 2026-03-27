%% @META: Section: Background %%
%% @META: Budget: 1.25 pages (~7 paragraphs, 3 subsections) %%
%% @META: Goal: Establish the three conceptual pillars the reader needs. Nothing more. %%
%% @META: Dependencies: None. %%

# Background
\label{sec:background}

## W3C Verifiable Credentials Data Model 2.0
\label{sec:vcdm}

%% @TODO: B1 — Define VCDM core data model elements for Section 4. Verifiable credential, credential subject, issuer, claims, proof mechanism. Emphasize that VCDM defines structure but not domain semantics or format encoding. [Binding Claim #2: grounding in VCDM 2.0]. Length: 5–7 sentences. %%

%% @CITE: W3C VCDM 2.0 specification %%

%% @TODO: B2 — Establish format diversity and differing privacy capabilities. JSON-LD with Data Integrity Proofs, JWT-encoded VCs, AnonCreds (outside W3C but widely used). Each format has different privacy capabilities: selective disclosure, predicate proofs (ZKP). This diversity motivates the format-specific layer. Length: 3–4 sentences. %%

%% @CITE: W3C VC Data Integrity %%
%% @CITE: AnonCreds specification %%
%% @CITE: SD-JWT VC %%

%% @TODO: B3 (optional) — Briefly establish governance context. EU Digital Identity Wallet (eIDAS 2.0, Architecture Reference Framework) imposes constraints on format choice, attribute disclosure, holder binding. Only include if space allows; context also appears in Sec 03. Length: 2–3 sentences. %%

%% @CITE: eIDAS 2.0 implementing regulation %%
%% @CITE: EU Architecture Reference Framework (ARF) %%

## Multi-Level Modeling
\label{sec:multi-level}

%% @TODO: B4 — Position three-layer metamodel within multi-level modeling literature. Atkinson & Kühne multi-level metamodeling, linguistic vs. ontological typing, potency. Three layers (domain concept, credential schema, format-specific) as ontological levels connected by cross-level constraints — independently governed concern spaces, not standard top-down refinement. No MDA terminology per DECISIONS.md. Length: 3–4 sentences. %%

%% @CITE: Atkinson & Kühne — multi-level modeling %%
%% @CITE: potency-based multi-level modeling %%

%% @TODO: B5 — Establish specific metamodeling concepts used in Section 4. Ecore-style class diagrams as metamodel notation, instances as partial models with open/closed world semantics, cross-layer trace relationships as refinement mappings. Length: 2–3 sentences. %%

## Partial Graph Modeling with Refinery
\label{sec:refinery}

%% @TODO: B6 — Introduce Refinery as the tool framework. Partial graph modeling framework, graph predicates as first-class constraint language, design space exploration via model generation from partial specifications. Third person (double-blind). Length: 4–5 sentences. %%

%% @CITE: Refinery — partial graph modeling framework %%

%% @TODO: B7 — Define Refinery language elements used in Section 4.4. Error predicates (constraints that must not hold), propagation rules (derived knowledge guiding generation), shadow predicates, scope constraints, partial interpretation (may/must/unknown). These are building blocks for Section 4.4 cross-layer constraints. Length: 4–5 sentences. %%

%% @FORMAL: Define error predicate, propagation rule, shadow predicate, scope constraint %%
