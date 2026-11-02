# workflow-kit

Personal agentic workflow improvement kit (Oscar). Non-destructive, local-first.

## Contents
- `templates/` — SPEC.md, PLAN.md, ACCEPTANCE.md
- `~/.local/bin/wf-verify` — universal verifier (run with project path or cwd)
- `~/.config/opencode/commands/` — `/spec`, `/verify`, `/review`, `/ship`, `/flow`

## Better flow (see flower viz)
1. Spec (`/spec`) → SPEC/PLAN/ACCEPTANCE
2. Spawn isolated workers (herdr + pi)
3. Implement
4. Verify (`wf-verify` / `/verify`)
5. Review (`/review`)
6. Fix → verify
7. Approve
8. Ship (`/ship`)
9. Log memory + status

## Verify runner behavior
- If `verify.sh` present and executable → run it
- else Go (`go.mod`) → gofmt check + vet + build + test
- else Bun/Node (`package.json`) → typecheck/check + test + build (if scripts exist)
- else Python → pytest (if tests present)
- else → no-op success

## Install / sync
Files live in config; no build needed. `wf-verify` must be on PATH (`~/.local/bin`).
