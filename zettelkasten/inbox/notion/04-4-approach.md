---
source: notion
notion_id: 3360766f-0685-815a-a1b9-fee1ba6e531a
notion_url: https://app.notion.com/p/3360766f0685815aa1b9fee1ba6e531a
title: 4_approach
pulled: 2026-06-17
---

# Approach for generating VC Schemas from KGs
To provide a systematic method for designing (+\~vcse) which contain claims from a predefined (+\~kg), i.e. which credential should contain which claim from a starting +ig, I propose a **(+\~dse)** \[@kang_approach_2011\] process using (+\~pgm) \[@famelis_partial_2012\], which produces templates for platform-specific +vcs, over which +vc can be issued, from which - when presented by their Holder - the required +ig can be partially or fully re-constructed and reasoned over by the Verifier. These designs follow the +mda approach, for the reasons detailed in .
The three prongs of my approach ((+dse), (+pgm), and (+mda)) compliment each other in interesting and important ways, as I detail in this chapter. At the outset, I would like to highlight +pgm allows for the generation of multiple diverse designs while also serving as an impeccable basis for creating models which satisfy complex requirements within and across the +mda abstraction layers. Also, the use of +mda following models in a +dse process enables designers to compose metrics for *each abstract step* of the modeling process along with the final model.
To generate the models, I use Refinery \[@marussy2024refinery\][1](about:blank#fn1), a partial graph refinement and graph generation tool, which can generate diverse graphs based on a ruleset written in its own +dsl. It requires a partial model as its input, as discussed in . Based on this input, it is able to generate diverse compliant models. Because the models are generated using +pgm, a designer may define only a part of the model, and still get a complete model in the end.<br>Specifically, the model can be refined with use-case-specific elements, predicates, and instance model. Using +pgm with a solver offers another benefit: If the partial model is *unsatisfiable* - meaning it already represents an invalid model, from which no complete models can be generated - the designer can be sure that they made an error *before* generating any models.
The design process goes as follows:
> \[!example\] Flow of the design process
	1. The designer defines a partial graph model extending an abstract metamodel, which contains the graph-based requirements they want the models in the searched design space to satisfy.
	2. Multiple diverse models are generated using Refinery. These models make up the design sub-space that are explored.
	3. The models are evaluated by +dse techniques, such as the ones mentioned in
	4. A chosen model can be implemented based on the carrying format specific representation of the (+\^vcs) in (+\^psm)
Through this process, a designer can generate diverse verification requirement setups for their specific use case, which satisfy complex requirements, and create an interoperable, potentially provably privacy-preserving +vcse.
## Architecture of model generation
As the starting point of the partial model, I define a generic metamodel and predicate set, which generates models that reflect the core logic of +mda. This metamodel defines how the generated models are structured, and what constraints they must satisfy. The generated model can be divided into three subgraphs analogous to the steps of +mda.  provides an overview of the architecture and the structure of the generated graphs. As stated before (See ), the sub-graphs model the abstraction layers in the design process. The specific abstraction layers of the design process, and the transformations between them are detailed in the next few sections.
![](notion-s3-image-redacted)
The architecture of model generation using Refinery
## Abstraction layers following the MDA approach
The metamodel from which the designs are chosen in the end consists of three abstraction layers, each modeling a part of an +mda design flow. First there is the (+\~kg) we want to include in the (+\~vcse). From this, an abstract (+\~vcs) model is generated, which denotes how are the claims divided between credentials. Finally, each abstract credential is transformed to the carrying format specific representation.
Because these abstraction layers follow the +mda approach, designers can reap the benefits mentioned in . Here, this specifically means that the lements of the model are taceable between abstraction layers - which claim from the +kg is in which +vcs - , and the *transformations* are both clearly defined and extensible between abstraction layers.
### CIM: Knowledge graph
The first part of the metamodel models the (+\^kg) containing the claims the designers want to represent in the (+\~vcse). It follows the `subject-property-value` relationship model. An example model can be seen on . This is the layer designers may refine the model with the business level characteristics of the claims - e.g. what level of risk does the unwanted exposure of a claim poses.
An example Knowledge graph
### PIM: Abstract VC Schemas
The second abstraction layer is the abstract model of the (+\^vcs), following the W3C Data Model \[@w3cVC\] (See ). The relationships are "partitioned" into claims within +vc in a traceable way, meaning there is a one-to-one correspondence between the relationships in the +kg and the claims they turned into within the credentials schemas. This forms the abstract +vcse. For an example, see .
The transformation that takes a +kg to an abstract +vcs model is systematic separation of entities in the +kg into multiple entities in the +vcs model so that they fall into multiple credentials, and also satisfy the graph-based requirements the designer extends the meta-model with. This means the model can be extended to satisfy complex requirements that can be stated as patterns on an +kg. Examples of such requirements include:
- Two specific relationships must go into the same or separate credentials, based on some rule
- A credential must contain at most or at least two claims
- High-risk and low-risk credentials must never go in the same credential
Here we must recognize that the reconstruction of the +kg from the credentials happens using *entity alignment*. Accepting the truthfulness of an alignment - meaning that an alignment presented to the Verifier was intended by the issuers, and not just a coincidence, which the Holder tries to exploit (On : `a_Tom1` and `a_Tom2` *really* refer to the same Tom) is left to the judgement of the Verifier, similarly to the overall *truthfulness* of the claims, as I mentioned in .
Essentially, the +kg is "split" into disjoint subgraphs where *entity alignment* takes place. Each continuous subgraph is a credential, for which we can decide which is the `credentialSubject` claim, i.e. the "entry point" of the credential.
An example CIM with PIM
### PSM: format-specific VC Schemas
Finally, the abstract set of (+\^vcs) is refined into carrying format specific representations from which they can be directly implemented. This ensures interoperability across the multiple +vc carrying formats, in the sense that the starting +kg can be reconstructed from claims that are contained in credentials with different formats, but they are part of the same abstract +vcse model.
As I mentioned in , these formats offer different characteristics, mainly in the context of what kind of privacy-preserving techniques they enable. Designers can not only enable interoperability between Issuers offering different carrying formats, but also can define technical-level, potentially format specific requirements.
This is the final layer of abstraction, where the technical level requirements can be defined - e.g. credentials containing sensitive information should use a privacy-enchanced carrying format, or credentials that are to be verified by IoT devices should use an easy-to-verify format.
Example complete model
## Partial graph meta-model
The generic meta-model () is implemented as an extensible Partial Graph Model. It is easily extended with specific graph-based requirements and concrete model use-case specific concrete model elements. In this section, I enumerate the elements and constraints of the meta-model, and explain how do they fit into its larger context. With this metamodel, I was able to generate complete models along with the previously defined architecture.
Initial partial model in Refinery
\{<br><br><br>### KG entities \{- .unlisted\}
**Entity**: Represents a subject or a value in the `subject-property-value` scheme
**Prop**: Represents a property in the `subject-property-value` scheme.
### KG predicates and rules
**statement(Entity, Prop ,Entity)**: Defines the `subject-property-value` relationships in the model
**neighbours(Entity, Entity)**: Two entities are neighbours if they are part of a `subject-property-value` relationship
***error* non_connected(Entity, Entity)**: If there are two entities two are not transitively neighbours, meaning there is no path between them in the knowledge graph, the the graph is non continuous, which I disallow, as I want to model *interrelated* (+\^vcse)
### PIM entities
**CredEntity**: Represents a subject or a value in the abstract VC schema model. It is associated with a **Entity**, and multiple **CredEntities** can be associated with one **Entity** - which means they are *aligned*
**Claim**: Represents a property or a value in the abstract VC schema model. It is associated with a **Prop**, one-to-one, as each property becomes one claim. Its *source* attribute points to the subject **CredEntity**, its *target* attribute points to the value **CredEntity**
**Credential**: Represents the "entry point" of the Verifiable Credential. It is the root of the continuous sub-graph defined by the **CredEntities** and **Claims**.
### PIM predicates and rules
**credential_statement(CredEntity, Claim, CredEntity)**: Defines the `subject-property-value` relationships of claims within the abstract VC schema model
***propagation rule* pim_and_cim_should_align(Entity, Prop, Entity)**: If a **credential_statement** is defined, they there should be a corresponding **statement**.
***propagation rule* tracing_cim_to_pim…(…)**: If there is a **credential_statement** and a **statement** where the **Claim** and **Prop** are associated, then the corresponding entites should be associated too.
**aligned(CredEntity, CredEntity)**: The two **CredEntities** are associated with the same **Entity**m, meaning they are *aligned*.
***propagation rule* prop_source(Claim,CredEntity)**: The *source* of a **Claim** must be associated with the *subject* of a **Prop**
***propagation rule* prop_target(Claim,CredEntity)**: The *target* of a **Claim** must be associated with the *value* of a **Prop**
***error* no_cred_props_for_cred_entity(CredEntity)**: Each **CredEntity** must be part of a `subject-property-value` relationship.
**Root_cred_entity(CredEntity)**: **CredEntity** that is the root of its subgraph
**error root_ent_doesnt_have_cred(Root_cred_entity)**: Each root must have an associated Credential.
### PSM entites
***abstract* Formatted_Credential**: Abstract representation of the carrying format specific credential schemas
**AnoncredsCredentialSchema; JsonLdCredentialSchema; …**: Specific representation of the carrying format specific credential schemas
\}
## Evaluating the generated models for DSE
As introduced in  and argued for in , established +dse techniques offer a wide range of benefits for the designers of (+\^vcse). In this specific approach, my aim was to first establish the feasiblility of such techniques, and explore how they are amenable to specific use-cases. In this section, I detail some rudimentary evaluations which can be done on these simple models that I used to demonstrate the approach.
### Expert driven
One very useful way that these models can be analyzed is looking at them with the aim of improving them with new heuristics and identifying implicit constrains and requirements.<br>Sometimes we are looking for the unexpected solutions, which can be found by looking at a diverse set of solutions of the *current* iteration. This method offers a key benefit beyond using a solver and unchanging systematic evaluation techniques, as it allows for the iterative discovery of useful implicit constraints. When something doesn't look as expected in the solution, that is an opportunity to learn something new.
### Ranking based on a metric
Another approach which is possible with these models is to define a metric which can be seen as useful, and rank the generated models based on that. A trivial example could be to count the number of individual +vcs that are generated from the +kg. With this metric, we can identify the model in which the schemas are the most coarse. This can be useful in context where publication of schemas or the issuance of credentials costs a large amount of some expensive resource (*e.g. gas on Ethereum*), or in an iteration step where we want to explore the design where schemas are divided as little as possible.
### Pareto Analysis of multi-objective functions
Multi-objective optimization of the models is useful when we can identify multiple metrics which are beneficial to optimize, and we cannot combine them into a single metric. An example could include the *Pareto front* formed in the context where we want to evaluate the granularity and the posed correlation risk. This can inform us which models are *Pareto optimal*, meaning the credentials cannot be made less granular without increasing the risk off correlation, and vice-versa.
## Assessment of the current implementation
With the current implementation of my approach[2](about:blank#fn2), I was able to generate consistent +vcs models, which satisfied graph-based requirements.
It is in development and currently doesn't implement the full design flow. Right now, I am working on the meta-model, making it more efficient and easy to use. I want to create a rich set of examples, big and small, over which the model generation can be evaluated, with respect to requirement satisfaction, ease of use. and generation performance.
My aim is to also define and create generic +dse evaluation processes, both to showcase the capabilities of my approach, and to provide templates for designers that they can use in their domain specific design endeavours.
The final goal is to provide a toolchain in which designers can iteratively define domain-specific partial models, generate a diverse set of complete models, and evaluate them based on their own metrics.
> \[!todo\]<br>Kód függelékben, színezve, kristófnak üzenet
---
1. Online version of the tool is available at [https://refinery.services/](https://refinery.services/)[↩︎](about:blank#fnref1)
2. Assets are available on GitHub at https://github.com/BlackLight54/dse-vc-refinery[↩︎](about:blank#fnref2)
