## TL;DR

Several recent studies identify concrete technical and governance tensions between eIDAS 2.0 (OIDC‑centred) and Web3/SSI stacks, and propose semantic, protocol and architectural analyses to bridge them; few works apply formal verification beyond semantic/shacl modelling or property listings.  

----

## Technical conflicts

This section collects literature that identifies concrete technical or protocol incompatibilities among eIDAS 2.0, W3C Verifiable Credentials, Hyperledger AnonCreds/Indy, and related stacks and gives examples reported by authors. The cited papers focus on protocol mismatches, credential formats, signature and trust‑anchor differences rather than purely normative differences.

- **Biedermann et al** identify a core technical incompatibility: OIDC as assumed by eIDAS 2.0 and typical Web3 SSI stacks (DIDs/VCs on public ledgers) use different protocols and runtime assumptions, and the authors argue this creates an interoperability gap that requires a dedicated “digital identity bridge” to connect OIDC applications with Web3 credentials [1].  
- **Hyperledger Indy / AnonCreds interoperability** is examined via implemented cross‑network protocols; authors demonstrate that permissioned networks using Indy/Aries need an explicit distributed identity registry and trust‑discovery protocols to make selective‑disclosure, privacy‑preserving credentials usable across networks, showing practical mismatches between Indy credential flows and conventional PKI/qualified‑trust flows [2].  
- **Signature and DID method heterogeneity** is shown as a practical conflict: architectures that must support multiple DID Methods and multiple signature schemes need explicit extensibility mechanisms and semantic modelling to reconcile formats and verification steps, as implemented in SISSI and evaluated by the authors [3].  
- **Standards‑to‑properties gaps** appear when authors compile standards and regulation requirements into system properties; the resulting property mismatches (e.g., non‑repudiation vs selective disclosure) highlight where technical designs (AnonCreds selective disclosure) and regulatory expectations (qualified signatures, auditability) diverge [4].  

----

## Governance differences

This section summarises papers that analyse differences in trust, orchestration and governance models across eIDAS 2.0 and decentralised identity initiatives and points to where these produce conflicts for deployment.

- **Public orchestration versus federated or market models** is a central tension: stakeholder analyses show two competing ID wallet orchestration models — a government‑led public infrastructure versus competitive/federated provisioning — each implying different requirements for who controls identity anchors and trust lists [5].  
- **Contradiction between SSI ideals and eIDAS central trust** is repeatedly observed: several authors argue eIDAS 2.0’s move to enable wallets still relies on lists of qualified trust providers and governance anchors, which clashes with SSI governance assumptions of user control and decentralized trust anchors [6].  
- **Cross‑network trust establishment** requires governance artifacts (registries, reputational groups) to be created for permissioned blockchain interoperation; the authors implementing Indy/Aries found that networks must agree on registries and operational governance to accept each other’s credentials, otherwise technical bridging fails for lack of trust policy alignment [2].  

----

## Legal and regulatory conflicts

This section lists works that discuss legal tensions or compliance issues arising when mixing eIDAS 2.0 requirements with SSI/Web3 mechanisms, and gives cited examples of where regulation and technology clash.

- **eIDAS requirements versus selective disclosure** — normative analyses flag tension between eIDAS’s reliance on qualified trust services and signature formats and SSI’s selective disclosure / unlinkability goals, producing conflicts around auditability, qualified electronic signatures, and legal accountability [7] [8].  
- **Privacy notices and records in ledger contexts** — proposals to bring privacy receipts into DLT/eIDAS landscapes highlight missing standards for expressing consent and privacy notices in ledgered flows; the absence of such standards risks non‑compliance or siloed proprietary solutions [9].  
- **Cross‑border compliance and node technicalities** — surveys of eIDAS interoperability report organizational and technical weaknesses (e.g., node implementation variance, biometric and remote ID practices) that may be exacerbated when integrating heterogeneous SSI technologies into cross‑border use cases [8].  

If a specific legal conflict with ISO mDL or a formal mapping between ISO mDL and the other frameworks is required, there is insufficient evidence in the supplied literature to document direct analyses or concrete conflicts involving ISO mDL.

----

## Interoperability analyses and formal methods

This section summarises the analytic methods used across the literature to study conflicts and interoperability, and identifies where formal methods are applied or absent.

- **Semantic modelling and SHACL validation** is applied to map required credential shapes and to enable policy‑level checks across different VC encodings; SISSI uses RDF/SHACL to describe credential requirements and to enable multi‑DID/multi‑signature support in practice [3].  
- **Reference models and component analyses** are used to reason about interoperability dependencies (trust establishment, secure communication, credential transport); tutorials and surveys present layered reference models that make interoperability issues explicit and actionable [10].  
- **Architectural prototyping and protocol evaluation** serve as de‑facto formal analyses: implementations of Indy/Aries cross‑network protocols test trust discovery, membership credentials, and security/extensibility properties, producing concrete interoperability findings [2].  
- **Standards‑to‑property compilation** is used to translate regulatory requirements into system properties (privacy, non‑repudiation, unlinkability) and to surface conflicts where a technology meets some properties but violates others; this approach appears in comparative analyses of SSI properties versus eIDAS requirements [4].  

Formal formal‑methods such as theorem proving, model checking, or machine‑checked protocol proofs are not reported in the supplied corpus; the dominant analytic techniques are semantic validation (SHACL), reference modelling, property compilation, and prototype protocol evaluation. If explicit formal verification methods are required, there is insufficient evidence in the provided literature that such methods have been applied to these specific framework conflicts.