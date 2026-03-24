# Abstract

%% @TODO: Quantify validation results when numbers are available (coverage count, constraints encoded, anti-patterns detected) %%
%% @TODO: Decide claim strength — "prerequisite" (necessity) vs. "effective" (sufficiency) — see binding claims analysis %%

Emerging digital credential ecosystems allow persons and organizations to receive, hold, and selectively present cryptographically verifiable claims. Such ecosystems are deployed under diverse governance frameworks — from government-regulated EU Digital Identity Wallets to community-governed decentralized identity systems — whose design constraints span domain-level claim semantics, credential schema structure, and format-specific privacy capabilities. These constraints are currently scattered across W3C standards, EU regulations, and community guidelines, with no formal means to check their consistency or detect cross-layer design errors.

We present a three-layer metamodel for credential ecosystem design, grounded in the W3C Verifiable Credentials Data Model 2.0. The metamodel captures domain-level claim properties as information graphs, abstract credential schemas defining claim grouping and subject binding, and format-specific representations for concrete formats such as AnonCreds and JSON-LD Verifiable Credentials. Cross-layer constraints are formalized as graph predicates in the Refinery partial graph modeling framework, enabling automated consistency checking through design space exploration. We validate metamodel coverage against the W3C specification, constraint expressiveness against W3C and EU regulatory sources, and error detection against known credential design anti-patterns. The formalization reveals that constraints from different governance frameworks can be formally contradictory, and that multi-layer design errors — undetectable by single-layer inspection — become visible through the integrated model. These results establish multi-layer formal modeling as a prerequisite for rigorous credential ecosystem design.

<!--
## Structure annotation

| Element     | Sentences                        |
|-------------|----------------------------------|
| Problem     | Para 1, S1–S2 (ecosystems + governance) |
| Gap         | Para 1, S3 (scattered, no formal means) |
| Contribution| Para 2, S1 (three-layer metamodel)       |
| Mechanism   | Para 2, S2–S3 (layers + Refinery)       |
| Evidence    | Para 2, S4–S5 (validation + results)    |
| Implication | Para 2, S6 (prerequisite)               |

## Self-critique flags

1. "prerequisite" in final sentence may overclaim — consider "effective" if necessity argument is not made in paper
2. Validation sentence (S4) is activity-reporting — convert to results when numbers available
3. ~217 words — within ACM sigconf range (150–250)

## Binding claims (paper must deliver)

1. Three-layer metamodel with defined layers
2. Grounding in W3C VCDM 2.0 (mapping)
3. Cross-layer constraints as Refinery graph predicates
4. Automated consistency checking demonstration
5. Coverage validation vs. W3C specification
6. Expressiveness validation vs. W3C + EU regulatory sources [HIGH RISK]
7. Error detection vs. known anti-patterns
8. Formally contradictory cross-framework constraints [HIGH RISK — headline result]
9. Multi-layer errors invisible to single-layer inspection
10. Necessity/effectiveness argument for multi-layer modeling [risk depends on claim strength]

## Title candidates

A. "A Multi-Layer Metamodel for Verifiable Credential Ecosystem Design in Refinery"
B. "Cross-Layer Constraint Formalization for Verifiable Credential Ecosystems: A Metamodel Grounded in W3C VCDM 2.0"
C. "Metamodeling Verifiable Credential Ecosystems: Formalizing Cross-Layer Constraints with Partial Graph Predicates"
-->
