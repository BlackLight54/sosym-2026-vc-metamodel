# Proto-SLR Axis (a): VC/SSI Ecosystem Definitions and B2B/B2G Deployments

## Scope

This axis collects the scholarly and grey literature that (i) attempts to define what a VC/SSI "ecosystem" is, (ii) documents the actual deployment spectrum of VC-based systems in business-to-business and business-to-government settings, and (iii) provides prior modeling or threat-characterization work aimed at such ecosystems. The paper needs this axis for two reasons. For RQ0, the claim that VC-based B2B/B2G ecosystems do not exist yet, and that their emergence is a hypothesis whose design errors can nonetheless be anticipated, must be grounded in evidence about what the literature actually says exists (definitions, pilots, prototypes, one production registry) versus what it merely projects. For RQ1, the axis establishes the state of prior modeling of SSI ecosystems and their governance, which is the baseline against which the paper's formal three-layer metamodel with graph-predicate constraints claims its delta.

## Confirmed corpus

| Title | Authors | Venue | Year | Locator | Kind |
| --- | --- | --- | --- | --- | --- |
| A Survey of Self-Sovereign Identity Ecosystem | Soltani, Nguyen, An | Security and Communication Networks (Wiley/Hindawi) | 2021 | https://doi.org/10.1155/2021/8873429 | peer-reviewed |
| Towards a trustful digital world: exploring self-sovereign identity ecosystems | Laatikainen, Kolehmainen, Li, Hautala, Kettunen, Abrahamsson | PACIS 2021 (AIS eLibrary); arXiv preprint | 2021 | https://arxiv.org/abs/2105.15131 | peer-reviewed |
| Self-sovereign identity: A conceptual framework and research agenda | Richter, Anke | Electronic Markets, vol. 36, art. 17 | 2026 | https://doi.org/10.1007/s12525-025-00867-8 | peer-reviewed |
| Analyzing and comparing the security of self-sovereign identity management systems through threat modeling | Gruener, Muehle, Lockenvitz, Meinel | International Journal of Information Security (Springer) | 2023 | https://doi.org/10.1007/s10207-023-00688-w | peer-reviewed |
| Clear the Fog: Towards a Taxonomy of Self-Sovereign Identity Ecosystem Members | Schmidt, Muehle, Gruener, Meinel | PST 2021, IEEE | 2021 | https://ieeexplore.ieee.org/document/9647797/ | peer-reviewed |
| How modeling helps in developing self-sovereign identity governance framework: An experience report | Sroor et al. | Procedia Computer Science, vol. 204 (Elsevier) | 2022 | https://doi.org/10.1016/j.procs.2022.08.032 | peer-reviewed |
| Model-Driven Security Analysis of Self-Sovereign Identity Systems | Ding, Sato | arXiv (cs) | 2024 | https://arxiv.org/abs/2406.00620 | preprint |
| Towards a Modelling Framework for Self-Sovereign Identity Systems | Barclay, Freytsis, Bucher, Radha, Preece, Taylor | arXiv (cs) | 2020 | https://arxiv.org/abs/2009.04327 | preprint |
| Self-Sovereign Identity: A Systematic Review, Mapping and Taxonomy | Schardong, Custodio | Sensors, vol. 22, no. 15, art. 5641 (MDPI) | 2022 | https://www.mdpi.com/1424-8220/22/15/5641 | peer-reviewed |
| A Survey on Decentralized Identifiers and Verifiable Credentials | Mazzocca, Acar, Uluagac, Montanari, Bellavista, Conti | IEEE Communications Surveys and Tutorials | 2025 | https://doi.org/10.1109/COMST.2025.3543197 | peer-reviewed |
| Verification of Education Credentials on European Blockchain Services Infrastructure (EBSI): Action Research in a Cross-Border Use Case between Belgium and Italy | Tan et al. | Big Data and Cognitive Computing, vol. 7, no. 2, art. 79 (MDPI) | 2023 | https://doi.org/10.3390/bdcc7020079 | peer-reviewed |
| A Blockchain-Based Self-Sovereign Identity Approach for Inter-Organizational Business Processes | Abid, Cheikhrouhou, Kallel, Jmaiel | FedCSIS 2022, IEEE, pp. 685-694 | 2022 | https://ieeexplore.ieee.org/document/9908860/ | peer-reviewed |
| OrgBook BC | Digital Government, Province of British Columbia | digital.gov.bc.ca blog | 2023 | https://digital.gov.bc.ca/2023/07/26/orgbook-bc/ | grey-other |

