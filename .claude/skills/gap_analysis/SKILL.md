# Skill: Gap Analysis RQ Generation

**Purpose:** Given the thesis and domain, generate concrete research questions that can be given to research agents (Claude research mode, SciSpace, Semantic Scholar, etc.) to map the landscape, establish novelty, and surface threats.

## Trigger

- "Generate research questions"
- "Run gap analysis"
- "Check the novelty claim"
- "What's the related work landscape?"

## Inputs

- CLAUDE.md: thesis (core claim, mechanism, so-what) and domain.
- Any prior knowledge Martin provides about the landscape.

## Steps

### 1. Decompose the thesis into searchable claims

Break the thesis into its constituent claims. A thesis like "We define a formal framework for verifying compliance in decentralized BPMN collaborations using Verifiable Credentials" decomposes into:

- **Existence claim:** Has anyone formalized compliance verification for BPMN collaborations?
- **Mechanism claim:** Has anyone used Verifiable Credentials for process-level compliance?
- **Intersection claim:** Has anyone combined formal verification with SSI/VC in a process modeling context?
- **Scope claim:** What is the state of decentralized process execution models?

### 2. Generate research questions

For each decomposed claim, generate 2–3 specific, answerable research questions. Each RQ should be:

- **Concrete:** "What formal methods have been applied to verify cross-organizational BPMN collaboration compliance?" not "What is related work in BPM?"
- **Agent-ready:** Phrased so a research agent can search for it directly.
- **Threat-aware:** At least one RQ per claim should be adversarial — specifically looking for work that could invalidate the novelty claim.

**RQ categories:**

| Category | Purpose | Example pattern |
|----------|---------|-----------------|
| **Landscape** | Map what exists | "What approaches exist for [X] in [domain]?" |
| **Novelty threat** | Find work that's too close | "Has anyone combined [mechanism A] with [mechanism B] for [goal]?" |
| **Groundedness** | Verify foundations | "What is the established formalization of [concept] that we build on?" |
| **Differentiation** | Sharpen positioning | "How does [closest related approach] differ from [our approach] technically?" |

### 3. Prioritize and annotate

Rank RQs by risk:
- **High risk:** If this search finds a close match, the paper's contribution is threatened.
- **Medium risk:** Finding related work would require repositioning but not abandoning the claim.
- **Low risk:** Expected to confirm that the area exists and is active.

For each RQ, note:
- Which part of the thesis it tests.
- What a threatening answer would look like.
- Suggested search terms and databases (DBLP, Semantic Scholar, Google Scholar, ACM DL, IEEE Xplore).

### 4. Format as agent prompts

For each RQ, produce a ready-to-use prompt:

```
Research question: [the question]
Context: [what we know, what the paper claims, why this matters]
Search strategy: [suggested databases, search terms, date range]
Threat indicator: [what would a threatening result look like]
Return: answer summary, key papers (title, authors, year, venue, DOI if available),
  relevance assessment, and any new questions that emerged.
```

### 5. Write prompt files

Create one prompt file per RQ in `prompts/`:

Filename: `YYYY-MM-DD_gap_analysis_rqN_[short_description].md`

Each file is a self-contained agent prompt:

```markdown
# Research Question: [the question]

**Risk level:** [high / medium / low]
**Tests:** [which part of the thesis this RQ targets]
**Threat indicator:** [what a threatening result would look like]

## Context

[What we already know. What the paper claims. Why this search matters.]

## Search strategy

- **Databases:** [DBLP, Semantic Scholar, Google Scholar, ACM DL, IEEE Xplore]
- **Search terms:** [specific terms]
- **Date range:** [if relevant]

## Expected return

- Answer summary.
- Key papers found (title, authors, year, venue, DOI if available).
- Relevance assessment: does this threaten, support, or refine the novelty claim?
- Any new questions that emerged from the search.
```

### 6. Update TODO.md

Add one TODO per prompt file:
- "Execute `prompts/[filename]` — high risk"
- "Execute `prompts/[filename]` — medium risk"
- etc.

Add a follow-up: "After all RQs answered, assess novelty claim status."

## After agents return results

When Martin reports back with agent findings, help:
- Assess whether any result threatens the novelty claim.
- Propose mitigations (sharpen the distinction, acknowledge and differentiate, reposition).
- Update the paper's positioning in the introduction and related work.
- Import results with `skills/prior_work_import`.
- Delete or archive executed prompt files.

## Output

- Individual prompt files in `prompts/`, one per RQ.
- TODO.md updated with per-prompt tasks.
