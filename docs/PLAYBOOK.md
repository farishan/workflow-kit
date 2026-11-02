# Agentic Workflow Playbook

## Better flow
1. `/spec` — write SPEC.md + PLAN.md + ACCEPTANCE.md (v0 minimal).
2. Spawn isolated workers (herdr + pi) for parallel tasks.
3. Implement in small increments.
4. `/verify` — run `wf-verify` (tests/typecheck/lint).
5. `/review` — code-reviewer subagent reviews diff.
6. If not ready: targeted fixes → back to 4.
7. Human approval.
8. `/ship` — verify + commit + push + memory log.
9. Update STATUS.md + `memo note`.

## Commands
- `/spec` scaffold spec artifacts
- `/plan` refresh PLAN.md
- `/verify` run wf-verify
- `/test` run tests only
- `/review` review diff
- `/ship` verify+commit+push+log
- `/flow` show flow + next step
- `/status` project status
- `/doctor` kit health check

## Verifier stacks
Go, Bun/Node, Rust, Deno, Ruby, TypeScript, Make, Python.
Falls back to project's own `verify.sh` if present.

## Safety
- No broad filesystem searches.
- No destructive ops without confirmation.
- Never force-push or rewrite history.
