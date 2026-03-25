# Formal Concept Analysis of Verifiable Credential supporting technologies

In this notebook, my aim is to perform a Formal Concept Analysis (FCA) of various technologies that support Verifiable Credentials (VCs). The goal is to identify and analyze the conceptual relationships between different protocols credential formats based on their features and capabilities. The core aims are:
- Identifying the similarities and differences between various VC supporting standards and technologies.
- Extracting inferences about how the attributes of these technologies relate to one another.
- Giving aid in the choice of appropriate technologies for specific use cases and requirements.
- Using rough set theory to identify interesting patterns and dependencies among the attributes of these technologies.

## Loading the data

```
=== Regular Data Files Loaded ===
Ecosystems: 8 rows, 7 columns
Protocols: 5 rows, 19 columns
Credential Formats: 6 rows, 18 columns
DIDs/VDRs: 9 rows, 18 columns

=== Sample: Ecosystems ===
```

```
           ecosystem governance_style primary_sector  region maturity_level  \
0           EUDI_ARF       Regulatory  Government_ID      EU         Pilots   
1  Hyperledger_Aries      Open_Source   Cross-sector  Global     Production   
2             Sovrin       Foundation   Cross-sector  Global     Production   

  trust_role_emphasis legal_identity_binding  
0    Verifier-centric                 Strong  
1      Holder-centric               Optional  
2      Issuer-centric               Optional
```

```
=== Binary Data Files Loaded ===
Ecosystems Binary: 8 rows, 25 attributes
Protocols Binary: 5 rows, 46 attributes
Credential Formats Binary: 6 rows, 27 attributes
DIDs Binary: 9 rows, 47 attributes

=== Sample: Credential Formats Binary ===
```

```
  credential_format  selective_disclosure  predicate_proofs    zkp  \
0         AnonCreds                  True              True   True   
1               mDL                  True             False  False   
2            VC-JWT                 False             False  False   

   revocation  batch_issuance  offline_verification  hardware_dependency  \
0        True           False                  True                False   
1        True           False                  True                 True   
2        True           False                 False                False   

   multi_credential_proofs  issuer_hiding  ...  crypto_pqr  \
0                     True          False  ...       False   
1                    False          False  ...       False   
2                    False          False  ...       False   

   established_standard  revocation-accumulator_based  revocation-list_based  \
0                 False                          True                  False   
1                  True                         False                   True   
2                 False                         False                   True   

   revocation-issuer_defined  binding_cryptographic  binding_biometric  \
0                      False                   True              False   
1                      False                  False               True   
2                      False                   True              False   

   identified  pseudonymous  anonymous  
0       False         False       True  
1        True         False      False  
2       False          True      False  

[3 rows x 27 columns]
```

```
=== Relationship Matrices Loaded ===
Ecosystem-Protocol: (9, 6)
Protocol-Credential Format: (5, 7)
Credential Format-DID: (6, 10)

=== Ecosystem-Protocol Relationships ===
```

```
           ecosystem  DIDComm_v1  DIDComm_v2  OID4VC  ISO18013-5  CHAPI
0           EUDI_ARF       False       False    True        True  False
1  Hyperledger_Aries        True        True   False       False  False
2             Sovrin        True       False   False       False  False
3            Trinsic       False        True    True       False  False
4              Lissi       False        True   False       False  False
5   Velocity_Network       False       False    True       False  False
6               EBSI       False       False    True       False  False
7              Cheqd       False        True   False       False  False
8             Veramo       False        True   False       False   True
```

## Formal Concept Analysis

Now we'll create formal contexts from the binary data and generate concept lattices for each domain. A formal context consists of:
- **Objects**: The entities (e.g., ecosystems, protocols)
- **Attributes**: The binary features (e.g., TRUE/FALSE properties)
- **Incidence relation**: Which objects have which attributes

```
Creating formal contexts...
✓ Ecosystems context: 8 objects, 24 attributes
✓ Protocols context: 5 objects, 45 attributes
✓ Credential Formats context: 6 objects, 26 attributes
✓ DIDs/VDRs context: 9 objects, 46 attributes
```

```
=== Credential Formats Formal Context ===
<Context object mapping 6 objects to 26 properties [91eda20d] at 0x15b2d6a0e10>
              |selective_disclosure|predicate_proofs|zkp|revocation|batch_issuance|offline_verification|hardware_dependency|multi_credential_proofs|issuer_hiding|long_term_signature|linked_secrets|JSON|JSON-LD|CBOR|crypto_elliptic_curve|crypto_pairing_based|crypto_pqr|established_standard|revocation-accumulator_based|revocation-list_based|revocation-issuer_defined|binding_cryptographic|binding_biometric|identified|pseudonymous|anonymous|
    AnonCreds |X                   |X               |X  |X         |              |X                   |                   |X                      |             |                   |X             |X   |       |    |                     |X                   |          |                    |X                           |                     |                         |X                    |                 |          |            |X        |
    mDL       |X                   |                |   |X         |              |X                   |X                  |                       |             |                   |              |    |       |X   |X                    |                    |          |X                   |                            |X                    |                         |                     |X                |X         |            |         |
    VC-JWT    |                    |                |   |X         |              |                    |                   |                       |             |X                  |              |X   |       |    |X                    |                    |          |                    |                            |X                    |                         |X                    |                 |          |X           |         |
    VC-JSON-LD|X                   |                |   |X         |              |X                   |                   |                       |             |X                  |              |    |X      |    |X                    |X                   |          |X                   |                            |X                    |                         |X                    |                 |          |            |X        |
    SD-JWT    |X                   |                |   |X         |              |                    |                   |                       |             |X                  |              |X   |       |    |X                    |                    |          |                    |                            |                     |X                        |X                    |                 |          |X           |         |
    BBS+      |X                   |X               |X  |X         |              |X                   |                   |X                      |X            |X                  |X             |    |X      |    |                     |X                   |          |                    |                            |X                    |                         |X                    |                 |          |            |X        |
```

### Generating Concept Lattices

A concept lattice represents all formal concepts and their hierarchical relationships. Each concept consists of:
- **Extent**: Set of objects sharing the attributes
- **Intent**: Set of attributes common to all objects in the extent

```
Generating concept lattices...
✓ Ecosystems lattice: 23 concepts
✓ Protocols lattice: 19 concepts
✓ Credential Formats lattice: 30 concepts
✓ DIDs/VDRs lattice: 46 concepts
```

### Understanding FCA Concepts

Before we dive into the lattices, let's understand the key concepts in Formal Concept Analysis:

#### **Formal Concept**
A formal concept is a pair (Extent, Intent):
- **Extent**: Set of objects that share certain attributes
- **Intent**: Set of attributes common to all those objects

Example: The concept `({AnonCreds, BBS+}, {selective_disclosure, zkp, predicate_proofs, ...})` means "AnonCreds and BBS+ are the credential formats that support selective disclosure, ZKP, and predicate proofs"

#### **Concept Lattice**
The hierarchical structure showing all concepts and their relationships. Concepts are ordered by:
- A ≤ B if extent(A) ⊆ extent(B) (equivalently, intent(A) ⊇ intent(B))
- More specific concepts (fewer objects, more attributes) are below
- More general concepts (more objects, fewer attributes) are above

#### **Supremum (Top/⊤)**
- The most general concept
- Extent: ALL objects in the context
- Intent: Attributes shared by EVERY object (often empty or minimal)
- Example: `({all credential formats}, {revocation})` - all formats support revocation

#### **Infimum (Bottom/⊥)**
- The most specific concept  
- Extent: Objects with ALL attributes (often empty)
- Intent: ALL attributes
- Example: `({}, {all attributes})` - no object has every single attribute

#### **Atoms**
- Minimal non-trivial concepts (directly above the bottom)
- Usually represent individual objects or minimal object groups
- Each atom captures the unique attribute set of an object
- Example: `({AnonCreds}, {selective_disclosure, zkp, predicate_proofs, ...})` is an atom

#### **Meet (∧) and Join (∨)**
- **Meet** of concepts A and B: Largest concept below both (intersection of extents)
- **Join** of concepts A and B: Smallest concept above both (intersection of intents)

```
=== PRACTICAL FCA DEMONSTRATION ===
Using the Credential Formats lattice as an example

1. SUPREMUM (Top Concept)
   ==================================================
   Extent (objects): ('AnonCreds', 'mDL', 'VC-JWT', 'VC-JSON-LD', 'SD-JWT', 'BBS+')
   Intent (attributes): ('revocation',)
   → This represents ALL credential formats and their common attributes
   → All 6 formats share these 1 attributes

2. INFIMUM (Bottom Concept)
   ==================================================
   Extent (objects): ()
   Intent (attributes): 26 attributes (ALL)
   → No single format has ALL 26 attributes
   → This is the most specific (impossible) concept

3. ATOMS (Minimal Non-trivial Concepts)
   ==================================================
   Number of atoms: 6
   → Each atom represents a credential format with its unique attributes

   Atom 1: ('AnonCreds',)
     Has 12 attributes
     Key attributes: ['selective_disclosure', 'predicate_proofs', 'zkp', 'revocation', 'offline_verification']...

   Atom 2: ('mDL',)
     Has 10 attributes
     Key attributes: ['selective_disclosure', 'revocation', 'offline_verification', 'hardware_dependency', 'CBOR']...

   Atom 3: ('VC-JWT',)
     Has 7 attributes
     Key attributes: ['revocation', 'long_term_signature', 'JSON', 'crypto_elliptic_curve', 'revocation-list_based']...

4. INTERMEDIATE CONCEPT EXAMPLE
   ==================================================
   Concept: Formats with 'selective_disclosure'
   Extent: ('AnonCreds', 'mDL', 'VC-JSON-LD', 'SD-JWT', 'BBS+')
   Intent: 2 common attributes
   → These formats share selective disclosure capability

5. CONCEPT HIERARCHY
   ==================================================
   Total concepts in lattice: 30
   Structure:
     - Top (Supremum): All objects, minimal attributes
     - Middle layers: Groupings by shared attributes
     - Atoms: Individual objects, maximal attributes
     - Bottom (Infimum): No objects, all attributes
```

```
=== CONCEPT LATTICE STRUCTURE ===

Visual representation of how concepts are organized:

                    ⊤ (Supremum)
              All objects, few attributes
                       /|\
                      / | \
                     /  |  \
              Intermediate Concepts
         (Groupings by shared attributes)
              /    |    |    \
             /     |    |     \
       Atom1   Atom2  Atom3  ... AtomN
    (Individual objects/minimal groups)
             \     |    |     /
              \    |    |    /
               \   |    |   /
                \  |    |  /
                    ⊥ (Infimum)
            No objects, all attributes

Reading the lattice:
  ↑ Going UP: More objects, fewer attributes (more general)
  ↓ Going DOWN: Fewer objects, more attributes (more specific)

For Credential Formats:
  ⊤ = All 6 formats, 1 common attributes
  Atoms = 6 individual formats
  ⊥ = No format has all 26 attributes
  Total concepts = 30 (all meaningful groupings)
```

```
=== NAVIGATING THE LATTICE: A PRACTICAL EXAMPLE ===

Question: Which credential formats support 'zkp'?

Answer: ('AnonCreds', 'BBS+')
→ Found 2 formats

What do they have in common?
→ 10 shared attributes:
   ['selective_disclosure', 'predicate_proofs', 'zkp', 'revocation', 'offline_verification', 'multi_credential_proofs', 'linked_secrets', 'crypto_pairing_based', 'binding_cryptographic', 'anonymous']...

This is a CONCEPT in the lattice:
  Extent: ('AnonCreds', 'BBS+')
  Intent: 10 attributes
  Interpretation: 'ZKP-supporting formats and their common features'

============================================================
NAVIGATING UP (toward supremum):
  → Formats with just 'revocation' (less restrictive)
     6 formats: ('AnonCreds', 'mDL', 'VC-JWT', 'VC-JSON-LD', 'SD-JWT', 'BBS+')
  → More objects, fewer attributes (more general)

NAVIGATING DOWN (toward infimum):
  → Formats with 'zkp' AND 'selective_disclosure' (more restrictive)
     2 formats: ('AnonCreds', 'BBS+')
  → Fewer objects, more attributes (more specific)

============================================================

KEY INSIGHT:
The lattice reveals NATURAL GROUPINGS based on shared attributes.
Each concept answers: 'What objects share these attributes?'
                  and: 'What attributes do these objects share?'
```

