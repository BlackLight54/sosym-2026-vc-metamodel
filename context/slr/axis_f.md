# Axis (f): MDE / knowledge-engineering / ontology angle (cheap pass)

## Scope

This axis surveys prior attempts to model, formalize, or ontologize self-sovereign identity and verifiable-credential systems: conceptual frameworks, goal models, ontologies and RDF vocabularies, formal mathematical treatments, pattern catalogs, model-checking approaches, and machine-readable trust frameworks. The paper needs it to (a) establish that no existing modeling artifact reaches the ecosystem-governance level with checkable cross-layer constraints, which is the RQ1 delta, and (b) collect evidence that the field itself still lacks a consolidated definition of the SSI/VC ecosystem concept, which supports the RQ0 relevance argument.

## Confirmed corpus

| Title | Authors | Venue | Year | Locator | Kind |
|---|---|---|---|---|---|
| Self-sovereign identity: A conceptual framework and research agenda | Richter, Anke | Electronic Markets 36, art. 17 | 2026 | https://doi.org/10.1007/s12525-025-00867-8 | peer-reviewed |
| Model-Driven Security Analysis of Self-Sovereign Identity Systems | Ding, Sato | arXiv | 2024 | https://arxiv.org/abs/2406.00620 | preprint |
| Towards a Modelling Framework for Self-Sovereign Identity Systems | Barclay et al. | arXiv | 2020 | https://arxiv.org/abs/2009.04327 | preprint |
| Self-Sovereign Identity: A Systematic Review, Mapping and Taxonomy | Schardong, Custodio | Sensors 22(15):5641 | 2022 | https://www.mdpi.com/1424-8220/22/15/5641 | peer-reviewed |
| Verifiable Credentials Vocabulary v2.0 | W3C | W3C | 2025 | https://www.w3.org/2018/credentials/ | standard-spec |
| In Search of Self-Sovereign Identity Leveraging Blockchain Technology | Ferdous, Chowdhury, Alassafi | IEEE Access | 2019 | https://doi.org/10.1109/ACCESS.2019.2931173 | peer-reviewed |
| Aligning eIDAS and Trust Over IP: A Mapping Approach | see ACM record | ARES 2024 (ACM) | 2024 | https://doi.org/10.1145/3664476.3670919 | peer-reviewed |
| RDF-Based Semantics for Selective Disclosure and Zero-Knowledge Proofs on Verifiable Credentials | Braun, Kaefer | ESWC 2025, LNCS 15718 | 2025 | https://link.springer.com/chapter/10.1007/978-3-031-94575-5_21 | peer-reviewed |
| Design Patterns for Blockchain-based Self-Sovereign Identity | Liu, Lu, Paik, Xu | EuroPLoP 2020 | 2020 | https://dl.acm.org/doi/10.1145/3424771.3424802 | peer-reviewed |
| An Ontological Approach to Model Self Sovereign Identity | Du | CSUSB MS thesis | 2024 | https://scholarworks.lib.csusb.edu/etd/1909/ | grey-other |
| LIGHTest (H2020 project 700321) | LIGHTest consortium | EU H2020 / CORDIS | 2016-2019 | https://cordis.europa.eu/project/id/700321/reporting | report |

## Classification

