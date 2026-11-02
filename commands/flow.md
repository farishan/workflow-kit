---
description: Show the recommended agentic workflow (better flow) and next step. /flow
---

Print the recommended flow and ask which step to do now:

1. Spec: OpenCode writes SPEC.md + PLAN.md + ACCEPTANCE.md (`/spec`).
2. Spawn: herdr spawns isolated pi workers in parallel for independent tasks.
3. Implement: workers implement scoped changes.
4. Verify: automated `wf-verify` (tests/typecheck/lint) — `/verify`.
5. Review: OpenCode reviews diff — `/review`.
6. Fix: targeted fixes if not ready, back to Verify.
7. Approve: human approval.
8. Ship: commit + push — `/ship`.
9. Log: memory + status.

Report current git status and whether SPEC.md/PLAN.md exist to suggest the next step.
