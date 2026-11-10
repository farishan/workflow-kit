# Contributing to workflow-kit

Thanks for contributing. This kit is files-only and local-first; keep changes
small and verifiable.

## Setup

```bash
git clone git@github.com:farishan/workflow-kit.git
cd workflow-kit
./install.sh   # copies into ~/.config/opencode
```

## Workflow

1. Create a branch: `git checkout -b feat/<short-name>`.
2. Make focused changes (one concern per PR).
3. Update docs/changelog when behavior changes.
4. Run the verify gate (below) before pushing.
5. Open a PR against `main` with a clear description and test notes.

## Verify gate (required)

All PRs must pass:

```bash
./verify.sh        # repo self-check (templates, install, selftest)
./selftest.sh      # wf-verify behavior
make verify        # alias
```

CI runs `.github/workflows/verify.yml` on push/PR. A PR that fails verify will
not be merged.

## Style

- Shell: `set -euo pipefail`, quote paths, keep scripts POSIX-ish bash.
- Markdown: concise, prefer file:line references in reviews.
- No new runtime dependencies; the kit stays build-free.
- Keep `wf-verify` detection order intact (verify.sh first, then stack files).

## Commit messages

Use conventional-ish prefixes: `feat:`, `fix:`, `docs:`, `chore:`, `test:`.

## Developer Certificate of Origin (optional)

We welcome `Signed-off-by` lines (`git commit -s`) but do not require them by
default. Maintainers may ask for sign-off on larger changes.

## License

By contributing, you agree your contributions are licensed under GPL-3.0 and
may be dual-licensed by the maintainer for commercial editions.