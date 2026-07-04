---
id: Q-012
title: Can the metamodel serve as a formal guardrail for LLM-generated credential schemas?
type: question
maturity: developing
tags: [topic/ssi, kind/method, prov/notion]
sources: ["inbox/notion/14-llm-alapu-verifiable-credential-sema-es-kodgeneralas.md"]
related: ["[[C-020 three-usage-modes]]", "[[C-006 partial-graph-modeling-refinery]]", "[[Q-001 empirical-evaluation-with-designers]]"]
created: 2026-07-04
---

LLMs can plausibly generate VC schemas (JSON-LD / JSON Schema) and issuance/verification code from
natural-language use-case descriptions, but hallucinate structure and constraints. Can the three-layer
metamodel and its cross-layer predicates act as the **validation oracle** in such a pipeline — every
generated schema checked (and repaired via DSE) before use?

## Why it matters
Positions the metamodel as the checking layer of an LLM-assisted design workflow — a usage mode beyond
the three in [[C-020 three-usage-modes]], and a route to the practitioner accessibility that
[[Q-001 empirical-evaluation-with-designers]] identifies as the largest open limitation (designers write
prose, the formalization checks). A natural future-work paragraph for the journal.

## Status
Exploratory; departmental lab-topic material (visual schema editor is the sibling thread). **Scope
risk:** a different paper if pursued beyond a future-work mention — flag before pulling into the journal
article.

## Links
- [[C-020 three-usage-modes]] — the modes an LLM front-end would extend.
- [[C-006 partial-graph-modeling-refinery]] — the machinery that makes checking sound.

## Source
Notion lab-topic page "LLM-alapú Verifiable Credential séma és kódgenerálás" (inbox page 14),
distilled 2026-07-04.
