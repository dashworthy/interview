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

A Markdown file at `.interviews/<date>-<session-name>/interview.md` — one folder per interview — with a summary, decisions, the full Q&A transcript, blindspots surfaced, open threads, and next steps.

**Resume:** `/interview-resume` picks up a prior interview's open threads without re-litigating settled decisions, and updates that same `interview.md` in place (no new file).

## Works in Claude Code and Codex

The plugin ships **two manifests over one shared `skills/` directory** — no
duplicated logic:

- `.claude-plugin/plugin.json` — Claude Code (plus the `/interview` command).
- `.codex-plugin/plugin.json` — Codex (loads the same `skills/`).

Same skill, same four laws, same handoff. Delivery is tool-agnostic: Claude Code
prefers the `AskUserQuestion` tool; Codex (no question widget) uses the skill's
plain-text numbered-menu fallback.

## Evals

A behavioral eval suite lives in [`evals/`](evals/), run with `claude plugin eval`.
It checks discovery (does the skill fire, and *not* on a plain question), that
questions are recommendation-first structured choices with an exit (never open
prose), that blindspots get probed, and that a faithful handoff gets written —
with both objective (`tool_used`) and intent (`llm`) graders. All 8 cases pass.

## Structure

```
interview/
├── .claude-plugin/plugin.json          # Claude Code manifest
├── .codex-plugin/plugin.json           # Codex manifest (shares skills/)
├── commands/interview.md               # /interview entry point (Claude Code)
├── skills/conducting-interviews/SKILL.md  # the interview workflow (shared)
└── evals/                              # claude plugin eval suite (8 cases)
```
