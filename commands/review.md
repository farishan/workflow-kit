---
description: Review the current diff with the code-reviewer subagent. /review [base]
agent: code-reviewer
---

Review uncommitted changes (or diff against $ARGUMENTS, default HEAD) for
correctness, regressions, security, conventions, tests, scope. Output findings
grouped by severity with file:line and suggested fix. End with one-line verdict
(approve / request changes) and whether `wf-verify` passes. Read-only.
