---
section: Abstract
budget: "0.25 pages (ACM abstract limit)"
goal: "State problem, approach, key results, significance."
dependencies: []
binding_claims:
  - "1. Three-layer metamodel with defined layers"
  - "2. Grounding in W3C VCDM 2.0 (mapping)"
  - "3. Cross-layer constraints as Refinery graph predicates"
  - "4. Automated consistency checking demonstration"
  - "5. Coverage validation vs. W3C specification"
  - "6. Expressiveness validation vs. W3C + EU regulatory sources [HIGH RISK]"
  - "7. Error detection vs. known anti-patterns"
  - "8. Formally contradictory cross-framework constraints [HIGH RISK - headline result]"
  - "9. Multi-layer errors invisible to single-layer inspection"
  - "10. Necessity/effectiveness argument for multi-layer modeling [risk depends on claim strength]"
title_candidates:
  - "A Multi-Layer Metamodel for Verifiable Credential Ecosystem Design in Refinery"
  - "Cross-Layer Constraint Formalization for Verifiable Credential Ecosystems: A Metamodel Grounded in W3C VCDM 2.0"
  - "Metamodeling Verifiable Credential Ecosystems: Formalizing Cross-Layer Constraints with Partial Graph Predicates"
---

::::: abstract :::::
Emerging digital credential ecosystems allow persons and organizations to selectively present cryptographically verifiable claims. Such ecosystems are being deployed under diverse governance frameworks, from EU Digital Identity Wallets to community-governed decentralized identity systems, whose design constraints span domain-level claim semantics, credential schema structure, and format-specific privacy capabilities. Constraints from W3C standards, EU regulations, and community specifications interact across layers: their combined effect is not predictable from any individual source, yet no formal framework checks their joint consistency.

We present a three-layer metamodel and formalized constraint set for credential ecosystem design, grounded in the W3C Verifiable Credentials Data Model 2.0, with cross-layer constraints formalized as graph predicates in the Refinery partial graph modeling framework. We validate coverage against the W3C specification, expressiveness against EU regulatory sources, and error detection against known anti-patterns. The evaluation shows that constraints from different governance frameworks can be formally conflicting, and that design errors spanning multiple layers become visible only through the integrated formalization: classifying eight eIDAS constraints, formalizing five anti-patterns, and surfacing two cross-layer errors that no single-layer analysis detects.
::::::::::::::::::::
