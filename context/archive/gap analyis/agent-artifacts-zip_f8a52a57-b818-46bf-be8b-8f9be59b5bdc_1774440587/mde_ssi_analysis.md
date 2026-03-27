## TL;DR

Model-driven engineering has been applied to Self‑Sovereign Identity (SSI) in several research efforts that define domain models, DSLs, choreography models, and model-based security analyses. Examples include SecureSSI for model checking, ChorSSI for BPMN-based SSI modeling, DSMLs for weakness detection, and iStar-based actor modelling.

----

## Key research examples

This section lists concrete papers that apply MDE (metamodeling, DSLs, model transformations) to SSI and summarizes their core aims and outcomes in a compact comparison. The table compares four representative works, focusing on which MDE artifacts they created, the problems they targeted, and the results they report.

| Work | MDE techniques used | Problems addressed | Results reported |
|---|---:|---|---|
| Ding and Sato SecureSSI | Modeling language for architectural patterns, formalization into temporal logic, automatic generation of verification programs for model checking [1] | Security analysis of SSI architectural patterns against attacker models and threat scenarios [1] | Mechanized framework and standalone IDE (SecureSSI) used to verify typical vulnerable patterns via model checking [1] |
| Cippitelli et al. ChorSSI | Model-driven framework using BPMN choreography diagrams to model SSI interactions and support execution [2] | Simplify development and usability of SSI systems and enable modeling plus execution of SSI interactions on blockchain platforms [2] | Framework enabling modelling of SSI systems and execution of related interactions using BPMN choreography representations [2] |
| Pattiyanon et al. DSML weakness detection | Two domain‑specific modeling languages (DSMLs) based on UML communication diagrams plus a domain knowledge graph and transformation/analysis method [3] | Automated detection of common weaknesses in SSI systems by linking domain models and known weakness knowledge [3] | A detection method evaluated using precision and accuracy metrics showing the approach can identify weaknesses in model links [3] |
| Barclay et al. iStar modelling | Actor‑based modelling using the iStar 2.0 framework to represent stakeholder goals and interactions in SSI case study [4] | Provide stakeholders and architects with communicative models for complex SSI interactions (birth registration case) [4] | Early success in representing an SSI birth registration scenario with iStar 2.0, supporting stakeholder communication and design reasoning [4] |

----

## Methods and transformation techniques used

This section summarizes the concrete modelling constructs and transformation/analysis techniques reported across the literature and how they were applied to SSI problems. The paragraphs point to specific approaches used in the cited works and what each technique enabled.

- **Model formalization** was used to express architectural patterns and attacker behavior as formal properties and to produce artifacts for model checking, enabling automated verification of security properties in SSI architectures [1].  
- **BPMN choreography modelling** was applied to represent message exchanges and participant roles in SSI protocols, and the models were used to drive execution or simulation of interactions in a blockchain context [2].  
- **Domain specific modeling languages** based on UML communication diagrams were developed to encode SSI domain knowledge and known weakness patterns; these models were linked to a knowledge graph and analyzed via transformations to detect potential weaknesses [3].  
- **Actor‑based requirements modelling** (iStar 2.0) was employed to capture goals, stakeholders, and socio‑technical interactions in SSI scenarios to aid governance and design deliberation in case studies [4].  

Each claim in this section is drawn directly from the respective papers cited above [1] [2] [3] [4].

----

## Observed results and remaining gaps

This section summarizes reported outcomes and notes what is not clearly supported in the supplied corpus, to indicate where further work is needed.

- **Verified vulnerable patterns**: SecureSSI demonstrates that model‑driven formalization plus automated generation for model checking can identify and verify vulnerable SSI architectural patterns using attacker models [1].  
- **Executable interaction models**: ChorSSI shows that BPMN choreography models can represent SSI interactions and be used to drive execution/simulation of those interactions on blockchain‑oriented frameworks [2].  
- **Automated weakness detection**: The DSML + knowledge‑graph method detected weaknesses in modeled SSI interactions and was evaluated with precision/accuracy metrics, indicating practical detection capability though detailed numeric results are reported in the original paper [3].  
- **Stakeholder modelling and governance**: iStar‑based modelling and an experience report document benefits for governance frameworks and stakeholder communication in SSI case studies, with lessons learned about tool and modelling choices [4] [5].  

Insufficient evidence exists in the supplied corpus to claim that any of these MDE efforts were explicitly targeted at, or evaluated against, the W3C Verifiable Credentials (VC) data model as a primary artifact; the papers describe SSI systems and credentials broadly but do not provide direct evidence of VC‑specific metamodels or transformation chains for W3C VC artifacts (insufficient evidence).