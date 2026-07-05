---
description: Bidirectional consistency check between the paper's prose and the Refinery model artifacts — every identifier named in prose exists in models/ with matching spelling, arity, and predicate role, and every paper-claimed count matches the model inventory. Use during and after paragraph engineering, and whenever models/ changes.
---

# Skill: Model–Prose Sync Check

**Purpose:** Catch the drift that creeps in during revision: a predicate renamed in the model but
not the paper, an arity that changed, a "nine constraints" that became ten in code, a predicate the
paper calls an error predicate that the model implements as a propagation rule. Entirely mechanical,
and exactly the class of defect a Refinery-literate reviewer catches in one read.

## Trigger

- "Sync check the models against the paper" / "Do the predicate names still match?"
- After any commit touching `models/`; as part of pre-submission review; after Stage 4 drafts a
  section that names model elements.

## Inputs

- `sections/*.md` — prose side. Identifiers are marked with the `.refi` span convention
  (`[governance_conflict]{.refi}`) and appear in fenced `refinery` listings.
- `models/*.refinery`, `models/*.problem`, `models/evaluation/` — model side.
- `skills/ref_refinery` for declaration syntax; `zettelkasten/moc/M-011` for which artifacts carry
  which claims.

## Prerequisites

`git submodule update --init models` — `models/` is a submodule (`ACM-MODELS-26-code`) and is
**empty in a fresh clone**. Running this skill against an empty checkout reports every identifier as
missing; check `ls models/` first and treat an empty directory as a setup error, not a finding.

## Steps

### 1. Extract the prose inventory

- `grep -oh '\[[A-Za-z_][A-Za-z_0-9]*\]{\.refi}' sections/*.md | sort -u` — the span-marked
  identifiers.
- Identifiers inside fenced ```refinery listings.
- The paper's **counted sets**: "nine constraints (C1–C9)", "six capability predicates", "five
  in-scope formats", "five anti-patterns", "eight ARF constraints", "three usage modes". Record the
  number and the members where prose lists them.
- Each identifier's **claimed role** where prose states one: error predicate, propagation rule,
  shadow predicate, class, reference (the taxonomy of C-010/C-011/C-012).

### 2. Extract the model inventory

Parse declarations from `models/*.refinery` and `*.problem`: classes, references, predicates with
their arity, and their role markers (`error pred`, propagation rules, plain `pred`). The scaled and
sensitivity instances under `models/evaluation/instances/` count for existence checks of instance
artifacts (G0–G7), not for the metamodel inventory.

### 3. Compare, both directions

- **Prose → model:** every `.refi` identifier and listing identifier resolves to a declaration with
  the same spelling, the arity prose uses, and the role prose claims. Near-misses (case,
  underscore, singular/plural) are findings, not matches — they are the bug this skill exists for.
- **Model → prose, counted sets only:** the model may contain plumbing the paper never names (not a
  finding), but every count the paper asserts must match the model inventory exactly, and every
  artifact the paper claims to ship (per `M-011` and the supplementary description) must exist.

### 4. Report and propagate

Each mismatch: identifier, prose location (`file:line`), model location or MISSING, mismatch kind
(spelling / arity / role / count / missing artifact). Fixes are always **paired edits in one
commit** — renaming in only one side reintroduces the drift with the sign flipped. Recurring rename
churn goes to `M-013` as a vocabulary entry.

## Output

`context/model_prose_sync_[date].md` with the mismatch table and the two inventories (so the next
run can diff instead of re-deriving). Todos for every mismatch touching a claim-carrying artifact.

## Failure modes

- **Empty-submodule false alarm.** See Prerequisites; an all-missing report means setup failed.
- **Fuzzy matching.** Accepting `crossCredPredicateGap` for `cross_cred_predicate_gap` defeats the
  check.
- **Names without roles.** The paper's predicate-role taxonomy is a contribution; a predicate whose
  role differs between prose and code is a worse defect than a misspelling, not a footnote.
