#!/usr/bin/env bash
# Runs unsandboxed (as the operator) only under --scaffold, in the case workspace.
# Drops a prior handoff document the agent must resume and UPDATE in place.
set -euo pipefail

mkdir -p .interviews/2026-01-15-widget-shop
cat > .interviews/2026-01-15-widget-shop/interview.md <<'DOC'
# Interview: Widget Shop Checkout

_2026-01-15 · Participant · Interviewer: Claude (conducting-interviews)_

## Summary
Design for a checkout flow. Core decisions settled; two threads left open.

## Decisions
| # | Area | Decision | Why |
|---|------|----------|-----|
| 1 | Cart storage | Server-side cart tied to session | Survives device switch |
| 2 | Payment | Stripe Checkout redirect | Least PCI burden |

## Full Q&A transcript
- **Q1 · Cart storage** — chose server-side cart.
- **Q2 · Payment** — chose Stripe Checkout.

## Open threads
1. Guest checkout vs required account — never decided.
2. How to handle abandoned carts (reminder emails? expiry?).

## Recommended next steps
1. Write the checkout spec.
DOC

echo "scaffolded prior handoff: .interviews/2026-01-15-widget-shop/interview.md"
