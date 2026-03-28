---
id: O-ANON
short: "anonymize"
title: "Anonymize supplementary material for double-blind"
status: pending
depends_on: []
binding_claims: []
target: supplementary/
priority: medium
pipeline: "consolidation"
assigned: "oszkár"
created: "2026-03-28"
---

## Goal

Prepare supplementary material (Refinery model files, constraint definitions) for double-blind submission. The supplementary must not reveal author identity.

## What to do

1. Randomize file naming — remove any author-identifying prefixes or paths
2. Remove author names, institution references, and project-identifying metadata from model files
3. Upload supplementary for the review period only (take down after)
4. Ensure Refinery `.problem` files do not contain comments with author names or institutional references
5. Check that the GitHub/repository URL (if included) is anonymized

**Assigned to Oszkár.** The supplementary includes Refinery model files that Oszkár maintains.
