---
name: resume-targets-open-threads
description: Resuming an interview must target the prior handoff's open threads and not re-litigate settled decisions, while keeping the four laws.
tags: [resume, compliance]
runs: 3
max_turns: 3
allowed_tools: [Read, Skill, Write]
---
Resume this interview and pick up where we left off. Here is the prior handoff document:

## Decisions (settled)
- Data model: separate Quote / SalesOrder / Invoice entities, linked by conversion.
- Money: stored as integer minor units (cents).
- Immutability: issued invoices are immutable; corrections happen via credit note.

## Open threads (unfinished)
1. Recurring / subscription billing was kept in scope but never designed — scheduling, proration, dunning.
2. Tax specifics — jurisdiction determination, tax-exempt customers, and the rounding strategy are undefined.
3. Quote expiry — the lifecycle has an "expired" state but the expiry policy and duration are unspecified.

Continue the interview, focusing on what's still unfinished.