```
=== Sample Concepts from Credential Formats Lattice ===

Concept 1:
  Extent (objects): ()
  Intent (attributes): ('selective_disclosure', 'predicate_proofs', 'zkp', 'revocation', 'batch_issuance', 'offline_verification', 'hardware_dependency', 'multi_credential_proofs', 'issuer_hiding', 'long_term_signature', 'linked_secrets', 'JSON', 'JSON-LD', 'CBOR', 'crypto_elliptic_curve', 'crypto_pairing_based', 'crypto_pqr', 'established_standard', 'revocation-accumulator_based', 'revocation-list_based', 'revocation-issuer_defined', 'binding_cryptographic', 'binding_biometric', 'identified', 'pseudonymous', 'anonymous')

Concept 2:
  Extent (objects): ('AnonCreds',)
  Intent (attributes): ('selective_disclosure', 'predicate_proofs', 'zkp', 'revocation', 'offline_verification', 'multi_credential_proofs', 'linked_secrets', 'JSON', 'crypto_pairing_based', 'revocation-accumulator_based', 'binding_cryptographic', 'anonymous')

Concept 3:
  Extent (objects): ('mDL',)
  Intent (attributes): ('selective_disclosure', 'revocation', 'offline_verification', 'hardware_dependency', 'CBOR', 'crypto_elliptic_curve', 'established_standard', 'revocation-list_based', 'binding_biometric', 'identified')

Concept 4:
  Extent (objects): ('VC-JWT',)
  Intent (attributes): ('revocation', 'long_term_signature', 'JSON', 'crypto_elliptic_curve', 'revocation-list_based', 'binding_cryptographic', 'pseudonymous')

Concept 5:
  Extent (objects): ('VC-JSON-LD',)
  Intent (attributes): ('selective_disclosure', 'revocation', 'offline_verification', 'long_term_signature', 'JSON-LD', 'crypto_elliptic_curve', 'crypto_pairing_based', 'established_standard', 'revocation-list_based', 'binding_cryptographic', 'anonymous')

Concept 6:
  Extent (objects): ('SD-JWT',)
  Intent (attributes): ('selective_disclosure', 'revocation', 'long_term_signature', 'JSON', 'crypto_elliptic_curve', 'revocation-issuer_defined', 'binding_cryptographic', 'pseudonymous')

Concept 7:
  Extent (objects): ('BBS+',)
  Intent (attributes): ('selective_disclosure', 'predicate_proofs', 'zkp', 'revocation', 'offline_verification', 'multi_credential_proofs', 'issuer_hiding', 'long_term_signature', 'linked_secrets', 'JSON-LD', 'crypto_pairing_based', 'revocation-list_based', 'binding_cryptographic', 'anonymous')

Concept 8:
  Extent (objects): ('AnonCreds', 'SD-JWT')
  Intent (attributes): ('selective_disclosure', 'revocation', 'JSON', 'binding_cryptographic')

Concept 9:
  Extent (objects): ('AnonCreds', 'BBS+')
  Intent (attributes): ('selective_disclosure', 'predicate_proofs', 'zkp', 'revocation', 'offline_verification', 'multi_credential_proofs', 'linked_secrets', 'crypto_pairing_based', 'binding_cryptographic', 'anonymous')

Concept 10:
  Extent (objects): ('mDL', 'VC-JSON-LD')
  Intent (attributes): ('selective_disclosure', 'revocation', 'offline_verification', 'crypto_elliptic_curve', 'established_standard', 'revocation-list_based')
```

## Cross-Domain Relationship Analysis

Now we'll analyze the relationships between different domains using the relationship matrices. This helps us understand which technologies work together.

```
=== Ecosystem-Protocol Relationships ===

EUDI_ARF: OID4VC, ISO18013-5
Hyperledger_Aries: DIDComm_v1, DIDComm_v2
Sovrin: DIDComm_v1
Trinsic: DIDComm_v2, OID4VC
Lissi: DIDComm_v2
Velocity_Network: OID4VC
EBSI: OID4VC
Cheqd: DIDComm_v2
Veramo: DIDComm_v2, CHAPI

=== Protocol Usage Statistics ===
DIDComm_v1: 2 ecosystems - ['Hyperledger_Aries', 'Sovrin']
DIDComm_v2: 5 ecosystems - ['Hyperledger_Aries', 'Trinsic', 'Lissi', 'Cheqd', 'Veramo']
OID4VC: 4 ecosystems - ['EUDI_ARF', 'Trinsic', 'Velocity_Network', 'EBSI']
ISO18013-5: 1 ecosystems - ['EUDI_ARF']
CHAPI: 1 ecosystems - ['Veramo']
```

```
=== Protocol-Credential Format Compatibility ===

DIDComm_v1: AnonCreds, VC-JWT, VC-JSON-LD, BBS+
DIDComm_v2: AnonCreds, VC-JWT, VC-JSON-LD, SD-JWT, BBS+
OID4VC: VC-JWT, VC-JSON-LD, SD-JWT
ISO18013-5: mDL
CHAPI: VC-JWT, VC-JSON-LD, SD-JWT, BBS+

=== Credential Format Support Statistics ===
AnonCreds: 2 protocols - ['DIDComm_v1', 'DIDComm_v2']
mDL: 1 protocols - ['ISO18013-5']
VC-JWT: 4 protocols - ['DIDComm_v1', 'DIDComm_v2', 'OID4VC', 'CHAPI']
VC-JSON-LD: 4 protocols - ['DIDComm_v1', 'DIDComm_v2', 'OID4VC', 'CHAPI']
SD-JWT: 3 protocols - ['DIDComm_v2', 'OID4VC', 'CHAPI']
BBS+: 3 protocols - ['DIDComm_v1', 'DIDComm_v2', 'CHAPI']
```

```
=== Credential Format-DID Compatibility ===

AnonCreds: Indy, Cheqd
mDL: did:key
VC-JWT: Indy, EBSI_DID_Registry, Cheqd, Velocity_Ledger, did:web, did:key, did:ethr, did:ion, did:peer
VC-JSON-LD: Indy, EBSI_DID_Registry, Cheqd, Velocity_Ledger, did:web, did:key, did:ethr, did:ion, did:peer
SD-JWT: Indy, EBSI_DID_Registry, Cheqd, Velocity_Ledger, did:web, did:key, did:ethr, did:ion, did:peer
BBS+: Indy, EBSI_DID_Registry, Cheqd, Velocity_Ledger, did:web, did:key, did:ethr, did:ion, did:peer

=== DID Method Support Statistics ===
Indy: 5 formats - ['AnonCreds', 'VC-JWT', 'VC-JSON-LD', 'SD-JWT', 'BBS+']
EBSI_DID_Registry: 4 formats - ['VC-JWT', 'VC-JSON-LD', 'SD-JWT', 'BBS+']
Cheqd: 5 formats - ['AnonCreds', 'VC-JWT', 'VC-JSON-LD', 'SD-JWT', 'BBS+']
Velocity_Ledger: 4 formats - ['VC-JWT', 'VC-JSON-LD', 'SD-JWT', 'BBS+']
did:web: 4 formats - ['VC-JWT', 'VC-JSON-LD', 'SD-JWT', 'BBS+']
did:key: 5 formats - ['mDL', 'VC-JWT', 'VC-JSON-LD', 'SD-JWT', 'BBS+']
did:ethr: 4 formats - ['VC-JWT', 'VC-JSON-LD', 'SD-JWT', 'BBS+']
did:ion: 4 formats - ['VC-JWT', 'VC-JSON-LD', 'SD-JWT', 'BBS+']
did:peer: 4 formats - ['VC-JWT', 'VC-JSON-LD', 'SD-JWT', 'BBS+']
```

## Combined Ecosystem Configuration Context

Now we'll create a combined formal context that shows each ecosystem with all its **inherited attributes** from the protocols, credential formats, and DIDs it supports. This allows us to infer capabilities like "Hyperledger Aries supports predicate-based selective disclosure because it uses AnonCreds."

```
Building combined ecosystem configuration context...

=== Ecosystem Configuration Summary ===

EUDI_ARF: 87 inherited attributes
Hyperledger_Aries: 86 inherited attributes
Sovrin: 80 inherited attributes
Trinsic: 90 inherited attributes
Lissi: 81 inherited attributes
Velocity_Network: 72 inherited attributes
EBSI: 72 inherited attributes
Veramo: 90 inherited attributes

✓ Combined context built successfully
```

```
=== COMBINED ECOSYSTEM CONFIGURATION CONTEXT ===
Objects: 8 ecosystems
Attributes: 114 inherited attributes

This context shows all capabilities inherited from protocols, credential formats, and DIDs

<Context object mapping 8 objects to 114 properties [368ca5b3] at 0x15b2d656190>
                     |CBOR|JSON|JSON-LD|algorithm_locked_to_identifier|anonymous|availability_at_least_community|availability_at_least_enterprise|availability_at_least_high|availability_at_least_immediate|availability_at_most_community|availability_at_most_enterprise|availability_at_most_high|availability_at_most_immediate|binding_application|binding_biometric|binding_browser|binding_cryptographic|binding_device|binding_secure_element|comm_proximity|comm_remote|compliance_experimental|compliance_industry|compliance_regulatory|credential_chaining|crypto_elliptic_curve|crypto_pairing_based|data_residency_device|data_residency_domain|data_residency_global|data_residency_regional|decentralization_consortium|decentralization_federated|decentralization_local|decentralization_permissionless|decentralization_web_federated|delivery_async|delivery_sync|discovery_oidc|discovery_out_of_band|discovery_reader_cert|discovery_url_handler|established_standard|hardware_dependency|identified|incentive_fee|incentive_free|incentive_membership|incentive_token|init_holder_driven|init_peer_driven|init_verifier_driven|interop_closed|interop_open|interop_selective|issuer_hiding|ledger_based|linked_secrets|locked|long_term_signature|maturity_emerging|maturity_legacy|maturity_pilot|maturity_production|mediator_optional|multi_credential_proofs|multi_party|offline_verification|on_chain_full_document|on_chain_metadata|peer_to_peer|permissioned|portable|predicate_proofs|pseudonymous|requires_return_route|resolution_at_least_fast|resolution_at_least_instant|resolution_at_least_medium|resolution_at_most_fast|resolution_at_most_instant|resolution_at_most_medium|revocation|revocation-accumulator_based|revocation-issuer_defined|revocation-list_based|security_authenticated_encryption|security_browser_origin|security_device_auth|security_mutual_tls|selective_disclosure|standard_ietf|standard_iso|standard_oidf|standard_w3c_community|stateful|stateless|supports_algorithm_upgrade|transport_browser|transport_http|transport_multi_channel|transport_nfc_ble|trust_blockchain|trust_ledger_backed|trust_peer_to_peer|trust_self_sovereign|trust_web_based|update_immutable|update_mutable|wallet_browser_based|wallet_device_bound|wallet_flexible|wallet_non_custodial|zkp|
    EUDI_ARF         |X   |X   |X      |X                             |X        |X                              |X                               |X                         |X                              |X                             |X                              |X                        |X                             |X                  |X                |               |X                    |              |X                     |X             |X          |X                      |X                  |X                    |                   |X                    |X                   |X                    |X                    |X                    |X                      |X                          |X                         |X                     |X                              |X                             |              |X            |X             |                     |X                    |                     |X                   |X                  |X         |X            |X             |X                   |X              |X                 |                |X                   |X             |            |X                |             |X           |              |X     |X                  |                 |               |X             |X                  |X                |                       |           |X                   |X                     |X                |X           |X           |X       |                |X           |                     |X                       |X                          |X                         |X                      |X                         |X                        |X         |                            |X                        |X                    |                                 |                       |X                   |X                  |X                   |             |X           |X            |                      |        |X        |X                         |                 |X             |                       |X                |X               |X                  |X                 |X                   |X              |X               |X             |                    |X                  |X              |                    |   |
    Hyperledger_Aries|    |X   |X      |X                             |X        |X                              |X                               |X                         |X                              |X                             |X                              |X                        |X                             |                   |                 |               |X                    |X             |                      |              |X          |X                      |X                  |X                    |X                  |X                    |X                   |X                    |X                    |X                    |X                      |X                          |X                         |X                     |X                              |X                             |X             |             |              |X                    |                     |                     |X                   |                   |          |X            |X             |X                   |X              |X                 |X               |                    |              |X           |                 |X            |X           |X             |X     |X                  |X                |X              |              |                   |X                |X                      |X          |X                   |X                     |X                |X           |X           |X       |X               |X           |X                    |X                       |X                          |X                         |X                      |X                         |X                        |X         |X                           |X                        |X                    |X                                |                       |                    |                   |X                   |X            |            |             |X                     |X       |         |X                         |                 |X             |X                      |                 |X               |X                  |X                 |X                   |X              |X               |X             |                    |                   |               |X                   |X  |
    Sovrin           |    |X   |X      |X                             |X        |X                              |X                               |X                         |X                              |X                             |X                              |X                        |X                             |                   |                 |               |X                    |X             |                      |              |X          |X                      |X                  |X                    |X                  |X                    |X                   |X                    |X                    |X                    |X                      |X                          |X                         |X                     |X                              |X                             |X             |             |              |X                    |                     |                     |X                   |                   |          |X            |X             |X                   |X              |                  |X               |                    |              |X           |                 |X            |X           |X             |X     |X                  |                 |X              |              |                   |                 |X                      |X          |X                   |X                     |X                |X           |X           |X       |X               |X           |X                    |X                       |X                          |X                         |X                      |X                         |X                        |X         |X                           |                         |X                    |X                                |                       |                    |                   |X                   |             |            |             |X                     |X       |         |X                         |                 |              |X                      |                 |X               |X                  |X                 |X                   |X              |X               |X             |                    |                   |               |X                   |X  |
    Trinsic          |    |X   |X      |X                             |X        |X                              |X                               |X                         |X                              |X                             |X                              |X                        |X                             |X                  |                 |               |X                    |X             |                      |              |X          |X                      |X                  |X                    |X                  |X                    |X                   |X                    |X                    |X                    |X                      |X                          |X                         |X                     |X                              |X                             |X             |X            |X             |X                    |                     |                     |X                   |                   |          |X            |X             |X                   |X              |X                 |                |                    |              |X           |X                |X            |X           |X             |X     |X                  |X                |               |X             |                   |X                |X                      |X          |X                   |X                     |X                |X           |X           |X       |X               |X           |                     |X                       |X                          |X                         |X                      |X                         |X                        |X         |X                           |X                        |X                    |X                                |                       |                    |X                  |X                   |X            |            |X            |                      |X       |X        |X                         |                 |X             |                       |                 |X               |X                  |X                 |X                   |X              |X               |X             |                    |                   |X              |X                   |X  |
    Lissi            |    |X   |X      |X                             |X        |X                              |X                               |X                         |X                              |X                             |X                              |X                        |X                             |                   |                 |               |X                    |X             |                      |              |X          |X                      |X                  |X                    |X                  |X                    |X                   |X                    |X                    |X                    |X                      |X                          |X                         |X                     |X                              |X                             |X             |             |              |X                    |                     |                     |X                   |                   |          |X            |X             |X                   |X              |X                 |                |                    |              |X           |                 |X            |X           |X             |X     |X                  |X                |               |              |                   |X                |X                      |X          |X                   |X                     |X                |X           |X           |X       |X               |X           |                     |X                       |X                          |X                         |X                      |X                         |X                        |X         |X                           |X                        |X                    |X                                |                       |                    |                   |X                   |X            |            |             |                      |X       |         |X                         |                 |X             |                       |                 |X               |X                  |X                 |X                   |X              |X               |X             |                    |                   |               |X                   |X  |
    Velocity_Network |    |X   |X      |X                             |X        |X                              |X                               |X                         |X                              |X                             |X                              |X                        |X                             |X                  |                 |               |X                    |              |                      |              |X          |X                      |X                  |X                    |                   |X                    |X                   |X                    |X                    |X                    |X                      |X                          |X                         |X                     |X                              |X                             |              |X            |X             |                     |                     |                     |X                   |                   |          |X            |X             |X                   |X              |X                 |                |                    |              |            |X                |             |X           |              |X     |X                  |                 |               |X             |                   |X                |                       |           |X                   |X                     |X                |            |X           |X       |                |X           |                     |X                       |X                          |X                         |X                      |X                         |X                        |X         |                            |X                        |X                    |                                 |                       |                    |X                  |X                   |             |            |X            |                      |        |X        |X                         |                 |X             |                       |                 |X               |X                  |X                 |X                   |X              |X               |X             |                    |                   |X              |                    |   |
    EBSI             |    |X   |X      |X                             |X        |X                              |X                               |X                         |X                              |X                             |X                              |X                        |X                             |X                  |                 |               |X                    |              |                      |              |X          |X                      |X                  |X                    |                   |X                    |X                   |X                    |X                    |X                    |X                      |X                          |X                         |X                     |X                              |X                             |              |X            |X             |                     |                     |                     |X                   |                   |          |X            |X             |X                   |X              |X                 |                |                    |              |            |X                |             |X           |              |X     |X                  |                 |               |X             |                   |X                |                       |           |X                   |X                     |X                |            |X           |X       |                |X           |                     |X                       |X                          |X                         |X                      |X                         |X                        |X         |                            |X                        |X                    |                                 |                       |                    |X                  |X                   |             |            |X            |                      |        |X        |X                         |                 |X             |                       |                 |X               |X                  |X                 |X                   |X              |X               |X             |                    |                   |X              |                    |   |
    Veramo           |    |X   |X      |X                             |X        |X                              |X                               |X                         |X                              |X                             |X                              |X                        |X                             |                   |                 |X              |X                    |X             |                      |              |X          |X                      |X                  |X                    |X                  |X                    |X                   |X                    |X                    |X                    |X                      |X                          |X                         |X                     |X                              |X                             |X             |X            |              |X                    |                     |X                    |X                   |                   |          |X            |X             |X                   |X              |X                 |                |                    |              |X           |                 |X            |X           |X             |X     |X                  |X                |               |X             |                   |X                |X                      |X          |X                   |X                     |X                |X           |X           |X       |X               |X           |                     |X                       |X                          |X                         |X                      |X                         |X                        |X         |X                           |X                        |X                    |X                                |X                      |                    |                   |X                   |X            |            |             |X                     |X       |X        |X                         |X                |X             |                       |                 |X               |X                  |X                 |X                   |X              |X               |X             |X                   |                   |               |X                   |X  |
```

