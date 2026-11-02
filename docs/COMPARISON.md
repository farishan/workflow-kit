# Comparison

When to use workflow-kit vs. common alternatives. The kit complements rather
than replaces them.

## vs. Husky / pre-commit

- **Husky/pre-commit** manage git hooks (lint/format/tests on commit) for one
  language ecosystem.
- **workflow-kit** ships a `hooks/pre-commit` that runs `wf-verify`, plus spec
  templates, slash commands, agent personas, and a polyglot verifier.
- Use Husky/pre-commit for standardized, language-specific hook configs in a
  team already on them. Use workflow-kit when you also want the spec → verify →
  review → ship loop and AI-agent personas.

## vs. Make

- **Make** is a build orchestrator with explicit targets.
- **wf-verify** auto-detects the stack and runs the usual checks; if a
  `Makefile` exposes `test`/`check`/`verify`/`build`, it delegates to `make`.
- Use Make for custom build graphs; workflow-kit for zero-config verification
  across Go/Node/Rust/Python/etc.

## vs. CI templates

- **CI templates** (e.g. `.github/workflows`) run checks on push/PR in a
  specific platform's environment.
- workflow-kit ships `verify.yml` that runs the *same* `wf-verify` used
  locally, so local and CI results match.
- Use platform CI for matrices, caching, deploy; workflow-kit for the shared
  local/CI command.

## When to use this kit

- Solo devs / small teams (2–5) building with AI coding agents.
- Polyglot repos needing one verifier entry point.
- Want a repeatable, documented change process (SPEC/PLAN/ACCEPTANCE) without
  a heavy PM tool.
- Prefer files-only, local-first, offline-capable tooling (no SaaS).

## When not to use

- Need hosted dashboards, SSO, or enterprise compliance.
- Large monorepos requiring custom orchestration beyond `wf-verify`.
- Teams standardized on another workflow with no appetite for migration.
- Projects where agent personas/slash commands add no value.