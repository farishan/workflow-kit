---
description: Stage all, commit, push
agent: build
---

ponytail: commit scope limited to staged intent; expand when user passes message in $ARGUMENTS.

Run `git add -A`, commit concise repo-style message, then `git push`. If $ARGUMENTS given, use it as the commit message.