```
=== Example Capability Inferences ===

1. Ecosystems supporting predicate proofs:
   ('Hyperledger_Aries', 'Sovrin', 'Trinsic', 'Lissi', 'Veramo')
   (inherited from AnonCreds and/or BBS+ credential formats)

2. Ecosystems supporting Zero-Knowledge Proofs:
   ('Hyperledger_Aries', 'Sovrin', 'Trinsic', 'Lissi', 'Veramo')
   (inherited from AnonCreds and/or BBS+ credential formats)

3. Ecosystems supporting BOTH selective disclosure AND ZKP:
   ('Hyperledger_Aries', 'Sovrin', 'Trinsic', 'Lissi', 'Veramo')
   (inherited from privacy-preserving credential formats)

4. Ecosystems supporting peer-to-peer communication:
   ('EUDI_ARF', 'Hyperledger_Aries', 'Sovrin', 'Trinsic', 'Lissi', 'Veramo')
   (inherited from DIDComm protocols)

5. Ecosystems compatible with ledger-based DIDs:
   ('EUDI_ARF', 'Hyperledger_Aries', 'Sovrin', 'Trinsic', 'Lissi', 'Velocity_Network', 'EBSI', 'Veramo')
   (inherited from DID methods they support)
```

```
=== Hyperledger_Aries Capability Profile ===

Technology Stack:
  Protocols: DIDComm_v1, DIDComm_v2
  Credential Formats: BBS+, VC-JSON-LD, SD-JWT, VC-JWT, AnonCreds
  DID Methods: 9 methods supported

Inherited Capabilities:
  From Protocols: 21 attributes
    ✓ Peer-to-peer communication
    ✓ Stateful sessions
    ✓ Multi-party interactions

  From Credential Formats: 20 attributes
    ✓ Selective disclosure
    ✓ Zero-knowledge proofs
    ✓ Predicate proofs
    ✓ Offline verification

  From DID Methods: 45 attributes
    ✓ Ledger-based DIDs supported
    ✓ Portable DIDs supported
    ✓ Instant resolution DIDs supported

  Total: 86 inherited attributes

============================================================

=== EUDI_ARF Capability Profile ===

Technology Stack:
  Protocols: OID4VC, ISO18013-5
  Credential Formats: mDL, SD-JWT, VC-JSON-LD, VC-JWT
  DID Methods: 9 methods supported

Inherited Capabilities:
  From Protocols: 24 attributes
    ✓ Peer-to-peer communication

  From Credential Formats: 18 attributes
    ✓ Selective disclosure
    ✓ Offline verification

  From DID Methods: 45 attributes
    ✓ Ledger-based DIDs supported
    ✓ Portable DIDs supported
    ✓ Instant resolution DIDs supported

  Total: 87 inherited attributes

============================================================

=== Trinsic Capability Profile ===

Technology Stack:
  Protocols: DIDComm_v2, OID4VC
  Credential Formats: BBS+, VC-JSON-LD, SD-JWT, VC-JWT, AnonCreds
  DID Methods: 9 methods supported

Inherited Capabilities:
  From Protocols: 25 attributes
    ✓ Peer-to-peer communication
    ✓ Stateful sessions
    ✓ Multi-party interactions

  From Credential Formats: 20 attributes
    ✓ Selective disclosure
    ✓ Zero-knowledge proofs
    ✓ Predicate proofs
    ✓ Offline verification

  From DID Methods: 45 attributes
    ✓ Ledger-based DIDs supported
    ✓ Portable DIDs supported
    ✓ Instant resolution DIDs supported

  Total: 90 inherited attributes
```

