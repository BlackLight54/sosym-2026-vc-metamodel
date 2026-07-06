---
id: "O-OVERLEAF"
short: "overleaf-attach"
title: "Wire the Overleaf project into overleaf/"
status: in_progress
priority: medium
depends_on: []
binding_claims: []
target: "overleaf/, AUTHOR_NOTES.md, skills/project_overleaf_push"
pipeline: ""
assigned: "martin"
created: "2026-07-06"
---

## Goal

Wire the Overleaf project into `overleaf/` so builds reach Overleaf and Overleaf edits flow back.

## Done (2026-07-06)

The Overleaf project syncs with GitHub via Overleaf GitHub Sync
(`BlackLight54/sosym-2026-overleaf`); that repo is attached as submodule `overleaf/project`,
pinned at the Springer Nature template import (commit `1a49800`). `overleaf/README.md` records
the chosen wiring and the fallback option.

## Remaining

1. **Martin:** verify the round trip once. Push any trivial change to
   `sosym-2026-overleaf:main`, pull it into Overleaf (Menu → GitHub → Pull), confirm the project
   compiles; make one edit on Overleaf, sync, and confirm it lands back on GitHub.
2. **Claude:** update `skills/project_overleaf_push` to target `overleaf/project` (build, copy
   `pandoc/` output into the submodule, commit, push, remind Martin to pull in Overleaf) instead
   of the pre-migration `build/` checkout with an `overleaf` remote.
3. **Claude (with O-VENUE):** retarget the pandoc pipeline from ACM `acmart` to the Springer
   Nature template (`sn-jnl.cls`) now in the Overleaf project; `pandoc/main.tex`,
   `defaults.yaml`, and the preamble are ACM-shaped.
4. Update AUTHOR_NOTES.md "Setup TODO" (Overleaf git remote item) when 1 and 2 are confirmed.

## Acceptance criteria

- Round trip verified in both directions.
- `skills/project_overleaf_push` works against the submodule.
- Pandoc output compiles under `sn-jnl.cls` on Overleaf.
- No credentials committed to the repo.
