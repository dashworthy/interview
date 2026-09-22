---
name: conducting-interviews
description: Interview a person on a topic they name, using structured multiple-choice and multi-select questions that always propose a recommendation, deliberately probing blindspots, then producing a handoff document of every question and answer. Use when the user asks to be interviewed, wants to flesh out or pressure-test an idea, runs discovery on a topic, or invokes /interview.
---

# Conducting Interviews

Say this first, plainly: `Using the conducting-interviews skill to interview you on <topic>.`

Turn a fuzzy idea into a decided, documented one. You supply the structure and the recommendations; the user supplies the judgment.

## What this guarantees

Given a topic, this produces a **handoff document** that captures every question, the options offered, and the user's answers — after an interview that always recommended, always offered an exit, and deliberately hunted the blindspots the user didn't raise.

## The four laws

These govern the *shape* of the interview, not any one tool. Whatever delivers a question must satisfy all four.

1. **Ask as a structured choice, never open prose.** One focused decision per question (or a batch of ~4 related ones), presented as a menu of options.
2. **Every question carries a recommendation.** The recommended option is **first**, marked `(Recommended)`, with a one-line *why*. Single-select for mutually exclusive options; multi-select when several can be true.
3. **Every question offers an exit.** Include an option **"Exit interview"** — "Stop here and write the handoff from what we have." Always leave room for a free-text answer too.
4. **Hunt blindspots.** Spend real effort on what the user *hasn't* raised. This is why the interview beats them thinking alone. See [Blindspot sweep](#blindspot-sweep).

## Delivery: tool-agnostic

The four laws are the contract; the tool is an implementation detail. Present the choice with the best available mechanism, in this order:

1. **A dedicated question/choice tool**, if the host offers one (e.g. `AskUserQuestion`, or any structured-input or forms tool). Prefer it — real selectable options, multi-select, built-in free-text escape.
2. **Plain-text fallback**, when none exists (or the user prefers chat): a numbered menu they answer by number.

   ```
   Q3 · Scope — which of these are in v1? (multi-select, reply with numbers)
     1. Core editor only   ⭐ recommended — smallest thing that's useful
     2. + real-time collaboration
     3. + offline mode
     4. Exit interview
   (or type your own answer)
   ```

Map the laws onto whatever you use — for `AskUserQuestion`: `label` + `(Recommended)`, `description` for the trade-off, `header` for the axis, `multiSelect` for non-exclusive answers. Don't narrate the plumbing to the user; just ask good questions. If they name a preferred mechanism, honor it.

**"Plain chat" changes the rendering, never the structure.** A request like "just talk to me, no widgets, no menus" means: don't use a question *tool* — it does **not** mean drop the four laws. Even in plain prose, each question is still a numbered list of discrete options, still recommendation-first with a `(Recommended)` marker and a why, still carries an "Exit interview" option. An open-ended prompt the user has to answer in free paragraphs ("tell me about your users") is never acceptable, in any mode. If you catch yourself writing a question with no options, stop and turn it into a menu.

## Workflow

1. **Lock the topic and goal.** Confirm the topic in one line. First structured question: *what does "done" look like for this idea?* Offer 2–4 recommended framings so they pick rather than compose.
2. **Ask in rounds.** 1–4 related questions per round. Let each answer choose the next question — follow the fork an answer opens. Restate state briefly between rounds: "Round 3. Scope and users settled; now the hard part — failure modes."
3. **Recommend, every time.** Form a genuine recommendation *before* writing the options, based on what they've said, common practice, and the lowest-regret default. If you truly can't recommend, say so in the question and mark the safest option instead. A recommendation you don't believe is worse than none.
4. **Run the blindspot sweep** (below) before wrapping.
5. **End and hand off.** The interview ends when the idea is decided, or the user picks "Exit interview" or "Wrap up." Then write the handoff document.

## Blindspot sweep

Probe the dimensions the user *didn't* bring up on their own. Pick the ones load-bearing for *this* topic and go deep — don't march the list robotically.

- **Scope & non-goals** — what's explicitly out?
- **Users / audience** — who it's for, and who it isn't.
- **Success criteria** — how we'll know it worked; what's measured.
- **Constraints** — time, budget, tech, legal, skills, dependencies.
- **Edge cases & failure modes** — what breaks it; the worst realistic outcome.
- **Assumptions** — what's taken for granted that might be false.
- **Alternatives** — the "do nothing" or simpler option, and why not it.
- **Second-order effects** — what success creates or breaks downstream.

Name the blindspot when you probe it: "You haven't mentioned failure modes — here's the one I'd worry about."

## Writing options (mechanics)

- 2–4 real options per question; label under ~5 words; one-line trade-off each.
- Recommended first, marked `(Recommended)`. Last option always **"Exit interview"**. Always room for free text.
- Multi-select when answers aren't mutually exclusive.
- Short axis label per question: "Scope", "Audience", "Success".
- Never invent facts about the user's situation inside a rationale — recommend from reasoning, not assumed detail.

## The handoff document

Write a Markdown file in the working directory named `interview-<slug>-<YYYY-MM-DD>.md` (slug from the topic). Honor a request for a shareable Claude Doc instead.

```markdown
# Interview: <Topic>
_Date · Participant · Interviewer (Claude)_

## Summary
3–6 sentences: the idea as it now stands, and the biggest decisions made.

## Decisions
Every settled question: the decision and the one-line why.

## Full Q&A transcript
Per question, in order:
- **Q:** the question text
- **Options offered:** list, marking which was recommended
- **A:** what the user chose (plus any free-text they added)

## Blindspots surfaced
Each blindspot raised, and how it resolved (decided / deferred / dismissed).

## Open threads
Anything unresolved, exited, or deferred — enough context to pick it up cold.

## Recommended next steps
The 3–5 concrete actions that follow.
```

**Track every Q&A as you go** — don't reconstruct the transcript from memory at the end. After writing, tell the user the path and give a 2–3 line summary of what got decided.

## Red flags — stop if you catch yourself

| Rationalization | Reality |
|---|---|
| "I'll just ask this one openly, it's simpler." | Open prose breaks law 1. Structure it, always. |
| "The options are obvious, no need to recommend." | Law 2 is unconditional. Recommend, first, with a why. |
| "I'll add the exit option only on the big questions." | Every question gets "Exit interview." No exceptions. |
| "They covered everything; I'll skip the blindspot sweep." | If they covered everything, the interview was worthless. Probe what they *didn't* say. |
| "I'll write the transcript from memory at the end." | It'll be lossy. Capture each Q&A as it happens. |
| "They said plain chat / no widgets, so I'll just ask normally." | Plain chat means text, not prose. Still a numbered menu, still recommendation-first, still an exit. |

## What this does NOT do

- It does **not** decide the topic. If none is given, ask for one, then start.
- It does **not** interview with open-ended prose questions. Structured choices only.
- It does **not** end without a handoff document — even on an early exit, write up what exists.
- It does **not** implement or act on the idea. It interviews and documents; building is a separate job.
