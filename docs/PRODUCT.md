# Product: workflow-kit

> Agentic workflow kit: spec → implement → verify → review → ship, repeatable.

## Value proposition

**Stop vibe-coding. Ship agentic changes with a repeatable loop.**

workflow-kit gives a solo developer or small team a ready-made, opinionated workflow
for AI-assisted coding: write a spec, spawn isolated workers, implement in small
increments, run a universal verifier, get a code review, then ship. It ships as
files (templates, slash commands, subagent personas, a verifier binary) — no
build, no service, no lock-in. Drop it into `~/.config/opencode` and it works
offline.

Primary outcome: fewer unreviewed, unverified commits; clearer scope per change;
a paper trail (SPEC/PLAN/ACCEPTANCE) that agents and humans both follow.

## Target buyer

- **Solo devs / indie hackers** building with AI coding agents (OpenCode, Claude
  Code, Cursor, Aider) who lose track of scope or skip verification.
- **Small teams (2–5)** wanting a shared, documented change process without
  adopting a heavy PM tool.
- **Agent power users** who already pay for OpenCode/Claude and want
  higher-leverage prompts, personas, and a verifier that auto-detects their stack.

Non-buyer: teams needing enterprise SSO, hosted dashboards, or a hosted CI —
out of scope (v0/v1).

## What's in the kit (free core)

- `templates/` — SPEC.md, PLAN.md, ACCEPTANCE.md
- `bin/wf-verify` — universal verifier (Go, Bun/Node, Rust, Deno, Ruby, TS,
  Make, Python); falls back to project `verify.sh`
- `commands/` — `/spec /plan /verify /test /review /ship /flow /status /doctor`
  (+ `/clean /jot /push /quickpush /gitflow-release /personal-tidy`)
- `agents/` — implementer, tester, docs-writer, code-reviewer, go-programmer,
  software-architect, Oscar (primary)
- `docs/PLAYBOOK.md` — better flow + command reference
- `install.sh`, `selftest.sh`, `.github/workflows/verify.yml`

Local-first, non-destructive, no telemetry.

## Pricing tiers

See `docs/PRICING.md` for the full matrix.

| Tier | Price | License | Seats |
|---|---|---|---|
| Free | $0 | MIT (core) | unlimited |
| Pro | $29 one-time | Commercial use of Pro assets | 1 |
| Team | $99 one-time | Commercial use of Pro assets | up to 5 |

### Free — $0

- Full core kit (MIT).
- Community support via GitHub Issues/Discussions.
- GitHub Releases updates.

### Pro — $29 one-time (single user)

Everything in Free, plus the **Pro pack**:

- Polished **landing-page template** (static HTML + Tailwind, single file, no
  build) for launching your own product/docs site.
- **Video walkthrough** placeholder slot (recorded demo of the better flow;
  shipped when recorded — buyers get updates).
- **Priority email support** (best-effort, ~5 business days).
- **Commercial license** for Pro-pack assets (use in client/commercial work;
  no redistribution).
- Early access to new commands/agents before they hit Free.
- Perpetual license for the purchased version; 12 months of updates included.

### Team — $99 one-time (up to 5 seats)

Everything in Pro, plus:

- Up to 5 seats (additional seats $15 each, one-time).
- **Shared config repo template** (org-level commands/agents synced via git).
- **30-minute onboarding call** (async video or live).
- Priority support with 48-hour SLA.
- Invoice/PO-friendly receipt (Gumroad).
- Commercial license scoped to the organization.

## Distribution channels

- **GitHub (free core)** — public repo, MIT. Install via `git clone` +
  `./install.sh`, or `curl | bash` one-liner (v1). GitHub Releases tagged
  versions (`v1.0.0`, etc.).
- **Gumroad (paid)** — Pro and Team as digital products (zip of Pro pack +
  license key). Gumroad handles payments, EU VAT, receipts, license keys.
- v1: **Homebrew tap** (`brew install workflow-kit`), OpenCode command/agent
  marketplace listing, Product Hunt launch.
- v2: optional paid add-ons (extra agent packs, industry-specific command sets).

No itch.io (dev-tool audience; itch is game-focused). No hosted SaaS in v0.

## License model

- **Core (Free): MIT.** Permits commercial use, modification, redistribution.
  No warranty.
- **Pro pack assets (landing template, video, any premium commands/agents):
  proprietary**, sold via Gumroad. Single-seat or org license depending on tier.
  No redistribution, no resale, no sublicensing. Personal/commercial *use* is
  allowed; sharing the files is not.
- **Commercial license** (Pro/Team) grants the right to use Pro assets in
  client/commercial projects. Core is already MIT; this clause covers Pro assets.
- Rationale for split: keep the workflow itself open and forkable; monetize
  polished assets + support, not the loop.

## Roadmap

### v0 (ship now)

- [ ] Add `LICENSE` (MIT) to repo root for core.
- [ ] Write `docs/PRODUCT.md` + `docs/PRICING.md` (this).
- [ ] Tag `v1.0.0` release on GitHub with install instructions.
- [ ] Build Pro pack zip (landing template + placeholder video slot +
  Pro-LICENSE.txt) and list on Gumroad ($29 / $99).
- [ ] README: install, tiers link, support email.

### v0.1

- [ ] `curl | bash` installer.
- [ ] Changelog (`CHANGELOG.md`) + release notes.
- [ ] Support email alias + canned responses.
- [ ] Record video walkthrough; ship to Pro/Team buyers.

### v1

- [ ] Homebrew formula.
- [ ] OpenCode marketplace listing.
- [ ] Product Hunt launch + landing page (using the Pro template).
- [ ] New command packs: `/debug`, `/refactor`, `/migrate`.
- [ ] Testimonials + case studies.

### v2 (explore, not committed)

- [ ] Org config sync helpers.
- [ ] Paid industry command packs (Go service, PWA, CLI).
- [ ] Optional hosted verify badge (static, no SaaS core).

## Out of scope (v0)

- Auto-swap/rotation of anything; hosted services; SSO; seat-management UI;
  DRM on Pro files (honor-system licensing).
- Any code changes to the kit itself beyond docs (this plan is docs-only).

## Open questions

1. **DRM vs honor system** — default: honor system + Gumroad license key in
   zip; no code gating. (Reversible? yes, can add gating later; low risk.)
2. **Team seat count** — default 5 seats; revisit if buyers ask for more.
3. **Update window** — default 12 months included for Pro/Team; lifetime
   updates is the alternative. Decide before launch.
4. **Support channel** — default email (`support@` alias) + GitHub Discussions
   for Free. Confirm domain/alias exists.
5. **Video walkthrough owner** — author records; placeholder ships until done.
   Confirm willingness/time.
6. **Landing template stack** — default static HTML + Tailwind (single file).
   Alternative: Astro. Static keeps it copy-pasteable.
7. **Refund policy** — default 14-day no-questions refund via Gumroad.
8. **Naming** — product "workflow-kit" vs "Oscar". Default keeps repo name.
