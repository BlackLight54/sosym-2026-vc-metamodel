---
section: Related Work
budget: "0.75 pages (~4 paragraphs, 3 subsections)"
goal: "Position the contribution against three bodies of work. Each subsection: cited works, positioning statement, gap."
dependencies: ["04_approach", "05_evaluation"]
source: "Gap analysis synthesis (2026-03-25), archive/gap analyis/GAP_ANALYSIS_SYNTHESIS.md"
---

# Related Work

\label{sec:related-work}

## Credential Ecosystem Design and Formalization

\label{sec:rw-credential}

Verifiable credential schema design is currently guided by specifications that define credential structure at individual abstraction layers: the W3C Verifiable Credentials Data Model 2.0 [@sporny_verifiable_2025] and EU +ARF [@noauthor_eu-digital-identity-walleteudi-doc-architecture-and-reference-framework_2026] prescribe issuance and presentation flows, while AnonCreds [@curran2022anoncreds] and ISO mDL [@_mobile_2021] define format-specific encoding and proof mechanisms. None of these specifications provides a formal mechanism for checking constraints that span multiple layers. Where formal methods have been applied, they target individual layers: Braun and Käfer [@curry_rdf-based_2025] define [+RDF]{.long}-based semantics for selective disclosure and zero-knowledge proofs on verifiable credentials, Yamamoto et al. [@yamamoto_formalising_2022] formalize selective disclosure specifically for linked-data credentials, and Braun et al. [@braun_ssi_2024] verify SSI protocol security properties using ProVerif. Each formalization targets protocol-level security or single-format semantics; none operates across the boundary between domain-level claim semantics and format-specific representation capabilities.

Complementary conceptual models address trust policy [@tith_trust_2025], delegated authority enforcement [@turkanovic_model_2025], governance layering [@davie_trust_2019], and privacy-by-design for SSI [@naghmouchi_systematic_2025]; each targets a single concern without formalizing cross-layer constraints spanning domain semantics, credential structure, and format-specific representation.

## Model-Driven Engineering for Security and SSI

\label{sec:rw-mde}

Model-driven security engineering has established metamodel-based approaches to security properties of software architectures. UMLsec [@noauthor_secure_2005] annotates UML models with confidentiality and authentication constraints, enabling formal verification of security properties during design. SecureUML [@basin_model_2006] integrates role-based access control specifications into class models, generating enforcement infrastructure from the model. Neither targets credential schema design; both operate on software architecture elements rather than the domain-specific structure of verifiable credentials.

Within SSI, model-driven approaches address choreography [@cippitelli_chorssi_2024], security analysis [@ding_model-driven_2023], weakness detection [@pattiyanonMethodDetectingCommon2022], governance requirements [@barclay_towards_2020], and multi-level compliance checking [@king_automated_2017]; none defines a multi-layer metamodel or formalizes cross-layer constraints connecting domain semantics to format-specific representation.

## Multi-Level Modeling and Graph-Based Design Space Exploration

\label{sec:rw-multilevel}

Multi-level metamodeling, as established by Atkinson and Kühne [@goos_essence_2001; @atkinson_reducing_2008], eliminates accidental complexity in deep classification scenarios by allowing model elements to span more than two metalevels; de Lara and Guerra [@hutchison_deep_2010] implement these principles with deep instantiation in MetaDepth. Diskin et al. [@dingel_specifying_2011] formalize consistency checking across heterogeneous model views, a problem this work extends by adding independently governed constraint sources as a consistency dimension.

The present metamodel relies on the Refinery +PGM framework [@marussy_refinery_2024] as its solver infrastructure. Refinery generates diverse model instances that satisfy structural and relational constraints expressed as graph predicates, and its four-valued partial model semantics enable reasoning over designs that are still incomplete, a property essential for credential ecosystems where not all schema elements are known at design time.
Alloy [@jackson_software_2012] performs bounded model finding over relational specifications but operates on fully concrete instances within a fixed scope and cannot represent open design decisions. It relies on SAT-based enumeration rather than incremental constraint propagation, re-encoding the entire problem for each candidate instance. OCL constraints on UML metamodels similarly assume fully instantiated models, with no representation of open decisions. Refinery's partial model semantics distinguish definite violations from open decisions through four-valued evaluation and graph-query-based constraint propagation, enabling reasoning over specifications where governance constraints from different sources arrive incrementally.

Unlike standard multi-level modeling applications where layers represent successive instantiation and constraints take the form of potency annotations, the three layers in the present metamodel (domain concepts, credential structure, and format-specific representation) represent independently governed concern spaces. They are connected by coverage and capability constraints over partial models, formalized in Refinery's predicate language (\autoref{sec:cross-layer}), not by instantiation relationships. The contribution is therefore the cross-layer constraint methodology under multi-source governance, not the layering technique itself: constraints originate from normative sources (W3C specifications, EU regulations, national privacy legislation) that impose requirements independently and may be formally irreconcilable (\autoref{sec:headlines}).

No prior work combines multi-layer metamodeling with formalized cross-layer constraints for verifiable credential ecosystem design under multi-source governance.
