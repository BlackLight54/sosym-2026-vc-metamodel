---
description: Instantiate four reviewer archetypes (Champion, Mathematician, Business Manager, Adversarial) into paper-specific personas for audience calibration. Use when generating reviewer personas, calibrating the audience, or asking 'who will review this?'
---

# Skill: Reviewer Personas

**Purpose:** Instantiate the four reviewer archetypes (from `skills/ref_reviewer_archetypes`) into specific personas calibrated to this paper's content, venue, and contribution type. The personas get more precise as more of the paper exists — run early for rough calibration, re-run after drafting for precision.

## Trigger

- "Generate reviewer personas"
- "Who will review this paper?"
- "Calibrate the audience"
- "Refine the reviewer personas"

## Inputs

**Minimum (early run):** CLAUDE.md (thesis, domain) + context/VENUE.md (venue name) or context/CFP.md.

**Better (after gap analysis):** Above + comparison matrix from `skills/research_related_work_positioning`, gap analysis results.

**Best (after first draft):** Above + all section files. The more paper exists, the more specific the personas.

**Always:** Read `skills/ref_reviewer_archetypes/SKILL.md` for the archetype definitions.

## The four archetypes

Read the full definitions in `skills/ref_reviewer_archetypes`. Summary:

| Archetype | Role | Calibration role |
|-----------|------|-----------------|
| **Champion** | Would fight for acceptance in the PC meeting | Sets the significance bar — is there a champion-worthy insight? |
| **Mathematician** | Domain expert checking rigor and correctness | Sets the rigor ceiling — how complete must the formalism be? |
| **Business Manager** | Adjacent-field reviewer checking relevance and accessibility | Sets the explanation floor — how deep must background/motivation go? |
| **Adversarial** | Predisposed to reject, looking for the weakest link | Sets the defense points — what must be pre-empted? |

## Steps

### 1. Analyze the context

Read what's available:
- **Venue:** What fields intersect in this venue's PC? (BPM has process mining people, formal methods people, IS people. ICSE has SE people, testing people, formal methods people.)
- **Thesis and domain:** What expertise does the contribution demand?
- **Contribution type:** Is it a formalization (needs proof-checkers), a tool (needs SE evaluators), a case study (needs domain experts), a framework (needs everyone)?
- **Comparison matrix:** If available, who are the competitors? Their authors might be reviewers, or someone in their research group.

### 2. Instantiate each persona

For each archetype, produce a paper-specific persona:

```markdown
### [Archetype]: [Name tag — e.g., "The Process Mining Expert"]

**Background:** [2-3 sentences. What they research, what they've published on, what tools/methods they use.]

**What they value:** [What would make them rate the paper highly. Specific to their expertise.]

**What they struggle with:** [What parts of the paper they won't fully follow. Not a weakness — a calibration point for explanation depth.]

**What they attack:** [Where they'll focus critical energy. Specific to the paper's content, not generic.]

**Their likely question:** [One concrete question this reviewer would ask. Not "Is this novel?" but "How does Definition 3 handle the case where participant P2 has left the collaboration before step 7?"]

**Score range:** [What range of scores you'd expect from them given the current state of the paper, and what would move them up or down.]
```

The persona inherits the archetype's evaluation criteria, forgiveness patterns, and attack vectors from `skills/ref_reviewer_archetypes` — but makes them concrete for this paper, this venue, this contribution.

### 3. Derive calibration guidance

From the four personas, extract the four calibration dimensions defined by the archetypes:

- **Significance framing** (from Champion): What would the champion say in one sentence to argue for acceptance? Is that sentence visible in the abstract and introduction?
- **Rigor ceiling** (from Mathematician): What will the mathematician check? What must be proven vs. argued vs. left to appendix?
- **Explanation floor** (from Business Manager): What must be explained for the business manager to follow? This sets the background section's depth and the motivation before each definition.
- **Defense points** (from Adversarial): What will the adversarial reviewer attack? These need pre-emptive responses in the paper.

### 4. Write to context/VENUE.md

Replace the reviewer personas section in context/VENUE.md with the generated personas and calibration guidance.

### 5. Run champion test

After generating personas, run `skills/review_champion_test` to evaluate whether the Champion persona would actually champion this paper. If the champion test fails at this stage, it may be a thesis problem — flag for Martin before proceeding with writing.

### 6. Update TODO.md

If the personas reveal specific risks:
- "Pre-empt adversarial reviewer concern about [X] in Section [N]"
- "Add intuition before Definition [M] for business manager reviewer"
- "Strengthen significance argument for champion reviewer in introduction"
- "Address mathematician reviewer's likely question about [Y]"

## Refinement

Each re-run should:
- Note what changed since the last run.
- Check if the personas still fit — did the contribution shift?
- Update the "likely question" and "score range" based on new paper content.
- Flag any new risks that emerged.
- Re-run `skills/review_champion_test` — the champion insight may have shifted.

## Output

- Four personas with calibration guidance in context/VENUE.md.
- Champion test result.
- Risk-based TODOs.
