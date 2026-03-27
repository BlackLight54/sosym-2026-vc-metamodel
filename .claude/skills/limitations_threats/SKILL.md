---
description: Derive an honest, structured limitations section from the paper's assumptions, evaluation scope, and model boundaries, ranked by reviewer risk. Use when writing limitations, identifying threats to validity, or checking scope honesty.
---

# Skill: Limitations and Threats to Validity

**Purpose:** Derive an honest, structured limitations section from the paper's actual assumptions, evaluation scope, and formal model boundaries. A good limitations section is not an afterthought — it pre-empts reviewer objections, demonstrates intellectual honesty, and scopes the contribution precisely. A missing or throwaway limitations section is a red flag at any serious venue.

## Trigger

- "Write the limitations"
- "What are the threats to validity?"
- "Are we being honest about scope?"
- "What will the adversarial reviewer attack?"

## Inputs

- All section files (especially the formal model and evaluation).
- CLAUDE.md: thesis (what the paper claims — limitations are what it does *not* claim).
- context/VENUE.md: reviewer personas (the adversarial reviewer's likely attacks inform priority), venue conventions (some venues expect a standalone "Threats to Validity" subsection; others fold limitations into Discussion).
- `skills/evaluation_design` output (threats identified during evaluation design feed directly here).
- Running example (limitations of the example itself may reflect limitations of the approach).

## Steps

### 1. Extract assumptions

Read every section. Identify every assumption the paper makes, explicit or implicit:

**Formal model assumptions:**
- What is the threat model? What attacker capabilities are excluded?
- What properties of the underlying infrastructure are assumed (authentic channels, correct implementations, honest majority, etc.)?
- What simplifications does the model make relative to real deployments?
- Are there axioms or assumptions introduced without proof?

**Evaluation assumptions:**
- Is the case study / running example representative? What classes of scenarios does it *not* cover?
- Are benchmarks or datasets representative of real-world usage?
- What parameters were fixed that could vary in practice?
- If the evaluation is a proof: what does the proof *not* cover (edge cases, composition, liveness)?

**Scope assumptions:**
- What does the paper explicitly defer to future work?
- What adjacent problems does the paper acknowledge but not address?
- What domain-specific constraints limit generalizability (e.g., "our approach targets BPMN collaborations" — what about other process languages)?

For each assumption, record:
- The assumption itself (precise statement).
- Where it is introduced or implied (section, paragraph).
- Whether it is currently stated explicitly in the paper or only implicit.
- What breaks if the assumption is violated.

### 2. Classify limitations

Group the extracted assumptions into standard categories. Not every paper needs every category — use what applies.

**For formal methods papers:**

| Category | What it covers | Example |
|----------|---------------|---------|
| **Model scope** | What the formal model does not capture | "The model assumes synchronous communication; asynchronous settings may require additional mechanisms." |
| **Threat model boundaries** | What attacker capabilities are excluded | "We do not consider colluding participants beyond the assumed threshold." |
| **Proof coverage** | What the proofs do not establish | "The proof addresses safety but not liveness properties." |
| **Tool limitations** | Limitations of the verification tool | "Tamarin's termination is not guaranteed; we manually guided the proof search for Lemma 4." |
| **Generalizability** | How far the results extend beyond the studied setting | "The approach is demonstrated on BPMN; adaptation to other process notations requires further study." |

**For papers with empirical evaluation (threats to validity):**

| Category | What it covers |
|----------|---------------|
| **Internal validity** | Could something other than the proposed mechanism explain the results? Confounds, implementation bugs, parameter sensitivity. |
| **External validity** | Do results generalize beyond the studied cases? Sample size, domain specificity, synthetic vs. real-world scenarios. |
| **Construct validity** | Do the metrics actually measure what the paper claims? Is "compliance" operationalized correctly? |
| **Conclusion validity** | Are the conclusions supported by the data? Statistical significance, effect sizes, replication. |

**For mixed papers (formal + empirical):** Use both frameworks. The formal limitations and the empirical threats are distinct and should be presented separately.

### 3. Prioritize by reviewer risk

Not all limitations are equally dangerous. Rank each by how likely it is to become a reviewer objection:

**High risk (adversarial reviewer will raise this):**
- Implicit assumptions that aren't stated anywhere in the paper.
- Assumptions that competing approaches don't make.
- Evaluation scope that doesn't cover the main claimed contribution.

**Medium risk (strong reviewer may note):**
- Explicit assumptions that are reasonable but limit applicability.
- Evaluation on a single case study (common, but always noted).
- Proof coverage gaps that are acknowledged.

**Low risk (worth stating for completeness):**
- Standard assumptions in the field (e.g., PKI exists, channels are TLS-protected).
- Deferred extensions that are clearly orthogonal to the contribution.

### 4. Check for implicit assumptions

This is the most valuable step. Read the formal model and evaluation again specifically looking for things the paper takes for granted without saying so:

- Does the model assume participants behave according to the protocol unless corrupted? Is that stated?
- Does the evaluation assume a specific deployment topology? Is that stated?
- Does the proof assume properties of cryptographic primitives (e.g., EUF-CMA)? Are those assumptions collected?
- Does the case study assume domain knowledge that a reader might not share?

Every implicit assumption should either be made explicit in the paper (in the model section, not just in limitations) or flagged as a limitation.

### 5. Draft limitations text

For each high-risk and medium-risk limitation, draft a limitation statement following this pattern:

**Pattern:** "[What the paper assumes or does not do]. [Why this is a limitation — what it means for the results]. [What would be needed to address it — future work or mitigation]."

**Good example:** "The formal model assumes synchronous message delivery between participants. In asynchronous settings, message reordering could violate the ordering invariant in Definition 5. Extending the model to asynchronous communication requires additional synchronization mechanisms, which we leave to future work."

**Bad example:** "Our approach has some limitations regarding asynchronous communication." (Too vague — doesn't say what breaks or why.)

**Bad example:** "A limitation is that we only evaluate on one case study, but we plan to do more." (Defensive rather than informative — doesn't explain what the single case study does and doesn't cover.)

### 6. Determine placement

Check context/VENUE.md and exemplar papers for where limitations appear:

| Venue convention | Where to place |
|-----------------|---------------|
| SE conferences (ICSE, FSE) | "Threats to Validity" as a subsection of Evaluation, using the four-category framework |
| FM conferences (CAV, FM, TACAS) | Limitations folded into Discussion section, focused on model scope and proof coverage |
| IS/BPM conferences | Discussion section, mixing formal limitations with practical applicability |
| IEEE journals (TDSC, TSE) | Standalone "Limitations" or "Threats to Validity" section |

Propose the placement and structure. Martin decides.

### 7. Cross-check with adversarial reviewer

Read the adversarial reviewer persona from context/VENUE.md. For each of their likely attacks:
- Is the attack addressed by a stated limitation? If yes, the paper is pre-empting.
- Is the attack addressed by evidence in the paper? If yes, the limitation may not be needed.
- Is the attack neither addressed nor pre-empted? Flag — this is a vulnerability.

### 8. Present to Martin

Output in plan mode:
- Full assumption inventory (explicit and implicit).
- Classified and prioritized limitations.
- Draft limitation statements for high and medium risk items.
- Proposed placement and structure.
- Cross-check against adversarial reviewer.
- Flags for implicit assumptions that need to be made explicit elsewhere in the paper.

Martin rewrites all limitation text.

### 9. Update TODO.md

- "Make assumption X explicit in Section N" for each implicit assumption.
- "Finalize limitations/discussion section" for the draft.
- Flag any limitation that suggests a deeper problem: "Limitation L suggests the contribution claim C may need softening — discuss."

## When to run

- After the evaluation section is drafted (evaluation design informs threats to validity).
- After the formal model stabilizes (model assumptions inform limitations).
- During `skills/final_review` (as a sub-check).
- After reviewer feedback (new limitations may emerge from reviews).

## Interaction with other skills

- **`skills/evaluation_design`**: Threats identified in evaluation design (step 3) are direct inputs here.
- **`skills/claim_evidence_audit`**: If the audit finds overclaims, some may be best resolved by adding limitations rather than strengthening evidence.
- **`skills/reviewer_personas`**: The adversarial reviewer persona drives the priority ranking.
- **`skills/rebuttal`**: Reviewer objections about limitations feed back into this skill for camera-ready revisions.

## Output

- Assumption inventory.
- Classified, prioritized limitations.
- Draft limitation statements.
- Placement recommendation.
- TODO.md updated.
