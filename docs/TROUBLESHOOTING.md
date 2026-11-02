# Troubleshooting

Common `wf-verify` / kit issues and fixes. Paths are relative to the project root unless noted.

## 1. `wf-verify: command not found`

- **Symptom:** shell says `wf-verify: command not found`.
- **Cause:** `~/.local/bin` not on `PATH`, or kit not installed.
- **Fix:** run `./install.sh`; add `export PATH="$HOME/.local/bin:$PATH"` to `~/.bashrc`/`~/.zshrc`; `source` it. Or call `~/.local/bin/wf-verify` directly.
- **Ref:** `install.sh:9-12`, `docs/INSTALL.md`.

## 2. `verify.sh` not executable

- **Symptom:** `./verify.sh: Permission denied`, or `wf-verify` runs it via `bash` instead of directly.
- **Cause:** missing execute bit.
- **Fix:** `chmod +x verify.sh` (also `chmod +x install.sh selftest.sh`).
- **Ref:** `bin/wf-verify:25-38` (executable check then bash fallback).

## 3. Go tests not found / skipped

- **Symptom:** `wf-verify` passes Go build but never runs tests; or Go prints "no test files".
- **Cause:** no `*_test.go` files detected (`bin/wf-verify:48` condition).
- **Fix:** add tests named `*_test.go` in package dirs; run `go test ./...` manually to confirm.
- **Ref:** `bin/wf-verify:40-53`.

## 4. Bun/Node typecheck missing

- **Symptom:** `wf-verify` skips typecheck even though TS errors exist.
- **Cause:** no `"typecheck"` (or `"check"`) script in `package.json` (`bin/wf-verify:66-78`).
- **Fix:** add to `package.json` scripts, e.g. `"typecheck": "tsc --noEmit"`, then re-run.
- **Ref:** `bin/wf-verify:66-71`.

## 5. `cargo fmt --check` diff

- **Symptom:** `wf-verify` fails at `cargo fmt --check`.
- **Cause:** unformatted Rust code.
- **Fix:** run `cargo fmt`, review the diff, commit.
- **Ref:** `bin/wf-verify:87`.

## 6. Python interpreter missing

- **Symptom:** `wf-verify: python tests present but no interpreter` (exit 1).
- **Cause:** no `python3`/`python` on `PATH`.
- **Fix:** install Python 3 + pytest (`pip install pytest` or project venv); ensure `python3 -m pytest -q` works.
- **Ref:** `bin/wf-verify:173-183`.

## 7. Ruby bundler missing

- **Symptom:** `wf-verify: bundler not installed; skip` (tests not run).
- **Cause:** `bundle` not on `PATH`.
- **Fix:** `gem install bundler` (or OS package), then `bundle install`; re-run.
- **Ref:** `bin/wf-verify:116-126`.

## 8. Permission denied

- **Symptom:** `Permission denied` when running `./install.sh`, `./verify.sh`, or `wf-verify`.
- **Cause:** execute bit missing on the file.
- **Fix:** `chmod +x <file>` or invoke via `bash <file>` / `sh <file>`.
- **Ref:** `install.sh:12`, `verify.sh:1`.

## 9. Go not formatted (`gofmt`)

- **Symptom:** `gofmt unformatted:` lists files.
- **Cause:** unformatted Go files.
- **Fix:** `gofmt -w .` (or `go fmt ./...`), then re-run.
- **Ref:** `bin/wf-verify:43-45`.

## 10. No recognized project (no-op)

- **Symptom:** `wf-verify: no recognized project (...). Nothing to do.` (exit 0).
- **Cause:** run from a dir without `verify.sh`/`go.mod`/`package.json`/etc., or wrong directory.
- **Fix:** `cd` into the project root, or add a `verify.sh` / project manifest.
- **Ref:** `bin/wf-verify:185-186`.

See also `docs/INSTALL.md`, `docs/FAQ.md`, and `/doctor`.
