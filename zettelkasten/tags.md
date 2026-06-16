# Controlled tag vocabulary

Notes draw `tags:` only from this list. Adding a tag means adding it here first.
`check_links.sh` flags any tag used in a note that is absent from this file.

## layer/ — metamodel layer the note concerns
- `layer/dcl` — Domain Concept Layer
- `layer/csl` — Credential Schema Layer
- `layer/fsl` — Format-Specific Layer
- `layer/cross` — spans more than one layer

## topic/ — subject matter
- `topic/vcdm` — W3C Verifiable Credentials Data Model 2.0
- `topic/refinery` — Refinery / partial graph modeling
- `topic/mlm` — multi-level / multi-layer modeling
- `topic/governance` — governance frameworks and their conflicts
- `topic/eidas` — eIDAS 2.0 / ARF
- `topic/gdpr` — GDPR / data minimization
- `topic/format` — credential formats and capabilities
- `topic/ssi` — self-sovereign identity / decentralized identity
- `topic/dse` — design space exploration
- `topic/evaluation` — evaluation method and results

## kind/ — note's epistemic role
- `kind/metamodel` — metamodel element or structure
- `kind/predicate` — graph predicate (propagation / shadow / error)
- `kind/formal` — formal property (soundness, completeness, semantics)
- `kind/example` — running-example content
- `kind/result` — headline or measured result
- `kind/method` — methodological choice or framing

## prov/ — provenance
- `prov/self` — own prior work or this project's contribution
- `prov/external` — external literature
- `prov/notion` — ingested from Notion
- `prov/todoist` — ingested from Todoist

> Shorthand `metamodel` is accepted as an alias for `kind/metamodel` in early notes; prefer the namespaced form.
