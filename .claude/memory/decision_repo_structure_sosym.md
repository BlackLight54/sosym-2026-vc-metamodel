---
name: "Repo structure: sosym-2026-vc-metamodel is main"
description: "Main authoring repo is sosym-2026-vc-metamodel; Overleaf attaches at the edge; ACM-MODELS-26 is the frozen conference record"
type: project
date: 2026-07-06
status: active
affects: "all future sessions (repo home), overleaf/, submodules, skills/project_overleaf_push, O-VENUE, O-OVERLEAF"
revisit_when: "If Overleaf releases submodule support in its git bridge, or the journal target changes"
tags: infrastructure, migration
---

**Decision:** `BlackLight54/sosym-2026-vc-metamodel` is the main authoring repository for the
journal cycle, carrying the full ACM-MODELS-26 history. Submodules: `models/`
(ACM-MODELS-26-code), `prior_work/dse-vc-refinery`, `prior_work/ese-vc-fca` (https URLs). The
Overleaf project attaches under `overleaf/` (submodule or build-push remote, todo O-OVERLEAF).
`BlackLight54/ACM-MODELS-26` is the frozen record of the withdrawn MODELS'26 submission and
receives no further paper work.

**Rationale:** Martin wanted the Overleaf project as the main repo with the artifact and Refinery
repos as submodules. Overleaf's git bridge does not support submodules and treats every pushed
file as a project file, so the knowledge base would flood the Overleaf editor and be exposed to
its sync semantics. Inverting the arrangement preserves the intent: one main repo from which
everything is reachable, with Overleaf as the collaboration surface at the edge.

**How to apply:** Start sessions in sosym-2026-vc-metamodel. Never push paper work to
ACM-MODELS-26. Clone with `--recurse-submodules`; run `git submodule update --init` before
model-facing skills.
