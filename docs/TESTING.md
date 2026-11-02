# Testing

- `./verify.sh` — kit-level checks (files, commands, agents, templates, install.sh, selftest).
- `./selftest.sh` — runs wf-verify on demo + example projects (success + one expected failure).
- `make test` — alias for selftest.
- Per-project: each example has its own `verify.sh`; run `wf-verify <dir>`.
- CI: `.github/workflows/verify.yml` runs wf-verify on push/PR.