```
Generating concept lattice for combined ecosystem configurations...
Concept 1:
  Extent (objects): ()
  Intent (attributes): ('CBOR', 'JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_application', 'binding_biometric', 'binding_browser', 'binding_cryptographic', 'binding_device', 'binding_secure_element', 'comm_proximity', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'credential_chaining', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_async', 'delivery_sync', 'discovery_oidc', 'discovery_out_of_band', 'discovery_reader_cert', 'discovery_url_handler', 'established_standard', 'hardware_dependency', 'identified', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'init_peer_driven', 'init_verifier_driven', 'interop_closed', 'interop_open', 'interop_selective', 'issuer_hiding', 'ledger_based', 'linked_secrets', 'locked', 'long_term_signature', 'maturity_emerging', 'maturity_legacy', 'maturity_pilot', 'maturity_production', 'mediator_optional', 'multi_credential_proofs', 'multi_party', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'predicate_proofs', 'pseudonymous', 'requires_return_route', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-accumulator_based', 'revocation-issuer_defined', 'revocation-list_based', 'security_authenticated_encryption', 'security_browser_origin', 'security_device_auth', 'security_mutual_tls', 'selective_disclosure', 'standard_ietf', 'standard_iso', 'standard_oidf', 'standard_w3c_community', 'stateful', 'stateless', 'supports_algorithm_upgrade', 'transport_browser', 'transport_http', 'transport_multi_channel', 'transport_nfc_ble', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_browser_based', 'wallet_device_bound', 'wallet_flexible', 'wallet_non_custodial', 'zkp')

Concept 2:
  Extent (objects): ('EUDI_ARF',)
  Intent (attributes): ('CBOR', 'JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_application', 'binding_biometric', 'binding_cryptographic', 'binding_secure_element', 'comm_proximity', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_sync', 'discovery_oidc', 'discovery_reader_cert', 'established_standard', 'hardware_dependency', 'identified', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'init_verifier_driven', 'interop_closed', 'interop_selective', 'ledger_based', 'locked', 'long_term_signature', 'maturity_pilot', 'maturity_production', 'mediator_optional', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-issuer_defined', 'revocation-list_based', 'security_device_auth', 'security_mutual_tls', 'selective_disclosure', 'standard_iso', 'standard_oidf', 'stateless', 'supports_algorithm_upgrade', 'transport_http', 'transport_nfc_ble', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_device_bound', 'wallet_flexible')

Concept 3:
  Extent (objects): ('Hyperledger_Aries',)
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'binding_device', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'credential_chaining', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_async', 'discovery_out_of_band', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'init_peer_driven', 'interop_open', 'issuer_hiding', 'ledger_based', 'linked_secrets', 'locked', 'long_term_signature', 'maturity_emerging', 'maturity_legacy', 'mediator_optional', 'multi_credential_proofs', 'multi_party', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'predicate_proofs', 'pseudonymous', 'requires_return_route', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-accumulator_based', 'revocation-issuer_defined', 'revocation-list_based', 'security_authenticated_encryption', 'selective_disclosure', 'standard_ietf', 'standard_w3c_community', 'stateful', 'supports_algorithm_upgrade', 'transport_http', 'transport_multi_channel', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_non_custodial', 'zkp')

Concept 4:
  Extent (objects): ('Trinsic',)
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_application', 'binding_cryptographic', 'binding_device', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'credential_chaining', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_async', 'delivery_sync', 'discovery_oidc', 'discovery_out_of_band', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'interop_open', 'interop_selective', 'issuer_hiding', 'ledger_based', 'linked_secrets', 'locked', 'long_term_signature', 'maturity_emerging', 'maturity_pilot', 'mediator_optional', 'multi_credential_proofs', 'multi_party', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'predicate_proofs', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-accumulator_based', 'revocation-issuer_defined', 'revocation-list_based', 'security_authenticated_encryption', 'security_mutual_tls', 'selective_disclosure', 'standard_ietf', 'standard_oidf', 'stateful', 'stateless', 'supports_algorithm_upgrade', 'transport_http', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_flexible', 'wallet_non_custodial', 'zkp')

Concept 5:
  Extent (objects): ('Veramo',)
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_browser', 'binding_cryptographic', 'binding_device', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'credential_chaining', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_async', 'delivery_sync', 'discovery_out_of_band', 'discovery_url_handler', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'interop_open', 'issuer_hiding', 'ledger_based', 'linked_secrets', 'locked', 'long_term_signature', 'maturity_emerging', 'maturity_pilot', 'mediator_optional', 'multi_credential_proofs', 'multi_party', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'predicate_proofs', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-accumulator_based', 'revocation-issuer_defined', 'revocation-list_based', 'security_authenticated_encryption', 'security_browser_origin', 'selective_disclosure', 'standard_ietf', 'standard_w3c_community', 'stateful', 'stateless', 'supports_algorithm_upgrade', 'transport_browser', 'transport_http', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_browser_based', 'wallet_non_custodial', 'zkp')

Concept 6:
  Extent (objects): ('EUDI_ARF', 'Trinsic')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_application', 'binding_cryptographic', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_sync', 'discovery_oidc', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'interop_selective', 'ledger_based', 'locked', 'long_term_signature', 'maturity_pilot', 'mediator_optional', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-issuer_defined', 'revocation-list_based', 'security_mutual_tls', 'selective_disclosure', 'standard_oidf', 'stateless', 'supports_algorithm_upgrade', 'transport_http', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_flexible')

Concept 7:
  Extent (objects): ('Hyperledger_Aries', 'Sovrin')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'binding_device', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'credential_chaining', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_async', 'discovery_out_of_band', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_peer_driven', 'interop_open', 'issuer_hiding', 'ledger_based', 'linked_secrets', 'locked', 'long_term_signature', 'maturity_legacy', 'multi_credential_proofs', 'multi_party', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'predicate_proofs', 'pseudonymous', 'requires_return_route', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-accumulator_based', 'revocation-list_based', 'security_authenticated_encryption', 'selective_disclosure', 'standard_w3c_community', 'stateful', 'supports_algorithm_upgrade', 'transport_multi_channel', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_non_custodial', 'zkp')

Concept 8:
  Extent (objects): ('Hyperledger_Aries', 'Veramo')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'binding_device', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'credential_chaining', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_async', 'discovery_out_of_band', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'interop_open', 'issuer_hiding', 'ledger_based', 'linked_secrets', 'locked', 'long_term_signature', 'maturity_emerging', 'mediator_optional', 'multi_credential_proofs', 'multi_party', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'predicate_proofs', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-accumulator_based', 'revocation-issuer_defined', 'revocation-list_based', 'security_authenticated_encryption', 'selective_disclosure', 'standard_ietf', 'standard_w3c_community', 'stateful', 'supports_algorithm_upgrade', 'transport_http', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_non_custodial', 'zkp')

Concept 9:
  Extent (objects): ('Trinsic', 'Veramo')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'binding_device', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'credential_chaining', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_async', 'delivery_sync', 'discovery_out_of_band', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'interop_open', 'issuer_hiding', 'ledger_based', 'linked_secrets', 'locked', 'long_term_signature', 'maturity_emerging', 'maturity_pilot', 'mediator_optional', 'multi_credential_proofs', 'multi_party', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'predicate_proofs', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-accumulator_based', 'revocation-issuer_defined', 'revocation-list_based', 'security_authenticated_encryption', 'selective_disclosure', 'standard_ietf', 'stateful', 'stateless', 'supports_algorithm_upgrade', 'transport_http', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_non_custodial', 'zkp')

Concept 10:
  Extent (objects): ('EUDI_ARF', 'Trinsic', 'Veramo')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_sync', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'ledger_based', 'locked', 'long_term_signature', 'maturity_pilot', 'mediator_optional', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-issuer_defined', 'revocation-list_based', 'selective_disclosure', 'stateless', 'supports_algorithm_upgrade', 'transport_http', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable')

Concept 11:
  Extent (objects): ('Hyperledger_Aries', 'Sovrin', 'Veramo')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'binding_device', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'credential_chaining', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_async', 'discovery_out_of_band', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'interop_open', 'issuer_hiding', 'ledger_based', 'linked_secrets', 'locked', 'long_term_signature', 'multi_credential_proofs', 'multi_party', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'predicate_proofs', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-accumulator_based', 'revocation-list_based', 'security_authenticated_encryption', 'selective_disclosure', 'standard_w3c_community', 'stateful', 'supports_algorithm_upgrade', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_non_custodial', 'zkp')

Concept 12:
  Extent (objects): ('EUDI_ARF', 'Trinsic', 'Velocity_Network', 'EBSI')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_application', 'binding_cryptographic', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_sync', 'discovery_oidc', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'interop_selective', 'ledger_based', 'locked', 'long_term_signature', 'maturity_pilot', 'mediator_optional', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'permissioned', 'portable', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-issuer_defined', 'revocation-list_based', 'security_mutual_tls', 'selective_disclosure', 'standard_oidf', 'stateless', 'supports_algorithm_upgrade', 'transport_http', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_flexible')

Concept 13:
  Extent (objects): ('Hyperledger_Aries', 'Trinsic', 'Lissi', 'Veramo')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'binding_device', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'credential_chaining', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_async', 'discovery_out_of_band', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'interop_open', 'issuer_hiding', 'ledger_based', 'linked_secrets', 'locked', 'long_term_signature', 'maturity_emerging', 'mediator_optional', 'multi_credential_proofs', 'multi_party', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'predicate_proofs', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-accumulator_based', 'revocation-issuer_defined', 'revocation-list_based', 'security_authenticated_encryption', 'selective_disclosure', 'standard_ietf', 'stateful', 'supports_algorithm_upgrade', 'transport_http', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_non_custodial', 'zkp')

Concept 14:
  Extent (objects): ('EUDI_ARF', 'Hyperledger_Aries', 'Trinsic', 'Lissi', 'Veramo')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'ledger_based', 'locked', 'long_term_signature', 'mediator_optional', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-issuer_defined', 'revocation-list_based', 'selective_disclosure', 'supports_algorithm_upgrade', 'transport_http', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable')

Concept 15:
  Extent (objects): ('EUDI_ARF', 'Trinsic', 'Velocity_Network', 'EBSI', 'Veramo')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_sync', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'ledger_based', 'locked', 'long_term_signature', 'maturity_pilot', 'mediator_optional', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'permissioned', 'portable', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-issuer_defined', 'revocation-list_based', 'selective_disclosure', 'stateless', 'supports_algorithm_upgrade', 'transport_http', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable')

Concept 16:
  Extent (objects): ('Hyperledger_Aries', 'Sovrin', 'Trinsic', 'Lissi', 'Veramo')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'binding_device', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'credential_chaining', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'delivery_async', 'discovery_out_of_band', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'interop_open', 'issuer_hiding', 'ledger_based', 'linked_secrets', 'locked', 'long_term_signature', 'multi_credential_proofs', 'multi_party', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'predicate_proofs', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-accumulator_based', 'revocation-list_based', 'security_authenticated_encryption', 'selective_disclosure', 'stateful', 'supports_algorithm_upgrade', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable', 'wallet_non_custodial', 'zkp')

Concept 17:
  Extent (objects): ('EUDI_ARF', 'Hyperledger_Aries', 'Sovrin', 'Trinsic', 'Lissi', 'Veramo')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'ledger_based', 'locked', 'long_term_signature', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'peer_to_peer', 'permissioned', 'portable', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-list_based', 'selective_disclosure', 'supports_algorithm_upgrade', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable')

Concept 18:
  Extent (objects): ('EUDI_ARF', 'Hyperledger_Aries', 'Trinsic', 'Lissi', 'Velocity_Network', 'EBSI', 'Veramo')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'init_holder_driven', 'ledger_based', 'locked', 'long_term_signature', 'mediator_optional', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'permissioned', 'portable', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-issuer_defined', 'revocation-list_based', 'selective_disclosure', 'supports_algorithm_upgrade', 'transport_http', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable')

Concept 19:
  Extent (objects): ('EUDI_ARF', 'Hyperledger_Aries', 'Sovrin', 'Trinsic', 'Lissi', 'Velocity_Network', 'EBSI', 'Veramo')
  Intent (attributes): ('JSON', 'JSON-LD', 'algorithm_locked_to_identifier', 'anonymous', 'availability_at_least_community', 'availability_at_least_enterprise', 'availability_at_least_high', 'availability_at_least_immediate', 'availability_at_most_community', 'availability_at_most_enterprise', 'availability_at_most_high', 'availability_at_most_immediate', 'binding_cryptographic', 'comm_remote', 'compliance_experimental', 'compliance_industry', 'compliance_regulatory', 'crypto_elliptic_curve', 'crypto_pairing_based', 'data_residency_device', 'data_residency_domain', 'data_residency_global', 'data_residency_regional', 'decentralization_consortium', 'decentralization_federated', 'decentralization_local', 'decentralization_permissionless', 'decentralization_web_federated', 'established_standard', 'incentive_fee', 'incentive_free', 'incentive_membership', 'incentive_token', 'ledger_based', 'locked', 'long_term_signature', 'offline_verification', 'on_chain_full_document', 'on_chain_metadata', 'permissioned', 'portable', 'pseudonymous', 'resolution_at_least_fast', 'resolution_at_least_instant', 'resolution_at_least_medium', 'resolution_at_most_fast', 'resolution_at_most_instant', 'resolution_at_most_medium', 'revocation', 'revocation-list_based', 'selective_disclosure', 'supports_algorithm_upgrade', 'trust_blockchain', 'trust_ledger_backed', 'trust_peer_to_peer', 'trust_self_sovereign', 'trust_web_based', 'update_immutable', 'update_mutable')
```

```
✓ Combined ecosystem lattice: 19 concepts

This lattice shows how ecosystems are related based on their inherited capabilities

Generating visualization...
```

```
'combined_ecosystem_lattice.png'
```

```
=== Combined Ecosystem Lattice Atoms ===

Number of atoms: 4

Atom 1:
  Ecosystem(s): ('EUDI_ARF',)
  Distinguishing capabilities: 87 inherited attributes
  Key features: Selective Disclosure, P2P

Atom 2:
  Ecosystem(s): ('Hyperledger_Aries',)
  Distinguishing capabilities: 86 inherited attributes
  Key features: ZKP, Predicate Proofs, Selective Disclosure, P2P, Stateful

Atom 3:
  Ecosystem(s): ('Trinsic',)
  Distinguishing capabilities: 90 inherited attributes
  Key features: ZKP, Predicate Proofs, Selective Disclosure, P2P, Stateful

Atom 4:
  Ecosystem(s): ('Veramo',)
  Distinguishing capabilities: 90 inherited attributes
  Key features: ZKP, Predicate Proofs, Selective Disclosure, P2P, Stateful
```

### Ecosystem Similarity Analysis

Now we'll identify which ecosystems are equivalent (identical capabilities) or similar (high overlap in capabilities).

```
=== EQUIVALENT ECOSYSTEMS ===
Ecosystems are equivalent if they share the exact same inherited capabilities

1. ('Trinsic', 'Veramo')
   Shared capabilities: 84 attributes
   Sample: JSON, JSON-LD, algorithm_locked_to_identifier, anonymous, availability_at_least_community...

2. ('Hyperledger_Aries', 'Veramo')
   Shared capabilities: 82 attributes
   Sample: JSON, JSON-LD, algorithm_locked_to_identifier, anonymous, availability_at_least_community...

3. ('Hyperledger_Aries', 'Trinsic', 'Lissi', 'Veramo')
   Shared capabilities: 81 attributes
   Sample: JSON, JSON-LD, algorithm_locked_to_identifier, anonymous, availability_at_least_community...

4. ('Hyperledger_Aries', 'Sovrin')
   Shared capabilities: 80 attributes
   Sample: JSON, JSON-LD, algorithm_locked_to_identifier, anonymous, availability_at_least_community...

5. ('Hyperledger_Aries', 'Sovrin', 'Veramo')
   Shared capabilities: 76 attributes
   Sample: JSON, JSON-LD, algorithm_locked_to_identifier, anonymous, availability_at_least_community...
```

```
=== ECOSYSTEM SIMILARITY MATRIX ===
Using Jaccard similarity: |A ∩ B| / |A ∪ B|

Similarity scores (0.0 = completely different, 1.0 = identical):

                   EUDI_ARF  Hyperledger_Aries  Sovrin  Trinsic  Lissi  \
EUDI_ARF              1.000              0.587   0.561    0.702  0.615   
Hyperledger_Aries     0.587              1.000   0.930    0.853  0.942   
Sovrin                0.561              0.930   1.000    0.789  0.872   
Trinsic               0.702              0.853   0.789    1.000  0.900   
Lissi                 0.615              0.942   0.872    0.900  1.000   
Velocity_Network      0.828              0.663   0.634    0.800  0.700   
EBSI                  0.828              0.663   0.634    0.800  0.700   
Veramo                0.609              0.872   0.809    0.875  0.900   

                   Velocity_Network   EBSI  Veramo  
EUDI_ARF                      0.828  0.828   0.609  
Hyperledger_Aries             0.663  0.663   0.872  
Sovrin                        0.634  0.634   0.809  
Trinsic                       0.800  0.800   0.875  
Lissi                         0.700  0.700   0.900  
Velocity_Network              1.000  1.000   0.688  
EBSI                          1.000  1.000   0.688  
Veramo                        0.688  0.688   1.000
```

