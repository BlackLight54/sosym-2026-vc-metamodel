---
name: figures.lua filter active
description: Lua filter emits ACM \Description{} from image description attribute; active in defaults.yaml
type: project
---

`pandoc/filters/figures.lua` is now functional (was a stub). It injects `\Description{}` for ACM accessibility compliance on Pandoc-style figures.

**Mechanism:** Reads `description="..."` attribute from the Image element inside a Figure (Pandoc places key=value attrs on Image, not Figure). Falls back to caption text if no explicit description. Emits as RawInline after the Image to avoid triggering Pandoc's minipage layout.

**How to apply:** For new Pandoc-style figures, add `description="alt text"` in the attribute block: `![Caption](path){#fig:label description="..." width=100%}`. For raw LaTeX figure blocks (e.g., `figure*`), manage `\Description{}` manually.
