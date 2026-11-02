# ACCEPTANCE-PRO.md — Extended Acceptance (Pro)

Every criterion must be objectively verifiable. Tick when done.

## Functional
- [ ] Feature behaves per spec for happy path.
- [ ] Edge cases enumerated and handled (list them).
- [ ] Error paths return actionable messages.

## Non-functional (SLA checks)
- [ ] Latency within budget (p95 ≤ target).
- [ ] Memory within ceiling under load.
- [ ] No new dependencies without justification.
- [ ] Bundle/binary size within ceiling.

## Security
- [ ] Threat model mitigations implemented and tested.
- [ ] No secrets in code or logs.
- [ ] Inputs validated at trust boundaries.
- [ ] Auth/authz checks present where required.

## Quality
- [ ] `wf-verify` passes (tests/typecheck/lint/build).
- [ ] Code review approved.
- [ ] No TODO/FIXME left without a tracking issue.

## Documentation
- [ ] README/docs updated for new behavior.
- [ ] Changelog entry added.
- [ ] Migration notes if breaking.

## Release
- [ ] Version bumped.
- [ ] Tag created.
- [ ] Buyers notified (Pro/Team).