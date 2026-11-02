---
description: Run the project's tests only. /test [path]
agent: build
---

Run the test suite for the current project without full build:
- Go: `go test ./...`
- Bun/Node: `bun test` / `npm test`
- Python: `pytest -q`
- Rust: `cargo test`
Report pass/fail counts and first failure. Do not edit files.
