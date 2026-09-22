---
type: llm
weight: 1
focus: last_message
arm: with-only
---
A question tool is available, so the user should never be handed an open-ended question to type a freehand answer to instead of picking from options.

PASS if the agent's message to the user does NOT pose an open-ended question expecting a hand-typed answer — i.e. it routed the question through the structured-choice tool and its own text does not additionally ask the user to write out a free-form response in place of choosing.

FAIL if the agent's text asks one or more open-ended questions the user must answer by typing prose (e.g. "So, tell me — what topics are you passionate about?", "What does success look like for you?") rather than presenting them as structured choices.
