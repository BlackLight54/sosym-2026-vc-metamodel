---
source: notion
notion_id: 3360766f-0685-8106-b93b-c150f0af3e18
notion_url: https://app.notion.com/p/3360766f06858106b93bc150f0af3e18
title: 2_background
pulled: 2026-06-17
---

> Pull note: Embedded image src URLs were transient AWS S3 presigned URLs (expire ~1h). The presigned `?X-Amz-...` query strings have been stripped; only the base object URL is retained so the image identity is preserved. Everything else is verbatim.

# Background
In this chapter, I introduce +vc in the wider context of +ssi. I explain how they can be modeled as knowledge graphs, and how graph-based requirements aid the design of +vc through an illustrative example. Then I briefly introduce +dse, with some common approaches and metrics with which designs are evaluated. Finally, I summarize the relevant concepts from the +mda approach. In the following chapters, I use these concepts to construct my approach for systematically designing interrelated sets +vc.
## Verifiable Credentials in an (increasingly) SSI world
**+vc** are a novel family digital claims. They are conceptually part of the +ssi, which according to Brian Behlendorf, GM for Blockchain, Healthcare, and Identity at the Linux Foundation, is “the most crucial fix for today’s broken Internet.” \[@SSIPreukschatReed\]
**+ssi** - also sometimes called *Decentralized Identity* - is a collection of ideologies, design paradigms, protocol frameworks, cryptographic principles, and, recently, software solutions that aim to provide an alternative to the existing identity management paradigms. Contrasting with today’s centralized and federated models, it is a decentralized, peer-to-peer identity architecture based on the principle that each peer has total control over the identifiers they own or are subject to. Within this model, +vc are the standardized and digitally verifiable form of the trusted claims and information which the parties share about each other. By using +vc, parties have a cryptographic framework for distributing claims in a peer-to-peer and privacy-preserving way. Many “flavors” of +vc also support the use of novel +zkp techniques, which when integrated to applications, minimizes the unescessary information shared by the users. They have been adopted by the European Union in the European Digital Identity Wallet \[@eidas2;@eudiw\] and in the EU Dataspaces initiative \[@eu_dataspaces;@gaiax\].
In this section, I discuss +ssi with an emphasis on +vc, as laid out by Drummond Reed and Alex Preukschat \[@SSIPreukschatReed\] as well as the Trust over IP Foundation’s model \[@toip_model\]. My aim is to outline how +vc work, and argue that their design is non-trivial.
### Concepts of Self-sovereign Identity
Digital identity is the sum of all digital information that exists connected to a person, such as their name, address, birthdate, education and work history, health and insurance data, and financial information. It describes who they are in every aspect of their digital life.\[@waltid_decentralized_identity\]<br>+ssi is an approach to digital identity which aims to give people and organizations full control over their data, through structural and technological innovation.
> \[!info\]- Principles of Self-sovereign Identity
	The principles of +ssi, according to Christopher Allen \[@allen_path_2016\] are the following:
	Existence:<br>Users must exist in the digital world without the need for a third party<br>Control:<br>Users must be able to control how their identity is used<br>Access:<br>Users must be able to access their data and any associated claims without the interference of gatekeepers or intermediaries<br>Transparency:<br>The systems used to administer and operate a network of identities must be open in how they function and in how they are managed and updated<br>Persistence:<br>Identities should last exactly as long as the user wishes<br>Portability:<br>Information and services about identity must be transportable. Identities must not be held by a singular third-party entity<br>Interoperability:<br>Identities should be as widely usable as possible<br>Consent:<br>Sharing of data must only occur with the consent of the user<br>Minimalization:<br>When data is disclosed, that disclosure should involve the minimum amount of data necessary to accomplish the task at hand<br>Protection:<br>When there is a conflict between the needs of the identity network and the rights of individual users, then the network should err on the side of preserving the freedoms and rights of the users
