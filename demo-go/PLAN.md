# PLAN.md template (agentic workflow kit)

Decompose into milestones. Each milestone has checkbox tasks. Mark parallelizable
tasks with (P). Include verify.sh updates per milestone.

## Milestone 0: Scaffold
- [ ] project init, deps
- [ ] config from env
- [ ] db + migrations
- [ ] /health
- [ ] verify.sh: build + health

## Milestone 1: Core
- [ ] ...

## Verification gate
After each milestone: `wf-verify .` must pass. Commit only after green.
