# Using the interview in OpenAI Codex

Codex CLI has no plugin/skill system and no interactive question widget, so this
ships as a **self-contained custom prompt** that carries the full interview
rules inside it and renders every question as a plain-text numbered menu.

## Install (personal `/interview` slash command)

Codex reads custom prompts from `~/.codex/prompts/`. Copy this one in:

```bash
mkdir -p ~/.codex/prompts
cp codex/prompts/interview.md ~/.codex/prompts/interview.md
```

Then in a Codex session:

```
/interview a subscription pricing model for my SaaS
```

The topic after the command lands in the prompt as `$ARGUMENTS`. Run `/interview`
with no topic and it asks for one first.

## Repo-scoped (optional)

`AGENTS.md` at this repo's root points any `codex` session opened here at the
interview instructions, so you don't need the slash command when working inside
the repo — just ask Codex to "interview me about X".

## Parity with the Claude Code plugin

Same four laws (structured choice, recommendation-first, exit option, blindspot
hunting) and the same handoff document. The only difference is delivery: Claude
Code prefers the `AskUserQuestion` tool when available; Codex always uses the
plain-text menu fallback. The behavior is verified by the eval suite under
`evals/` (run with Claude Code's `claude plugin eval`).