+ssi allows us to model digital identity just like we are used to in the non-digital world based on paper documents and cards. Instead of documents made of paper and plastic stored in a wallet, data is shared through digital credentials stored in wallet applications on the users phone. Importantly, these digital credentials can be securely shared in a peer-to-peer manner, and their authenticity can be reliably verified. \[@SSIPreukschatReed; @waltid_intro_ssi\]
The basic lifecycle of these credentials is usually illustrated with the so called *Trust Triangle* \[@SSIPreukschatReed;@waltid_decentralized_identity;@toip_model\], seen on , which describes the different roles and their relationships regarding data sharing.
![](notion-s3-image-redacted)
Trust Triangle from the Trust over IP Foundation
### Issuer, Holder and Verifier \[@waltid_verifiable_credentials\]
- **Issuers** - Parties who “issue” identity-related data to people or organizations (“Holders”) in the form of digital credentials. They are the original data sources of a digital identity ecosystem. For example, a government issues digital passports to citizens or a university issues digital diplomas to graduates.
- **Holders** - Individuals or organizations who receive digital credentials that contain data about themselves from various sources (“Issuers”). By aggregating and storing such credentials in digital wallets, Holders can build holistic digital identities that are under their control and can easily be shared with third parties (“Verifiers”).
- **Verifiers** - Parties who rely on data to provide products and services can reliably verify and process data that has been provided by others (“Holders”). Verifiers, also called “Relying Parties”, are usually organizations or individuals in their professional capacity.
To model the technological and functional requirements of these relationships, the Trust over IP Foundation defined a protocol stack \[@toip_model\] (), through which I will present the technological building blocks of +ssi based systems. Their goal is to present +ssi as a possible *trust layer* over the internet.
The lower two levels of the stack focus on meeting the technical requirements of digital trust with *+vdr* serving as repositories of cryptographic material digital trust can be based on, and *Trust Spanning Protocols* - communication protocols enabling secure and private communication. The top two layers focus on meeting human requirements with +vc Exchange protocols, which can be integrated into specific but standardized software ecosystems. Through the ToIP protocol one can establish trusted, secure, and private peer-to-peer connections, issue, exchange, and verify digital credentials, and store public credential data on Verifiable Data registries, which may use decentralized or distributed record-keeping technologies.
![](notion-s3-image-redacted)
Trust over IP model
In the next few sections, I cover the relevant technological building blocks of the ToIP protocol stack\[@toip_model\], and explain how interoperability can be maintained between the different +vc formats, as well as what challenges does the design of +vc pose. Even though the building blocks of the ToIP stack \[@toip_model\] *are* related, they are often implemented independently, and may also exist as independent services. Their discussion should follow similar compartmentalization.
### Decentralized Identifiers
**+did**\[@w3cDID\] give us the power of verifying information, like credentials, anywhere, anytime, through the establishment of a novel form of public key infrastructure.
+did are unique identifiers (URIs) which are standardized by the W3C \[@w3cDID\]. They can refer to any subject - from a person, to an organization, to a thing or basically anything else for that matter. They associate this subject with a DID document (DIDDoc). A DIDDoc contains cryptographic information with which the controller of the +did may prove ownership of the DID, or ensure the authenticity of the claims made by them in a digital credential. They may also contain service endpoints, which are URLs through which the controller of the DID may be reached. A comparison between centralized identifiers and +did can be seen on .
A DID is reachable through a DID method, which is a technical specification of how the identifier can be resolved. DID methods may be implemented over various types of verifiable data registries, such as the Domain Name System, existing Public Key Infrastructure (e.g, X.509 or JWS), general-purpose blockchains \[@w3cDID;@blockcertsCredentialStandard\], purpose-built blockchains \[@indyWiki\], or even using a peer-to-peer model (pairwise and n-wise DIDs). Their syntax can be seen on .
![](notion-s3-image-redacted)
DID Syntax
<table header-row="true">
<tr>
<td>**Centralized Identifiers**</td>
<td>**Decentralized Identifiers**</td>
</tr>
<tr>
<td>Identifiers provided by centralized providers like Google or phone companies allow access to apps and services*e.g. email addresses and passwords, Single sign-on(SSO)*</td>
<td>Identifiers are generated by their user, and stored either on their own hardware, or on tamper-proof Verifiable Data Registries</td>
</tr>
<tr>
<td>Personal data is collected on centralized servers and it’s not clear who has access to it</td>
<td>Data is not shared with anyone except whoever is chosen and there is no personal data stored on Verifiable Data Registries</td>
</tr>
<tr>
<td>Data can be manipulated by providers</td>
<td>Records on Verifiable Data Registries are tamper-proof</td>
</tr>
<tr>
<td>Data is owned by third parties and users can’t control their data</td>
<td>Users have full ownership of their DIDs and complete control of their cryptographic keys</td>
</tr>
<tr>
<td>People’s identifiers are used to track online behavior</td>
<td>Create as many DIDs as needed for different relationships to keep sensitive data private as having multiple DIDs makes it harder to track users and correlate data</td>
</tr>
<tr>
<td>Providers can remove access to your data anytime</td>
<td>Data can’t be taken away from the user and their credentials can be verified anywhere, anytime</td>
</tr>
<tr>
<td>Less secure and potentially eavesdroppable connections between parties</td>
<td>Enables unique, private, and secure peer-to-peer connections between two parties</td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</table>
### Existing VC formats
The W3C defines a +vc as “… a tamper-evident credential that has authorship that can be cryptographically verified.” While there are many competing flavors and models of +vc, the core of the abstract data model is established by the W3C +vc Data Model \[@w3cVC\].
+vc encode claims about their Subject made by their Issuers, cryptographically linked to both their Issuer and their Subject. These claims can then be verified by presenting them to a Verifier - meaning the claims are communicated through a secure channel, with the instructions and resources (e.g. signatures and public keys, possibly from PKI or a DIDDoc) to verify their authenticity, and whether they have been revoked. Verifying a +vc does not directly imply the truth of the claims encoded in it, only their authenticity and currency. Rather, after authenticity and currency are established, a verifier may evaluate the claims based on their own policy and trust in the Issuer.
+vc are held within digital wallet applications, which are digital solutions designed to store +vc securely, and with the ability to present these credentials using various *presentation protocols* (See ).
There are multiple competing encoding formats of +vc, (See ) which offer different privacy characteristics and are supported by different *presentation protocols*. A key privacy characteristic is whether they support some kind of +zkp protocol, and if so, then what kind.<br>A **+zkp** is a cryptographic scheme where a Prover is able to convince a Verifier that a statement is true, without providing any more information than that single bit (that is, that the statement is true rather than false). In the context of +vc, this usually means the following two types of schemes:
**Selective Disclosure**<br>enables a holder to choose which pieces of information contained in a +vc will be revealed to a verifier, rather than being forced to reveal all the data present in a +vc, through the use of cryptographic protocols, such as BBS \[@looker_bbs_2024\].<br>For example, Alice can share share only her age to verify being old enough to purchase products offered in an ecommerce shop, without revealing other personal information present in her Verifiable ID document used for verification. \[@waltid_selective\]<br>**Range Proofs**<br>is a +zkp that demonstrates a numeric value in a credential falls within a specified range (e.g., between a minimum and maximum), without revealing the actual value. Now, Alice share only *the fact* that she is old enough, without revealing her actual age.
As encoding formats can be derived from the abstract data model, a modeled claim set can be represented in either of them. If a designer has an abstract model for a set of interrelated +vc, they can derive the format specific representations, and choose the best one for their needs. This can be heuristic or even systematic, as some characteristics of the formats - e.g. whether they support Selective Disclosure - can be modelled.
<table header-row="true">
<tr>
<td>Format</td>
<td>Owner</td>
<td>Published</td>
<td>Enc.</td>
<td>SD</td>
<td>Pros</td>
</tr>
<tr>
<td>JWT</td>
<td>IETF</td>
<td>2015-03</td>
<td>JSON</td>
<td>No</td>
<td>Widely adopted and supported, simple to implement and use</td>
</tr>
<tr>
<td>CWT</td>
<td>IETF</td>
<td>2018-05</td>
<td>CBOR</td>
<td>No</td>
<td>Adopted and supported, but not so much as JWT <br>Smaller binary payload than JWT</td>
</tr>
<tr>
<td>W3C VC JSON-LD</td>
<td>W3C</td>
<td>2024-10</td>
<td>JSON</td>
<td>No</td>
<td>Semantically expressive, extensible with linked data</td>
</tr>
<tr>
<td>SD-JWT VC</td>
<td>IETF</td>
<td>2024-09</td>
<td>JSON</td>
<td>Yes</td>
<td>Supports SD while being compatible with existing JWT infra</td>
</tr>
<tr>
<td>AnonCreds</td>
<td>LF DT</td>
<td>2024-03</td>
<td>JSON</td>
<td>Yes</td>
<td>Strong privacy features, such as SD and range proofs</td>
</tr>
<tr>
<td>mDocs (mDL)</td>
<td>ISO/IEC</td>
<td>2021-09</td>
<td>CBOR</td>
<td>No</td>
<td>Standardized for mobile driving licenses</td>
</tr>
<tr>
<td>JSON Web Proof</td>
<td>IETF</td>
<td>2024-09</td>
<td>JSON</td>
<td>No</td>
<td>Extends JWT with proof mechanisms</td>
</tr>
</table>
To enforce a specific structure on a given claim collection, the W3C defines *Data Verification Schemas*, which are used to establish that the structure and contents of a +vc conform to a published schema. Mostly they enumerate what claims the +vc must contain. A `JsonSchema`, for example, lists what keys are in the +vc, and what is their data type. Many ecosystems call these schemas **+vcs**, which is the terminology used in this paper.
### Identities and presentation protocols
A final technical detail of the ToIP model \[@toip_model\] is the layer through which +vc can be communicated, ***presentation protocols***. They are sometimes called *Credential Exchange Protocols*, *Trust Spanning Protocols*, or *Transfer Envelopes*. These protocols (See ) enable the secure and private communication of claims on- and sometimes offline, while offering a diverse set of complementary functions which aid developers in the design of processes and applications. They influence the choice of +vc format as each support different ones. They are important in the context of regulatory compliance, as they are the center pillar of security in a digital process involving +vc.
<table header-row="true">
<tr>
<td>Protocol name</td>
<td>Owner</td>
<td>EUDIW ARF Compliance</td>
<td>Proximity</td>
</tr>
<tr>
<td>OpenID for Verifiable Credentials</td>
<td>OIDF</td>
<td>Explicit for remote flows</td>
<td>Bluetooth</td>
</tr>
<tr>
<td>Mobile Driver’s License(mDL)</td>
<td>Auth0</td>
<td>Explicit for proximity flows</td>
<td>NFC</td>
</tr>
<tr>
<td>DIDComm</td>
<td>DIF</td>
<td>Possible</td>
<td>BLE</td>
</tr>
<tr>
<td>Aries</td>
<td>LF DT</td>
<td>Unlikely</td>
<td>BLE</td>
</tr>
<tr>
<td>Credential Handler API 1.0 (CHAPI)</td>
<td>W3C</td>
<td>Likely</td>
<td>-</td>
</tr>
</table>
### Credentials as Knowledge Graphs
Claims in +vc can be expressed as **subject-property-value** relationships, e.g. `"Tom"-"has"-"blue eyes"`. This means that +vc can be modelled as +kg or +ig.
![](notion-s3-image-redacted)
Information graph associated with a basic verifiable credential; source: W3C Verifiable Credential Data Model v2
As +vcs make establishing the structure of common claim sets easier; their design influences the privacy characteristics of a +vc ecosystem. How the claims are divided up between credentials plays a crucial role in how expressive a set of related +vcs is and how precisely a Holder can control what they disclose when they present a +vc. This, and many other requirements of +vcs can be modeled as graph-based requirements.
An important concept in this case is *Entity Alignment*, which is the process of identifying nodes that represent the same entity across multiple +kg. In our case, if two +vcs contain claims about the same subject, there needs to be a process that enables us to identify them and thus enable us to reason over the joint +ig, as shown in .
```latex
\usetikzlibrary{arrows.meta,calc,positioning}
\usepackage{tikz-qtree}
\begin{document}
\caption{Decomposition of an information graph into verifiable credential schemas and illustrating entity aligment}\label{fig:alignment}
\begin{tikzpicture}[
  scale=0.8,
  every node/.style={thick},
  every path/.style={thick},
  vertex/.style={draw,circle,minimum height=3em},
  level distance=8em,sibling distance=2em,
  edge from parent path={(\tikzparentnode) -- (\tikzchildnode)},
  edge from parent/.append style={->},
  every tree node/.style={vertex,inner sep=1em},
  vc/.style={draw,rectangle,minimum height=3em,text width=8em,text centered},
  rellab/.style={fill=white,inner sep=.25em},
  >={Straight Barb[scale=1.5]},
]
  \Tree [.\node (iga) {A};
    \edge node[rellab] {is}; B
    \edge node[rellab] {has}; \node (igc) {C};
  ]
  \coordinate (cm) at ($(iga)!.5!(igc)+(14em,0)$);

  \node[above=of cm,vc] (vc1) {Verifiable Credential 1};
  \node[below=of cm,vc] (vc2) {Verifiable Credential 2};
  \node[right=6em of vc1,vertex] (ma1) {A};
  \node[right=6em of vc2,vertex] (ma2) {A};
  \node[right=of ma1,vertex,yshift=2.5em] (mb) {B};
  \node[right=of ma2,vertex,yshift=-2.5em] (mc) {C};

  \draw[->] (vc1) -- node[rellab] {subject} (ma1);
  \draw[->] (vc2) -- node[rellab] {subject} (ma2);
  \draw[->] (ma1) -- node[rellab] {is} (mb);
  \draw[->] (ma2) -- node[rellab] {has} (mc);

  \draw[red!60!black,{Stealth[scale=1.5]}-{Stealth[scale=1.5]},dashed] (ma1) -- node[rellab] {Entity Alignment} (ma2);

  \coordinate[right=3em of igc] (barc);
  \draw
    (current bounding box.north -| barc)
      node[below left] {Information Graph}
      node [below right] {Credential Schema Model}
    -- coordinate (mid) (current bounding box.south -| barc);

  \draw[ultra thick,-Triangle] ($(mid)+(-3em,0)$) -- ($(mid)+(3em,0)$);


\end{tikzpicture}

\end{document}
```
Reasoning over +ig constructed from +vcs allows us to make inferences and evaluate policies over subjects in a privacy-preserving way. Although many small examples have been demonstrated in existing research, a systematic design approach has yet to be proposed for +vc schema sets, over which a policy may reason.
To this end, I define a set of interrelated +vcs, which are designed together, have a related set of requirements, influence each others design characteristics, and can form a connected +ig a *+vcse*.
### A Motivating Example
To demonstrate how such graph-based requirements come about, I present a hypothetical +vcse - meaning a set of interrelated +vcs that are meant to be used together - in which i can highlight the challanges that lie in their design.
A national government along with a consortium of financial institutions is developing a comprehensive financial services ecosystem. This system needs to assess individuals for various financial products and services, including credit scoring, mortgage applications, investment opportunities, insurance policies, but also regular KYC procedures, simple wire transfers, and payment with credit cards. To highlight one *complex* scenario in this ecosystem, I explain what kinds of credentials a client must present to get access to government supported mortgage for newly constructed homes based on the Hungarian “CSOK” government program \[@mnb_csok\].
> \[!example\] Credentials presented for a government supported mortgage
	**Debtor and Co-debtor:**
	- National ID - to prove their identity and that they are Hungarian
	- Proof of residence - To prove that they live in Hungary
	- Proof that they are not under foreclosure or bankrupt - BAR lista
	- Account at the bank
	**Marriage and children:**
	- Marriage certificate - To prove that they are married
	- Birth certificate of the child
	**Employment:**
	- Proof of Social Security payment status
	- Financial statements for three months of pay - So that they have enough income to pay the mortgage
	- Proof of employment for at least three months of *continous* and open-ended employment
	**Constructed home:**
	- Proof of ownership of the used plot
	- Construction permit
