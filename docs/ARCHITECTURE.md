# Architecture

workflow-kit is a files-only kit: templates, slash commands, agent personas,
and a universal verifier. There is no service, build, or runtime dependency
beyond bash and the toolchains of the project being verified.

## Directory layout

```
workflow-kit/
├── agents/                 # OpenCode subagent personas (*.md, YAML frontmatter)
├── bin/wf-verify           # universal verifier (bash)
├── commands/               # slash commands (*.md, YAML frontmatter)
├── docs/                   # documentation
├── examples/               # sample projects, one per supported stack
├── demo-go/                # Go demo used by selftest
├── hooks/pre-commit        # git hook template
├── scripts/package.sh      # build release zip
├── templates/              # SPEC.md, PLAN.md, ACCEPTANCE.md
├── .github/workflows/verify.yml
├── install.sh, verify.sh, selftest.sh
├── Makefile
└── README.md, CHANGELOG.md, LICENSE, VERSION
```

Supporting dirs: `product/`, `pro/`, `site/` (marketing assets).

## Components

- **templates/** — copied to `~/.config/opencode/templates/`. `/spec` scaffolds
  `SPEC.md`, `PLAN.md`, `ACCEPTANCE.md` from these (fallback:
  `~/dev/workflow-kit/templates/`).
- **commands/** — Markdown prompt templates with YAML frontmatter
  (`description`, `agent`). Installed to `~/.config/opencode/commands/`; invoked
  as `/name` in OpenCode, with `$ARGUMENTS`.
- **agents/** — Markdown personas with frontmatter (`description`, `mode`,
  `color`, `permissions`). Installed to `~/.config/opencode/agents/`. Modes:
  `primary` (Oscar) or `subagent`. Permissions gate tool access per persona.
- **bin/wf-verify** — universal verifier; installed to `~/.local/bin/`.
- **hooks/pre-commit** — runs `wf-verify` on the repo root before commit.

## Install data flow

`install.sh` (`install.sh:4-12`) creates target dirs and copies:

- `commands/*.md` → `~/.config/opencode/commands/`
- `agents/*.md` → `~/.config/opencode/agents/`
- `templates/*` → `~/.config/opencode/templates/`
- `bin/wf-verify` → `~/.local/bin/wf-verify` (chmod +x)
- `hooks/*` → `~/.config/workflow-kit/hooks/`

No build step; re-run `./install.sh` after `git pull` to sync.

## Command / agent system

- A command file's `agent:` field selects the persona (or built-in `build`).
  Example: `commands/spec.md` uses `agent: software-architect`;
  `commands/ship.md` uses `agent: build`.
- Agents declare tool permissions (`shell`, `edit`, `read`, `glob`, `grep`)
  with `allow`/`deny` and resource globs, e.g. `code-reviewer` denies
  `shell`/`edit`; `docs-writer` may edit only `*.md`/`*.txt`.
- Oscar (`agents/Oscar.md`) is the `primary` agent; others are `subagent`s
  spawned for scoped work.

## wf-verify stack detection

`bin/wf-verify [path]` (default `.`) `cd`s to the project, then checks in
this order; the first match wins and exits after running:

| Order | Trigger file | What runs |
|---|---|---|
| 1 | `verify.sh` (exec or any) | run it (preferred; `bin/wf-verify:25-38`) |
| 2 | `go.mod` | `gofmt -l`, `go vet ./...`, `go build ./...`, `go test ./...` if `*_test.go` (`:40-53`) |
| 3 | `package.json` | Bun if `bun.lock`/`bun.lockb`/`bunfig.toml`+bun, else npm; runs `typecheck`/`check`/`test`/`build` scripts if present; biome/eslint if config (`:55-81`) |
| 4 | `Cargo.toml` | `cargo fmt --check`, `cargo check`, clippy (if available), `cargo test` if tests (`:83-100`) |
| 5 | `deno.json`/`deno.jsonc` | `deno check .` (best-effort), `deno test` if `*_test.ts/js` (`:102-113`) |
| 6 | `Gemfile` | `bundle exec rake` if `Rakefile`; `rspec` if `spec/*_spec.rb` (`:115-126`) |
| 7 | `Makefile` with `test`/`check`/`verify`/`build` target | `make verify`/`check`/`build`+`test` (`:128-139`) |
| 8 | `tsconfig.json` (no `package.json`) | `tsc --noEmit` (or via npx) (`:141-155`) |
| 9 | `composer.json` | phpunit (vendor or global) if configured (`:157-170`) |
| 10 | `pyproject.toml`/`setup.py` | `pytest -q` if tests present (`:172-183`) |

If nothing matches: `no recognized project ... Nothing to do.` (exit 0)
(`bin/wf-verify:185-186`). Missing toolchains are skipped (exit 0) for Rust,
Deno, Ruby, TypeScript, PHP; a missing Python interpreter with tests exits 1.

## Project data flow

1. `/spec` writes `SPEC.md`/`PLAN.md`/`ACCEPTANCE.md` in the project root.
2. Implementation (often via spawned subagents).
3. `/verify` runs `wf-verify` (tests/typecheck/lint).
4. `/review` runs the code-reviewer subagent on the diff.
5. Fix → verify loop.
6. `/ship` runs `wf-verify`, commits, pushes, logs memory, updates `STATUS.md`.
7. `/clean`, `/status`, `/doctor` support the loop.

`verify.sh` in a project takes precedence over auto-detection, so projects can
encode custom checks. The pre-commit hook (`hooks/pre-commit`) and CI
(`.github/workflows/verify.yml`) both call the same `wf-verify` entry point
for local/CI parity.

## Constraints

- Local-first, no telemetry, no network required after install.
- No broad filesystem searches; targeted searches within one project.
- Never force-push or rewrite history (`commands/ship.md`).