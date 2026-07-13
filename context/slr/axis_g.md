# Proto-SLR Axis (g): Siemens talk at Hyperledger Global Forum, Dublin

## Scope

This axis resolves a single provenance question raised in the project's meeting notes: which "Siemens talk at Hyperledger Global Forum, Dublin" was being referred to, and what evidentiary weight it carries. The paper needs it for two reasons. First, RQ0 rests on the claim that VC-based B2B/B2G ecosystems do not yet exist and that their emergence is an industrially anticipated hypothesis rather than an academic invention; a major industrial vendor (Siemens) presenting VC-based device lifecycle trust as a prototype, at a flagship SSI industry forum, is primary evidence for exactly that claim. Second, the same talk names a concrete anticipated design friction (the disconnect between the industrial device world and web-based VC tooling), which feeds the design-error taxonomy as a practitioner-sourced data point rather than a speculation of the authors. The axis covers only the confirmed Dublin talks; it is a grey-literature axis (conference talks with recordings, not peer-reviewed papers) and must be cited as such.

## Confirmed corpus

| Title | Authors | Venue | Year | Locator | Kind |
|---|---|---|---|---|---|
| Bringing Trustworthiness in Industrial Device Lifecycle using Verifiable Credentials | Marquart Franz (Senior Software Expert, Siemens AG); Saad Bin Shams (Cybersecurity Architect, Siemens AG) | Hyperledger Global Forum 2022, Convention Centre Dublin (Wicklow Meeting Room 1, Mon 12 Sep 2022, 17:20-18:00 IST) | 2022 | https://hgf22.sched.com/event/14H61 | talk |
| Keynote: ESG with a Bit of Help from Indy | Dr. Andreas Kind (Vice President Cybersecurity & Trust, Siemens AG) | Hyperledger Global Forum 2022, Convention Centre Dublin (Wicklow Hall 2A-B, Tue 13 Sep 2022, 09:45 IST) | 2022 | https://hgf22.sched.com/event/14Hbb | talk |

Recordings (LF Decentralized Trust YouTube channel, formerly Hyperledger):
Franz and Shams: https://www.youtube.com/watch?v=QP3NloQhLss
Kind keynote: https://www.youtube.com/watch?v=54Ljc1Uwt-Q

## Classification

- **Franz and Shams, "Bringing Trustworthiness in Industrial Device Lifecycle using Verifiable Credentials" (2022): must-cite.** It is the direct referent of the meeting note this axis exists to resolve, and it is the paper's strongest single piece of practitioner evidence that industrial B2B VC ecosystems were anticipated but only prototyped as of 2022; the RQ0 emergence-hypothesis argument loses its industrial anchor without it.
- **Kind, "Keynote: ESG with a Bit of Help from Indy" (2022): differentiate.** A close neighbor and the only plausible alternative referent of the meeting note; the paper should cite it to disambiguate which Siemens Dublin talk is meant and to corroborate demand-side executive commitment to SSI for cross-organizational ESG credentialing, but the RQ0 argument stands on the Franz and Shams talk alone.

## What exists, what is thin

What exists is exactly two confirmed items, both talks at the same event, both from the same company, both with working sched.com locators and public recordings. Within its deliberately narrow scope (identify the Siemens Dublin talk) the axis is complete: the referent is identified with high confidence, the recording is available, and the session description contains quotable language that serves RQ0 directly. The corpus was re-verified against the live sched.com pages on 2026-07-13 and both pages still resolve with matching titles, speakers, rooms, and times.

What is thin is everything beyond provenance. This is grey literature: no peer review, no paper, no artifact beyond slides and video, and the session descriptions are abstracts written before the talks, so any claim taken from the description text rather than the recording should be flagged as such. The axis contributes zero density to RQ1 and does not by itself establish a trend; it is one vendor at one event in one year. The paper should lean on this axis for the industrial-anticipation claim and the one named design friction, and lean on other axes (deployment spectrum, X.509 error history) for everything else.

## RQ0 evidence

Yes, the Franz and Shams talk characterizes part of the threat, though neither item defines the VC ecosystem concept.

- **Prototype-only status of industrial VC B2B**: the session description states the demo is a "prototype industrial devices approach using verifiable credentials for German Railway operator (Deutsche Bahn)" (quoted from https://hgf22.sched.com/event/14H61 as fetched 2026-07-13). A Siemens-Deutsche Bahn scenario presented as prototype in September 2022 is direct evidence that the B2B VC ecosystem was anticipated, not deployed.
- **Hedged feasibility framing**: "verifiable credentials can potentially help us in achieving a trustworthy and automated approach in cycling thorough the different device phases" (same page; "thorough" is as it appears in the fetched page text, likely a typo for "through" in the original). The word "potentially" is the vendor's own hedge on ecosystem emergence.
- **A named anticipated design friction**: the description highlights "the disconnect in the world of devices and the web technology" (same page). This is a practitioner-stated mismatch between industrial device constraints and web-native VC tooling, usable as a concrete anticipated-design-error data point in the taxonomy.
- The Kind keynote adds demand-side corroboration ("The advantages of verifiable credentials for sharing trustworthy, aggregated ESG information across supply chains is highlighted and demonstrated with the SiGREEN application", quoted from https://hgf22.sched.com/event/14Hbb as fetched 2026-07-13) but does not characterize design errors.

Plainly: no item in this axis defines the ecosystem concept or offers a systematic characterization of future design errors; the axis supplies existence proof of anticipation plus one friction data point, not a threat model.

## RQ1 anchors

None. Neither talk addresses formal metamodeling, graph predicates, or multi-source governance constraints, so this axis does not anchor RQ1. At most, the Franz and Shams lifecycle phases (manufacturing, transport, onboarding, operation, reassignment, offboarding, across multiple vendors) can be used as domain requirements that a credible ecosystem metamodel should be able to express, which is motivation for RQ1 scope, not evidence about its answerability. RQ1 anchoring must come from other axes.

## Talk identification

- **Primary referent (high confidence)**: Marquart Franz and Saad Bin Shams (both Siemens AG), "Bringing Trustworthiness in Industrial Device Lifecycle using Verifiable Credentials", Hyperledger Global Forum 2022, Convention Centre Dublin, Monday 12 September 2022, 17:20-18:00 IST, Wicklow Meeting Room 1. Session page: https://hgf22.sched.com/event/14H61. Recording: https://www.youtube.com/watch?v=QP3NloQhLss. This matches every element of the meeting note: Siemens speakers, Hyperledger Global Forum, Dublin, VCs in an industrial B2B setting.
- **Alternative referent (lower likelihood)**: Dr. Andreas Kind (VP Cybersecurity and Trust, Siemens AG), "Keynote: ESG with a Bit of Help from Indy", same event, Tuesday 13 September 2022, 09:45 IST, Wicklow Hall 2A-B (the live page shows a 09:45-09:50 keynote slot). Session page: https://hgf22.sched.com/event/14Hbb. Recording: https://www.youtube.com/watch?v=54Ljc1Uwt-Q. Plausible only if the meeting note meant the executive keynote rather than the technical session.
- **Year verdict: 2022.** Both confirmed talks took place at Hyperledger Global Forum 2022 in Dublin, per the live sched.com pages (re-checked 2026-07-13). No Dublin edition of a Hyperledger forum was surfaced for 2023 during verification for this axis, so if any note records the talk as 2023 that year is almost certainly a misremembering; uncertainty here is limited to the possibility of some other 2023 Siemens talk at a different event, which this axis did not find and does not claim exists.