The presented claims come from multiple issuers, and have widely differing characteristics. For them to be trustworthy and reusable, the designers of the ecosystem must carefully consider how the claims are divided between the credentials in this scenario, along with the claims in the previously mentioned simpler ones. Here are a few important aspects for the claims contained within the credentials:
> \[!info\] Design aspect of claims contained within VCs<br>**Persistence and update frequency**
	**Long-term or static**<br>Never or rarely changes *e.g. birth date, education***Periodical**<br>Evaluated on a regular refresh cycle, or valid for a certain period*e.g. financial statements; concert ticket***Event-triggered**<br>Changes based on specific events *e.g. address change***Highly Dynamic Information**<br>Real-Time Data, continuous updates *e.g. account balance*
	**Sensitivity/Risk associated with unwanted disclosure (financial; identity; reputational)**
	**High Risk***e.g. Identity Card Number, Bank Details***Medium Risk***e.g. Address History, Employment***Low Risk***e.g. Public Certifications, Skills*
	**Privacy/Correlation risk of claims**
	**Correlation Risk**<br>Could enable unwanted correlation*e.g. Location + Purchase History***Inference Risk**<br>Could enable unwanted inference*e.g. Medical History + Insurance Claims***Aggregation Risk**<br>Reveal more when combined*e.g. Social Media + Financial Activity*
	**Data Relationship Complexity**
	**Independent Claims**<br>Can be verified standalone*e.g. Basic Identity***Hierarchical Claims**<br>Parent-child relationships, claims depending on eachother<br>*e.g. Organization -\> Department -\> Role***Network Claims**<br>Complex interconnected relationships
	**Revocation propagation Patterns**
	**Atomic Revocation**<br>Individual claim can be revoked*e.g. Single Account Status***Group Revocation**<br>Related claims that must be revoked together<br>**Cascading Revocation**<br>Revocation triggers other revocations*e.g. Professional License -\> Related Certifications*