## Classification

| Item | Bucket | Reason |
| --- | --- | --- |
| Soltani et al. 2021 | must-cite | The most-cited work with "SSI ecosystem" as its explicit object; RQ0 needs it to show the concept exists only as a technology-stack survey with an unsettled definition. |
| Laatikainen et al. 2021 | must-cite | Only field study framing SSI ecosystems as emergent and prospective socio-technical business ecosystems; direct scholarly support for the RQ0 non-existence hypothesis. |
| Richter and Anke 2026 | must-cite | Proves the definitional gap persists into 2026 and its five-level framework with a distinct governance level is the positioning benchmark for the paper's three layers. |
| Gruener et al. 2023 | must-cite | The only peer-reviewed systematic threat characterization of SSI in the corpus; the design-error taxonomy cannot claim grounding in documented SSI threat analysis without it. |
| Schmidt et al. 2021 | must-cite | Supplies the explicit scholarly statement that the SSI ecosystem is "rapidly changing and ill-defined"; RQ0's definitional-gap premise leans on this quote. |
| Sroor et al. 2022 | differentiate | Closest precedent to the core claim: multi-source governance constraints on an SSI ecosystem were modeled, but visually and informally; the paper must state explicitly that the formal graph-predicate step is what it adds. |
| Ding and Sato 2024 | differentiate | Formal modeling plus mechanized verification of SSI already exists here, but at the architecture/protocol level; the paper must distinguish ecosystem-governance-level formalization from protocol-level model checking. |
| Barclay et al. 2020 | differentiate | Earliest SSI ecosystem modeling framework (iStar 2.0 goal/actor models); a reviewer could see it as prior art, so the paper must contrast goal models against a metamodel with checkable cross-layer constraints. |
| Schardong and Custodio 2022 | must-cite | Systematic review naming the definition of SSI as the primary open conceptual problem; the strongest breadth evidence that no agreed ecosystem definition exists. |
| Mazzocca et al. 2025 | must-cite | Top-venue map of the current DID/VC deployment spectrum and adoption barriers; RQ0's extrapolation-from-the-spectrum argument needs this as its empirical base. |
| Tan et al. 2023 | must-cite | Empirical evidence that even flagship government VC infrastructure (EBSI) is at pilot/action-research stage; anchors the public-sector end of the non-existence claim. |
| Abid et al. 2022 | must-cite | Representative evidence that scholarly B2B VC work is at research-prototype stage; anchors the B2B end of the non-existence claim. |
| OrgBook BC 2023 | must-cite | The single production-scale counterpoint (1.4M+ entities, 3.8M+ VCs); RQ0 must acknowledge the mature end of the spectrum to be honest, and the grey-literature kind must be flagged. |

Counts: must-cite 10, differentiate 3, ignore 0.

## What exists, what is thin

The definitional side of the axis is reasonably dense. There is an unbroken chain from 2020 to 2026 of peer-reviewed work stating, in various forms, that the SSI/VC ecosystem concept is not settled: Schmidt et al. (2021) call it ill-defined, Soltani et al. (2021) survey it while conceding the definition is open, Schardong and Custodio (2022) name defining SSI as the primary open problem, and Richter and Anke (2026) still find a consolidated definition missing. Laatikainen et al. (2021) add the socio-technical business-ecosystem framing and explicitly treat these ecosystems as emergent rather than existing. This chain is strong enough to carry the paper's definitional-gap argument on its own.

