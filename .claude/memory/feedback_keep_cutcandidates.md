---
name: "Don't remove cutcandidate wrappers without approval"
description: "Keep .cutcandidate annotation wrappers unless Martin explicitly says to remove them"
type: feedback
---

Do not remove `::: {.cutcandidate ...}` wrappers from section files unless Martin explicitly approves their removal. The wrapper is a deliberate annotation that preserves optionality for page-budget decisions.

**Why:** In Z-P2, the plan proposed removing the cutcandidate wrapper from the governance paragraph in Sec 2.1 (T33). Martin corrected: "Do not remove the wrapper."

**How to apply:** When a todo says to "keep" a paragraph that has a cutcandidate wrapper, that means keep the paragraph's content — the wrapper is a separate decision. Only remove annotation wrappers when Martin explicitly says to unwrap them.