```

=== MOST SIMILAR ECOSYSTEM PAIRS ===

1. Velocity_Network ↔ EBSI
   Similarity: 1.000 (100.0%)
   Common: 72 attributes
   Only in Velocity_Network: 0 attributes
   Only in EBSI: 0 attributes

2. Hyperledger_Aries ↔ Lissi
   Similarity: 0.942 (94.2%)
   Common: 81 attributes
   Only in Hyperledger_Aries: 5 attributes
   Only in Lissi: 0 attributes

3. Hyperledger_Aries ↔ Sovrin
   Similarity: 0.930 (93.0%)
   Common: 80 attributes
   Only in Hyperledger_Aries: 6 attributes
   Only in Sovrin: 0 attributes

4. Trinsic ↔ Lissi
   Similarity: 0.900 (90.0%)
   Common: 81 attributes
   Only in Trinsic: 9 attributes
   Only in Lissi: 0 attributes

5. Lissi ↔ Veramo
   Similarity: 0.900 (90.0%)
   Common: 81 attributes
   Only in Lissi: 0 attributes
   Only in Veramo: 9 attributes

6. Trinsic ↔ Veramo
   Similarity: 0.875 (87.5%)
   Common: 84 attributes
   Only in Trinsic: 6 attributes
   Only in Veramo: 6 attributes

7. Hyperledger_Aries ↔ Veramo
   Similarity: 0.872 (87.2%)
   Common: 82 attributes
   Only in Hyperledger_Aries: 4 attributes
   Only in Veramo: 8 attributes

8. Sovrin ↔ Lissi
   Similarity: 0.872 (87.2%)
   Common: 75 attributes
   Only in Sovrin: 5 attributes
   Only in Lissi: 6 attributes

9. Hyperledger_Aries ↔ Trinsic
   Similarity: 0.853 (85.3%)
   Common: 81 attributes
   Only in Hyperledger_Aries: 5 attributes
   Only in Trinsic: 9 attributes

10. EUDI_ARF ↔ Velocity_Network
   Similarity: 0.828 (82.8%)
   Common: 72 attributes
   Only in EUDI_ARF: 15 attributes
   Only in Velocity_Network: 0 attributes
```

```
=== ECOSYSTEM CLUSTERS ===
Grouping ecosystems by capability similarity (threshold: 0.7)

Cluster 1: {'Velocity_Network', 'EUDI_ARF', 'Lissi', 'EBSI', 'Trinsic', 'Sovrin'}
  Average intra-cluster similarity: 0.758

Cluster 2: {'Hyperledger_Aries', 'Lissi', 'Trinsic', 'Sovrin', 'Veramo'}
  Average intra-cluster similarity: 0.874
```

```
=== ECOSYSTEM DIFFERENTIATION ===
What unique capabilities distinguish each ecosystem?

EUDI_ARF:
  Most distinguishing attributes:
    • wallet_device_bound (shared by 1/8 ecosystems)
    • maturity_production (shared by 1/8 ecosystems)
    • comm_proximity (shared by 1/8 ecosystems)
    • binding_biometric (shared by 1/8 ecosystems)
    • standard_iso (shared by 1/8 ecosystems)

Hyperledger_Aries:
  Most distinguishing attributes:
    • init_peer_driven (shared by 2/8 ecosystems)
    • transport_multi_channel (shared by 2/8 ecosystems)
    • maturity_legacy (shared by 2/8 ecosystems)
    • requires_return_route (shared by 2/8 ecosystems)
    • standard_w3c_community (shared by 3/8 ecosystems)

Sovrin:
  Most distinguishing attributes:
    • init_peer_driven (shared by 2/8 ecosystems)
    • transport_multi_channel (shared by 2/8 ecosystems)
    • maturity_legacy (shared by 2/8 ecosystems)
    • requires_return_route (shared by 2/8 ecosystems)
    • standard_w3c_community (shared by 3/8 ecosystems)

Trinsic:
  Most distinguishing attributes:
    • maturity_emerging (shared by 4/8 ecosystems)
    • interop_selective (shared by 4/8 ecosystems)
    • standard_ietf (shared by 4/8 ecosystems)
    • wallet_flexible (shared by 4/8 ecosystems)
    • standard_oidf (shared by 4/8 ecosystems)

Lissi:
  Most distinguishing attributes:
    • maturity_emerging (shared by 4/8 ecosystems)
    • standard_ietf (shared by 4/8 ecosystems)
    • predicate_proofs (shared by 5/8 ecosystems)
    • interop_open (shared by 5/8 ecosystems)
    • revocation-accumulator_based (shared by 5/8 ecosystems)

Velocity_Network:
  Most distinguishing attributes:
    • interop_selective (shared by 4/8 ecosystems)
    • standard_oidf (shared by 4/8 ecosystems)
    • wallet_flexible (shared by 4/8 ecosystems)
    • binding_application (shared by 4/8 ecosystems)
    • discovery_oidc (shared by 4/8 ecosystems)

EBSI:
  Most distinguishing attributes:
    • interop_selective (shared by 4/8 ecosystems)
    • standard_oidf (shared by 4/8 ecosystems)
    • wallet_flexible (shared by 4/8 ecosystems)
    • binding_application (shared by 4/8 ecosystems)
    • discovery_oidc (shared by 4/8 ecosystems)

Veramo:
  Most distinguishing attributes:
    • discovery_url_handler (shared by 1/8 ecosystems)
    • binding_browser (shared by 1/8 ecosystems)
    • transport_browser (shared by 1/8 ecosystems)
    • security_browser_origin (shared by 1/8 ecosystems)
    • wallet_browser_based (shared by 1/8 ecosystems)
```

```
=== SIMILARITY ANALYSIS SUMMARY ===

Most Similar Pair:
  Velocity_Network ↔ EBSI
  Similarity: 100.0%
  → These ecosystems are nearly interchangeable in terms of capabilities

Most Different Pair:
  EUDI_ARF ↔ Sovrin
  Similarity: 56.1%
  → These ecosystems serve very different use cases

Average Ecosystem Similarity: 76.6%
  → High overlap: Ecosystems share many capabilities

Total Clusters (threshold 0.7): 2 multi-member clusters
Unique Configurations: 0 ecosystems with distinct capabilities
```

## Attribute Implications and Dependencies

Now we'll discover which attributes imply others (dependencies) and which attributes are indistinguishable (always occur together). This is crucial for understanding:
- **For designers**: What capabilities are bundled together, what's technically necessary vs optional
- **For users**: What features come as a package, what trade-offs exist
- **For the ecosystem**: Where there's redundancy, what can be simplified

```
Analyzing Credential Formats...

=== CREDENTIAL FORMATS IMPLICATIONS ===

1. IF issuer_hiding
   THEN also has: binding_cryptographic, predicate_proofs, anonymous, long_term_signature, revocation
                  ... and 8 more
   (Supported by 1 formats)

2. IF revocation-accumulator_based
   THEN also has: binding_cryptographic, predicate_proofs, anonymous, revocation, crypto_pairing_based
                  ... and 6 more
   (Supported by 1 formats)

3. IF predicate_proofs
   THEN also has: binding_cryptographic, anonymous, revocation, crypto_pairing_based, multi_credential_proofs
                  ... and 4 more
   (Supported by 2 formats)

4. IF zkp
   THEN also has: binding_cryptographic, predicate_proofs, anonymous, revocation, crypto_pairing_based
                  ... and 4 more
   (Supported by 2 formats)

5. IF hardware_dependency
   THEN also has: binding_biometric, revocation, revocation-list_based, established_standard, CBOR
                  ... and 4 more
   (Supported by 1 formats)

6. IF multi_credential_proofs
   THEN also has: binding_cryptographic, predicate_proofs, anonymous, revocation, crypto_pairing_based
                  ... and 4 more
   (Supported by 2 formats)

7. IF linked_secrets
   THEN also has: binding_cryptographic, predicate_proofs, anonymous, revocation, crypto_pairing_based
                  ... and 4 more
   (Supported by 2 formats)

8. IF CBOR
   THEN also has: binding_biometric, revocation, revocation-list_based, hardware_dependency, established_standard
                  ... and 4 more
   (Supported by 1 formats)

9. IF binding_biometric
   THEN also has: revocation, revocation-list_based, hardware_dependency, established_standard, CBOR
                  ... and 4 more
   (Supported by 1 formats)

10. IF identified
   THEN also has: binding_biometric, revocation, revocation-list_based, hardware_dependency, established_standard
                  ... and 4 more
   (Supported by 1 formats)
```

```

=== CREDENTIAL FORMATS - INDISTINGUISHABLE ATTRIBUTES ===

Found 4 groups of indistinguishable attributes:

Group 1: {'multi_credential_proofs', 'predicate_proofs', 'zkp', 'linked_secrets'}
  Present in: ('AnonCreds', 'BBS+')
  → These 4 attributes always occur together

Group 2: {'crypto_pqr', 'batch_issuance'}
  Present in: ()
  → These 2 attributes always occur together

Group 3: {'hardware_dependency', 'binding_biometric', 'CBOR', 'identified'}
  Present in: ('mDL',)
  → These 4 attributes always occur together

Group 4: {'crypto_pairing_based', 'anonymous'}
  Present in: ('AnonCreds', 'VC-JSON-LD', 'BBS+')
  → These 2 attributes always occur together
```

```
=== STRONG IMPLICATIONS IN CREDENTIAL FORMATS ===

Most widely-supported implications:

1. selective_disclosure → {'revocation'}
   Support: 5/6 formats (83%)
   Interpretation: Formats with 'selective_disclosure' always have ['revocation']

2. binding_cryptographic → {'revocation'}
   Support: 5/6 formats (83%)
   Interpretation: Formats with 'binding_cryptographic' always have ['revocation']

3. offline_verification → {'selective_disclosure', 'revocation'}
   Support: 4/6 formats (67%)
   Interpretation: Formats with 'offline_verification' always have ['selective_disclosure', 'revocation']

4. long_term_signature → {'binding_cryptographic', 'revocation'}
   Support: 4/6 formats (67%)
   Interpretation: Formats with 'long_term_signature' always have ['binding_cryptographic', 'revocation']

5. crypto_elliptic_curve → {'revocation'}
   Support: 4/6 formats (67%)
   Interpretation: Formats with 'crypto_elliptic_curve' always have ['revocation']

6. revocation-list_based → {'revocation'}
   Support: 4/6 formats (67%)
   Interpretation: Formats with 'revocation-list_based' always have ['revocation']

7. JSON → {'binding_cryptographic', 'revocation'}
   Support: 3/6 formats (50%)
   Interpretation: Formats with 'JSON' always have ['binding_cryptographic', 'revocation']

8. crypto_pairing_based → {'binding_cryptographic', 'revocation', 'offline_verification', 'selective_disclosure', 'anonymous'}
   Support: 3/6 formats (50%)
   Interpretation: Formats with 'crypto_pairing_based' always have ['binding_cryptographic', 'revocation', 'offline_verification', 'selective_disclosure', 'anonymous']

9. anonymous → {'binding_cryptographic', 'revocation', 'crypto_pairing_based', 'offline_verification', 'selective_disclosure'}
   Support: 3/6 formats (50%)
   Interpretation: Formats with 'anonymous' always have ['binding_cryptographic', 'revocation', 'crypto_pairing_based', 'offline_verification', 'selective_disclosure']

10. established_standard → {'revocation-list_based', 'revocation', 'offline_verification', 'crypto_elliptic_curve', 'selective_disclosure'}
   Support: 2/6 formats (33%)
   Interpretation: Formats with 'established_standard' always have ['revocation-list_based', 'revocation', 'offline_verification', 'crypto_elliptic_curve', 'selective_disclosure']

11. pseudonymous → {'binding_cryptographic', 'long_term_signature', 'revocation', 'JSON', 'crypto_elliptic_curve'}
   Support: 2/6 formats (33%)
   Interpretation: Formats with 'pseudonymous' always have ['binding_cryptographic', 'long_term_signature', 'revocation', 'JSON', 'crypto_elliptic_curve']
```

```
======================================================================
=== IMPLICATIONS ACROSS ALL DOMAINS ===


PROTOCOLS:
--------------------------------------------------
  credential_chaining
    → ['comm_remote', 'interop_open']
    (3/5 objects)
  delivery_sync
    → ['stateless', 'mediator_optional']
    (3/5 objects)
  init_holder_driven
    → ['comm_remote', 'mediator_optional']
    (3/5 objects)


DIDS/VDRS:
--------------------------------------------------
  update_mutable
    → ['supports_algorithm_upgrade']
    (7/9 objects)
  ledger_based
    → ['locked', 'update_mutable', 'supports_algorithm_upgrade']
    (6/9 objects)
  locked
    → ['update_mutable', 'supports_algorithm_upgrade', 'ledger_based']
    (6/9 objects)


ECOSYSTEMS:
--------------------------------------------------
  region_global
    → ['maturity_production']
    (4/8 objects)
  identity_binding_optional
    → ['maturity_production']
    (4/8 objects)
  role_holder_centric
    → ['maturity_production']
    (3/8 objects)
```

### Why This Matters: Implications for Designers and Users

Understanding attribute implications and indistinguishability has practical value:

