I want you to devise an agentic workflow that is run across multiple agents but not through interactive sessions, so I can run it inside one session.

I want you to look at each section or even subsection of the paper and offer some critique of it. Give me whether it conforms with an 8-star conference standard, whether it was written by a good PhD student or researcher, and what the reviewer thinks about it now.

Also, look through all the files and identify any other kinds of critiquing points that could be made against these sections. In the end, I want each agent or sub-agent to be more precise and to produce a prompt that, when applied by an interactive agent, we can use to fix their critiques of the section.

Do you understand, or do you need more clarification?

----

Batch Section Review Workflow
Context
Problem: The paper is ~2 days from the MODELS 2026 submission deadline. Sections vary from high-maturity drafts (intro, background, related work) to heavily scaffolded placeholders (evaluation, cross-layer constraints). Before investing the remaining hours, Martin needs a rigorous, per-section critique that identifies what blocks submission, what costs review score, and what can ship as-is — plus actionable fix prompts for the highest-priority issues.

Approach: Launch 15 independent review agents in Wave 1 (all parallel), then 1 synthesis agent in Wave 2 that reads all outputs and produces a prioritized triage. Each agent writes a file to prompts/2026-03-27_section_reviews/.

Why batch: Interactive review is too slow for 8 sections + 4 cross-cutting concerns in 2 days. Parallel agents cover everything in one pass.

Wave 1: 15 Parallel Agents
Section Agents (11)
Each agent evaluates its section against three criteria:

A* conference standard — would this pass at MODELS Foundations Track?
Writing quality — does it read like a competent researcher wrote it?
Four reviewer personas — Champion, Mathematician, Business Manager, Adversarial (from VENUE.md)
Each produces: critique with severity ratings + a self-contained fix-it prompt.

Agent Scope Reads (beyond section) Output file
S00 Abstract + Title VENUE.md, DECISIONS.md, CFP.md S00_abstract_title.md
S01 Introduction 00_abstract, VENUE.md, DECISIONS.md, CFP.md S01_introduction.md
S02 Background (3 subsections) 03_overview (explanation floor check), VENUE.md, DECISIONS.md S02_background.md
S03 Overview (3 subsections) 02_background, 04_approach, VENUE.md, DECISIONS.md S03_overview.md
S04a Approach: DCL (Sec 4.1) 02_background, VENUE.md, DECISIONS.md S04a_approach_dcl.md
S04b Approach: CSL (Sec 4.2) 02_background, VENUE.md, DECISIONS.md S04b_approach_csl.md
S04c Approach: FSL + Cross-Layer (Sec 4.3–4.4) 02_background, 05_evaluation, VENUE.md, DECISIONS.md S04c_approach_fsl_crosslayer.md
S05a Evaluation: Elaboration + Headlines (Sec 5.1) 04_approach, VENUE.md, DECISIONS.md S05a_eval_elaboration.md
S05b Evaluation: Scalability + Threats (Sec 5.2–5.3) VENUE.md, DECISIONS.md, TODO.md S05b_eval_scalability_threats.md
S06 Related Work (3 subsections) 04_approach, VENUE.md, DECISIONS.md, CFP.md S06_related_work.md
S07 Conclusion 00_abstract, 01_introduction, VENUE.md, DECISIONS.md S07_conclusion.md
Sec 04 split rationale: Three metamodel layers have distinct formalism concerns. DCL/CSL need precision checks (Reviewer B). FSL + cross-layer need maturity/novelty assessment (Reviewer D).

Sec 05 split rationale: Elaboration has drafted headline results needing precision critique. Scalability + threats are entirely scaffolded — need a viability assessment (cut vs. attempt?).

Cross-Cutting Agents (4)
Agent Concern Reads Output file
X01 Argument coherence + promise tracking All 8 sections, VENUE.md X01_argument_coherence.md
X02 Claim-evidence audit (binding claims #1–10) All 8 sections, DECISIONS.md X02_claim_evidence_audit.md
X03 Four-persona reviewer simulation (scores + attacks) All 8 sections, VENUE.md, DECISIONS.md, CFP.md X03_reviewer_simulation.md
X04 Decision compliance + emergency triage All 8 sections, DECISIONS.md, CFP.md, TODO.md, VENUE.md X04_decision_cfp_compliance.md
Wave 2: Synthesis Agent (1, after Wave 1)
Agent Z01 reads all 15 output files and produces Z01_synthesis.md:

Triage table — every finding, deduplicated, classified CRITICAL / IMPORTANT / POLISH
Prioritized action list — ordered by impact-per-hour given 2-day deadline
Kill list — sections to cut rather than fix (scalability measurement is the likely candidate)
Top fix prompts — 5–7 highest-priority self-contained prompts ready for interactive execution
Agent Prompt Template
Each Wave 1 agent receives:

# [Agent ID]: [Title]

## Role

You are reviewing a MODELS 2026 Foundations Track submission...
[full venue context, 4 reviewer personas from VENUE.md]

## Evaluation Criteria

For every issue:

1. A* conference standard?
2. Writing quality (competent researcher)?
3. Four reviewer persona reactions?

## Scope

[section-specific instructions]

## Files to Read

[explicit absolute paths]

## Output Format

### Part 1: Section Assessment

- Overall verdict: [READY / NEEDS WORK / NOT SUBMITTABLE]
- Estimated reviewer score range (per persona)

### Part 2: Critique

For each issue:

- Location (section, paragraph, line range)
- Severity (CRITICAL / IMPORTANT / POLISH)
- Issue description
- Which reviewer catches it, score impact
- Suggested fix direction

### Part 3: Fix-It Prompt

Self-contained prompt for Claude Code interactive session:

- Target file(s)
- Goal
- What to read first
- Constraints
- Specific instructions
- Acceptance criteria
Execution
Step 1: Create output directory prompts/2026-03-27_section_reviews/

Step 2: Launch all 15 Wave 1 agents in a single message (parallel Agent tool calls). Each agent is general-purpose type, reads files, writes one output file. No edits to section files.

Step 3: After all 15 complete, launch Z01 synthesis agent.

Step 4: Martin reviews Z01_synthesis.md, picks which fix prompts to execute.

Verification
All 16 output files exist in prompts/2026-03-27_section_reviews/
Each S*file contains: assessment verdict, critique with severity ratings, fix-it prompt
Each X* file contains: cross-cutting findings with section references
Z01 file contains: deduplicated triage table, prioritized action list, kill list, top fix prompts
No section files were modified
Key Design Decisions
15 agents, not 8 — Sec 04 and 05 are too large and heterogeneous for single-agent review. Subsection splitting enables deeper formalism critique.
Cross-cutting agents run in Wave 1 (parallel), not Wave 2 — they read source files, not other agents' outputs, so no dependency.
Emergency-mode framing — per CLAUDE.md (<2 days = polish only), every agent classifies issues by submission-blocking severity.
Each agent gets full VENUE.md personas — costs tokens but ensures self-contained prompts without inter-agent dependencies.
