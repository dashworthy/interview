---
name: resume-updates-same-doc
description: A self-driven resume must read the existing handoff, interview its open threads, and update the SAME file rather than spawning a new one.
tags: [resume, handoff]
runs: 2
max_turns: 14
allowed_tools: [Read, Skill, Write, Edit]
---
There is a prior interview handoff under `.interviews/` in this directory (a `.interviews/<date>-<session>/interview.md` file). Resume that interview and pick up its open threads. I'm in a hurry — for every question assume I pick your recommended option, so don't stop to wait for me: ask each question, record your recommended pick as my answer, work through the open threads, and then update the handoff document with what got resolved.
