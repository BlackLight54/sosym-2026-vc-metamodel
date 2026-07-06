---
id: "O-OVERLEAF"
short: "overleaf-attach"
title: "Wire the Overleaf project into overleaf/"
status: blocked
priority: medium
depends_on: []
binding_claims: []
target: "overleaf/, AUTHOR_NOTES.md"
pipeline: ""
assigned: "martin"
created: "2026-07-06"
---

## Goal

`overleaf/` is the attachment point for the Overleaf project in the post-migration repo
structure (see `overleaf/README.md`), but it is unwired: no Overleaf git URL is configured
anywhere in this repo. Wire it so `skills/project_overleaf_push` has a working remote.

## Blocked on

Martin supplying the Overleaf project's git URL (`https://git.overleaf.com/<project-id>`,
Overleaf: Menu → Git) and an access token if the account uses one. This cannot be discovered
from the repo.

## Steps once unblocked

1. Prefer Option A from `overleaf/README.md`: add the Overleaf project as a submodule at
   `overleaf/project`. If the git bridge or credentials make the submodule awkward, fall back to
   Option B (plain `overleaf` remote on a build checkout, the pre-migration design in
   AUTHOR_NOTES.md "Overleaf integration").
2. Update AUTHOR_NOTES.md "Setup TODO": check off the Overleaf git remote item.
3. Verify round-trip: `skills/project_overleaf_push` pre-flight passes and a test push lands in
   the Overleaf project history.
4. Record which option was chosen and why as a one-line note in `overleaf/README.md`.

## Acceptance criteria

- A push via `skills/project_overleaf_push` (or the submodule) reaches the Overleaf project.
- `overleaf/README.md` states the chosen wiring.
- No credentials committed to the repo.
