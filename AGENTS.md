# AGENTS.md

This repo is an **interview tool**: it interviews a person on a topic with
structured, recommendation-first questions, hunts their blindspots, and writes a
handoff document of every question and answer.

## Running an interview (Codex and other AGENTS.md-aware agents)

To interview someone, follow the self-contained instructions in
[`codex/prompts/interview.md`](codex/prompts/interview.md). In short:

- Ask every question as a **plain-text numbered menu**, never as open prose.
- Every question puts a **recommended option first** (`⭐ (Recommended)`) with a one-line why.
- Every question's last option is **"Exit interview"**.
- Deliberately probe **blindspots** the person didn't raise.
- End by writing a Markdown **handoff document** with the full Q&A transcript, decisions, blindspots, open threads, and next steps.

The Claude Code version of the same capability lives in
`skills/conducting-interviews/SKILL.md` and `commands/interview.md`, and its
behavior is checked by the eval suite in `evals/`.
