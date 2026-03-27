## TL;DR

Multiple research works have proposed formal models for verifiable credential ecosystems, including formal VC definitions for selective disclosure, ontology/metamodel efforts for credential semantics, schema-transformation approaches, and formal treatments of revocation and delegation.

----

## Formal definitions for VCs

This section summarizes works that give formal, provable definitions or protocol-level formalizations of verifiable credentials and their security properties. These efforts target the core VC data model, selective disclosure, and the formal assembly of SSI specifications into verifiable protocols.

- **Formal model** Formal Linked‑Data verifiable credentials for selective disclosure were defined with provable properties and an open‑source implementation that supports selective disclosure across multiple credentials and combinations of certificates [1].  
- **Key features** The work includes a formal definition, selective‑disclosure semantics, proofs of the scheme’s properties, and a Web application demonstrating verifiable presentations [1].  
- **Who developed it** insufficient evidence for author names is available in the supplied metadata for that paper.  
- **Protocol formalization** A separate study formalized how to assemble W3C VC/DID and related SSI specs into an authentication protocol and used formal verification to check secrecy, authentication, and unlinkability properties [2].  
- **Who developed it** The protocol formalization and verification were presented by Braun et al. in the cited study [2].

----

## Ontologies and metamodels

This section covers ontology and metamodel efforts that characterize credentials, credential types, and e‑identity ecosystem elements using semantic formalisms such as OWL or BFO‑based modeling.

- **Occupation ontology** An ontological model (OccO extension) defines credential concepts, credential types, authorization logic, and relations linking credentials to occupations; it is BFO‑based and intended for semantic integration of credential data [3].  
- **Who developed it** The occupation credential ontology and definitions were developed by Beverley, McGill, Smith, Zheng, and De Colle [3].  
- **Semantic web mapping** Work advocating connecting verifiable credentials to the Semantic Web uses OWL‑2 to express credential schemas and mappings between VC schemas and web ontologies to enable expectation matching and automated interpretation [4].  
- **Who developed it** The semantic‑web mapping approach was developed by Sürmeli and Yilmaz [4].  
- **E‑identity semantic framework** A proposed minimal semantic framework captures self‑sovereign identity ecosystem elements and assessment criteria, aiming for extensibility and formal representational support for e‑identity management [5].  
- **Who developed it** The framework was described by C. Lepore in the supplied report [5].

----

## Schema languages and mappings

This section lists formal approaches for representing, exploring, and transforming credential schemas and JSON‑based credential formats to support interoperability across heterogeneous ecosystems.

- **Partial graph modeling** A design‑space method models credential schemas as information graphs and uses partial graph modeling to generate and explore diverse data presentation requirements and schema variants for VCs [6].  
- **Who developed it** The partial graph modeling approach was presented by Farkas, Péter, and Kocsis in the cited work [6].  
- **Decentralized schema transformation** A system for publishing transformation metadata (to translate between JSON credential schemas) and for building decentralized trust in those transformations via a distributed ledger was proposed to enable verifiers to interpret unknown credential schemas automatically [7].  
- **Key features** The proposal includes transformation publication, verifier‑side schema translation, and a decentralized web‑of‑trust for asserting issuer legitimacy and transformation trustworthiness [7].  
- **Who developed it** The transformation and decentralized verification system was developed by More, Grassberger, Horandner, and Klausner [7].

----

## Revocation delegation and policy metamodels

This section highlights formal models targeting credential lifecycle and governance aspects: revocation privacy properties, delegation semantics, and trust/policy metamodels for identity ecosystems.

- **Revocation formal definition** A formal characterization of desirable privacy properties of revocation mechanisms was proposed, together with CRSet, a non‑interactive revocation mechanism that encodes revocation data for private publication (evaluated with Ethereum blobs) [8].  
- **Key features** CRSet provides a formal privacy objective for issuer activity protection and a concrete mechanism that publishes periodic revocation encodings for offline verification [8].  
- **Who developed it** The CRSet mechanism and formalization were developed by Hoops, Gebele, and Matthes [8].  
- **Delegation metamodel** A formalization of delegation semantics introduced the concept of a Verifiable Mandate, embedded delegation constructs into an extended VC schema compatible with the W3C model, and operationalized policy enforcement via policy languages and registries [9].  
- **Key features** The work aligns a formal delegation model with VC schemas, defines a generalized VM schema, and demonstrates policy enforcement using Rego and Open Policy Agent for runtime checks [9].  
- **Who developed it** The delegation model and schema extensions were developed by Turkanović, Keršič, Horvat, Beron, and Čučko [9].  
- **Trust policy metamodel** A trust‑policy metamodel was proposed to structure policy models for credential systems, aiming at interoperability and formal policy design across identity ecosystems [10].  
- **Who developed it** The trust policy metamodel was proposed by Tith and Colin in the cited article [10].