# Decisions

Cross-cutting decisions that affect multiple sections or constrain downstream work. This file is the canonical record — inspectable, versionable, and survives context resets.

Record decisions here when they are made. Review them periodically with `skills/prior_decision_audit`.

## How to record a decision

Each entry has a date, the decision, the rationale, and what it affects. Use this format:

```
### YYYY-MM-DD — [short label]

**Decision:** [what was decided]
**Rationale:** [why — the alternatives considered and why this was chosen]
**Affects:** [which sections, skills, or elements this constrains]
**Revisit when:** [condition under which this should be reconsidered]
```

## Active decisions

%% Add decisions below this line. %%

### 2026-03-24 — Thesis framing: metamodel as headline

**Decision:** Frame the paper's core claim around the metamodel contribution ("VC ecosystem design requires a multi-layer metamodel"), not around conflict detection as the headline. Conflict/error detection is a consequence of modeling correctly — it validates the metamodel, not the other way around.
**Rationale:** Option B (metamodel-centric) chosen over Option A (conflict-detection-centric) and Option C (balanced). Martin's reasoning: conflict detection is handled by Refinery at the model level; the paper's contribution is the metamodel and its constraint formalization. This framing is also the safest for MODELS Foundations Track reviewers who expect a clean modeling contribution.
**Affects:** Introduction framing (P1-P3), contribution list, evaluation structure, abstract revision, title.
**Revisit when:** If reviewers push back that the metamodel alone is insufficient and want stronger empirical/formal validation of the conflict detection capability.

### 2026-03-24 — Domain: MDE, not formal methods

**Decision:** Primary domain is model-driven engineering (metamodeling, partial graph modeling, DSE), not formal methods (protocol verification, epistemic logic). Adjacent domains: decentralized identity, formal constraint specification.
**Rationale:** The paper uses metamodel definitions and graph predicates, not theorem-proof structure. MODELS is an MDE venue. The domain calibration affects register, explanation floor, and writing advice.
**Affects:** CLAUDE.md domain block, reviewer persona generation, writing register, background section scope.
**Revisit when:** If the paper develops substantial theorem-proof content that shifts it toward formal methods.

## Superseded decisions

%% Move decisions here when they are replaced, with a note on what replaced them. %%
