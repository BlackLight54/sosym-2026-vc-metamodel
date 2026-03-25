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

### 2026-03-25 — Claim C5 correction: MDE has been applied to SSI

**Decision:** Soften the novelty claim. Do not claim "MDE has not been applied to the VC/SSI domain." Instead claim: "No prior work applies multi-level metamodeling to VC credential design with formalized cross-layer constraints spanning domain semantics, credential structure, and format-specific representation."
**Rationale:** Gap analysis (2026-03-25) found four MDE works targeting SSI: ChorSSI (Cippitelli et al. 2023, BPMN choreography), SecureSSI (Ding & Sato 2023, security analysis), Pattiyanon et al. (2022, MODELSWARD, weakness detection via DSMLs), Barclay et al. (2020, iStar governance modeling). Each addresses a different sub-problem. None defines a multi-layer metamodel or formalizes cross-layer constraints. The defensible claim is the intersection: multi-level metamodel + cross-layer constraints + VC credential design.
**Affects:** Introduction P2 gap claim, abstract framing, Related Work Sec 06.2. All four works must be cited and differentiated.
**Revisit when:** If any of these papers turn out to address cross-layer constraint formalization upon full reading.

### 2026-03-25 — Gap analysis completed: core novelty confirmed

**Decision:** Proceed with current thesis. The core novelty — a multi-layer metamodel for VC ecosystem design with cross-layer constraints formalized as graph predicates — has no precedent in the literature. All found formalizations operate at a single layer (protocol security, RDF semantics, credential shapes, delegation semantics).
**Rationale:** Seven research questions tested across arXiv, Google Scholar, SciSpace. Five returned CLEAR, two returned CAUTION (RQ2: differentiate from Braun et al./Mezei/ToIP; RQ3: soften C5). No DANGER results. Full synthesis in `archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md`.
**Affects:** Confidence to proceed with drafting. Related work section must cite ~20 papers across three tiers.
**Revisit when:** If supplementary ACM DL/DBLP searches surface closer work, or if a reviewer identifies missing related work.

### 2026-03-24 — CSOK naming: "family housing subsidy" in body, CSOK in footnote

**Decision:** Use "family housing subsidy" in all body text. Introduce Hungarian name once in footnote at first mention: "Based on the Hungarian Family Housing Subsidy (Családi Otthonteremtési Kedvezmény, CSOK), simplified." After that, "the housing subsidy scenario" or "the running example."
**Rationale:** MODELS is international. "CSOK" carries zero information for a non-Hungarian reader. The scenario's value is its structural properties (multi-issuer, cross-credential constraints, governance conflict), not its Hungarian identity.
**Affects:** All section files (03, 04, 05, 01), abstract if revised.
**Revisit when:** Never — purely a naming convention.

### 2026-03-24 — GDPR constraint strength: two-tier framing

**Decision:** Frame eIDAS format mandate as hard (SHALL per ARF), GDPR data minimization as operationally binding (cite NAIH 35M HUF enforcement precedent against a bank for excessive data collection during CSOK processing). Scope the privacy claim: "if data minimization is to be achieved through technical means at the credential layer, predicate proof capability is necessary."
**Rationale:** GDPR Art. 5(1)(c) requires data minimization in general, not predicate proofs specifically. Overstating would be dishonest. But the NAIH precedent shows the interpretation is operationally enforced in CSOK context, not hypothetical. The two-tier framing lets the conflict stand without overpromising.
**Affects:** Section 05.3 (governance conflict language), Section 03 (motivation), abstract hedging.
**Revisit when:** If stronger regulatory guidance linking GDPR to credential format choice emerges.

### 2026-03-24 — Format-driven CPL restructuring as worked example

**Decision:** Present in Section 04.4 as a cross-layer constraint propagation example. With AnonCreds, the issuer encodes monthly_income as an integer and the holder uses a predicate proof (monthly_income ≥ threshold). With SD-JWT-VC, the issuer must pre-compute boolean claims (income_above_X: true) because the format lacks predicate proofs. This CPL restructuring — forced by an FSL limitation — is exactly what multi-layer analysis detects.
**Rationale:** Martin identified this as a key insight. It concretely demonstrates the paper's thesis: format-specific limitations propagate upward through the metamodel layers. The workaround also doesn't fully resolve the conflict (issuer must anticipate all thresholds; static; leaks information).
**Affects:** Section 04.4 (worked example), Section 05.3 (remark after conflict).
**Revisit when:** If page budget forces cuts, this could move to supplementary material.

### 2026-03-24 — mdoc simplified away in running example

**Decision:** Mention both SD-JWT-VC and mdoc (ISO 18013-5) in Background to establish that eIDAS mandates both. Running example uses SD-JWT-VC only: "since both lack predicate proof support, we focus on SD-JWT-VC without loss of generality for the governance conflict."
**Rationale:** Adding mdoc doubles FSL visual complexity without adding analytical insight. Both formats lack predicate proofs. The conflict is identical for both.
**Affects:** Section 02 (background), Section 04.3, Section 05.3, teaser figure.
**Revisit when:** If a reviewer demands mdoc coverage.

### 2026-03-24 — Two orthogonal headline results in evaluation

**Decision:** Present two headline results in Section 05.3: (1) Income governance conflict (vertical) — eIDAS format mandate vs. GDPR privacy on IncomeCred, no format satisfies both. (2) Floor area cross-credential predicate gap (horizontal) — property_area ≥ f(num_children) requires cross-credential arithmetic, no deployed format supports it (not even AnonCreds). The income conflict gets ~0.5 page, the cross-credential gap ~0.3 page.
**Rationale:** The two results are orthogonal — vertical governance conflict vs. horizontal format expressiveness gap. Together they make a stronger case for multi-layer analysis than either alone. Both are grounded in real CSOK requirements (government decrees 16/2016, 17/2016, 518/2023 for floor area; GDPR + eIDAS for income).
**Affects:** Section 05.3 structure, evaluation scope, abstract claims.
**Revisit when:** If page budget forces cuts, the cross-credential gap can be shortened to a remark.

## Superseded decisions

%% Move decisions here when they are replaced, with a note on what replaced them. %%
