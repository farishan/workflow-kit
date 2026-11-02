---
description: Bump version, commit, push dev, merge into main, push main. /gitflow-release [patch|minor|major]
---

Bump version in package.json. $1 is bump type; default patch.

1. Stage, commit (with interactive message), and push any unstaged/uncommitted changes first:
   - `git status` to check for changes
   - If dirty: `git add -A && git commit -m "describe changes" && git push origin dev`
2. Read package.json, get current version
3. Bump it per semver ($1 or "patch"); write back
4. `git add package.json && git commit -m "chore: bump ver"`
5. `git push origin dev`
6. `git fetch origin main && git checkout main && git merge dev && git push origin main`
7. `git checkout dev`