Requirements about how claims fit into different credentials along these design aspects can be represented as graph patterns - e.g. static and dynamic claims cannot be part of the same credential means that they cannot be connected in the sub-graph modeling the credential. Because of this, the generation of graph models which satisfy these patterns enables the designers to easily create compliant designs. In the next few sections, I detail some methods and approaches I used in the creation of the proposed design flow. Specifically, how do we generate these models, how can we represent them in a way so that these patterns can be made explicit, and how designers may choose from the generated models.
### Partial graph modeling
+pgm is a modeling technique used to specify and generate graphs that satisfy certain structural constraints and requirements. Instead of manually defining, or deterministically generating graphs, we can:
- Model known relationships between nodes
- Define wanted and unwanted patterns
- Specify how inferences are made in the generation process
- Generate multiple, consistent graphs
This approach enables the generation of *multiple* valid models that satisfy complex, graph-based requirements, if given a sufficient starting partial model.
### Conceptual model
During +pgm, we start with a partial model which consists of:
- A **metamodel** or *domain* specifying nodes and edge types and how they can be connected;
- **Predicates** which declaratively denote patterns in a given metamodel;
- **Error predicates** which denote unwanted patterns, suitable for effectively shrinking the design space;
- **Instance models** which are specific model parts that are required to be present in the generated model;
- and the **model scope** which denotes the desired size range of the entire generated graph, with the option defining size ranges of specific model elements.
This defines what is certainly *known* and what is yet *unknown* in the model.<br>From this, a modeling tool can generate multiple compliant models. This is done by representing the model using 4-valued logic - *true, false, unknown, error*, and applying valid transformation steps until there are no unknowns, and there are no errors. When the process is finished, a single consistent, valid model.\[@marussy2024refinery\]
### Used technology: Refinery
Refinery is a partial graph modeling and generation tool with which we can generate provably diverse graphs from a starting partial model using graph refinement with efficient, state-of-the-art algorithms. Its main benefits are:
**+dsl**<br>for defining partial models. An easy to learn modeling language based on first order logic, similar to Prolog in this aspect.<br>**Low computational complexity**<br>because it stores not just the model but all truth values in memory, enabling faster execution with a larger memory footprint.<br>**Large expressive power**<br>based on 4-value predicate logic, which allows the easy declarative definition of arbitrarily complex partial models.<br>**Graph refinement**<br>meaning in each solution step, the solver takes an *unknown* element to be resolved by decision rules.<br>**Propagation rules**<br>language construct for defining specific refinement steps - can be though of as rules in 4 value logic.<br>**Generation of provably diverse graphs**<br>is beneficial, as in +dse, it is imperative to choose from a diverse set of possible designs.
With Refinery, we have a tool for modeling knowledge graphs, and generating multiple designs which satisfy complex graph based requirements, which can be serve as a basis for +dse (See ).
### Design Space Exploration
**(+\~dse)** is a systematic approach to analyzing and evaluating different possible designs that satisfy a given set of requirements. It involves exploring a *design space* to find solutions that best meet specified objectives. \[@pimentel_exploring_2017; @kang_approach_2011; @thompson_tools_2012\] This *design space* represents all possible combinations of design decisions and their resulting solutions.
The primary goal of +dse is to help designers understand and navigate complex trade-offs between different design objectives. This includes:
> \[!ex\] Goals of Design Space Exploration
	- Identifying feasible design alternatives
	- Understanding relationships between design decisions
	- Evaluating designs against predefined criteria
	- Finding optimal, near-optimal, or most satisfying solutions
