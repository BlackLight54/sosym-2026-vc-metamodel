# Decisions

Cross-cutting decisions that affect multiple sections or constrain downstream work. This file is the canonical record — inspectable, versionable, and survives context resets.

Record decisions here when they are made. Review them periodically with `skills/prior_decision_audit`.

## How to record a decision

Each entry has a date, the decision, the rationale, and what it affects. Use this format:

```
### YYYY-MM-DD — [short label]

**Decision:** [what was decided]
**Rationale:** [why — the alternatives considered and why this was chosen]
**Affects:** [which sections, skills, or elements this constrains]
**Revisit when:** [condition under which this should be reconsidered]
```

## Active decisions

%% Add decisions below this line. %%

### 2026-03-24 — Thesis framing: modeling-first, not detection-first

**Decision:** Frame the paper around multi-level metamodeling as the contribution. Refinery generates diverse graphs from partial metamodels — it does not detect errors algorithmically. Errors "become visible through the integrated formalization" (abstract). The title leads with modeling, not detection.
**Title:** "Multi-Level Metamodeling for Verifiable Credential Ecosystem Design: Formalizing Cross-Layer Constraints with Graph Predicates"
**Rationale:** The previous title ("Detecting Cross-Layer Design Errors...") implied an error-detection algorithm. The actual mechanism is constraint formalization in a partial graph model, with Refinery generating model instances. Detection-framing overpromises; modeling-framing matches the actual contribution and is safest for MODELS Foundations Track.
**Affects:** Introduction framing (P1-P3), contribution list, evaluation structure, abstract revision, title, all section headers.
**Revisit when:** If reviewers want stronger detection/tooling claims, or if Refinery gains explicit error-reporting capabilities beyond generation.

### 2026-03-24 — Domain: MDE, not formal methods

**Decision:** Primary domain is model-driven engineering (metamodeling, partial graph modeling, DSE), not formal methods (protocol verification, epistemic logic). Adjacent domains: decentralized identity, formal constraint specification.
**Rationale:** The paper uses metamodel definitions and graph predicates, not theorem-proof structure. MODELS is an MDE venue. The domain calibration affects register, explanation floor, and writing advice.
**Affects:** CLAUDE.md domain block, reviewer persona generation, writing register, background section scope.
**Revisit when:** If the paper develops substantial theorem-proof content that shifts it toward formal methods.

### 2026-03-24 — Terminology: multi-level metamodeling, no MDA

**Decision:** Do not use MDA-specific terminology (CIM, PIM, PSM, Model-Driven Architecture). Use "multi-level metamodeling" framing. Layer names aligned with abstract phrasing:
- **Claim Property Layer** — domain-level information graph
- **Credential Schema Layer** — abstract credential schemas
- **Format-Specific Layer** — format-specific representations
**Rationale:** Oszkár's direction. MDA is OMG-branded terminology from 2001; the MODELS community has moved beyond strict MDA. Using CIM/PIM/PSM invites reviewer objections and ties the contribution to an outdated framework.
**Affects:** All section files, background section 2.2 (now covers multi-level modeling: Atkinson & Kühne), approach subsection titles, CLAUDE.md thesis.
**Revisit when:** Never — this is a hard constraint from the advisor.

### 2026-03-24 — Running example: simplified CSOK scenario

**Decision:** Single running example based on the Hungarian CSOK (Családi Otthonteremtési Kedvezmény / Family Housing Subsidy) mortgage scenario, heavily simplified to fit 10 pages. Replaces the Diploma+Alice hybrid (superseded).
**Rationale:** Advisor (Oszkár) directed use of the CSOK scenario. A real-world example is stronger motivation than synthetic ones. Simplification is key — strip to the minimum entities and credentials that still exercise all three layers and demonstrate both vertical (format→claim) and horizontal (cross-credential alignment) constraints. The prior Diploma+Alice hybrid was rejected by the advisor.
**Affects:** Motivation section (Sec 03), approach examples (Sec 04), teaser figure, evaluation cases. All section scaffolds referencing Diploma/Alice must be updated.
**Revisit when:** If the simplified CSOK still does not fit in the page budget during drafting.

### 2026-03-24 — Motivation section ends with problem statement

**Decision:** Section 03 ends with the problem statement ("no formal framework for simultaneous multi-layer, multi-source constraint satisfaction"), not with a demonstrated detected error. The actual formalization and its consequences appear in Sections 04-05.
**Rationale:** Clean separation of motivation and contribution. Detection payoff in motivation risks front-loading results.
**Affects:** Section 03 paragraph plan, teaser figure design.
**Revisit when:** If the introduction feels insufficiently motivated without a concrete payoff preview.

### 2026-03-24 — Teaser figure: simplified CSOK scenario

**Decision:** ACM sigconf teaser figure (full-width, before first column) shows the simplified CSOK scenario across three layers. Must demonstrate both vertical and horizontal cross-layer constraints in a single unified visual.
**Rationale:** Communicates the cross-layer problem at first glance. Single unified example is cleaner than a split panel.
**Affects:** Introduction layout, Sec 03 page budget, figure design workflow.
**Revisit when:** If the CSOK scenario requires too much visual space for a teaser.

## Superseded decisions

%% Move decisions here when they are replaced, with a note on what replaced them. %%