The deployment and modeling sides are thin, and that thinness is itself the finding. On deployments, the corpus contains exactly one production-scale B2G data point (OrgBook BC, grey literature, government blog as source), one pilot studied empirically (Tan et al. on EBSI), and one representative B2B research prototype (Abid et al.); Mazzocca et al. (2025) map the wider spectrum but that spectrum is dominated by proposals and pilots. On modeling, there are only three items (Barclay 2020, Sroor 2022, Ding and Sato 2024), two of which are preprints, and none combines ecosystem-level governance scope with formal, checkable constraints. Nothing in the corpus provides a design-error taxonomy for VC ecosystems, and nothing engages the X.509/PKI error-history transfer argument at all; that comparison must be carried by other axes. Caveat on evidence depth: the characterizations above rest on abstracts, index records, and the verified corpus notes, not on a full-text read of every item; page-level claims should be re-verified against full texts before final citation.

## RQ0 evidence

Does any item characterize the threat, meaning the design errors that future VC-based B2B/B2G ecosystems will face? Plainly: no item does this directly. The closest approximations are partial:

- Gruener et al. 2023 characterize present-tense threats to SSI identity management (35 threats, 15 countermeasures, STRIDE plus attack trees) and find the SSI threat surface significantly larger than that of traditional identity management. This is threat characterization of SSI systems as they are, not anticipation of design errors in B2B/B2G ecosystems that do not yet exist. It supports the paper's argument but does not preempt it.
- Ding and Sato 2024 contribute a threat model grounded in real-world SSI systems, again at the system/protocol level, not the ecosystem level.

Does any item define the ecosystem concept? Several attempt it, none settles it:

- Schmidt et al. 2021 open by stating the SSI ecosystem is "rapidly changing and ill-defined" with no elaborate systematization (wording as recorded in the verified corpus notes; exact phrasing should be re-checked against the PST full text before quoting in the paper).
- Soltani et al. 2021 treat the SSI ecosystem as their explicit survey object but state clarifying the definition of SSI as a goal, conceding it is not settled.
- Laatikainen et al. 2021 conceptualize SSI ecosystems as socio-technical business ecosystems and frame them as emergent and prospective.
- Richter and Anke 2026 offer the most recent consolidation attempt (five levels including governance), which itself demonstrates the definition was still open as of 2026.
- Schardong and Custodio 2022 name defining SSI and what constitutes a self-sovereign system as the primary open conceptual problem, per the corpus notes on their stated open problems.

Verdict for this axis: the definitional gap is well evidenced and citable; the specific threat characterization RQ0 targets (anticipated design errors of future VC B2B/B2G ecosystems) is characterized by no item in this axis. The paper's RQ0 occupies genuinely unclaimed ground here, and the axis supplies the non-existence evidence (pilot-stage EBSI per Tan et al., prototype-stage B2B per Abid et al., the single OrgBook BC production registry as the acknowledged exception) needed to state that safely.

## RQ1 anchors

Three items anchor the formal-metamodel question, and together they bound the gap the paper fills:

1. Sroor et al. 2022 is the primary anchor and the primary novelty threat. It builds an SSI ecosystem governance framework from user needs, standards, laws, and business requirements using domain-specific modeling, which is exactly the multi-source constraint problem of RQ1, but the modeling is visual and informal. The paper's delta is the formalization of such constraints as checkable graph predicates.
2. Barclay et al. 2020 anchors the origin of SSI ecosystem modeling: iStar 2.0 goal/actor models on a birth-registration case. It shows prior ecosystem-scoped modeling stopped at goals and actors, with no metamodel and no cross-layer constraints.
3. Ding and Sato 2024 anchors the formal-methods end: mechanized verification via model checking exists for SSI, but at the architecture/protocol level. It proves formal treatment of SSI is feasible while leaving the ecosystem-governance level unformalized.

Secondary support: Richter and Anke 2026 treat governance as a distinct framework level, which legitimizes the paper's decision to give governance its own metamodel layer, without providing any formal machinery for it.
