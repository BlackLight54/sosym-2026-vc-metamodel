# Guide: Running Example

**Purpose:** The running example is the single most effective tool for making a formal methods paper accessible to non-expert reviewers. This guide covers how to design, introduce, and thread an example through the paper.

## Why it matters

At A* venues, the business manager reviewer often decides the paper's fate. A well-chosen running example lets this reviewer follow the contribution without understanding every formal detail. It grounds definitions in something concrete, motivates design choices, and makes the "so-what" tangible.

A paper without a running example forces the business manager reviewer to build their own mental model from the definitions alone. Most won't.

## Design criteria

A good running example is:

- **Simple enough to follow without domain expertise.** The reader should understand the scenario in 2–3 sentences. If you need a full paragraph to set up the example, it's too complex.
- **Complex enough to demonstrate the contribution.** The example must exercise the interesting parts of your formalism. If your contribution handles multi-party interaction, a two-party example is too simple. If it handles conflicting constraints, the example must have a conflict.
- **Realistic enough to be credible.** "Alice and Bob" is fine for crypto papers but may not convince a BPM reviewer. Use a scenario from the paper's application domain.
- **Stable enough to survive the writing process.** Choose something you won't need to redesign when the formalism evolves. Err on the side of simplicity.

## Common mistakes

- **The example is introduced but never revisited.** It appears in Section 2 and then the paper reverts to pure formalism. Thread it through every section.
- **The example is too toy.** If it doesn't exercise the contribution's key distinctions, it's not doing its job.
- **The example is too complex.** If you need a figure + a paragraph + a table just to set it up, the reader is already lost.
- **Different sections use different examples.** One running example, threaded everywhere. Auxiliary examples for specific points are fine, but the main example must be consistent.
- **The example only appears in text.** The running example should usually be a figure (or part of one) early in the paper, then revisited visually in the contribution and evaluation sections.

## How to thread it

| Section | Example role |
|---------|-------------|
| Introduction | Introduce the scenario informally. Use it to make the gap concrete: "In this scenario, [problem] occurs because [gap]." |
| Background | Restate the scenario using the formal concepts introduced here. The reader sees how the formalism maps to something they already understand. |
| Contribution | Apply each new definition to the example. After defining concept X, immediately show: "In the running example, X corresponds to [concrete thing]." |
| Evaluation | The running example should be one of the evaluation cases, or the simplest case that demonstrates the approach works. |
| Discussion | Use the example to illustrate limitations: "Our approach handles [aspect of example] but does not address [extension of example] because [limitation]." |

## Cross-cutting decision

The running example is a cross-cutting decision — it affects every section. Record it in context/DECISIONS.md:
- What the example is.
- What aspects of the contribution it exercises.
- What it intentionally does NOT exercise (and why).
- The figure(s) associated with it.

## When to choose it

Choose the running example during paper engineering (before the first draft), after the thesis and contribution list are stable. If the example needs to change later, update it everywhere — inconsistent examples are worse than no example.