A key challenge in +dse is that design problems often have competing objectives - improving one aspect may worsen another. For example, in chip design, increasing processing speed typically increases power consumption. The goal is often not to find a single “best” solution, but rather to understand the trade-offs and identify a set of promising alternatives.
In the previously stated example, it it trivial to identify competing and non-competing design objectives. An example for the former would be between +vcse complexity and +vcs complexity. The more complex individual (+\^vcs) are allowed to be, the less complex the relationship between them in the ecosystem representing the starting claim set.
### Possible approaches for exploring the design space
The process of +dse can be categorized by how the design space is explored. These approaches, although may contain similar steps, have<br>distinct relationships to the design space.
> \[!info\] Approaches for Design Space Exploration based on exploration type
	**Exhaustive exploration**<br>• *Systematically examines all possible combinations of design decisions*<br>• Guarantees finding optimal solutions, if they exist<br>• Limited to small design spaces due to combinatorial explosion<br>• Example: Testing all possible CPU cache configurations up to a certain size**Guided exploration**<br>• *Uses domain knowledge and heuristics to focus on promising areas*<br>• More efficient but may miss optimal solutions<br>• Often employs sampling strategies or expert rules<br>• Example: Starting with known good architectures and exploring variations**Evolutionary exploration**<br>• *Starts with initial designs and evolves them through iterations*<br>• Uses genetic algorithms or other metaheuristics<br>• Particularly useful for large, complex design spaces<br>• Example: Evolving neural network architectures for specific tasks
	- • *Systematically examines all possible combinations of design decisions*
	- • Guarantees finding optimal solutions, if they exist
	- • Limited to small design spaces due to combinatorial explosion
	- • Example: Testing all possible CPU cache configurations up to a certain size
	- • *Uses domain knowledge and heuristics to focus on promising areas*
	- • More efficient but may miss optimal solutions
	- • Often employs sampling strategies or expert rules
	- • Example: Starting with known good architectures and exploring variations
	- • *Starts with initial designs and evolves them through iterations*
	- • Uses genetic algorithms or other metaheuristics
	- • Particularly useful for large, complex design spaces
	- • Example: Evolving neural network architectures for specific tasks
