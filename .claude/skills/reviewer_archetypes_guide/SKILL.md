# Guide: Reviewer Archetypes

**Purpose:** Four reusable reviewer archetypes that `skills/reviewer_personas` instantiates for each paper. The archetypes define *what kind* of reviewer; the personas (in context/VENUE.md) define *who specifically* for this paper at this venue.

## The four archetypes

### 1. The Champion

The reviewer who will fight for the paper in the PC meeting. They see the big picture, get excited about the contribution, and are willing to argue with skeptics. They are not uncritical — they champion because they believe the core idea matters, not because the paper is flawless.

**What they evaluate:**
- Is there a clear, exciting insight? Can they summarize it in one sentence to the PC?
- Does the paper deliver on its promise? Is the contribution real and substantial?
- Would accepting this paper make the conference program better?

**What they forgive:**
- Minor presentation issues, imperfect evaluation scale, rough edges in the formalism — as long as the core idea is sound and significant.

**What kills their enthusiasm:**
- A paper that is technically correct but has no clear insight ("so what?").
- A contribution that is incremental — a small extension of existing work without a new idea.
- A mismatch between the ambitious framing and the modest delivery.

**Calibration role:** The champion sets the *significance bar*. If no champion would fight for this paper, it will not be accepted regardless of technical quality. The champion test (`skills/champion_test`) evaluates whether this reviewer exists for the current paper.

**Derived guidance:**
- **Significance framing:** What would the champion say in one sentence to argue for acceptance? That sentence must be visible in the abstract (contribution and implication elements) and the introduction (P3). If you can't write it, the paper may lack a champion-worthy insight.

---

### 2. The Mathematician

The domain expert who works on exactly this topic or an adjacent formalism. They know the related work better than the authors. They will check every definition for precision, verify proof arguments, question design choices against alternatives, and compare the approach to work the authors might not know.

**What they evaluate:**
- Are definitions precise, minimal, and well-motivated?
- Are proofs correct and complete (or are proof sketches convincing with full proofs available)?
- Are the formal claims consistent with each other and with the prose?
- Does the paper correctly characterize and build on prior work?

**What they forgive:**
- Modest evaluation if the formal contribution is strong and novel.
- Dense presentation if the ideas justify it.

**What they attack:**
- Imprecise definitions that conflate distinct concepts.
- Proof gaps — especially in proof sketches where the "obvious" step is the hard one.
- Overclaiming: "We prove X" when only a proof sketch or partial result exists.
- Missing or mischaracterized related work in their area of expertise.

**Calibration role:** The mathematician sets the *rigor ceiling*. What they will check determines how complete the formalism must be. What they know determines which related work must be discussed.

**Derived guidance:**
- **Rigor ceiling:** What must be proven vs. argued vs. left to appendix? The mathematician determines the minimum formalism the paper must contain to be credible.
- **Related work completeness:** The mathematician will mentally compare against specific papers. Identify these and address them in `skills/related_work_positioning`.

---

### 3. The Business Manager

The reviewer from a neighboring field or an applied perspective. They are competent but not invested in the paper's specific formalism. They bring different standards — empirical where the paper is formal, systems-oriented where the paper is theoretical, practice-focused where the paper is abstract. They will ask "so what?" more than "is this correct?"

They are not unintelligent — they are a competent researcher who was assigned this paper because the PC needed reviewers with breadth. Their confusion is diagnostic: if they can't follow the argument, the paper fails for a significant fraction of the likely audience.

**What they evaluate:**
- Can they follow the main argument without understanding every formal detail?
- Does the motivation connect to a real problem they recognize?
- Is there an evaluation they can assess with their own expertise?
- Would the results change practice or open new research directions they care about?

**What they forgive:**
- Formalism they can't fully check — if the paper gives them enough intuition and the proof structure seems sound.

**What they attack:**
- Unmotivated formalism: definitions that appear without explanation of why they are shaped that way.
- Missing practical grounding: no running example, no case study, no connection to real systems.
- "Technically sound but limited impact" — this is their signature rejection reason.
- Inaccessible writing that assumes too much domain knowledge.

**Calibration role:** The business manager sets the *explanation floor*. How deep the background must go, how much motivation each definition needs, and how explicit the practical implications must be.

**Derived guidance:**
- **Explanation floor:** What must be explained for the business manager to follow the argument? This drives the background section's depth and the motivation paragraphs before each definition.
- **Running example importance:** The business manager needs the running example more than any other reviewer. If the running example is weak, the business manager is lost.

---

### 4. The Adversarial Reviewer

The reviewer predisposed to reject. Not because they are unfair, but because the paper threatens their worldview — it competes with their approach, challenges an assumption they've published on, or they believe the problem is not important. They will systematically look for the weakest link.

**What they evaluate:**
- What is the weakest assumption? Can it be violated in practice?
- What does the competing approach do better? Is there a dimension where the paper loses?
- Is the evaluation cherry-picked or does it cover the hard cases?
- Can the contribution be reduced to a "trivial" extension of existing work?

**What they forgive:**
- Nothing. Every weakness is ammunition.

**What they attack:**
- Assumptions: "This assumes X, but in practice X rarely holds."
- Scope: "This only handles the easy case; the hard case is Y, which the authors don't address."
- Novelty: "This is essentially [prior work] with a minor extension."
- Evaluation: "The case study was chosen to make the approach look good. What about [harder scenario]?"
- Framing: "The authors overstate the significance. This is a niche contribution."

**Calibration role:** The adversarial reviewer is the *stress test*. If the paper survives their review, it survives the PC discussion. Their likely attacks are the defense points the paper must pre-empt.

**Derived guidance:**
- **Defense points:** What will the adversarial reviewer attack? Each attack needs a pre-emptive response in the paper — either in the technical sections (showing the approach handles the hard case) or in the limitations (honestly acknowledging the boundary).
- **Positioning against competitors:** The adversarial reviewer will advocate for a competing approach. `skills/related_work_positioning` must address this head-on.

## How archetypes become personas

The `skills/reviewer_personas` skill instantiates these archetypes for a specific paper and venue:

1. Reads the archetypes from this guide.
2. Combines with venue knowledge (who sits on this PC? what fields intersect here?).
3. Combines with paper content (what expertise does the contribution demand? who are the competitors?).
4. Produces four concrete personas with specific backgrounds, likely questions, and score ranges.

The archetypes are stable across papers. The personas change for every paper and venue.
