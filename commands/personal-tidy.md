---
description: Walk ~/dev/personal/ dir-by-dir to tidy up local state, reconcile with GitHub, and update PROJECTS.md + TIDY_LOG.md.
---

# Personal Tidy

Work through `~/dev/personal/` one dir at a time. For each:

1. Read `TIDY_LOG.md` to find the first dir with status `—` (unprocessed). If all done, report and stop.
2. For that dir, check:
   - Is it a git repo? Remotes? Is remote accessible?
   - Is it on GitHub under `farishan`? `tacyeet`? Does it match?
   - Does it have `node_modules` or build artifacts that bloat?
3. Present options to the user — typical outcomes:
   - **delete** — trash it (already on GitHub or worthless)
   - **push** — `git init` + `gh repo create` + push to `farishan/<name>`, then delete local
   - **merge** — clone GitHub version, copy local changes in, merge README, push, delete local
   - **fork** — if remote is `tacyeet/`, create `farishan/<name>`, rename origin→upstream, push, delete local
   - **keep** — leave as-is (active development)
   - **archive** — just note in log, no action
4. After the action, update `TIDY_LOG.md` with the result.
5. If `PROJECTS.md` status changed, update it too.
6. Move to next dir (repeat).

Reference docs:
- PROJECTS.md at `~/dev/personal/docs/PROJECTS.md`
- TIDY_LOG.md at `~/dev/personal/docs/TIDY_LOG.md`
- GitHub personal SSH: `git@github-faris:farishan/<repo>.git`
- `gh` CLI authed to `farishan` (personal) and `farishubton` (work, inactive)
- Butler CLI for itch.io: `butler push <dir> <user>/<game>:<channel>`
