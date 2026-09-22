---
name: discovery-implicit
description: A "help me pressure-test / flesh out my half-baked idea" request should fire the interview skill even without the word "interview".
tags: [discovery, routing]
runs: 3
max_turns: 3
allowed_tools: [Read, Glob, Grep, Skill, AskUserQuestion]
---
I've got a rough, half-baked idea for a neighborhood tool-sharing app. Help me pressure-test it and flesh out the blindspots before I commit to building anything.
