---
type: llm
weight: 1
focus: last_message
arm: with-only
---
The interview must present its question as a structured choice the user answers by selecting, not as open prose. (In a live session this is a question-tool call; the headless eval harness can't grant that interactive tool, so grade the rendered behavior.)

PASS if the agent's question offers the user a set of discrete, selectable options (numbered, lettered, or otherwise pick-able) to choose from — i.e. it behaves as a multiple-choice / multi-select question.

FAIL if the agent instead asks an open-ended prose question with no options to pick from.
