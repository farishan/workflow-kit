# FAQ

**What is workflow-kit?**
A personal agentic workflow kit: SPEC/PLAN/ACCEPTANCE templates, slash commands, specialized agents, and `wf-verify` — a universal project verifier. Built for OpenCode.

**Do I need OpenCode?**
Commands and agents target OpenCode (`~/.config/opencode`). `wf-verify` and the templates work standalone in any repo.

**How does wf-verify detect my stack?**
It checks for `verify.sh` first, then `go.mod`, `package.json`, `Cargo.toml`, Deno config, `Gemfile`, `Makefile`, `tsconfig.json`, `composer.json`, and Python project files, in that order. Missing toolchains are skipped where noted.

**Is it destructive?**
No. It copies files into your config dir and never force-pushes or rewrites history. `/ship` aborts if verify fails.

**What does `/spec` produce?**
`SPEC.md`, `PLAN.md`, `ACCEPTANCE.md` in the project root, filled for v0 (smallest thing that proves value).

**How do I update?**
`cd ~/dev/workflow-kit && git pull && ./install.sh`.

**What's the better flow?**
Spec → spawn workers → implement → verify → review → fix → approve → ship → log memory/status (see `docs/PLAYBOOK.md`).

**License?**
MIT. See `LICENSE`.

**Pricing?**
Free (OSS) plus placeholder Pro/Team tiers on the landing page; checkout is not wired yet.