My approach fits into the *Guided exploration* category, because after generating some models, designers evaluate on domain specific metrics. Model driven approaches have shown to be feasible in similar scenarios, as shown by the work of Abel Hegedüs, Akos Horvath, and Daniel Varró \[@hegedus_modeldriven_2015\], which partly inspired my work.
To note another interesting approach, which could follow similar modeling practices, would be using genetic algorithms to diversify and refine the generated models through multiple iterations. Certainly, an analysis of what kind of other requirements it would be able to satisfy could be compelling.
### Evaluation techniques
Design alternatives encountered during each of the exploration approaches can be evaluated. The results of the evaluation of these design points - alone or together - inform which design is chosen in the end, and may even be a key part of some approaches (e.g. genetic algorithms discard models that are worse than the previous iteration, and further mutate those who are better in some metric)\[@pimentel_exploring_2017\].
These evaluations may happen either analytically on the model, by measuring an implementation, or by simulation.
I list some evaluation methods, which are relevant for my use-case.
> \[!info\] DSE evaluation techniques
	**Ranking based on single-objective functions**<br>If we have some sortable function of the characteristics of the designs which we want to optimize, then we can simply rank the designs by this function, and find the most fitting one.<br>**Pareto Analysis of multi-objective functions**<br>Sometimes we have multiple optimization objectives in a DSE process. Since the objectives are often in conflict, there cannot be a single optimal solution that simultaneously optimizes all objectives. In this case, we can analyze the *Pareto efficiency* of the designs, and choose from the *Pareto front* the optimal designs form. \[@pimentel_exploring_2017\]<br>**Constraint verification**<br>Another metric is whether the design meets some formalized requirement. If the design doesn’t pass the filter, it is scrapped.<br>**Manual expert driven**<br>An approach for small design spaces is manually analyze the model with a domain expert, who can help by providing heuristics, and implicit requirements, which when made explicit, can be incorporated into an automated design process.
