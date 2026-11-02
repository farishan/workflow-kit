# Releasing workflow-kit

Cutting a release is manual on the version bump and automated on the build.
Keep changes focused; run the verify gate before tagging.

## Steps

1. **Bump version** — write the new semver to `VERSION` (e.g. `0.4.0`). No `v`
   prefix; the tag carries that.
2. **Update CHANGELOG** — add a new section at top of `CHANGELOG.md` summarizing
   changes since the last release (follow the existing format).
3. **Verify** — run the gate:
   ```bash
   ./verify.sh && ./selftest.sh   # or: make verify
   ```
4. **Package** — build the release zip:
   ```bash
   make package   # runs scripts/package.sh → dist/workflow-kit-<VERSION>.zip
   ```
   (Or `make release`, which just wraps `package` and prints the next step.)
5. **Commit & push** — commit the version bump + changelog (and any other
   changes) to `main`:
   ```bash
   git add VERSION CHANGELOG.md && git commit -m "chore: release vX.Y.Z" && git push origin main
   ```
6. **Tag** — create an annotated tag matching `VERSION` with a `v` prefix and
   push it:
   ```bash
   git tag -a vX.Y.Z -m "vX.Y.Z" && git push origin vX.Y.Z
   ```
7. **GitHub Actions builds the release** — pushing a `v*` tag triggers
   `.github/workflows/release.yml`, which rebuilds the package and creates a
   GitHub Release attaching `dist/workflow-kit-*.zip`.

## Notes

- The tag must match `v<VERSION>` exactly (workflow trigger: `tags: ['v*']`).
- `scripts/package.sh` reads `VERSION` to name the zip; keep them in sync.
- The release workflow rebuilds the zip itself — local `make package` is for
  verification/preview only, but recommended before tagging.
- Do not commit files under `dist/` unless intended; `.gitignore` ignores
  `dist/*` zips.
