Conduct a structured interview to turn a fuzzy idea into a decided, documented one.

Topic: $ARGUMENTS
(If the topic is empty, ask me for one first — as a single plain question — then begin.)

You supply the structure and the recommendations; I supply the judgment. This is self-contained: follow the rules below directly (Codex has no question-widget tool, so every question is a plain-text numbered menu).

## The four laws (non-negotiable)

1. **Ask as a structured choice, never open prose.** One focused decision per question (or a small batch of ~4 related ones), presented as a numbered menu I answer by number. Never ask a question I must answer in free paragraphs ("tell me about your users") — turn it into options.
2. **Every question carries a recommendation.** Put the recommended option **first**, mark it `⭐ (Recommended)`, and give a one-line *why*. Single-select normally; say "(pick any)" when several answers can be true at once.
3. **Every question offers an exit.** The last option is always **"Exit interview — stop here and write the handoff from what we have."** If I pick it, stop asking and write the handoff immediately.
4. **Hunt blindspots.** Spend real effort on what I *haven't* raised — that's why this beats me thinking alone.

## Question format

```
Q3 · Scope — which of these are in v1? (pick any)
  1. Core editor only   ⭐ (Recommended) — smallest thing that's still useful
  2. + real-time collaboration
  3. + offline mode
  4. Exit interview — stop and write the handoff
(or type your own answer)
```

Ask 1–4 related questions per round. Let each answer choose the next question. Briefly restate where we are between rounds ("Round 3 — scope settled; now failure modes").

## Blindspot sweep

Before wrapping, probe the dimensions I didn't raise — pick the ones that matter most for *this* topic and go deep. Name the blindspot when you raise it ("You haven't mentioned failure modes — here's the one I'd worry about"):

- Scope & non-goals — what's explicitly out?
- Users / audience — who it's for, and who it isn't.
- Success criteria — how we'll know it worked.
- Constraints — time, budget, tech, legal, skills, dependencies.
- Edge cases & failure modes — what breaks it; the worst realistic outcome.
- Assumptions — what's taken for granted that might be false.
- Alternatives — the "do nothing" or simpler option, and why not it.
- Second-order effects — what success creates or breaks downstream.

## End: write the handoff

The interview ends when the idea is decided, or I pick "Exit interview," or I say wrap up. Then write a Markdown file `interview-<slug>-<YYYY-MM-DD>.md` in the working directory with:

- **Summary** — 3–6 sentences: the idea as it now stands and the biggest decisions.
- **Decisions** — every settled question: the decision and the one-line why.
- **Full Q&A transcript** — per question: the question, the options offered (marking the recommended one), and what I chose (plus any free-text I added).
- **Blindspots surfaced** — each one raised and how it resolved (decided / deferred / dismissed).
- **Open threads** — anything unresolved, exited, or deferred, with enough context to pick it up cold.
- **Recommended next steps** — 3–5 concrete actions.

Track every question and answer *as you go* so the transcript is complete — don't reconstruct it from memory. After writing, tell me the file path and give a 2–3 line summary of what got decided.
