---
id: "M07"
short: "migration-check"
title: "Final migration verification pass"
status: done
priority: medium
depends_on: ["M20"]
binding_claims: []
target: ""
pipeline: "overhaul-p2"
assigned: "claude"
created: "2026-03-28"
---

After all Phase 2 tasks: grep for stale `%% @` markers, old skill names, `context/DECISIONS.md` refs. Verify all directories have README.md, all skills have SKILL.md. Test build pipeline.
 It should be explained in the CLAUDE.md how to use the memories, the skills, and the to-dos. Decisions and claims go into memory, and to-dos go to the to-dos and the index.
See `prompts/2026-03-28_workflow_overhaul_phase2.md` Task 11.
