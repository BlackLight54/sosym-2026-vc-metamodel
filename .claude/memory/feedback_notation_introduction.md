---
name: "Introduce every concept before use"
description: "No Refinery concept or mathematical notation (including relations) may appear without prior introduction — reviewers treat Refinery as unknown"
type: feedback
---

Every mathematical concept and every Refinery-specific concept must be introduced before first use. This includes basic notions like relations, partial models, and graph predicates — do not assume the reader knows any of these.

**Why:** Oszkár: "Ne használnék bevezetés nélkül a refinery fogalmakat, és ne használnék bevezetés nélkül olyan matematikai fogalmakat, amiket használunk; tehát még relációkat sem. A reviewereknek a Refinery kínai." Reviewers will not know Refinery. They will likely appreciate the tool if properly introduced, but will reject claims built on undefined notation.

**How to apply:** Before any section uses a Refinery concept or mathematical symbol, verify it was defined in Background (Sec 02) or at first use. If Oszkár's Refinery introduction in Background is not yet written, flag any section that uses undefined terms. The running example's constraints must be mathematically precise with all terms defined.