---
type: llm
weight: 1
focus: last_message
arm: with-only
---
The user must never be handed an open-ended question to answer in freehand prose instead of picking from options. (In a live session the question is a structured tool call; the headless eval harness can't grant that tool, so grade the rendered behavior.)

PASS if every question the agent poses is rendered as a structured choice — discrete options the user selects — and the agent does NOT additionally ask the user to write out a free-form prose answer in place of choosing.

FAIL if the agent asks one or more open-ended questions the user must answer by typing prose (e.g. "So, tell me — what topics are you passionate about?", "What does success look like for you?").
