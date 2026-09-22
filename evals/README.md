# interview plugin evals

Behavioral eval suite for the `interview` plugin, run with the native
`claude plugin eval` harness. Each case is a realistic prompt plus graders,
scored against a no-plugin baseline (two-arm ablation) so `arm: both` numbers
say what the plugin *adds* over plain Claude. Compliance cases use `arm: with-only`
— they assert the plugin'd run clears the bar, regardless of baseline.

Two grader kinds run side by side:

- **Objective** (`tool_used`) — did the right skill fire (and the wrong one not),
  did the interview end by writing a handoff file.
- **Intent** (`llm`) — is the question a structured selectable choice rather than
  open prose, is a recommendation marked and placed first, is an exit option
  offered, is the recommendation genuinely justified, is the blindspot
  load-bearing and truly unraised, is the handoff faithful to the interview.

## Note: the question tool can't be asserted headlessly

`claude plugin eval` runs the agent **headless** — there is no human to answer,
so the harness does not grant the interactive `AskUserQuestion` tool (its system
tool-list carries `Skill`, `Read`, `Write`, but not `AskUserQuestion`, even with
`--allow-tools AskUserQuestion`). A `tool_used: AskUserQuestion` grader can
therefore never pass here — and asserting one specific tool would also fight the
skill's tool-agnostic design. So these evals grade the **behavior** the tool
produces — a recommendation-first structured choice with an exit option — which
holds whether it's rendered as a real tool call (live session) or as the
plain-text menu the skill falls back to (headless). To confirm the literal
`AskUserQuestion` call, run the skill in an interactive Claude Code session.

## Cases

| Case | What it pins down | Key graders |
| --- | --- | --- |
| `discovery-explicit` | "interview me about X" fires the skill | `tool_used: Skill` |
| `discovery-implicit` | "pressure-test / flesh out my idea" fires it (no word "interview") | `tool_used: Skill` |
| `no-fire-plain-qa` | a plain conceptual question does **not** become an interview | `tool_used: Skill, max:0` |
| `picks-question-tool` | question is a real decision presented as a selectable choice | `llm` ×2 |
| `question-recommends-and-exits` | a recommendation is marked & first, an exit is offered, and the recommendation is genuine | `llm` ×3 |
| `no-open-ended-prose` | every question is a structured choice, never freehand prose | `llm` ×2 |
| `fallback-no-tool` | with the tool removed, still a structured menu (rec + exit), not prose | `llm` |
| `full-run-handoff` | self-driven run probes a real blindspot and writes a faithful handoff | `llm` trace + `tool_used: Write` |

## Running

```bash
# From the plugin root. --trust-plugin loads the local plugin; no scaffold scripts here.
claude plugin eval . --trust-plugin --allow-tools Write --runs 1

# One case, keep the temp session for debugging:
claude plugin eval . --case full-run-handoff --trust-plugin \
  --allow-tools Write --runs 1 --keep-temp
```

Notes:
- `--allow-tools Write` lets `full-run-handoff` actually write its handoff file
  (the `handoff-written` grader is a real test).
- Default pass threshold is 1.0; a case passes when its scored-arm mean clears it.
- `full-run-handoff` is self-driven (the prompt delegates every answer to the
  recommendation) so a single turn exercises the whole interview without a human.