```
======================================================================
WHY ATTRIBUTE IMPLICATIONS MATTER
======================================================================

🏗️  FOR DESIGNERS:

1. TECHNICAL DEPENDENCIES
   • Implications reveal what capabilities are technically bundled
   • Example: 'zkp' → 'selective_disclosure' + 'privacy_model'
   • Insight: Can't add ZKP without these other features
   • Action: Design systems knowing these constraints

2. REDUNDANCY DETECTION
   • Indistinguishable attributes = redundant specifications
   • Example: If attr_A ↔ attr_B, only need one in the model
   • Insight: Simplify data model, reduce cognitive load
   • Action: Merge redundant attributes in specs

3. FEATURE PLANNING
   • Strong implications show what features come as packages
   • Example: 'peer_to_peer' → 'stateful' + 'multi_party'
   • Insight: Adding P2P brings these capabilities for free
   • Action: Plan feature roadmap knowing these bundles

======================================================================

👤 FOR USERS:

1. CAPABILITY EXPECTATIONS
   • Implications tell users what to expect
   • Example: System with 'predicate_proofs' → has 'zkp' + 'selective_disclosure'
   • Insight: One feature guarantees others
   • Action: Choose systems based on implied capabilities

2. TRADE-OFF UNDERSTANDING
   • Implications reveal unavoidable trade-offs
   • Example: 'offline_verification' → 'hardware_dependency' (for some formats)
   • Insight: Some features require specific infrastructure
   • Action: Make informed deployment decisions

3. SIMPLIFY REQUIREMENTS
   • Don't need to specify redundant requirements
   • Example: Instead of requiring 10 attributes, require 2 that imply the rest
   • Insight: Clearer, simpler requirement specifications
   • Action: Write minimal but complete requirements

======================================================================

🌐 FOR THE ECOSYSTEM:

1. STANDARDIZATION OPPORTUNITIES
   • Implications show natural feature bundles
   • Insight: Standards should reflect these natural groupings
   • Action: Create specs around implied capability sets

2. INTEROPERABILITY
   • Understanding implications helps predict compatibility
   • Insight: Systems with similar implications can interoperate
   • Action: Design for compatibility based on implication patterns

3. DOCUMENTATION
   • Implications provide clear, factual documentation
   • Insight: 'If you have X, you automatically have Y'
   • Action: Use implications to educate users and developers

======================================================================
```

```
=== CONCRETE EXAMPLES FROM YOUR DATA ===

EXAMPLE 1: Zero-Knowledge Proofs
--------------------------------------------------
Formats with ZKP: ('AnonCreds', 'BBS+')

These formats ALWAYS have:
  ✓ binding_cryptographic
  ✓ predicate_proofs
  ✓ anonymous
  ✓ revocation
  ✓ crypto_pairing_based
  ✓ multi_credential_proofs
  ✓ offline_verification
  ✓ linked_secrets
  ✓ selective_disclosure

💡 Insight for designers:
   If you want ZKP, you must also implement:
   • Selective disclosure
   • Predicate proofs
   • Privacy-preserving architecture
   These are NOT optional - they're technically necessary!


EXAMPLE 2: Peer-to-Peer Protocols
--------------------------------------------------
P2P Protocols: ('DIDComm_v1', 'DIDComm_v2', 'ISO18013-5')

These protocols ALWAYS have:

💡 Insight for users:
   Choosing a P2P protocol guarantees:
   • Device binding (more secure)
   • Remote communication capability
   • Stateful sessions (better UX)
   You get these benefits automatically!


EXAMPLE 3: Ledger-Based DIDs
--------------------------------------------------
Ledger-based DIDs: ('Indy', 'EBSI_DID_Registry', 'Cheqd', 'Velocity_Ledger', 'did:ethr', 'did:ion')

These DIDs ALWAYS have:
  ✓ locked
  ✓ update_mutable
  ✓ supports_algorithm_upgrade

💡 Insight for users:
   Ledger-based DIDs come with trade-offs:
   • NOT portable (locked to ledger)
   • Require on-chain data
   • Support algorithm upgrades
   • Have specific trust frameworks
   You can't have ledger security without these constraints!
```

## Examining Formal Context Relations

Before visualizing the lattices, let's examine the formal contexts themselves. The context shows the **incidence relation** - which objects have which attributes (marked with X).

```
gov_commercial equivalent sector_enterprise
gov_consortium equivalent sector_workforce
gov_regulatory equivalent sector_government_id
gov_regulatory equivalent region_eu
gov_regulatory equivalent maturity_pilots
sector_developer_toolkit equivalent role_developer_centric
sector_government_id equivalent region_eu
sector_government_id equivalent maturity_pilots
region_eu equivalent maturity_pilots
region_north_america equivalent identity_binding_weak
gov_regulatory complement maturity_production
sector_government_id complement maturity_production
region_eu complement maturity_production
maturity_pilots complement maturity_production
gov_commercial incompatible gov_consortium
gov_commercial incompatible gov_foundation
gov_commercial incompatible gov_open_source
gov_commercial incompatible gov_regulatory
gov_commercial incompatible sector_cross_sector
gov_commercial incompatible sector_developer_toolkit
gov_commercial incompatible sector_government_id
gov_commercial incompatible sector_workforce
gov_commercial incompatible region_eu
gov_commercial incompatible region_global
gov_commercial incompatible maturity_pilots
gov_commercial incompatible role_developer_centric
gov_commercial incompatible role_issuer_centric
gov_commercial incompatible role_verifier_centric
gov_commercial incompatible identity_binding_strong
gov_consortium incompatible gov_foundation
gov_consortium incompatible gov_open_source
gov_consortium incompatible gov_regulatory
gov_consortium incompatible sector_cross_sector
gov_consortium incompatible sector_developer_toolkit
gov_consortium incompatible sector_enterprise
gov_consortium incompatible sector_government_id
gov_consortium incompatible region_eu
gov_consortium incompatible region_europe
gov_consortium incompatible region_north_america
gov_consortium incompatible maturity_pilots
gov_consortium incompatible role_developer_centric
gov_consortium incompatible role_holder_centric
gov_consortium incompatible role_issuer_centric
gov_consortium incompatible identity_binding_optional
gov_consortium incompatible identity_binding_weak
gov_foundation incompatible gov_open_source
gov_foundation incompatible gov_regulatory
gov_foundation incompatible sector_developer_toolkit
gov_foundation incompatible sector_enterprise
gov_foundation incompatible sector_government_id
gov_foundation incompatible sector_workforce
gov_foundation incompatible region_eu
gov_foundation incompatible region_europe
gov_foundation incompatible region_north_america
gov_foundation incompatible maturity_pilots
gov_foundation incompatible role_developer_centric
gov_foundation incompatible role_holder_centric
gov_foundation incompatible role_verifier_centric
gov_foundation incompatible identity_binding_strong
gov_foundation incompatible identity_binding_weak
gov_open_source incompatible gov_regulatory
gov_open_source incompatible sector_enterprise
gov_open_source incompatible sector_government_id
gov_open_source incompatible sector_workforce
gov_open_source incompatible region_eu
gov_open_source incompatible region_europe
gov_open_source incompatible region_north_america
gov_open_source incompatible maturity_pilots
gov_open_source incompatible role_issuer_centric
gov_open_source incompatible role_verifier_centric
gov_open_source incompatible identity_binding_strong
gov_open_source incompatible identity_binding_weak
gov_regulatory incompatible sector_cross_sector
gov_regulatory incompatible sector_developer_toolkit
gov_regulatory incompatible sector_enterprise
gov_regulatory incompatible sector_workforce
gov_regulatory incompatible region_europe
gov_regulatory incompatible region_global
gov_regulatory incompatible region_north_america
gov_regulatory incompatible role_developer_centric
gov_regulatory incompatible role_holder_centric
gov_regulatory incompatible identity_binding_optional
gov_regulatory incompatible identity_binding_weak
sector_cross_sector incompatible sector_developer_toolkit
sector_cross_sector incompatible sector_enterprise
sector_cross_sector incompatible sector_government_id
sector_cross_sector incompatible sector_workforce
sector_cross_sector incompatible region_eu
sector_cross_sector incompatible region_europe
sector_cross_sector incompatible region_north_america
sector_cross_sector incompatible maturity_pilots
sector_cross_sector incompatible role_developer_centric
sector_cross_sector incompatible role_verifier_centric
sector_cross_sector incompatible identity_binding_strong
sector_cross_sector incompatible identity_binding_weak
sector_developer_toolkit incompatible sector_enterprise
sector_developer_toolkit incompatible sector_government_id
sector_developer_toolkit incompatible sector_workforce
sector_developer_toolkit incompatible region_eu
sector_developer_toolkit incompatible region_europe
sector_developer_toolkit incompatible region_north_america
sector_developer_toolkit incompatible maturity_pilots
sector_developer_toolkit incompatible role_holder_centric
sector_developer_toolkit incompatible role_issuer_centric
sector_developer_toolkit incompatible role_verifier_centric
sector_developer_toolkit incompatible identity_binding_strong
sector_developer_toolkit incompatible identity_binding_weak
sector_enterprise incompatible sector_government_id
sector_enterprise incompatible sector_workforce
sector_enterprise incompatible region_eu
sector_enterprise incompatible region_global
sector_enterprise incompatible maturity_pilots
sector_enterprise incompatible role_developer_centric
sector_enterprise incompatible role_issuer_centric
sector_enterprise incompatible role_verifier_centric
sector_enterprise incompatible identity_binding_strong
sector_government_id incompatible sector_workforce
sector_government_id incompatible region_europe
sector_government_id incompatible region_global
sector_government_id incompatible region_north_america
sector_government_id incompatible role_developer_centric
sector_government_id incompatible role_holder_centric
sector_government_id incompatible identity_binding_optional
sector_government_id incompatible identity_binding_weak
sector_workforce incompatible region_eu
sector_workforce incompatible region_europe
sector_workforce incompatible region_north_america
sector_workforce incompatible maturity_pilots
sector_workforce incompatible role_developer_centric
sector_workforce incompatible role_holder_centric
sector_workforce incompatible role_issuer_centric
sector_workforce incompatible identity_binding_optional
sector_workforce incompatible identity_binding_weak
region_eu incompatible region_europe
region_eu incompatible region_global
region_eu incompatible region_north_america
region_eu incompatible role_developer_centric
region_eu incompatible role_holder_centric
region_eu incompatible identity_binding_optional
region_eu incompatible identity_binding_weak
region_europe incompatible region_global
region_europe incompatible region_north_america
region_europe incompatible maturity_pilots
region_europe incompatible role_developer_centric
region_europe incompatible role_issuer_centric
region_europe incompatible role_verifier_centric
region_europe incompatible identity_binding_strong
region_europe incompatible identity_binding_weak
region_global incompatible region_north_america
region_global incompatible maturity_pilots
region_global incompatible identity_binding_weak
region_north_america incompatible maturity_pilots
region_north_america incompatible role_developer_centric
region_north_america incompatible role_issuer_centric
region_north_america incompatible role_verifier_centric
region_north_america incompatible identity_binding_optional
region_north_america incompatible identity_binding_strong
maturity_pilots incompatible role_developer_centric
maturity_pilots incompatible role_holder_centric
maturity_pilots incompatible identity_binding_optional
maturity_pilots incompatible identity_binding_weak
role_developer_centric incompatible role_holder_centric
role_developer_centric incompatible role_issuer_centric
role_developer_centric incompatible role_verifier_centric
role_developer_centric incompatible identity_binding_strong
role_developer_centric incompatible identity_binding_weak
role_holder_centric incompatible role_issuer_centric
role_holder_centric incompatible role_verifier_centric
role_holder_centric incompatible identity_binding_strong
role_issuer_centric incompatible role_verifier_centric
role_issuer_centric incompatible identity_binding_weak
role_verifier_centric incompatible identity_binding_optional
role_verifier_centric incompatible identity_binding_weak
identity_binding_optional incompatible identity_binding_strong
identity_binding_optional incompatible identity_binding_weak
identity_binding_strong incompatible identity_binding_weak
region_europe implication gov_commercial
region_north_america implication gov_commercial
gov_commercial implication maturity_production
gov_commercial implication role_holder_centric
identity_binding_weak implication gov_commercial
gov_consortium implication region_global
gov_consortium implication maturity_production
gov_consortium implication role_verifier_centric
gov_consortium implication identity_binding_strong
gov_foundation implication sector_cross_sector
gov_foundation implication region_global
gov_foundation implication maturity_production
gov_foundation implication role_issuer_centric
gov_foundation implication identity_binding_optional
sector_developer_toolkit implication gov_open_source
gov_open_source implication region_global
gov_open_source implication maturity_production
role_developer_centric implication gov_open_source
gov_open_source implication identity_binding_optional
gov_regulatory implication identity_binding_strong
sector_cross_sector implication region_global
sector_cross_sector implication maturity_production
sector_cross_sector implication identity_binding_optional
sector_developer_toolkit implication region_global
sector_developer_toolkit implication maturity_production
sector_developer_toolkit implication identity_binding_optional
region_europe implication sector_enterprise
region_north_america implication sector_enterprise
sector_enterprise implication maturity_production
sector_enterprise implication role_holder_centric
identity_binding_weak implication sector_enterprise
sector_government_id implication identity_binding_strong
sector_workforce implication region_global
sector_workforce implication maturity_production
sector_workforce implication role_verifier_centric
sector_workforce implication identity_binding_strong
region_eu implication identity_binding_strong
region_europe implication maturity_production
region_europe implication role_holder_centric
region_europe implication identity_binding_optional
region_global implication maturity_production
role_developer_centric implication region_global
region_north_america implication maturity_production
region_north_america implication role_holder_centric
maturity_pilots implication identity_binding_strong
role_developer_centric implication maturity_production
role_holder_centric implication maturity_production
identity_binding_optional implication maturity_production
identity_binding_weak implication maturity_production
role_developer_centric implication identity_binding_optional
identity_binding_weak implication role_holder_centric
role_verifier_centric implication identity_binding_strong
maturity_production subcontrary identity_binding_strong
gov_commercial orthogonal identity_binding_optional
gov_open_source orthogonal sector_cross_sector
gov_open_source orthogonal role_holder_centric
gov_regulatory orthogonal role_issuer_centric
gov_regulatory orthogonal role_verifier_centric
sector_cross_sector orthogonal role_holder_centric
sector_cross_sector orthogonal role_issuer_centric
sector_enterprise orthogonal identity_binding_optional
sector_government_id orthogonal role_issuer_centric
sector_government_id orthogonal role_verifier_centric
region_eu orthogonal role_issuer_centric
region_eu orthogonal role_verifier_centric
region_global orthogonal role_holder_centric
region_global orthogonal role_issuer_centric
region_global orthogonal role_verifier_centric
region_global orthogonal identity_binding_optional
region_global orthogonal identity_binding_strong
maturity_pilots orthogonal role_issuer_centric
maturity_pilots orthogonal role_verifier_centric
maturity_production orthogonal role_issuer_centric
maturity_production orthogonal role_verifier_centric
role_holder_centric orthogonal identity_binding_optional
role_issuer_centric orthogonal identity_binding_optional
role_issuer_centric orthogonal identity_binding_strong
```

