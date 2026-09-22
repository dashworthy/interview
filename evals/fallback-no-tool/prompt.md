---
name: fallback-no-tool
description: With no structured-question tool available, the interview must degrade to a plain-text structured menu — still recommendation-first, still with an exit — not open prose.
tags: [compliance, tool-agnostic, fallback]
runs: 3
max_turns: 3
allowed_tools: [Read, Skill, Write]
---
Interview me about picking a tech stack for a side project. My terminal can only display plain text — it can't render interactive pickers or buttons — so keep every question as plain text.
