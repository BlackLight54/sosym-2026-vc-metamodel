# Abstract

Emerging digital credential ecosystems allow persons and organizations to receive, hold, and selectively present cryptographically verifiable claims. Such ecosystems are deployed under diverse governance frameworks — from government-regulated EU Digital Identity Wallets to community-governed decentralized identity systems — whose design constraints span domain-level claim semantics, credential schema structure, and format-specific privacy capabilities. Constraints from W3C standards, EU implementing regulations, and community design guidelines interact across layers: their combined effect on a single credential design is not predictable from any individual source, and no existing tool checks their cross-layer consistency.

We present a three-layer metamodel for credential ecosystem design, grounded in the W3C Verifiable Credentials Data Model 2.0. The metamodel captures domain-level claim properties as information graphs, abstract credential schemas defining claim grouping and subject binding, and format-specific representations for concrete formats such as AnonCreds and JSON-LD Verifiable Credentials. Cross-layer constraints are formalized as graph predicates in the Refinery partial graph modeling framework, enabling automated consistency checking through design space exploration. We validate metamodel coverage against the W3C specification, constraint expressiveness against EU regulatory sources, and error detection against known credential design anti-patterns. The formalization reveals that constraints from different governance frameworks can be formally contradictory, and that multi-layer design errors become visible through the integrated model only when cross-layer constraints are jointly checked. The evaluation classifies eight eIDAS regulatory constraints against the metamodel, formalizes five structural anti-patterns as graph predicates, and surfaces two cross-layer design errors — a governance conflict and a format expressiveness gap — that no single-layer analysis detects. These results establish multi-layer formal modeling as a prerequisite for rigorous credential ecosystem design.

%% @META: == Binding claims (paper must deliver) %%
%% @META: 1. Three-layer metamodel with defined layers %%
%% @META: 2. Grounding in W3C VCDM 2.0 (mapping) %%
%% @META: 3. Cross-layer constraints as Refinery graph predicates %%
%% @META: 4. Automated consistency checking demonstration %%
%% @META: 5. Coverage validation vs. W3C specification %%
%% @META: 6. Expressiveness validation vs. W3C + EU regulatory sources [HIGH RISK] %%
%% @META: 7. Error detection vs. known anti-patterns %%
%% @META: 8. Formally contradictory cross-framework constraints [HIGH RISK — headline result] %%
%% @META: 9. Multi-layer errors invisible to single-layer inspection %%
%% @META: 10. Necessity/effectiveness argument for multi-layer modeling [risk depends on claim strength] %%
%% @META: == Title candidates %%
%% @META: A. "A Multi-Layer Metamodel for Verifiable Credential Ecosystem Design in Refinery" %%
%% @META: B. "Cross-Layer Constraint Formalization for Verifiable Credential Ecosystems: A Metamodel Grounded in W3C VCDM 2.0" %%
%% @META: C. "Metamodeling Verifiable Credential Ecosystems: Formalizing Cross-Layer Constraints with Partial Graph Predicates" %%