### Model Driven Architecture
**+mda** is an approach to software design and development that provides a set of guidelines for structuring specifications expressed as models. Introduced by the +omg in 2001, +mda emphasizes the separation of business or application logic from the underlying technological platforms. The aim is to derive value and automate the path from high-level stakeholder focused models to executable information systems. \[@brown_model_2004; @mellor_modeldriven_2002; @omg_mda_guide\]
### Abstraction layers
A core principle of MDA is that “It is useful to identify particular “layers” of an architecture with respect to its level of abstraction.” \[@omg_mda_guide\] We will borrow the following abstractions:
> \[!info\] Relevant abstraction layers in MDA
	**+cim:**<br>model of actual, *real* things in a specific domain, not representations of those things in an information system. Describes “business” concepts without thought for architecture. Also known as the domain model or business model.<br>+pim<br>models components of a system and their interactions, without the specific used resources in mind, describes system functionality.<br>+psm<br>Combines +pim specifications with details about how the system uses a specific platform or technology. It is derived from the +pim by specifying the technology that is being modeled. The goal of +pim is for developers to be able to directly generate implementation code from the final model.
![](notion-s3-image-redacted)
MDA Layers
### Transformations
A featured value proposition of +mda is the ability to relate and automate the generation of such models. In this aspect, +mda serves to separate the concerns between those business system requirements and the technology that implements them. This is achieved through defining *transformations* between the models. \[@omg_mda_guide\]
*Transformation* is the process of applying a pattern to produce one representation from another, or to cross levels of abstraction or architectural layers. The two abstract pattern used in this work are the following:
> \[!info\] Relevant transformations in MDA
	**CIM to PIM Transformation**<br>A pattern mapping business requirements to system functionality, preserving business rules and constraints.<br>**PIM to PSM Transformation**<br>Adds platform specific technical details and parameters, maintaining functional equivalence across platforms.
Later, in , I argue that the +mda approach provides a solid foundation for systematic +vc schema design, enabling the creation of interoperable, maintainable, and privacy-preserving credential ecosystems. By separating concerns at different levels of abstraction, it allows designers to focus on the essential aspects of credential design while ensuring the satisfaction of complex requirements and the consistent implementation across different platforms and formats.
