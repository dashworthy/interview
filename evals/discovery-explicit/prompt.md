---
name: discovery-explicit
description: An explicit "interview me about X" request should fire the conducting-interviews skill.
tags: [discovery, routing]
runs: 3
max_turns: 3
allowed_tools: [Read, Glob, Grep, Skill, AskUserQuestion]
---
Interview me about a subscription pricing model for my SaaS product.
