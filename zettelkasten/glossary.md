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

## Method and scope
- **Three usage modes.** Consistency checking / error identification / DSE. [[C-020 three-usage-modes]]
- **DSE — design space exploration.** Generate valid completions or prove none exist. [[C-020 three-usage-modes]]
- **Three-axis validation.** Coverage / expressiveness / error detection. [[C-028 three-axis-validation]]
- **CORE-DISC.** Consistency, Diverse, Scalable, Realistic — validation scope. [[C-028 three-axis-validation]]
- **CSOK.** The Hungarian housing-subsidy running example. [[C-021 csok-running-example]]
- **PID / QEAA / EAA.** eIDAS attestation qualification levels. [[Q-004 attestation-qualification-levels]]
