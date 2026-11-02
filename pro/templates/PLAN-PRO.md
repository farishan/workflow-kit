# PLAN-PRO.md — Extended Plan (Pro)

## 1. Objective
Restate the goal in one line.

## 2. Tasks (ordered)
For each task: owner, estimate, dependency, definition of done.

| # | Task | Owner | Est | Deps | DoD |
|---|---|---|---|---|---|
| 1 | ... | you | S | — | tests green |
| 2 | ... | worker | M | 1 | verify passes |

## 3. Risk register
| Risk | Likelihood | Impact | Mitigation | Owner |
|---|---|---|---|---|
| ... | med | high | ... | you |

## 4. Rollback
- Trigger conditions.
- Steps to revert (commit SHA, migration down, flag off).
- Data recovery (if any).

## 5. Verification
- `wf-verify` must pass on every task boundary.
- Additional checks (load test, security scan) listed here.

## 6. Ship checklist
- [ ] All tasks done and verified.
- [ ] Review approved.
- [ ] Changelog updated.
- [ ] Tagged release (if applicable).