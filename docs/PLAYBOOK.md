# Agentic Workflow Playbook

> Stop vibe-coding. Ship agentic changes with a repeatable loop.

This playbook is the operating manual for workflow-kit. It explains the flow,
the commands, the verifier, and the patterns that make AI-assisted coding
reliable. Read it once, then use the commands.

---

## 1. The better flow

```
/spec → /plan → (spawn workers) → implement → /verify → /review → fix → /ship → log
```

1. **Spec (`/spec`)** — write `SPEC.md` + `PLAN.md` + `ACCEPTANCE.md` before
   touching code. Scope the change in 5 minutes; agents and humans both follow it.
2. **Plan (`/plan`)** — refresh `PLAN.md` into concrete, ordered tasks with
   owners (you or a worker).
3. **Spawn workers** — for parallelizable tasks, spawn isolated workers
   (herdr + pi) in separate terminals. Each worker gets one task + the spec.
4. **Implement** — small increments. One logical change per commit. Run the
   verifier after each.
5. **Verify (`/verify`)** — run `wf-verify` (tests/typecheck/lint/build). If it
   fails, fix before moving on. Never push red.
6. **Review (`/review`)** — code-reviewer subagent reviews the diff against the
   spec and acceptance criteria.
7. **Fix → verify** — apply review feedback, re-verify. Loop 5–7 until green.
8. **Approve** — human (you) approves the diff. This is the gate; agents don't
   ship without it.
9. **Ship (`/ship`)** — verify + commit + push + memory log + status update.
10. **Log** — update `STATUS.md` and `memo note` so the next session has context.

### Rules of the loop

- **Spec before code.** Even a 3-line spec beats none. It gives agents a target.
- **One change per commit.** Easier to review, revert, and bisect.
- **Verifier is the source of truth.** If `wf-verify` passes, the change is
  structurally sound. If it fails, nothing else matters.
- **Review is not optional.** Agents miss things humans catch (and vice versa).
- **Human approval is the gate.** Agents propose; you dispose.

---

## 2. Worked example: demo-go

The repo ships `demo-go/` — a tiny Go module that demonstrates the full loop.

```
demo-go/
├── SPEC.md          # what we're building
├── PLAN.md          # ordered tasks
├── ACCEPTANCE.md    # how we know it's done
├── go.mod
├── main.go
├── main_test.go
└── verify.sh        # project-specific checks
```

Try it:

```sh
cd ~/dev/workflow-kit/demo-go
cat SPEC.md PLAN.md ACCEPTANCE.md   # read the spec first
./verify.sh                        # run project checks
wf-verify .                        # run the universal verifier
```

Expected: `wf-verify` detects `go.mod`, runs `gofmt -l`, `go vet`, `go build`,
`go test`, and reports PASS. `verify.sh` runs any project-specific checks on
top.

To practice the loop, make a small change (e.g., add a function), then:

```sh
/spec      # scaffold spec artifacts if missing
# edit main.go
/verify    # wf-verify
/review    # code-reviewer subagent
/ship      # verify + commit + push + log
```

---

## 3. Command reference

| Command | Purpose |
|---|---|
| `/spec` | Scaffold `SPEC.md` + `PLAN.md` + `ACCEPTANCE.md` (minimal v0). |
| `/plan` | Refresh `PLAN.md` from the current spec. |
| `/verify` | Run `wf-verify` (tests/typecheck/lint/build). |
| `/test` | Run tests only (faster feedback). |
| `/review` | Code-reviewer subagent reviews the diff vs spec. |
| `/ship` | Verify + commit + push + memory log + status update. |
| `/flow` | Show current flow step + next action. |
| `/status` | Project status (git, verify, memory). |
| `/doctor` | Kit health check (commands, agents, wf-verify on PATH). |
| `/clean` | Remove build artifacts (safe). |
| `/jot` | Quick note to memory. |
| `/push` / `/quickpush` | Push commits (with/without verify). |
| `/gitflow-release` | Tag + release flow. |
| `/personal-tidy` | Tidy personal projects. |

---

## 4. Verifier: `wf-verify`

`wf-verify` auto-detects the stack and runs the usual checks. If a project has
its own `verify.sh`, that takes precedence.

### Supported stacks

