---
name: "Keep annotation divs when filling stubs"
description: "Fill .formal/.todo divs with proposed content inside the div, don't replace div with regular prose"
type: feedback
---

When a `.formal` (or other annotation) div contains placeholder text, fill the div with proposed content — do not remove the div and replace it with regular prose.

**Why:** The div wrapper preserves the annotation for the assigned collaborator (e.g., Oszkar) to review. Removing the div converts a reviewable proposal into committed prose, bypassing the review step. The div also controls visibility via `annotations.lua` (stripped in submission mode).

**How to apply:** When a todo says "fill the stub," write the proposed text inside the existing `::: {.formal}` / `::: {.todo}` div. Only convert to regular prose if Martin explicitly asks to remove the div.
