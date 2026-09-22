# interview

A Claude Code plugin that interviews you on any topic to turn a fuzzy idea into a decided, documented one.

## What it does

- Asks **structured questions** — multiple-choice or multi-select, via the AskUserQuestion tool.
- **Always proposes a recommendation** (first option, labeled `(Recommended)`, with the reasoning).
- **Hunts your blindspots** — scope, non-goals, users, success criteria, constraints, edge cases, assumptions, alternatives, second-order effects.
- **Every question has an "Exit interview" option** — bail anytime and it writes up what you have.
- Produces a **handoff document** capturing every question, the options offered, and your answers.

## Use it

```
/interview <topic>
```

Example: `/interview a subscription pricing model for my SaaS`

No topic? Just run `/interview` and it asks for one. You can also say "interview me about X" and the `conducting-interviews` skill triggers on its own.

## Output

A Markdown file in your working directory: `interview-<topic>-<date>.md` with a summary, decisions, the full Q&A transcript, blindspots surfaced, open threads, and next steps.

## Also works in Codex

Codex has no plugin system or question widget, so the same interview ships as a
self-contained `/interview` custom prompt (plain-text menus, same four laws, same
handoff). See [`codex/README.md`](codex/README.md) — one `cp` into
`~/.codex/prompts/`.

## Evals

A behavioral eval suite lives in [`evals/`](evals/), run with `claude plugin eval`.
It checks discovery (does the skill fire, and *not* on a plain question), that
questions are recommendation-first structured choices with an exit (never open
prose), that blindspots get probed, and that a faithful handoff gets written —
with both objective (`tool_used`) and intent (`llm`) graders. All 8 cases pass.

## Structure

```
interview/
├── .claude-plugin/plugin.json          # manifest
├── commands/interview.md               # /interview entry point (Claude Code)
├── skills/conducting-interviews/SKILL.md  # the interview workflow
├── codex/                              # Codex CLI port (/interview prompt + AGENTS pointer)
├── AGENTS.md                           # repo-scoped instructions for Codex-style agents
└── evals/                              # claude plugin eval suite (8 cases)
```