- Richter and Anke 2026: **must-cite**. Freshest peer-reviewed evidence that the field still needed a consolidated conceptual framework in 2026; its distinct governance layer directly parallels and motivates the paper's three-layer metamodel.
- Ding and Sato 2024: **differentiate**. Closest formal-verification neighbor; the paper must state it works at architecture/protocol level via model checking, not at ecosystem-governance level via partial-model graph predicates.
- Barclay et al. 2020: **differentiate**. Prior "modelling framework for SSI ecosystems" by name; must be distinguished as goal/actor modeling (iStar 2.0) without a metamodel or checkable cross-layer constraints.
- Schardong and Custodio 2022: **must-cite**. The SLR that names defining SSI as the primary open conceptual problem; anchors the RQ0 claim that no agreed ecosystem definition exists.
- W3C VC Vocabulary v2.0: **must-cite**. Normative baseline; the paper claims its metamodel extends beyond what the standard's own vocabulary covers, so it must cite what that vocabulary does cover.
- Ferdous et al. 2019: **differentiate**. Prior mathematical formalization of SSI, but of identity properties and lifecycles; needs one sentence of scoping to avoid a "formalization exists already" objection.
- Aligning eIDAS and ToIP (ARES 2024): **must-cite**. Direct evidence that multi-source governance alignment is currently done by manual informal mapping, which is the practical motivation for RQ1.
- Braun and Kaefer 2025: **differentiate**. Formal semantics at the RDF/credential-data level; distinguishes the data layer (covered by prior work) from the ecosystem/governance layer (the paper's territory).
- Liu et al. 2020: **must-cite** (for the taxonomy). Cataloged recurring design decisions imply anticipatable design errors; supports the design-error taxonomy's premise for RQ0.
- Du 2024 (thesis): **ignore**. Confirms an SSI ontology exists but is a grey MS thesis covering component structure only; adds little over the W3C vocabulary and the ESWC work; cite only if a reviewer asks for ontology completeness.
- LIGHTest: **differentiate**. Prior machine-readable formalization of trust schemes; must be scoped as a DNS-based policy language, not an ecosystem metamodel with cross-layer constraints.

## What exists, what is thin

The corpus is reasonably dense on adjacent formalizations: mathematical treatments of SSI properties (Ferdous et al.), model checking of SSI architectures (Ding and Sato), RDF-level formal semantics (Braun and Kaefer), a normative vocabulary (W3C), pattern catalogs (Liu et al.), and machine-readable trust policies (LIGHTest). Conceptual and survey work is also solid (Richter and Anke, Schardong and Custodio, Barclay et al.). Every one of these stops below or beside the target: data model, protocol, architecture, goals, or policy language.

What is genuinely thin is the intersection the paper occupies: a metamodel of the whole VC ecosystem with governance constraints from multiple normative sources formalized as checkable predicates. No item in this axis attempts it; the only ecosystem-scoped modeling artifact (Barclay et al.) is a 2020 goal-model preprint. This is good news for the novelty claim but means the related-work section must assemble the gap from several partial neighbors rather than contrast against a single rival.

## RQ0 evidence

No item in this axis characterizes future VC-based B2B/B2G ecosystems or their anticipated design errors; that threat framing is not present in this corpus and must come from other axes (deployment spectrum, X.509/PKI error history). Partial support exists for the weaker RQ0 sub-claim that the ecosystem concept itself is unsettled: Schardong and Custodio (2022) identify defining SSI and what constitutes a self-sovereign system as the primary open conceptual problem (per the verified corpus notes; exact wording should be re-quoted from the paper before citing verbatim), and Richter and Anke (2026) demonstrate that a consolidated conceptual framework was still being proposed in 2026. Liu et al. (2020) support the premise that design decisions in this space recur and are therefore anticipatable, but do not discuss errors or B2B/B2G settings. Plainly: this axis grounds "the concept is undefined" but not "the design errors can be anticipated"; the latter has no anchor here.

## RQ1 anchors

- Richter and Anke 2026: governance as a distinct framework layer, motivating a layered metamodel.
- Ding and Sato 2024: proof that formal, tool-supported analysis of SSI is feasible, at a lower level than the paper's.
- Barclay et al. 2020: prior ecosystem modeling stopped at goal/actor models; sharpest statement of the delta.
- W3C VC Vocabulary v2.0 and Braun and Kaefer 2025: the data-model layer already has formal/ontological treatment, leaving upper layers open.
- Ferdous et al. 2019: precedent for mathematical formalization of SSI, scoped to identity lifecycles.
- ARES 2024 eIDAS/ToIP mapping: multi-source governance alignment is done manually today, motivating one formal metamodel.
- LIGHTest: trust frameworks have been made machine-readable before, but as policy languages, not metamodels.
