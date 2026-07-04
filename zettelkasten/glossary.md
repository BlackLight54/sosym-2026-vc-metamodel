# Glossary

Terminology, symbols, and acronyms, each linked to its concept note. Mirrors the paper's notation
discipline; a journal terminology table can be generated from this.

## Layers
- **DCL — Domain Concept Layer.** Domain facts as a typed DAG information graph. [[C-002 domain-concept-layer]]
- **CSL — Credential Schema Layer.** Facts partitioned into credentials with subjects and claims. [[C-003 credential-schema-layer]]
- **FSL — Format-Specific Layer.** Concrete format assignment with capability predicates. [[C-004 format-specific-layer]]

## Constraint and predicate vocabulary
- **Cross-layer constraint.** Predicate whose variables span more than one layer. [[C-009 cross-layer-constraint]]
- **Propagation rule / negative elimination.** Derives facts / prunes choices during refinement. [[C-010 propagation-rule-and-negative-elimination]]
- **Shadow predicate.** Records derived info without constraining generation. [[C-011 shadow-predicate]]
- **Error predicate.** Flags an unrepairable contradiction. [[C-012 error-predicate]]
- **Trace reference.** Mandatory CSL→DCL link; basis of C1/C2. [[C-014 trace-reference]]
- **Coverage / capability constraint.** What couples the layers (vs instantiation). [[C-016 format-capability-matrix]], [[C-017 capability-driven-format-elimination]]
- **C1–C9.** The cross-layer constraint taxonomy. [[C-013 cross-layer-constraint-taxonomy-c1-c9]]
- **`governance_conflict`.** Error predicate; no format satisfies C5∧C6∧C7. [[C-025 governance-conflict-vertical]]
- **`cross_cred_predicate_gap` / `aligned`.** Shadow predicates for the horizontal gap. [[C-026 cross-credential-predicate-gap-horizontal]]

## Formal apparatus
- **Partial model.** Objects + four-valued interpretation. [[C-006 partial-graph-modeling-refinery]]
- **Four-valued semantics.** true / false / unknown / error (Belnap). [[C-008 four-valued-partial-model-semantics]]
- **Refinement.** Partial order narrowing unknowns to true/false. [[C-008 four-valued-partial-model-semantics]]
- **Soundness / bounded completeness.** Generation guarantees. [[C-019 soundness-completeness-guarantee]]
- **Graph predicate.** Pattern evaluated under four-valued semantics. [[C-007 graph-predicate-formalization]]

## Governance and formats
- **VCDM 2.0.** W3C Verifiable Credentials Data Model. [[C-005 vcdm-2.0-grounding]]
- **eIDAS ARF.** EU Architecture and Reference Framework; format mandate (C5). [[C-022 eidas-arf-format-mandate]]
- **GDPR data minimization.** Operationalized as a predicate-proof requirement (C6). [[C-023 gdpr-data-minimization]]
- **Predicate proof / selective disclosure / ZKP.** Format capabilities. [[C-016 format-capability-matrix]]
- **AnonCreds, JSON-LD, JWT-VC, SD-JWT-VC, mdoc.** The five in-scope formats. [[C-016 format-capability-matrix]]
- **Governance annotation.** EidasMandate / PrivacyRequirement / VcdmConformance markers. [[C-018 governance-annotations]]

## EU regulatory landscape (June 2026 snapshot)
- **eIDAS 2 / Reg. (EU) 2024/1183.** The amending regulation; unlinkability (Art. 5a(16)(b)) and RP minimization (Art. 5b(3)) duties. [[S-030 eidas2-regulation-2024-1183]]
- **Relying party (RP) / registration regime.** Verifier-side governance under CIR (EU) 2025/848. [[C-037 relying-party-registration-regime]]
- **RP scope gap / verifier extension.** The issuer-side boundary and its named extension. [[C-038 relying-party-scope-gap]], [[C-040 verifier-side-extension-sketch]]
- **Linkability / statutory unlinkability gap.** Salted-hash baseline vs Art. 5a(16)(b); ARF §7.4.3.5.1. [[C-034 statutory-unlinkability-gap]]
- **Dual issuance.** PID in both mdoc AND SD-JWT VC (CIR 2024/2977). [[C-033 dual-issuance-mandate]]
- **TS13 / TS14.** Published-but-non-mandated EC ZKP specs. [[S-038 eudiw-zkp-ts13-ts14]]
- **EAA realizations.** Four-format taxonomy (ETSI TS 119 472-1), finer than "SD-JWT-VC or mdoc". [[S-037 eu-eudiw-technical-standards-2026]]
- **Disclosure spectrum.** Full presentation → selective disclosure → predicate proof → general ZK. [[C-039 disclosure-spectrum]]
- **Method over catalogue.** The durable contribution vs its dated regulatory instantiation. [[D-016 dated-snapshot-method-over-catalogue]]

## Method and scope
- **Three usage modes.** Consistency checking / error identification / DSE. [[C-020 three-usage-modes]]
- **DSE — design space exploration.** Generate valid completions or prove none exist. [[C-020 three-usage-modes]]
- **Three-axis validation.** Coverage / expressiveness / error detection. [[C-028 three-axis-validation]]
- **CORE-DISC.** Consistency, Diverse, Scalable, Realistic — validation scope. [[C-028 three-axis-validation]]
- **CSOK.** The Hungarian housing-subsidy running example. [[C-021 csok-running-example]]
- **PID / QEAA / EAA.** eIDAS attestation qualification levels. [[Q-004 attestation-qualification-levels]]
