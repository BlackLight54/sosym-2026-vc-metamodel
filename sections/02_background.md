%% @META: Section: Background %%
%% @META: Budget: 1.25 pages (~7 paragraphs, 3 subsections) %%
%% @META: Goal: Establish the three conceptual pillars the reader needs. Nothing more. %%
%% @META: Dependencies: None. %%

# Background

## W3C Verifiable Credentials Data Model 2.0

%% @SCAFFOLD: B1 — VCDM core concepts %%
%% @SCAFFOLD: Job: Define the data model elements the reader needs for Section 4. %%
%% @SCAFFOLD: Key content: Verifiable credential, credential subject, issuer, claims, proof. The data model defines structure but not domain semantics or format-specific encoding. %%

%% @CITE: W3C VCDM 2.0 specification %%

%% @TODO: Draft — define VC, credential subject, issuer, claims, proof. Emphasize that VCDM defines structure but not domain semantics or format encoding. %%

%% @SCAFFOLD: B2 — Securing mechanisms and format diversity %%
%% @SCAFFOLD: Job: Establish that multiple credential formats exist with different privacy capabilities. %%
%% @SCAFFOLD: Key content: JSON-LD with Data Integrity Proofs, JWT-encoded VCs, AnonCreds (outside W3C but widely used). Each format has different privacy capabilities: selective disclosure, predicate proofs (ZKP). This diversity is what creates the format-specific layer. %%

%% @CITE: W3C VC Data Integrity %%
%% @CITE: AnonCreds specification %%
%% @CITE: SD-JWT VC %%

%% @TODO: Draft — JSON-LD, JWT, AnonCreds formats. Privacy capabilities differ: selective disclosure, ZKP range proofs. This motivates the format-specific layer. %%

%% @SCAFFOLD: B3 (optional) — Governance context %%
%% @SCAFFOLD: Job: Briefly establish that governance frameworks impose additional constraints on credential design. %%
%% @SCAFFOLD: Key content: EU Digital Identity Wallet (eIDAS 2.0, Architecture Reference Framework) imposes constraints on format choice, attribute disclosure, holder binding. %%
%% @SCAFFOLD: Note: Only include if space allows. This context also appears in Sec 03. %%

%% @CITE: eIDAS 2.0 implementing regulation %%
%% @CITE: EU Architecture Reference Framework (ARF) %%

## Multi-Level Modeling

%% @SCAFFOLD: B4 — Multi-level modeling concepts %%
%% @SCAFFOLD: Job: Position the paper's three-layer metamodel within the multi-level modeling literature. %%
%% @SCAFFOLD: Key content: Atkinson & Kühne's multi-level modeling, potency, linguistic vs. ontological typing. Our three layers are ontological levels with cross-level constraints — not just linguistic metamodel stacking. %%
%% @SCAFFOLD: Note: Do NOT use MDA terminology (CIM/PIM/PSM). Frame as multi-level metamodeling. %%

%% @CITE: Atkinson & Kühne — multi-level modeling %%
%% @CITE: potency-based multi-level modeling %%

%% @TODO: Draft — multi-level modeling concepts. Position our three layers (domain concept, credential schema, format-specific) as ontological levels. Explain cross-level constraints as the novel element. %%

%% @SCAFFOLD: B5 — Metamodeling for this paper %%
%% @SCAFFOLD: Job: Establish the specific metamodeling concepts used in Section 4. %%
%% @SCAFFOLD: Key content: Ecore-style class diagrams as metamodel notation. Instances as partial models with open/closed world semantics. Cross-layer trace relationships as refinement mappings. %%

%% @TODO: Draft — metamodel notation, partial models, trace relationships. %%

## Partial Graph Modeling with Refinery

%% @SCAFFOLD: B6 — Refinery overview %%
%% @SCAFFOLD: Job: Introduce Refinery as the tool framework. Enough for the reader to understand the constraint language in Section 4.4. %%
%% @SCAFFOLD: Key content: Partial graph modeling framework. Graph predicates as first-class constraint language. Design space exploration via model generation from partial specifications. %%
%% @SCAFFOLD: Note: Double-blind — refer to Refinery as a published tool, not "our tool." %%

%% @CITE: Refinery — partial graph modeling framework %%

%% @TODO: Draft — Refinery overview. Graph predicates, partial interpretation, model generation. Third person (double-blind). %%

%% @SCAFFOLD: B7 — Refinery-specific concepts needed for this paper %%
%% @SCAFFOLD: Job: Define the Refinery language elements that appear in Section 4.4. %%
%% @SCAFFOLD: Key content: Error predicates (constraints that must not hold), propagation rules (derived knowledge that guides generation), shadow predicates, scope constraints, partial interpretation (may/must/unknown). %%

%% @FORMAL: Define error predicate, propagation rule, shadow predicate, scope constraint %%

%% @TODO: Draft — error predicates, propagation rules, may/must semantics. These are the building blocks for Section 4.4 cross-layer constraints. %%
