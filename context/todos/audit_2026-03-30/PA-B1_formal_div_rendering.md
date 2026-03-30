---
id: "PA-B1"
short: "formal-div-rendering"
title: "Verify .formal divs stripped in submission mode"
status: done
priority: high
depends_on: []
binding_claims: []
target: "sections/02_background.md, pandoc/filters/annotations.lua"
pipeline: "audit_2026-03-30"
assigned: "martin"
created: "2026-03-30"
---

## Goal

Verify that the three `::: {.formal}` annotation divs in `sections/02_background.md` are stripped by `annotations.lua` in submission mode. If they are not stripped, three placeholder texts beginning with "Oscar:" will appear in the final PDF, which is a desk-reject-level problem.

## Context

The paper audit (Z01 synthesis, item B1) identified three unfilled `.formal` divs:

1. **Lines 47-49** — refinement ordering definition placeholder
2. **Lines 85-87** — propagation rule semantics placeholder
3. **Lines 109-111** — soundness/completeness guarantees placeholder

All three are assigned to Oszkar and contain visible placeholder text (e.g., "Oscar: refinement ordering definition..."). The `annotations.lua` Pandoc filter is supposed to strip annotation divs in submission mode, but `.formal` class divs must be confirmed as part of the strip list.

## Steps

1. Open `pandoc/filters/annotations.lua` and check whether `.formal` is in the list of annotation classes that get stripped in submission mode.
2. If YES: no action needed — the divs will be invisible in the PDF. Mark this todo as done.
3. If NO: either (a) add `.formal` to the strip list in `annotations.lua`, or (b) manually remove or comment out the three div blocks in `sections/02_background.md` before building the submission PDF.
4. After fixing, build the PDF and visually confirm no "Oscar:" text appears.

## Acceptance criteria

- [ ] Confirmed `.formal` divs do not render in submission-mode PDF
- [ ] If filter was modified, change is tested with a local pandoc build
