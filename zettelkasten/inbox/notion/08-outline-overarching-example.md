---
source: notion
notion_id: 3560766f-0685-81a6-b22d-e04dd3997f9e
notion_url: https://app.notion.com/p/3560766f068581a6b22de04dd3997f9e
title: Outline — Overarching Example
pulled: 2026-06-17
---

# Structure of the outline
*Hybrid problem-driven + layered structure.* The overarching example (academic credentials) is the spine; each layer advances by showing how the previous layer breaks down on the example. The liquor store, EHIC, and AI-agent appear as *spotlights*, not full sections.
Time budget: 90 minutes, of which **65–70 minutes of planned content**, 20–25 minutes for questions, transitions, and unexpected detours.
# Sections
## 0. Opening — context and connection (\~5 min)
- What follows from lectures 1–11, and what comes after this lecture.
- What we will build on from lecture 11 (Privacy/ZK): zero-knowledge proofs, BBS / SD-JWT primitives.
- A one-sentence promise: the single thought students should leave with.
## 1. The problem — diploma in another EU country (\~8 min)
*Productive failure opening.*
- Concrete scenario: BME graduate, German PhD admission, presenting the original diploma.
- Current practice: certified copies, postal mail, Apostille, translation, time, cost.
- *Question to the room:* "What can go wrong here?" — 10–15 sec deliberate silence.
- What would we want instead? We pull the requirements list — this becomes our *evaluation grid* for the rest of the lecture.
## 2. SSI triangle — introduction on the spine example (\~8 min)
- Function before terminology. First: "BME signs a claim about Anna; Anna stores it; TUM checks it."
- Then: name these roles (issuer, holder, verifier).
- *First introduction of the canonical diagram.* We re-interpret it after every new layer.
- Backward reference: "Remember the Fabric MSP? There was a similar triangle there too, just with corporate identities."
## 3. VC lifecycle — issuance (\~8 min)
- Issuance interaction: BME issuance flow.
- Holder binding basics: the student's pubkey in the credential. ("Why isn't the name enough?" — 10 sec silence.)
- Choice of signature scheme. This is the first appearance of *signature scheme choice constrains later disclosure capabilities.* Calibrated certainty marker: "we'll come back to this." (Permitted *attention contract* style forecast — concrete and near.)
## 4. Disclosure — liquor store spotlight (\~12 min)
*The cleanest contrast section. The spotlight takes focus for 12 minutes, then we return to the spine.*
- Scenario: 17 vs. 35 years old, buying beer.
- **Tier 1 — JWT as VC.** I show the entire ID. What's wrong? — 10 sec silence. Address, place of birth, mother's name — all visible.
- **Tier 2 — SD-JWT, field-level.** Just the age, just the photo. What remains a problem? — exact birth date is still visible.
- **Tier 3 — predicate.** "I am over 18." A boolean. What remains a problem? — issuer-side linkability via unique identifiers.
- **Tier 4 — full ZK.** Arbitrary claim proof. ZK proof that hides the issuer signature. The price? — development complexity, audit demands.
- *Loop back to the requirements grid.* Which tier satisfies the diploma example? Pose this as a decision question to the room.
## 5. VC lifecycle — presentation (\~6 min)
- Back to the diploma example: Anna shows TUM her diploma in SD-JWT form, revealing only the major and the year of graduation.
- Verifier-side storage avoidance → GDPR fit architecturally, not legally.
- Backward reference to section 1: how many items on the *requirements grid* are now ticked?
## 6. DID — the third corner of the triangle (\~10 min)
- *Function first.* "How does TUM know this is actually BME's signature?" — deliberate silence.
- Minimal, *functional* introduction of classical PKI (CA, key lookup). Done functionally, not historically.
- DID as decentralized alternative.
- Method spectrum on 2–3 representative examples: did:web, did:ethr, an EBSI method.
- **Emphasis:** the DID world has *no hierarchical root*. Say this explicitly.
- *Here the course title enters explicitly.* For on-chain DID methods, the blockchain is the VDR.
## 7. EBSI and the DC4EU pilot — the personal connection (\~5 min)
- What EBSI is: 4-generation European Blockchain Services Infrastructure, permissioned, member states as nodes.
- The *Diplomas* use case: Europass + microcredentials.
- *DC4EU pilot.* "We piloted this stack for the Commission." Micro-mention, not a long pitch.
- What did the pilot surface that the spec doesn't make obvious? — one or two concrete lessons.
## 8. Complex flow spotlight — cross-border medical care (\~7 min)
- Scenario: Hungarian citizen visiting a doctor in Italy.
- Emphasis: *the doctor is also a presenter*. The patient verifies the doctor's license.
- Predicate proof finds its most natural case here: "the patient has valid coverage of category X" without revealing the diagnosis history.
- Backward reference to section 4: same disclosure spectrum, different stakeholders.
## 9. AnonCreds Revocation Registry — mathematical interlude (\~7 min)
*The one hard concept we explicitly mark:* "this is the deepest point of the lecture; if you lose me here, don't worry — the take-away is that *revocation can be proved in ZK too*, and it's an elegant mathematical construction."
- Problem: how does the holder prove the credential isn't revoked, without revealing which credential they hold?
- Cryptographic accumulator as a data structure: O(1) membership proof.
- RSA accumulator intuition. The hard problem: the strong RSA assumption.
- Lateral connection to lecture 11: students see the *industrial* application of ZK building blocks here.
## 10. Closing spotlight — AI agency (\~5 min)
- *"Where is the AI in this?" — the question every student wants to ask.* We answer it now.
- Byron Cook's example (Amazon Bedrock): "I'm moving to Germany, and the AI agent registers my child for kindergarten."
- What does it take? Delegation via VC; short-lived credentials held by the agent; verifier-side agent recognition.
- *This is an open research question.* Calibrated certainty marker.
## 11. Where this is going — recruiting slide (\~3 min)
- Concrete open research questions, with names attached.
- *Not* "thanks for your attention." Instead: "here are three problems we're working on at the department; if any of these caught your eye, come find us."
# Timing check
<table header-row="true">
<tr>
<td>Section</td>
<td>Planned (min)</td>
<td>Cumulative</td>
</tr>
<tr>
<td>0. Opening</td>
<td>5</td>
<td>5</td>
</tr>
<tr>
<td>1. Problem</td>
<td>8</td>
<td>13</td>
</tr>
<tr>
<td>2. SSI triangle</td>
<td>8</td>
<td>21</td>
</tr>
<tr>
<td>3. VC issuance</td>
<td>8</td>
<td>29</td>
</tr>
<tr>
<td>4. Disclosure / liquor store</td>
<td>12</td>
<td>41</td>
</tr>
<tr>
<td>5. VC presentation</td>
<td>6</td>
<td>47</td>
</tr>
<tr>
<td>6. DID</td>
<td>10</td>
<td>57</td>
</tr>
<tr>
<td>7. EBSI / DC4EU</td>
<td>5</td>
<td>62</td>
</tr>
<tr>
<td>8. EHIC spotlight</td>
<td>7</td>
<td>69</td>
</tr>
<tr>
<td>9. Revocation math</td>
<td>7</td>
<td>76</td>
</tr>
<tr>
<td>10. AI agent</td>
<td>5</td>
<td>81</td>
</tr>
<tr>
<td>11. Recruiting</td>
<td>3</td>
<td>84</td>
</tr>
<tr>
<td>**Content total**</td>
<td>**84**</td>
<td></td>
</tr>
<tr>
<td>Question / reaction reserve</td>
<td>6</td>
<td>90</td>
</tr>
</table>
*Note:* the content draft currently runs 84 minutes, leaving only 6 minutes of slack. That's tight. Sections 3 and 5 (VC issuance + presentation) are natural candidates for compression if the spine example flows well.
# Consolidation points
Following the two-clocks rule, at least three "let it settle" pauses are needed:
1. End of section 4 — disclosure-spectrum recap projected back onto the requirements grid. (\~minute 41)
2. End of section 6 — three-pillar map review. (\~minute 57)
3. End of section 9 — "we have seen these building blocks; section 10 is now an open application." (\~minute 76)
These are not new-content moments; they are repetition and re-framing, *deliberately*.
