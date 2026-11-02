# ACCEPTANCE.md template (agentic workflow kit)

Binary checklist. A change is "ready" only when every box is checked.

## Build
- [ ] `wf-verify .` exits 0
- [ ] no compiler/type errors
- [ ] no lint errors (if configured)

## Behavior
- [ ] happy path works (manual or automated)
- [ ] error paths return correct codes
- [ ] no secret leakage in logs/output

## Review
- [ ] diff reviewed by OpenCode (code-reviewer subagent)
- [ ] scope matches spec; no unrelated edits

## Ship
- [ ] commit message follows repo style
- [ ] pushed to correct remote/branch
- [ ] memory logged (OptMem note) if significant
- [ ] status updated (STATUS.md) if project tracked
