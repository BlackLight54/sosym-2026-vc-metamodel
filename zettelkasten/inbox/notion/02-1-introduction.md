---
source: notion
notion_id: 3360766f-0685-8168-bfb8-eb1b798534cb
notion_url: https://app.notion.com/p/3360766f06858168bfb8eb1b798534cb
title: 1_introduction
pulled: 2026-06-17
---

# Introduction
In recent years, +vc \[@w3cVC;@w3cJSON\] have stirred the interest of not just researchers but also legislators and corporations in the realm of digital identity management, including the European Union \[@eidas2; @essif; @eu_dataspaces; @eudiw\]. They are a crucial part of a novel and proliferating identity model called +ssi, which aims to offer its users more interoperability, privacy, and control over their identity on the Internet. +vc enable individuals and organizations to exchange trusted digital claims in a privacy-preserving and interoperable manner. However, as these credentials become increasingly integrated into complex business processes and regulatory frameworks, their design poses significant challenges that extend beyond simple data representation.
A critical challenge emerges as organizations begin adopting +vc: how to structure interrelated sets of claims into credential schemas that serve multiple verification scenarios while maintaining privacy, security, and usability. This challenge is particularly acute in regulated sectors such as finance, healthcare, and government services, where credentials must satisfy complex compliance requirements while protecting sensitive personal data. For instance, a financial services ecosystem might need to verify claims ranging from basic identity information to detailed financial history, employment records, and existing credit obligations - all while minimizing data disclosure and correlation risks.
To address this challenge, I propose an approach that combines three complementary methodologies:
1. **+pgm** for systematic generation of credential schema designs
2. **+mda** principles for ensuring interoperability and requirement satisfaction
3. **+dse** techniques for evaluating and selecting optimal designs
My aim is to design a comprehensive framework for systematically designing sets of interrelated +vc schemas that satisfy complex requirements while maintaining privacy and security characteristics. To this end, I use +pgm \[@famelis_partial_2012\] to generate diverse +vc architectures, as the +vc data model can be expressed as **subject-property-value** relationships, and thus +vc can be modeled as +ig. To help systematically ensure interoperability, and the satisfaction of complex requirements the generated designs follow the +mda approach. These generated designs form a design space, which can be explored with generic or use-case specific metrics. The approach enables designers to explore and evaluate different schema architectures systematically, moving beyond manual design approaches that become intractable as complexity grows.
My contributions include:
- A systematic method for generating diverse credential schema designs using +pgm
- A +mda-based approach ensuring interoperability between different +vc formats
- An iterative framework for evaluating generated designs against diverse requirements
- A proof-of-concept implementation demonstrating the feasibility of automated credential schema generation
In , after a brief introduction to +vc, the role they fill in +ssi, and the design challenges they present, I detail how VCs can be modeled as knowledge graphs and explain key concepts from +dse and +mda that form the foundation of the approach.
In , I present the emerging design problem of +vcse, and examine both generic and domain-specific requirements that influence their design. The chapter argues for approaching this challenge through systematic methods, particularly the combination of +pgm with +mda principles to enable comprehensive Design Space Exploration.
In , I detail the approach for generating +vcs from +kg, introduce the architecture of model generation and explain how it implements +mda's abstraction layers. The chapter describes the partial meta-model and discusses how the generated models can be evaluated with established +dse techniques with a proposed process.
Finally,  concludes my work by summarizing the contributions and outlining directions for future work, including extending the meta-model, implementing comprehensive evaluation metrics, and validating the approach with industry use-cases.
