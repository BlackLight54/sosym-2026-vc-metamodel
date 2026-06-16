---
source: notion
notion_id: 3560766f-0685-81c1-b6dc-dedd26a25703
notion_url: https://app.notion.com/p/3560766f068581c1b6dcdedd26a25703
title: Thesis Map
pulled: 2026-06-17
---

# Central thesis
> Self-Sovereign Identity is an architectural pattern with the issuer–holder–verifier triangle, in which the Verifiable Credential lifecycle (issuance → storage → presentation) plays out through different disclosure schemes, and where the DID — as a decentralized PKI registry — connects to the blockchain world.
# Three pillars
## Pillar 1 — SSI triangle and VC lifecycle
*Architectural level*
- **Issuer** — takes a claim about a subject and signs it. Source of trust.
- **Holder** — stores the credential in their wallet; chooses what to present.
- **Verifier** — in a given interaction, requests a claim; doesn't necessarily store it.
*Lifecycle level*
- **Issuance** — issuer ↔ holder protocol; subject binding; signature scheme choice.
- **Storage** — wallet architecture; key management; portability.
- **Presentation** — holder ↔ verifier protocol; presentation request; selective disclosure; proof of possession.
*Lateral connection to Pillar 3:* the issuer's and verifier's keys/identities have to be locatable somewhere → DID + VDR.
## Pillar 2 — Disclosure spectrum
The four canonical levels, in order of decreasing disclosure / increasing privacy:
1. **Full credential presentation** — JWT as VC. Verifier sees everything. Universal support, zero privacy.
2. **Field-level selective disclosure** — SD-JWT, SD-JWT VC. Holder picks which fields to reveal; the rest stay as hashes. Field granularity.
3. **Predicate proofs** — "am I over 18?" type claims. Holder proves a predicate over the value without revealing the value itself. BBS+ or CL based.
4. **Full ZK** — proof over an arbitrary circuit. Maximum expressivity, minimum disclosure. Custom ZKP design required, industrial maturity limited.
*Three axes to traverse with the spectrum:*
- *Expressivity* — what claims can I formulate? Increases left to right.
- *Support* — how many existing systems understand it? Decreases left to right.
- *Development cost* — how much investment to prove a specific claim? Increases left to right, dramatically at level 4.
*Lateral connection to Pillar 3:* for storage-free verification, the verifier needs to know where to find the issuer's key → DID resolution.
## Pillar 3 — DID as decentralized PKI registry
*Function:* tells you which key(s) belong to a given identifier (DID), which service endpoints are associated, and who controls it.
*The DID document* — JSON-LD structure; verification methods, service endpoints, controller.
*Method differences:*
- *Ledger-less, self-contained* — e.g. did:key. The DID itself contains the public key.
- *Web-based* — e.g. did:web. DNS + HTTPS as trust anchor; no blockchain.
- *On-chain* — e.g. did:ethr, did:ion, did:cheqd. Blockchain as VDR. This is where the course title enters.
- *Permissioned ledger* — e.g. EBSI methods. Hyperledger / governance frame + blockchain.
*Key conceptual swap:* classical PKI is hierarchical (CA tree); the DID world has *no central root*. Instead, ledger-, governance-, and method-level trust mechanisms combine. This must be stated explicitly — otherwise the student imagines DID resolution as CA-like and stays on the wrong track until the end of the lecture.
*Lateral connection to Pillar 1:* issuer and verifier identities are addressed via DIDs; the credential's signature is verified using the key listed in the DID.
# Secondary claims (built on the pillars)
- **GDPR fit** — Field-level and predicate disclosure architecturally solve what classical systems address through legal frameworks. The verifier cannot see what they shouldn't.
- **Holder binding** — only the legitimate holder can present the credential; non-trivial, and one of the central tensions in the SD-JWT VC vs. mDoc debate.
- **Revocation** — the issued credential's revocability. AnonCreds Revocation Registry as a pedagogically beautiful mathematical interlude: cryptographic accumulators, RSA-group hidden values.
- **Trust framework** — who decides which issuers are trustworthy? Trust Registry / EBSI Trusted Issuer Registry / EUDI Trust Anchor. This is layer 4 of Trust over IP; this is where governance enters.
# Terminology evolution paths
What do we call something *before* formally introducing it (goal: smooth transition from informal to formal).
<table header-row="true">
<tr>
<td>Informal (Act 1)</td>
<td>Formal (Act 2)</td>
</tr>
<tr>
<td>"The signed claim"</td>
<td>Verifiable Credential (VC)</td>
</tr>
<tr>
<td>"What the holder shows the verifier"</td>
<td>Verifiable Presentation (VP)</td>
</tr>
<tr>
<td>"The holder's pocket / app"</td>
<td>Wallet</td>
</tr>
<tr>
<td>"The issuing party's address"</td>
<td>Issuer DID</td>
</tr>
<tr>
<td>"The way of partial disclosure"</td>
<td>Selective disclosure mechanism</td>
</tr>
</table>
# What I deliberately leave out of the map
- Concrete DID-method enumeration beyond the 2–3 representative examples.
- Wallet protocol (OpenID4VCI, OpenID4VP) protocol-level details. Brief mention only.
- VC Data Model 1.1 vs. 2.0 specification differences.
- Linked Data Proofs vs. JSON-JOSE detailed comparison.
