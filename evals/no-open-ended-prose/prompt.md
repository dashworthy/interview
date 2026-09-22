---
name: no-open-ended-prose
description: With a question tool available, the agent must ask via a structured tool call, never as open-ended prose the user has to hand-type an answer to.
tags: [compliance, laws, anti-prose]
runs: 3
max_turns: 3
allowed_tools: [Read, Skill, AskUserQuestion, Write]
---
Interview me about writing a personal blog — what I should write about and how often I should post.
