# Index — credential-ecosystem metamodel Zettelkasten

Master map of content. 133 atomic notes and 14 maps, distilled from this repository (including a model
and figure artifact layer) plus Notion and Todoist ingestion (see `INGESTION.md`), organized for
drafting a journal-length article on the three-layer verifiable-credential metamodel. How the vault is
consumed stage by stage: `PIPELINE.md`.

New here? Read `README.md`, then walk the maps below in order.

## Maps of content (the argument)

1. [[M-001 journal-paper-outline]] — proposed journal structure; each section links the notes that feed it. **Start here.**
2. [[M-006 running-example-csok]] — the single thread carrying the whole paper.
3. [[M-002 three-layer-metamodel]] — the metamodel, layer by layer.
4. [[M-003 cross-layer-constraints]] — the formal core (Refinery + cross-layer predicates).
5. [[M-005 evaluation]] — coverage, expressiveness, anti-patterns, headlines, scalability.
6. [[M-004 novelty-and-positioning]] — why it is novel; differentiation and all sources.
7. [[M-007 writing-gaps]] — open questions; what to write next.
8. [[M-008 artifact-inventory]] — claim → evidence; each result mapped to a model file or figure.
9. [[M-009 threats-to-applicability]] — EU regulatory threats (current state) and the "is the problem real?" evidence.

## Maps of content (the production)

Consumed by the spin, paragraph-engineering, and writing stages (`PIPELINE.md`):

10. [[M-010 objection-ledger]] — every anticipated attack, its committed rebuttal, its landing spot.
11. [[M-011 claim-delivery-matrix]] — claim → evidence → artifact → figure → threat → open item, one table.
12. [[M-012 journal-extension-delta]] — the conference→journal delta ranked by claim impact; Heilmeier seed.
13. [[M-013 drafting-guardrails]] — prohibitions, refuted claims, do-not-cite list, anchor quotes. **Load before drafting.**
14. [[M-014 figure-plan]] — each figure and the claim it carries; existing / planned / proposed.

## Binding claims

Contributions: [[K-001 three-layer-metamodel]], [[K-002 vcdm-grounding]],
[[K-003 cross-layer-constraints-as-predicates]], [[K-004 automated-consistency-checking]].
Validation: [[K-005 coverage-validation]], [[K-006 expressiveness-validation]], [[K-007 antipattern-detection]].
Results: [[K-008 contradictory-cross-framework-constraints]], [[K-009 multilayer-invisibility]],
[[K-010 necessity-of-multilayer-modeling]].

## Committed framing (2026-07-04)

The four decisions that fix the paper's positioning against the EU regulatory landscape, with the
committed one-paragraph framing, live in [[M-009 threats-to-applicability]]:
[[D-013 verifier-scope-issuer-remit]] · [[D-014 regulator-documented-conflict]] ·
[[D-015 expressiveness-strength-first]] · [[D-016 dated-snapshot-method-over-catalogue]].

## Kickoff rulings (2026-07-13)

Martin's rulings on the six decisions left open by the spin and the 2026-07-06 advisor
consultation:
[[D-018 venue-sosym]] · [[D-019 rq-wording-approved]] ·
[[D-020 rq0-relevance-and-error-taxonomy]] · [[D-021 q007-structurally-diverse-instances]] ·
[[D-022 f8-conflict-anatomy]] · [[D-023 industry5-not-the-spin]].

## Tooling

- [[glossary]] — terms, symbols, acronyms → concept notes.
- [[dashboards]] — live Dataview queries (claims by status, seed worklist, unresolved citekeys).
- [[_citekey-map]] — source notes → BibTeX keys.
- `tags.md` — controlled tag vocabulary.
- `INGESTION.md` — pulling Notion and Todoist into the base.
- `./check_links.sh` — link, orphan, tag, and maturity integrity check.

## Counts

Concepts (C) 40 · Claims/arguments (K) 15 · Sources (S) 43 · Decisions (D) 23 · Questions (Q) 12 · Artifacts (A) 6 · MOCs (M) 14.
