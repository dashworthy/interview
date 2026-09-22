---
type: llm
weight: 1
focus: last_message
arm: both
---
No structured-question tool is available, so the interview must fall back to plain text while keeping its shape.

PASS if the first question is presented as a structured choice (a numbered or lettered menu of 2-4 options the user can answer by picking), clearly marks one option as recommended, and includes an "Exit interview" option — all in plain chat text.

FAIL if the agent asks an open-ended prose question with no options, omits the recommendation, or omits the exit option.
