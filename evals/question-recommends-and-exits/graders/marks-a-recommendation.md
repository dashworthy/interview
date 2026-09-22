---
type: llm
weight: 1
focus: last_message
arm: with-only
---
Law 2: every question carries a recommendation, placed first.

PASS if the question presents discrete options and clearly marks one of them as the recommended choice (e.g. "(Recommended)"), placed first in the list.

FAIL if no option is marked as recommended, or the marked option is not placed first.
