---
description: Scaffold spec artifacts for a feature/project. /spec [idea or scope]
agent: software-architect
---

Produce three files in the current project root (or a named subdir if $ARGUMENTS
suggests one):

1. `SPEC.md` — use ~/.config/opencode/templates/SPEC.md as shape (fallback ~/dev/workflow-kit/templates/SPEC.md).
   Fill purpose, scope (in/out), data model, API contract, non-functional,
   verification, open questions. Pick sensible defaults; document open questions.
2. `PLAN.md` — milestones with checkbox tasks, mark parallelizable (P).
3. `ACCEPTANCE.md` — binary checklist (build/behavior/review/ship).

Rules:
- v0 = smallest thing that proves value; push nice-to-haves to v1/v2.
- Ask only if a decision is genuinely ambiguous and irreversible.
- Reuse proven stack patterns (Go+SQLite modernc, Bun+SQLite PWA, embedded UI).
- End by reporting file paths + open questions + concrete next step.
- Do not edit code; docs only.
