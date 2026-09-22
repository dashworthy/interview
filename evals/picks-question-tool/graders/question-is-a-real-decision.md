---
type: llm
weight: 1
focus: trace
arm: with-only
---
The agent was asked to interview the user about a mobile-app onboarding flow.

PASS if the first question it poses is a genuine structured decision: it names a clear axis (e.g. what onboarding should optimise for, how many steps, account-first vs value-first), offers 2-4 distinct and sensible options, and is a real choice the user could answer by picking — not a vague or open-ended prompt.

FAIL if it asks an open-ended prose question ("tell me about your users"), offers fake or non-distinct options, or dumps several unrelated questions into one undifferentiated blob.
