# Overleaf interface

**Chosen wiring (2026-07-06):** the Overleaf project syncs with GitHub
(`BlackLight54/sosym-2026-overleaf`, Overleaf GitHub Sync), and that repo is attached here as the
submodule `overleaf/project`. Push to the submodule's `main`, then pull the update into Overleaf
(Menu → GitHub → Pull); Overleaf edits flow back the same way. The project currently holds the
Springer Nature template (`sn-jnl.cls`), which is the SoSyM format; the pandoc pipeline in
`pandoc/` still targets ACM `acmart` and must be retargeted (tracked as an O-VENUE follow-up).

This directory is the attachment point for the Overleaf project. Overleaf is the collaboration
and compilation surface; this repository is the main authoring repo. Overleaf's git bridge does
not support submodules or non-project files, which is why Overleaf hangs off this repo and not
the other way around.

## Flow

`sections/*.md` stay the source of truth. `pandoc/` output is generated, copied into
`overleaf/project/`, committed, and pushed; Overleaf pulls it via GitHub Sync. Collaborator edits
made on Overleaf sync back to the GitHub repo and are pulled here, then reconciled into the
Markdown until the late-stage handoff documented in AUTHOR_NOTES.md.

## Alternative wiring (not in use)

Option B (build-and-push to the Overleaf git bridge directly): keep Overleaf as a plain remote of
a build checkout (`https://git.overleaf.com/<project-id>`) and push generated LaTeX to it. See
AUTHOR_NOTES.md "Overleaf integration" and `.claude/skills/project_overleaf_push/SKILL.md`. Falls
back into use if GitHub Sync becomes unavailable.