```
=== PROTOCOLS FORMAL CONTEXT ===
Objects: 5, Attributes: 45

<Context object mapping 5 objects to 45 properties [3de2372] at 0x15b2d5a7c50>
              |requires_return_route|peer_to_peer|mediator_optional|multi_party|credential_chaining|binding_application|binding_browser|binding_device|binding_secure_element|comm_proximity|comm_remote|delivery_async|delivery_sync|discovery_oidc|discovery_out_of_band|discovery_reader_cert|discovery_url_handler|init_holder_driven|init_peer_driven|init_verifier_driven|interop_closed|interop_open|interop_selective|maturity_emerging|maturity_legacy|maturity_pilot|maturity_production|security_authenticated_encryption|security_browser_origin|security_device_auth|security_mutual_tls|standard_ietf|standard_iso|standard_oidf|standard_w3c_community|stateful|stateless|transport_browser|transport_http|transport_multi_channel|transport_nfc_ble|wallet_browser_based|wallet_device_bound|wallet_flexible|wallet_non_custodial|
    DIDComm_v1|X                    |X           |                 |X          |X                  |                   |               |X             |                      |              |X          |X             |             |              |X                    |                     |                     |                  |X               |                    |              |X           |                 |                 |X              |              |                   |X                                |                       |                    |                   |             |            |             |X                     |X       |         |                 |              |X                      |                 |                    |                   |               |X                   |
    DIDComm_v2|                     |X           |X                |X          |X                  |                   |               |X             |                      |              |X          |X             |             |              |X                    |                     |                     |X                 |                |                    |              |X           |                 |X                |               |              |                   |X                                |                       |                    |                   |X            |            |             |                      |X       |         |                 |X             |                       |                 |                    |                   |               |X                   |
    OID4VC    |                     |            |X                |           |                   |X                  |               |              |                      |              |X          |              |X            |X             |                     |                     |                     |X                 |                |                    |              |            |X                |                 |               |X             |                   |                                 |                       |                    |X                  |             |            |X            |                      |        |X        |                 |X             |                       |                 |                    |                   |X              |                    |
    ISO18013-5|                     |X           |X                |           |                   |                   |               |              |X                     |X             |           |              |X            |              |                     |X                    |                     |                  |                |X                   |X             |            |                 |                 |               |              |X                  |                                 |                       |X                   |                   |             |X           |             |                      |        |X        |                 |              |                       |X                |                    |X                  |               |                    |
    CHAPI     |                     |            |X                |           |X                  |                   |X              |              |                      |              |X          |              |X            |              |                     |                     |X                    |X                 |                |                    |              |X           |                 |                 |               |X             |                   |                                 |X                      |                    |                   |             |            |             |X                     |        |X        |X                |              |                       |                 |X                   |                   |               |                    |
```

```
=== CREDENTIAL FORMATS FORMAL CONTEXT ===
Objects: 6, Attributes: 26

<Context object mapping 6 objects to 26 properties [91eda20d] at 0x15b2d6a0e10>
              |selective_disclosure|predicate_proofs|zkp|revocation|batch_issuance|offline_verification|hardware_dependency|multi_credential_proofs|issuer_hiding|long_term_signature|linked_secrets|JSON|JSON-LD|CBOR|crypto_elliptic_curve|crypto_pairing_based|crypto_pqr|established_standard|revocation-accumulator_based|revocation-list_based|revocation-issuer_defined|binding_cryptographic|binding_biometric|identified|pseudonymous|anonymous|
    AnonCreds |X                   |X               |X  |X         |              |X                   |                   |X                      |             |                   |X             |X   |       |    |                     |X                   |          |                    |X                           |                     |                         |X                    |                 |          |            |X        |
    mDL       |X                   |                |   |X         |              |X                   |X                  |                       |             |                   |              |    |       |X   |X                    |                    |          |X                   |                            |X                    |                         |                     |X                |X         |            |         |
    VC-JWT    |                    |                |   |X         |              |                    |                   |                       |             |X                  |              |X   |       |    |X                    |                    |          |                    |                            |X                    |                         |X                    |                 |          |X           |         |
    VC-JSON-LD|X                   |                |   |X         |              |X                   |                   |                       |             |X                  |              |    |X      |    |X                    |X                   |          |X                   |                            |X                    |                         |X                    |                 |          |            |X        |
    SD-JWT    |X                   |                |   |X         |              |                    |                   |                       |             |X                  |              |X   |       |    |X                    |                    |          |                    |                            |                     |X                        |X                    |                 |          |X           |         |
    BBS+      |X                   |X               |X  |X         |              |X                   |                   |X                      |X            |X                  |X             |    |X      |    |                     |X                   |          |                    |                            |X                    |                         |X                    |                 |          |            |X        |
```

```
=== DIDs/VDRs FORMAL CONTEXT ===
Objects: 9, Attributes: 46

<Context object mapping 9 objects to 46 properties [77a01dea] at 0x15b2d656650>
                     |ledger_based|permissioned|resolution_at_least_instant|resolution_at_most_instant|resolution_at_least_fast|resolution_at_most_fast|resolution_at_least_medium|resolution_at_most_medium|availability_at_least_immediate|availability_at_most_immediate|availability_at_least_high|availability_at_most_high|availability_at_least_enterprise|availability_at_most_enterprise|availability_at_least_community|availability_at_most_community|on_chain_metadata|on_chain_full_document|update_immutable|compliance_experimental|decentralization_federated|data_residency_domain|trust_blockchain|data_residency_device|supports_algorithm_upgrade|data_residency_regional|compliance_industry|key_recovery|data_residency_global|algorithm_locked_to_identifier|incentive_token|decentralization_consortium|decentralization_web_federated|incentive_membership|decentralization_permissionless|trust_web_based|compliance_regulatory|incentive_free|locked|portable|trust_ledger_backed|trust_peer_to_peer|incentive_fee|decentralization_local|update_mutable|trust_self_sovereign|
    Indy             |X           |X           |                           |                          |                        |                       |X                         |X                        |                               |                              |                          |                         |                                |                               |X                              |X                             |                 |X                     |                |                       |X                         |                     |                |                     |X                         |                       |X                  |            |X                    |                              |               |                           |                              |X                   |                               |               |                     |              |X     |        |X                  |                  |             |                      |X             |                    |
    EBSI_DID_Registry|X           |X           |                           |                          |                        |                       |X                         |X                        |                               |                              |                          |                         |X                               |X                              |                               |                              |                 |X                     |                |                       |                          |                     |                |                     |X                         |X                      |                   |            |                     |                              |               |X                          |                              |                    |                               |               |X                    |X             |X     |        |X                  |                  |             |                      |X             |                    |
    Cheqd            |X           |            |                           |                          |                        |                       |X                         |X                        |                               |                              |X                         |X                        |                                |                               |                               |                              |                 |X                     |                |                       |                          |                     |                |                     |X                         |                       |X                  |            |X                    |                              |X              |                           |                              |                    |X                              |               |                     |              |X     |        |X                  |                  |             |                      |X             |                    |
    Velocity_Ledger  |X           |X           |                           |                          |                        |                       |X                         |X                        |                               |                              |                          |                         |X                               |X                              |                               |                              |                 |X                     |                |                       |                          |                     |                |                     |X                         |                       |X                  |            |X                    |                              |               |X                          |                              |X                   |                               |               |                     |              |X     |        |X                  |                  |             |                      |X             |                    |
    did:web          |            |            |                           |                          |X                       |X                      |X                         |                         |                               |                              |                          |                         |                                |                               |                               |                              |                 |                      |                |X                      |                          |X                    |                |                     |X                         |                       |                   |            |                     |                              |               |                           |X                             |                    |                               |X              |                     |              |      |X       |                   |                  |X            |                      |X             |                    |
    did:key          |            |            |X                          |X                         |X                       |                       |X                         |                         |X                              |X                             |X                         |X                        |X                               |X                              |X                              |X                             |                 |                      |X               |X                      |                          |                     |                |X                    |                          |                       |                   |            |                     |X                             |               |                           |                              |                    |                               |               |                     |X             |      |X       |                   |                  |             |X                     |              |X                   |
    did:ethr         |X           |            |                           |X                         |                        |X                      |                          |                         |                               |                              |X                         |X                        |                                |                               |                               |                              |                 |X                     |                |X                      |                          |                     |X               |                     |X                         |                       |                   |            |X                    |                              |               |                           |                              |                    |X                              |               |                     |              |X     |        |                   |                  |X            |                      |X             |                    |
    did:ion          |X           |            |                           |X                         |                        |X                      |                          |                         |                               |                              |X                         |X                        |                                |                               |                               |                              |X                |                      |                |X                      |                          |                     |X               |                     |X                         |                       |                   |            |X                    |                              |               |                           |                              |                    |X                              |               |                     |              |X     |        |                   |                  |X            |                      |X             |                    |
    did:peer         |            |            |X                          |X                         |X                       |                       |X                         |                         |X                              |X                             |X                         |X                        |X                               |X                              |X                              |X                             |                 |                      |X               |X                      |                          |                     |                |X                    |X                         |                       |                   |            |                     |                              |               |                           |                              |                    |                               |               |                     |X             |      |X       |                   |X                 |             |X                     |              |                    |
```

```
=== Context Density Analysis ===

Ecosystems:
  Matrix size: 8 × 24 = 192 possible relations
  Actual relations: 48
  Density: 25.0%

Protocols:
  Matrix size: 5 × 45 = 225 possible relations
  Actual relations: 73
  Density: 32.4%

Credential Formats:
  Matrix size: 6 × 26 = 156 possible relations
  Actual relations: 62
  Density: 39.7%

DIDs/VDRs:
  Matrix size: 9 × 46 = 414 possible relations
  Actual relations: 138
  Density: 33.3%
```

## Visualization

We'll visualize the concept lattices using graphviz. Note: This requires graphviz to be installed on your system.

```
Generating visualization for Credential Formats lattice...
```

```
<graphviz.graphs.Digraph at 0x15b2d6a1950>
```

```
Generating visualization for Protocols lattice...
```

```
<graphviz.graphs.Digraph at 0x15b2d6a1810>
```

```
Generating visualization for Ecosystems lattice...
```

```
<graphviz.graphs.Digraph at 0x15b2d657490>
```

```
Generating visualization for DIDs/VDRs lattice...
```

```
<graphviz.graphs.Digraph at 0x15b2d657100>
```

### Lattice Atoms

**Atoms** in a concept lattice are the minimal non-trivial concepts - they are the concepts that are directly above the bottom concept (which has no attributes and all objects). Atoms represent the most specific, fundamental concepts in the lattice.

Each atom typically corresponds to a single object or a minimal grouping of objects that share a unique set of attributes. Understanding atoms helps identify the basic building blocks of the concept hierarchy.

```
=== Credential Formats Lattice Atoms ===

Number of atoms: 6

Atom 1:
  Extent (objects): ('AnonCreds',)
  Intent (attributes): ('selective_disclosure', 'predicate_proofs', 'zkp', 'revocation', 'offline_verification', 'multi_credential_proofs', 'linked_secrets', 'JSON', 'crypto_pairing_based', 'revocation-accumulator_based', 'binding_cryptographic', 'anonymous')

Atom 2:
  Extent (objects): ('mDL',)
  Intent (attributes): ('selective_disclosure', 'revocation', 'offline_verification', 'hardware_dependency', 'CBOR', 'crypto_elliptic_curve', 'established_standard', 'revocation-list_based', 'binding_biometric', 'identified')

Atom 3:
  Extent (objects): ('VC-JWT',)
  Intent (attributes): ('revocation', 'long_term_signature', 'JSON', 'crypto_elliptic_curve', 'revocation-list_based', 'binding_cryptographic', 'pseudonymous')

Atom 4:
  Extent (objects): ('VC-JSON-LD',)
  Intent (attributes): ('selective_disclosure', 'revocation', 'offline_verification', 'long_term_signature', 'JSON-LD', 'crypto_elliptic_curve', 'crypto_pairing_based', 'established_standard', 'revocation-list_based', 'binding_cryptographic', 'anonymous')

Atom 5:
  Extent (objects): ('SD-JWT',)
  Intent (attributes): ('selective_disclosure', 'revocation', 'long_term_signature', 'JSON', 'crypto_elliptic_curve', 'revocation-issuer_defined', 'binding_cryptographic', 'pseudonymous')

Atom 6:
  Extent (objects): ('BBS+',)
  Intent (attributes): ('selective_disclosure', 'predicate_proofs', 'zkp', 'revocation', 'offline_verification', 'multi_credential_proofs', 'issuer_hiding', 'long_term_signature', 'linked_secrets', 'JSON-LD', 'crypto_pairing_based', 'revocation-list_based', 'binding_cryptographic', 'anonymous')
```

