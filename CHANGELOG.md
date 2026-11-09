# Changelog

## 0.3.2 (2026-11-10)
- Fix: `wf-verify` now ignores an ancestor `go.work` (sets `GOWORK=off`) so Go projects verify in workspace repos.
- Fix: example/demo `verify.sh` scripts set `GOWORK=off`.
- Test: selftest now provisions its Deno/Go fixtures and passes 13/13.

## 0.3.1 (2026-11-02)
- Installer: `install.sh` now supports `curl | bash` bootstrap (clone + install).
- Playbook: expanded into a full guide (worked example, patterns, troubleshooting, FAQ, pro tips).
- Pro pack: real templates (SPEC-PRO, PLAN-PRO, ACCEPTANCE-PRO) + `pro/templates/landing.html`; `site/img` shipped.
- Packaging: `pro/` included in release zip.

## 0.3.0 (2026-11-02)
- Productization: landing page, pricing, Pro pack, community files, GitHub Pages/Release workflows.
- Examples: bun, go, rust, python, deno, php, ts, make, ruby (9 total).
- Docs: INSTALL, FAQ, TROUBLESHOOTING, EXAMPLES, ARCHITECTURE, COMPARISON, ROADMAP, DEMO, PLAYBOOK, PRODUCT, PRICING.
- wf-verify expanded: PHP, clippy, biome/eslint; selftest 13 cases.


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
