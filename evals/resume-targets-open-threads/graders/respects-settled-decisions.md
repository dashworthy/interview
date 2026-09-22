---
type: llm
weight: 1
focus: last_message
arm: with-only
---
Settled decisions are locked context on resume — they must not be re-opened.

PASS if the agent does NOT re-ask or re-litigate any already-settled decision (the data model, the integer-cents money type, or invoice immutability) — it treats them as fixed and moves on to the open threads.

FAIL if the agent re-asks or proposes reconsidering one of the settled decisions.