| Stack | Detection | Checks |
|---|---|---|
| Go | `go.mod` | `gofmt -l`, `go vet`, `go build`, `go test` |
| Bun/Node | `package.json` | typecheck/check, test, build (if scripts exist) |
| Rust | `Cargo.toml` | `cargo fmt --check`, `cargo clippy`, `cargo build`, `cargo test` |
| Deno | `deno.json` / `deno.jsonc` | `deno check`, `deno test`, `deno task build` |
| Ruby | `Gemfile` | `bundle exec rspec` / `rake test` |
| TypeScript | `tsconfig.json` | `tsc --noEmit` |
| Make | `Makefile` with test/check/verify/build | delegates to `make` |
| Python | `pyproject.toml` / `setup.py` / `requirements.txt` | `pytest` (if tests present) |
| PHP | `composer.json` | `phpunit` / `php -l` |
| (fallback) | any `verify.sh` | runs it |

### Behavior

- If `verify.sh` present and executable → run it (project owns verification).
- Else detect stack and run the matching checks.
- If no recognized stack → no-op success (so empty dirs pass).

### Install

`wf-verify` must be on `PATH` (`~/.local/bin`). The installer copies it there.
Run `wf-verify --version` or `/doctor` to confirm.

---

## 5. Patterns

### Spec-first, always

Write the spec before code. A minimal spec is 3 lines: what, why, acceptance.
Agents given a spec produce better code than agents given a vibe.

### Small increments

One logical change per commit. Smaller diffs review faster and revert cleanly.
If a change touches 5 files for 3 unrelated reasons, split it.

### Isolated workers

For parallelizable tasks, spawn one worker per task in its own terminal/branch.
Workers share the spec but not the working tree. Merge when each passes verify.

### Verify after every edit

Don't batch 10 edits then verify. Verify after each logical step so failures
localize to one change.

### Review against the spec

`/review` checks the diff against `SPEC.md` + `ACCEPTANCE.md`. A change that
passes tests but violates the spec is still wrong.

### Paper trail

`SPEC/PLAN/ACCEPTANCE` are the paper trail. Future-you (and future agents)
read them to understand why a change exists. Keep them in the repo.

### Memory log

After shipping, `memo note` the outcome. The next session starts from facts,
not vibes.

---

## 6. Safety

- No broad filesystem searches (grep/find/rg across `~` or `~/dev`).
- No destructive ops without confirmation.
- Never force-push or rewrite history.
- Never commit secrets; `.env` and `data/` are gitignored.
- Local-first: no telemetry, no network calls from the kit itself.

---

## 7. Troubleshooting

### `wf-verify: command not found`

Run `./install.sh` or `make install`, then ensure `~/.local/bin` is on `PATH`.

### Verifier reports no stack detected

Add a `verify.sh` to the project, or ensure a recognized marker file exists
(`go.mod`, `package.json`, `Cargo.toml`, etc.).

### `gofmt` / `cargo fmt` fails

Run the formatter with `--write`/`fmt` to fix, then re-verify. Formatters are
not optional; unformatted code fails the gate.

### Tests fail only in CI

Check env differences (paths, env vars). `wf-verify` runs the same commands
locally and in CI via `.github/workflows/verify.yml` — keep them in sync.

### Agent produces code that doesn't match spec

Tighten the spec: add acceptance criteria, examples, and explicit out-of-scope.
Re-run `/spec` then `/review`.

---

## 8. FAQ

**Q: Does this replace my CI?**
A: No. It complements it. `verify.yml` runs the same `wf-verify` in CI so
local and CI results match.

**Q: Can I use it with Cursor/Aider, not just OpenCode/Claude Code?**
A: Yes. Commands are plain Markdown; agents are plain Markdown. Drop them into
your tool's config dir. `wf-verify` is standalone.

**Q: Is the core really free?**
A: Yes, MIT. The Pro pack (landing template, pro templates, video walkthrough,
support) is paid. Core stays open and forkable.

**Q: What's the difference between Pro and Team?**
A: Pro is single-seat ($29). Team is up to 5 seats + shared config repo +
onboarding call + 48h SLA ($99). See `docs/PRICING.md`.

**Q: Do I get updates?**
A: Free gets all core updates (open source). Pro/Team include 12 months of
updates to Pro assets from purchase.

---

## 9. Pro tips

- Run `/doctor` after installing to confirm everything is wired.
- Keep `SPEC.md` under one screen. If it's long, the change is too big.
- Use `/flow` when you forget where you are in the loop.
- Tag releases (`git tag v0.x.0`) so buyers can pin a version.
- Add a `verify.sh` to every project — it's the one file that makes the kit
  project-aware.

---

*See also: `docs/PRODUCT.md`, `docs/PRICING.md`, `docs/INSTALL.md`,
`docs/FAQ.md`, `docs/COMPARISON.md`, `docs/EXAMPLES.md`.*