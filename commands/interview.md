---
description: Interview me on a topic with structured, recommendation-first questions, hunt blindspots, then write a handoff document.
argument-hint: <topic to be interviewed on>
---

Conduct a structured interview on this topic: **$ARGUMENTS**

If no topic was given, ask me for one (a single free-form question) before starting.

Follow the `conducting-interviews` skill for the full workflow. Non-negotiables:

- Ask every question as a **structured choice** (multiple-choice or multi-select) — never open prose. Use a dedicated question tool (like `AskUserQuestion`) if one is available; otherwise fall back to a numbered plain-text menu. The tool is interchangeable; the structure is not.
- Every question **always** includes a recommended option, placed first and marked `(Recommended)`, plus room for a free-text answer.
- Every question includes an explicit **"Exit interview"** option. If I pick it, stop asking and jump straight to writing the handoff document from whatever we have so far.
- Actively probe blindspots — the things I haven't thought to mention.
- When the interview ends, write a handoff document capturing every question and my answer.
