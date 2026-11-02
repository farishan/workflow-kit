# Video walkthrough script — workflow-kit Pro pack

Target runtime: ~5 minutes. Record in a clean terminal (12–14pt font) with
OpenCode in the project dir. Commands below are shown **on screen**; talking
points are read/narrated. All paths assume the default install
(`~/dev/workflow-kit`, `~/.local/bin/wf-verify`).

## 1. Intro (0:00–0:25)

**On screen:** title card "workflow-kit — spec → implement → verify → review → ship",
then repo README.

**Talking points:**
- Stop vibe-coding: agents drift without scope and verification.
- workflow-kit is files only — templates, slash commands, agent personas, and a
  universal verifier (`wf-verify`). No build, no service, no lock-in.
- Core is MIT and free; Pro adds this walkthrough, a landing template, and
  priority support.

**Refs:** `README.md:1`, `docs/PRODUCT.md:1`, `docs/PRICING.md`.

## 2. Install (0:25–0:55)

**On screen:**
```bash
git clone git@github.com:farishan/workflow-kit.git ~/dev/workflow-kit
cd ~/dev/workflow-kit && ./install.sh
wf-verify --version
./verify.sh
```

**Talking points:**
- One clone + `install.sh` copies commands/agents/templates into
  `~/.config/opencode` and `wf-verify` into `~/.local/bin`.
- `./verify.sh` confirms the kit itself is healthy (selftest over all stacks).
- Works offline after install; no telemetry.

**Refs:** `docs/INSTALL.md:1`, `install.sh:1`, `verify.sh:1`.

## 3. Spec (0:55–1:35)

**On screen:**
```bash
mkdir -p ~/dev/wf-demo && cd ~/dev/wf-demo && git init
# in OpenCode:
/spec tiny Go Add(a,b int) int with a unit test; v0 only
```
Then show generated files:
```bash
ls SPEC.md PLAN.md ACCEPTANCE.md && sed -n '1,40p' SPEC.md
```

**Talking points:**
- `/spec` (agent: `software-architect`, `commands/spec.md`) writes SPEC.md,
  PLAN.md, ACCEPTANCE.md from templates.
- Scope is explicit: in/out, data model, API, verification, open questions.
- v0 = smallest thing that proves value; nice-to-haves pushed to v1/v2.
- The acceptance checklist becomes the ship gate.

**Refs:** `commands/spec.md:1`, `templates/SPEC.md:1`, `templates/PLAN.md:1`,
`templates/ACCEPTANCE.md:1`.

## 4. Implement (1:35–2:35)

**On screen (OpenCode chat):**
```text
/flow
Implement PLAN.md Milestone 0: Add function + unit test + verify.sh.
Keep the diff minimal; no unrelated edits.
```
Show the resulting diff:
```bash
git diff --stat && git diff
```

**Talking points:**
- `/flow` reports current step from git status + spec presence.
- Implementer works from PLAN.md in small increments; scope matches spec.
- Optional: spawn isolated workers (herdr + pi) for parallel tasks
  (`PLAYBOOK.md` step 2).
- No code edits happen during spec/review steps — docs and verification first.

**Refs:** `commands/flow.md:1`, `commands/plan.md:1`, `docs/PLAYBOOK.md:1`,
`agents/implementer.md`.

## 5. Verify (2:35–3:15)

**On screen:**
```bash
wf-verify .
echo "exit=$?"
```
Expected (generic Go stack):
```text
wf-verify: project=/home/.../wf-demo
== go.mod ==
>> gofmt -l .
>> go vet ./...
>> go build ./...
>> go test ./...
wf-verify: go OK
```

**Talking points:**
- `/verify` runs `wf-verify` (`commands/verify.md`); auto-detects stack
  (Go/Bun/Node/Rust/Deno/Ruby/TS/Make/Python) or a project `verify.sh`.
- A non-zero exit aborts the loop; fix the first failing step, then re-run.
- Verification gate after every milestone (`PLAN.md` template).

**Refs:** `commands/verify.md:1`, `bin/wf-verify`, `docs/DEMO.md:1`.

## 6. Review (3:15–3:55)

**On screen (OpenCode):**
```text
/review
```
Show the reviewer output ending with:
```text
Verdict: approve — wf-verify passes.
```

**Talking points:**
- `/review` runs the `code-reviewer` subagent over the diff
  (`commands/review.md`).
- Checks correctness, regressions, security, conventions, tests, scope.
- Read-only: reports findings by severity with file:line; never auto-edits.
- If "request changes": targeted fixes → back to Verify.

**Refs:** `commands/review.md:1`, `agents/code-reviewer.md`.

## 7. Ship (3:55–4:30)

**On screen (OpenCode):**
```text
/ship "feat: add Add with tests"
```
Then confirm:
```bash
git status && git log --oneline -1
```

**Talking points:**
- `/ship` runs `wf-verify` first and aborts on failure, then stages, commits,
  pushes, and logs memory if significant (`commands/ship.md`).
- Never force-pushes or rewrites history; updates STATUS.md when tracked.
- Result: a verified, reviewed, pushed commit with a paper trail
  (SPEC/PLAN/ACCEPTANCE).

**Refs:** `commands/ship.md:1`, `templates/ACCEPTANCE.md:1`.

## 8. Outro (4:30–5:00)

**On screen:** links slide.

**Talking points:**
- Free core: `github.com/farishan/workflow-kit` (MIT).
- Pro/Team on Gumroad: landing template, this walkthrough, priority support,
  commercial license.
- 14-day refund; support per tier.
- Next: `/status` on your own repo and run the loop on your next change.

**Refs:** `docs/PRICING.md`, `pro/README.md:1`, `docs/PRODUCT.md:1`.
