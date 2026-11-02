---
description: Remove build artifacts and caches (non-destructive). /clean
agent: build
---

Remove common build artifacts in the current project without touching source:
- Go: remove binaries from `go build`, `*.test`
- Bun/Node: remove `dist/`, `.next/`, build outputs (keep node_modules)
- Rust: `cargo clean` if Cargo.toml present
- Python: remove `__pycache__/`, `*.pyc`, `.pytest_cache/`
- Generic: remove `*.log` in /tmp only
Report what was removed. Never delete source files or node_modules.
