# SPEC-PRO.md — Extended Spec (Pro)

Use this instead of the free `templates/SPEC.md` when the change is
security-sensitive, performance-critical, or cross-cutting.

## 1. Summary
One paragraph: what, why, who benefits.

## 2. Scope
### In scope
- ...
### Out of scope
- ... (explicit, so agents don't gold-plate)

## 3. Threat model (security-sensitive changes)
- Assets: ...
- Actors: ...
- Trust boundaries: ...
- Abuse cases: ...
- Mitigations: ...

## 4. Performance budgets (perf-critical changes)
- Latency target (p50/p95/p99): ...
- Memory ceiling: ...
- Bundle size ceiling: ...
- Regression tolerance: ...

## 5. Acceptance criteria
Numbered, testable. Each must be verifiable by `wf-verify` or a named check.

## 6. Risks & rollback
- Top 3 risks with likelihood/impact.
- Rollback plan (revert commit, feature flag, migration down).

## 7. Open questions
List unknowns that block implementation; resolve before coding.