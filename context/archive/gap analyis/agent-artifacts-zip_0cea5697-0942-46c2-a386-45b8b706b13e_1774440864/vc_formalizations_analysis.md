## TL;DR

Two complementary formalization families appear in the corpus: RDF/Linked‑Data and graph/metamodel approaches for the data/schema level, and formal verification/specification approaches for protocol/workflow semantics. Each targets different VC facets: credential/schema structure, selective disclosure, predicate integration, and protocol security.

----

## Identified formalizations

The papers enumerate concrete formalizations and modeling approaches applied to the W3C VC data model and its extensions; the table below lists each item, its formalism, the parts of the VC model addressed, intended purpose, and the source that documents it. The entries are drawn only from the supplied literature and cite the paper that directly supports each row.

| Name and type | Formalism used | VC aspects covered | Purpose or use case | Key references |
|---|---:|---|---|---|
| RDF‑based semantics for selective disclosure and presentations (ontology/semantics) | RDF / Linked Data semantics (semantic mapping of VC + presentation semantics) | Mapping VC data model to RDF graphs; formal semantics for credential presentation and selective disclosure, integration with ZK proofs | Give a semantic account of VC presentations that supports selective disclosure and reasoning about ZK proof constructs | Braun and Käfer [1] |
| Formal Linked‑Data VC definition for selective disclosure (formal specification with proofs) | Formal Linked‑Data definition and cryptographic proof-style formalism (mathematical specification and proofs) | Linked‑Data VC structure, selective disclosure across single and multiple credentials, presentation generation | Provide a provably secure Linked‑Data VC construction supporting selective disclosure and composition of multiple credentials | Formalising Linked‑Data VCs paper [2] |
| Generic metamodel / partial graph modeling (metamodel) | Partial graph modeling / subject‑property‑value metamodel and predicate set | Credential schema space: subject/property/value patterns and generated schema models | Design‑space exploration for VC schema design and automated generation of schema variants | Farkas et al. [3] |
| Predicate data model and validation meta‑schema (metamodel / meta‑schema) | Predicate data model plus validation meta‑schema (serialization aligned to VC data model) | Representation of predicate expressions for p‑ABC and their serialization into VC‑compatible forms; validation rules | Standardize and ease integration of privacy‑preserving attribute‑based credentials with the VC model; enable validation tooling | García‑Rodríguez et al. [4] |
| SHACL shapes for credential graph constraints (constraint language) | SHACL (Shapes Constraint Language) applied to RDF representations of credentials | Constraints/shape descriptions of Linked Data credential graphs used to express required credential structure | Describe and validate required credentials in access‑control policies and interoperability checks | SHACL suitability in access control study [5] |
| Protocol/workflow formalization using ProVerif (formal verification model) | ProVerif / applied pi‑calculus style formal verification | Workflows combining VCs, DIDs, and Aries components; security and privacy properties of protocols that act on VCs | Mechanized verification of secrecy, authentication, and unlinkability for protocols that use the VC data model | Braun et al. (formal verification) [6] |

----

## Formal coverage details

Each formalization targets different layers of the VC ecosystem, so understanding coverage helps pick the right method. The RDF/Linked‑Data and SHACL items focus on data shape and semantics; metamodel and meta‑schema works focus on schema and predicate expressivity; formal verification targets protocol-level security properties.

- **RDF semantics coverage**  The RDF‑based semantics work maps the VC data model and credential presentation constructs into RDF/Linked‑Data semantics and adds a presentation model aimed at selective disclosure and integration with zero‑knowledge proof primitives [1].  
- **Linked‑Data formal specification**  The formal Linked‑Data VC paper gives a mathematical/formal definition of Linked‑Data VCs, proves selective‑disclosure properties, and describes composition across multiple credentials for presentation generation [2].  
- **Metamodel and graph modeling**  The partial graph metamodel expresses VC schemas as subject‑property‑value graphs and defines a predicate set to generate schema variants for design exploration [3].  
- **Predicate meta‑schema**  The predicate data model and validation meta‑schema formalize how p‑ABC predicates can be expressed and validated while remaining serializable to the VC data model; applied in a proof‑of‑concept integration [4].  
- **SHACL constraints**  SHACL is shown suitable for expressing required Linked‑Data credential shapes for access control rules and interoperability checks over RDF‑serialized credentials [5].  
- **Protocol verification**  ProVerif models are used to formalize the assembly of W3C VC/DID/Aries specifications into protocols and to verify secrecy, authentication, and unlinkability properties of those protocol workflows [6].

----

## Practical uses and selection

Match the formalization to the task you need to solve and consult the corresponding source for implementation details and proofs. The bullets give short guidance mapping use cases to formalisms, with the supporting citation.

- **If you need machine‑readable semantics and to reason about selective disclosure or ZK integrations, use the RDF‑based semantics approach** and follow the semantic presentation model described by Braun and Käfer [1].  
- **If you need provable cryptographic guarantees for Linked‑Data VCs and multi‑credential selective disclosure, adopt the formal Linked‑Data VC specification and proofs** from the Formalising Linked‑Data VCs work [2].  
- **If you are designing or exploring credential schema variants, use partial graph metamodeling to generate and compare schemas** as in Farkas et al. [3].  
- **If integrating privacy‑preserving attribute‑based credential predicates with the VC model, use the predicate data model and validation meta‑schema** proposed by García‑Rodríguez et al. [4].  
- **If you must express and validate structural constraints on RDF‑serialized credentials for policy or access control, encode shapes in SHACL** as recommended in the access‑control study [5].  
- **If your goal is to argue about protocol‑level security or privacy (e.g., unlinkability, authentication) of systems that use VCs, model the workflows in ProVerif and verify desired properties** following Braun et al.'s methodology [6].