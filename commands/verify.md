---
description: Run the universal verifier (wf-verify) on the current project. /verify [path]
agent: build
---

Run `~/.local/bin/wf-verify "${ARGUMENTS:-.}"` and report the exit code + tail of
output. If it fails, summarize the first failing step and propose the smallest
fix. Do not auto-edit unless asked; just report.
