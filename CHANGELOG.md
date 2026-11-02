# Changelog

All notable changes to workflow-kit.

## [0.2.0] - 2026-11-02

### Added
- `wf-verify` v0.2.0: universal verifier (Go, Bun/Node, Rust, Deno, Ruby, TypeScript, Make, Python, PHP).
- Project's own `verify.sh` takes precedence when present.
- Commands: /spec, /plan, /verify, /test, /review, /ship, /flow, /status, /doctor, /clean, /push, /quickpush, /jot, /gitflow-release, /personal-tidy.
- Agents: implementer, tester, docs-writer, code-reviewer, go-programmer, software-architect, Oscar.
- Templates: SPEC.md, PLAN.md, ACCEPTANCE.md.
- Hooks: pre-commit.
- GitHub Actions workflow `verify.yml`.
- Docs: PLAYBOOK.md, INSTALL.md, FAQ.md.
- Landing page at `site/index.html`.
- MIT `LICENSE`.

### Changed
- README references playbook.

## [0.1.0] - earlier
- Initial kit: templates, wf-verify, install.sh, selftest.