```
=== Protocols Lattice Atoms ===

Number of atoms: 5

Atom 1:
  Extent (objects): ('DIDComm_v1',)
  Intent (attributes): ('requires_return_route', 'peer_to_peer', 'multi_party', 'credential_chaining', 'binding_device', 'comm_remote', 'delivery_async', 'discovery_out_of_band', 'init_peer_driven', 'interop_open', 'maturity_legacy', 'security_authenticated_encryption', 'standard_w3c_community', 'stateful', 'transport_multi_channel', 'wallet_non_custodial')

Atom 2:
  Extent (objects): ('DIDComm_v2',)
  Intent (attributes): ('peer_to_peer', 'mediator_optional', 'multi_party', 'credential_chaining', 'binding_device', 'comm_remote', 'delivery_async', 'discovery_out_of_band', 'init_holder_driven', 'interop_open', 'maturity_emerging', 'security_authenticated_encryption', 'standard_ietf', 'stateful', 'transport_http', 'wallet_non_custodial')

Atom 3:
  Extent (objects): ('OID4VC',)
  Intent (attributes): ('mediator_optional', 'binding_application', 'comm_remote', 'delivery_sync', 'discovery_oidc', 'init_holder_driven', 'interop_selective', 'maturity_pilot', 'security_mutual_tls', 'standard_oidf', 'stateless', 'transport_http', 'wallet_flexible')

Atom 4:
  Extent (objects): ('ISO18013-5',)
  Intent (attributes): ('peer_to_peer', 'mediator_optional', 'binding_secure_element', 'comm_proximity', 'delivery_sync', 'discovery_reader_cert', 'init_verifier_driven', 'interop_closed', 'maturity_production', 'security_device_auth', 'standard_iso', 'stateless', 'transport_nfc_ble', 'wallet_device_bound')

Atom 5:
  Extent (objects): ('CHAPI',)
  Intent (attributes): ('mediator_optional', 'credential_chaining', 'binding_browser', 'comm_remote', 'delivery_sync', 'discovery_url_handler', 'init_holder_driven', 'interop_open', 'maturity_pilot', 'security_browser_origin', 'standard_w3c_community', 'stateless', 'transport_browser', 'wallet_browser_based')
```

```
=== Ecosystems Lattice Atoms ===

Number of atoms: 8

Atom 1:
  Extent (objects): ('EUDI_ARF',)
  Intent (attributes): ('gov_regulatory', 'sector_government_id', 'region_eu', 'maturity_pilots', 'role_verifier_centric', 'identity_binding_strong')

Atom 2:
  Extent (objects): ('Hyperledger_Aries',)
  Intent (attributes): ('gov_open_source', 'sector_cross_sector', 'region_global', 'maturity_production', 'role_holder_centric', 'identity_binding_optional')

Atom 3:
  Extent (objects): ('Sovrin',)
  Intent (attributes): ('gov_foundation', 'sector_cross_sector', 'region_global', 'maturity_production', 'role_issuer_centric', 'identity_binding_optional')

Atom 4:
  Extent (objects): ('Trinsic',)
  Intent (attributes): ('gov_commercial', 'sector_enterprise', 'region_north_america', 'maturity_production', 'role_holder_centric', 'identity_binding_weak')

Atom 5:
  Extent (objects): ('Lissi',)
  Intent (attributes): ('gov_commercial', 'sector_enterprise', 'region_europe', 'maturity_production', 'role_holder_centric', 'identity_binding_optional')

Atom 6:
  Extent (objects): ('Velocity_Network',)
  Intent (attributes): ('gov_consortium', 'sector_workforce', 'region_global', 'maturity_production', 'role_verifier_centric', 'identity_binding_strong')

Atom 7:
  Extent (objects): ('EBSI',)
  Intent (attributes): ('gov_regulatory', 'sector_government_id', 'region_eu', 'maturity_pilots', 'role_issuer_centric', 'identity_binding_strong')

Atom 8:
  Extent (objects): ('Veramo',)
  Intent (attributes): ('gov_open_source', 'sector_developer_toolkit', 'region_global', 'maturity_production', 'role_developer_centric', 'identity_binding_optional')
```

```
=== DIDs/VDRs Lattice Atoms ===

Number of atoms: 9

Atom 1:
  Extent (objects): ('Indy',)
  Intent (attributes): ('ledger_based', 'permissioned', 'resolution_at_least_medium', 'resolution_at_most_medium', 'availability_at_least_community', 'availability_at_most_community', 'on_chain_full_document', 'decentralization_federated', 'supports_algorithm_upgrade', 'compliance_industry', 'data_residency_global', 'incentive_membership', 'locked', 'trust_ledger_backed', 'update_mutable')

Atom 2:
  Extent (objects): ('EBSI_DID_Registry',)
  Intent (attributes): ('ledger_based', 'permissioned', 'resolution_at_least_medium', 'resolution_at_most_medium', 'availability_at_least_enterprise', 'availability_at_most_enterprise', 'on_chain_full_document', 'supports_algorithm_upgrade', 'data_residency_regional', 'decentralization_consortium', 'compliance_regulatory', 'incentive_free', 'locked', 'trust_ledger_backed', 'update_mutable')

Atom 3:
  Extent (objects): ('Cheqd',)
  Intent (attributes): ('ledger_based', 'resolution_at_least_medium', 'resolution_at_most_medium', 'availability_at_least_high', 'availability_at_most_high', 'on_chain_full_document', 'supports_algorithm_upgrade', 'compliance_industry', 'data_residency_global', 'incentive_token', 'decentralization_permissionless', 'locked', 'trust_ledger_backed', 'update_mutable')

Atom 4:
  Extent (objects): ('Velocity_Ledger',)
  Intent (attributes): ('ledger_based', 'permissioned', 'resolution_at_least_medium', 'resolution_at_most_medium', 'availability_at_least_enterprise', 'availability_at_most_enterprise', 'on_chain_full_document', 'supports_algorithm_upgrade', 'compliance_industry', 'data_residency_global', 'decentralization_consortium', 'incentive_membership', 'locked', 'trust_ledger_backed', 'update_mutable')

Atom 5:
  Extent (objects): ('did:web',)
  Intent (attributes): ('resolution_at_least_fast', 'resolution_at_most_fast', 'resolution_at_least_medium', 'compliance_experimental', 'data_residency_domain', 'supports_algorithm_upgrade', 'decentralization_web_federated', 'trust_web_based', 'portable', 'incentive_fee', 'update_mutable')

Atom 6:
  Extent (objects): ('did:key',)
  Intent (attributes): ('resolution_at_least_instant', 'resolution_at_most_instant', 'resolution_at_least_fast', 'resolution_at_least_medium', 'availability_at_least_immediate', 'availability_at_most_immediate', 'availability_at_least_high', 'availability_at_most_high', 'availability_at_least_enterprise', 'availability_at_most_enterprise', 'availability_at_least_community', 'availability_at_most_community', 'update_immutable', 'compliance_experimental', 'data_residency_device', 'algorithm_locked_to_identifier', 'incentive_free', 'portable', 'decentralization_local', 'trust_self_sovereign')

Atom 7:
  Extent (objects): ('did:ethr',)
  Intent (attributes): ('ledger_based', 'resolution_at_most_instant', 'resolution_at_most_fast', 'availability_at_least_high', 'availability_at_most_high', 'on_chain_full_document', 'compliance_experimental', 'trust_blockchain', 'supports_algorithm_upgrade', 'data_residency_global', 'decentralization_permissionless', 'locked', 'incentive_fee', 'update_mutable')

Atom 8:
  Extent (objects): ('did:ion',)
  Intent (attributes): ('ledger_based', 'resolution_at_most_instant', 'resolution_at_most_fast', 'availability_at_least_high', 'availability_at_most_high', 'on_chain_metadata', 'compliance_experimental', 'trust_blockchain', 'supports_algorithm_upgrade', 'data_residency_global', 'decentralization_permissionless', 'locked', 'incentive_fee', 'update_mutable')

Atom 9:
  Extent (objects): ('did:peer',)
  Intent (attributes): ('resolution_at_least_instant', 'resolution_at_most_instant', 'resolution_at_least_fast', 'resolution_at_least_medium', 'availability_at_least_immediate', 'availability_at_most_immediate', 'availability_at_least_high', 'availability_at_most_high', 'availability_at_least_enterprise', 'availability_at_most_enterprise', 'availability_at_least_community', 'availability_at_most_community', 'update_immutable', 'compliance_experimental', 'data_residency_device', 'supports_algorithm_upgrade', 'incentive_free', 'portable', 'trust_peer_to_peer', 'decentralization_local')
```

```
=== Atom Count Summary ===

Ecosystems:         8 atoms from 8 objects
Protocols:          5 atoms from 5 objects
Credential Formats: 6 atoms from 6 objects
DIDs/VDRs:          9 atoms from 9 objects

Interpretation:
- When # atoms = # objects: Each object is uniquely characterized by its attributes
- When # atoms < # objects: Some objects share the same minimal attribute sets
- Fewer atoms suggest more similarity/overlap between objects in that domain
```

## Technology Selection Support

Now we'll create queries to help select appropriate technologies based on requirements.

```
=== Query 1: Credential formats with selective_disclosure AND zkp ===
Found: ('AnonCreds', 'BBS+')

=== Query 2: Protocols that are peer_to_peer AND use security_authenticated_encryption ===
Found: ('DIDComm_v1', 'DIDComm_v2')

=== Query 3: DIDs that are NOT ledger_based ===
Found: {'did:peer', 'did:web', 'did:key'}
```

```
=== Technology Stack Analysis ===

Ecosystem: EUDI_ARF
  Protocols: OID4VC, ISO18013-5
  Credential Formats: mDL, SD-JWT, VC-JSON-LD, VC-JWT
  DID Methods: did:ion, Cheqd, Velocity_Ledger, did:key, did:ethr, Indy, did:web, EBSI_DID_Registry, did:peer

Ecosystem: Hyperledger_Aries
  Protocols: DIDComm_v1, DIDComm_v2
  Credential Formats: BBS+, VC-JSON-LD, SD-JWT, VC-JWT, AnonCreds
  DID Methods: did:ion, Cheqd, Velocity_Ledger, did:key, did:ethr, Indy, did:web, EBSI_DID_Registry, did:peer

Ecosystem: Trinsic
  Protocols: DIDComm_v2, OID4VC
  Credential Formats: BBS+, VC-JSON-LD, SD-JWT, VC-JWT, AnonCreds
  DID Methods: did:ion, Cheqd, Velocity_Ledger, did:key, did:ethr, Indy, did:web, EBSI_DID_Registry, did:peer
```

```
=== Use Case 1: Privacy-Preserving Credentials ===
Requirements: Selective disclosure, ZKP support, anonymous

Recommended Credential Formats: ['AnonCreds', 'BBS+']

=== Use Case 2: EU Government Identity with Strong Binding ===
Requirements: EU region, government ID sector, strong identity binding

Recommended Ecosystems: ['EUDI_ARF', 'EBSI']

=== Use Case 3: Peer-to-peer, Stateful Communication ===
Requirements: Peer-to-peer, stateful, multi-party support

Recommended Protocols: ['DIDComm_v1', 'DIDComm_v2']

=== Use Case 4: Fast, Non-Ledger DIDs ===
Requirements: Fast resolution, not ledger-based

Recommended DIDs (non-ledger): ['did:key', 'did:peer', 'did:web']
```

## Summary and Key Insights

This FCA analysis provides:

1. **Formal Contexts**: Structured representations of each technology domain (ecosystems, protocols, credential formats, DIDs)

2. **Concept Lattices**: Hierarchical organization of concepts showing relationships between technologies and their attributes

3. **Attribute Implications**: Rules that reveal dependencies between attributes (e.g., "if a format has ZKP support, it likely supports selective disclosure")

4. **Cross-Domain Relationships**: Understanding of which technologies work together across the VC stack

5. **Technology Selection Support**: Query functions to find suitable technologies based on specific requirements

### Next Steps

You can use this notebook to:
- Explore additional attribute combinations
- Identify emerging technology patterns
- Make informed decisions about technology stack selection
- Discover unexpected relationships between VC technologies
- Generate documentation about technology compatibility
