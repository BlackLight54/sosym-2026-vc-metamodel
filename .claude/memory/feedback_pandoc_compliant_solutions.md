---
name: Prefer Pandoc-compliant solutions
description: Use Lua filters and Pandoc attributes over raw LaTeX workarounds when adding LaTeX features
type: feedback
---

When a LaTeX feature (e.g., ACM `\Description{}`) is needed but Pandoc doesn't emit it natively, implement a Lua filter rather than converting Markdown figures to raw LaTeX blocks.

**Why:** Martin explicitly asked for Pandoc-compliant handling of figure descriptions rather than just filling in raw LaTeX placeholders. The pipeline is Markdown-first; raw LaTeX should be a last resort.

**How to apply:** When a new LaTeX requirement arises (accessibility tags, custom environments, venue-specific commands), first check if a Lua filter can bridge the gap. Use custom attributes on Markdown elements (e.g., `description="..."` on images) as the source of truth, with filters emitting the LaTeX. Only use raw LaTeX blocks when the construct has no Pandoc equivalent (e.g., `figure*` for double-column).
