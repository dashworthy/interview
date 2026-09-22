---
type: llm
weight: 1
focus: trace
arm: with-only
---
The skill requires that every question carries a genuine recommendation, placed first, with a stated reason.

PASS if the recommended option is placed first, is clearly marked as recommended, AND carries a real one-line justification for WHY it is recommended (a reason grounded in the topic or a lowest-regret default) — not a bare label with no rationale. The other options are distinct, plausible alternatives.

FAIL if there is no recommendation, the recommendation is not first, the "why" is missing or empty boilerplate, or the recommended option is arbitrary rather than a defensible default.
