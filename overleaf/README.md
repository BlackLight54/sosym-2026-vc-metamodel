# Overleaf interface

This directory is the attachment point for the Overleaf project. Overleaf is the collaboration
and compilation surface; this repository is the main authoring repo. Overleaf's git bridge does
not support submodules or non-project files, which is why Overleaf hangs off this repo and not
the other way around.

## Attach the Overleaf project (one-time, requires the project's git URL)

Overleaf premium exposes a git remote per project: `https://git.overleaf.com/<project-id>`.

Option A (submodule, preferred once the project exists):

```bash
git submodule add https://git.overleaf.com/<project-id> overleaf/project
git commit -m "Attach Overleaf project as submodule"
```

Option B (build-and-push, the pre-migration design): keep Overleaf as a plain remote of a build
checkout and push generated LaTeX to it. See AUTHOR_NOTES.md "Overleaf integration" and
`.claude/skills/project_overleaf_push/SKILL.md`.

## Flow

`sections/*.md` stay the source of truth. `pandoc/` output is generated and pushed to Overleaf;
collaborator edits made on Overleaf are pulled back and reconciled into the Markdown until the
late-stage handoff documented in AUTHOR_NOTES.md.
