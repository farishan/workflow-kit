---
description: Ship: verify + commit + push + memory log. /ship [commit message]
agent: build
---

Execute the ship sequence:
1. Run `~/.local/bin/wf-verify .`; abort if non-zero.
2. `git status` — if dirty, `git add -A`.
3. Commit with message from $ARGUMENTS or a concise auto message.
4. `git push` (current branch).
5. If the change is significant, run `~/.optmem/memo note "<1 line>"`.
6. If project tracked in STATUS.md, update it.
Report each step's result. Never force-push or rewrite history.
