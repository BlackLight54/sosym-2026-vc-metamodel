---
id: "A-BG1"
short: "refinery-bg-example"
title: "Add Refinery code example to Sec 2.3 Background"
status: in_progress
priority: high
depends_on: ["A-LST"]
binding_claims: [3, 4]
target: "sections/02_background.md"
pipeline: "advisor-2026-03-29"
assigned: "oszkár"
created: "2026-03-29"
---

## Goal

Add two small, self-contained Refinery `.problem` code listing to Sec 2.3 (Partial Graph Modeling with Refinery) that demonstrates the four mechanisms the prose already describes. This is the **top priority** from the advisor meeting: it unblocks Oszkár's rewrite of the background section.

## Context

Advisor feedback (2026-03-29): "top prio: backgroundba példa, hogy oszkár meg tudja írni" (Top priority: example in background so Oszkár can write it). "be kell vezetni egy nyelvezetet a backgroundban a refinery-re" (Must introduce a notation for Refinery in background).

The current Sec 2.3 has three paragraphs of prose covering partial models, four-valued interpretation, graph predicates, and four mechanisms (error predicate, propagation rule, shadow predicate, scope constraint). No code example exists.

**Overlaps with O-REFBG** (the full BG rewrite). A-BG1 is the minimal unblocking step: deliver the code example so Oszkár can build the surrounding prose.

## What to do

Draft a Refinery code snippet (10-15 lines) for Sec 2.3 that illustrates:

1. **Class declaration** with containment: `class Entity { contains Prop[] property }` or similar
2. **Error predicate**: e.g., `error non_connected(Entity n, Entity m) <-> n != m, !neighbours+(n, m).`
3. **Propagation rule**: e.g., `propagation rule root_is_subj(Entity e) <-> must !value(_, e) ==> Subject(e).`
4. **Shadow predicate**: brief example

The example should use the credential domain (not a toy domain) so readers see how the BG connects to Sec 04. A stripped-down subset of `models/vc_metamodel.refinery` (DCL fragment) works well.

Suggested listing (adapt as needed):

```refinery
abstract class Entity {
    contains Prop[] property
}
class Subject extends Entity.
class Value extends Entity.

class Prop {
    contains Value[1] value
}

pred statement(Entity s, Prop p, Entity v) <->
    s != v, property(s, p), value(p, v).

error non_connected(Entity n, Entity m) <->
    n != m, !neighbours+(n, m).

propagation rule root_is_subj(Entity e) <->
    must !value(_, e) ==> Subject(e).
```

Place it after the paragraph that introduces the four mechanisms (currently the last paragraph of Sec 2.3). Add a one-sentence caption or lead-in referencing the running example.

## Source material

- Full metamodel: `models/vc_metamodel.refinery` (DCL section, lines 22-77)
- Instance: `models/csok_instance.refinery`
- Standalone version: `models/csok_standalone.problem`

## Acceptance criteria

- [ ] Sec 2.3 contains a Refinery code listing with `lstlisting` markup
- [ ] The listing demonstrates at least: class declaration, error predicate, propagation rule
- [ ] The example uses the credential domain (Entity/Prop/Subject/Value)
- [ ] A one-sentence lead-in connects the listing to the prose
