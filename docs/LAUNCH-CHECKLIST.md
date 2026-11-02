# Launch checklist — workflow-kit

Pre-launch gate. Work top-down; every box must be ticked (or explicitly
deferred with a note in `docs/ROADMAP.md`) before announcing.

## Assets

- [ ] `LICENSE` (MIT) present at repo root (done — v0.2).
- [ ] `CHANGELOG.md` up to date; new section for the release.
- [ ] `VERSION` bumped to target (e.g. `1.0.0`); tag will be `v<VERSION>`.
- [ ] Pro pack zip built: `make package` → `dist/workflow-kit-<VERSION>.zip`
      contains `pro/` (landing template, commercial license, video slot).
      See `scripts/package.sh` (note: package.sh currently excludes `pro/` and
      `selftest*`; verify zip contents before upload).
- [ ] Screenshots captured per `docs/SCREENSHOTS.md` into `site/img/`
      (terminal-verify, commands, landing, mobile).
- [ ] Landing page `site/index.html` renders; Gumroad URLs replaced (not
      placeholders).
- [ ] Video walkthrough recorded or placeholder shipped to buyers (open
      question #5 in `docs/PRODUCT.md`).

## Accounts / infra

- [ ] GitHub repo public, default branch `main`, topics/tags set.
- [ ] GitHub Pages enabled for `site/` (landing + 404).
- [ ] Gumroad account verified; payout + tax info complete (Gumroad is
      merchant of record; VAT handled by Gumroad).
- [ ] Support email alias live (`support@…`) + canned responses
      (`docs/PRODUCT.md` open question #4).
- [ ] Domain for landing page (if custom) pointed at Pages.

## Listing

- [ ] Gumroad products created per `docs/GUMROAD-SETUP.md` (Pro $29, Team
      $99) using `product/gumroad-listing.md` copy.
- [ ] Placeholder Gumroad URLs replaced in:
      - `site/index.html` (lines ~232, ~243)
      - `pro/README.md`
      - `product/gumroad-listing.md` CTA
- [ ] `docs/PRICING.md` matches live Gumroad prices (incl. $15 extra seat).
- [ ] Refund policy stated (14-day no-questions) on listing + `docs/PRICING.md`.
- [ ] License terms (`pro/LICENSE-COMMERCIAL.md`) shipped inside paid zip.

## Tags / release

- [ ] Verify gate green: `./verify.sh && ./selftest.sh` (or `make verify`).
- [ ] Commit version bump + changelog; push `main`.
- [ ] Annotated tag `v<VERSION>` pushed (triggers `.github/workflows/release.yml`).
- [ ] GitHub Release created with zip attached.
- [ ] `install.sh` one-liner tested on a clean machine.

## Announce

- [ ] Social posts drafted (`product/social-post.md`) — X + LinkedIn.
- [ ] Product Hunt submission (v1) prepared with landing + screenshots.
- [ ] OpenCode marketplace listing submitted (v1).
- [ ] README updated with tiers link, support email, install one-liner.
- [ ] GitHub Discussions enabled; welcome post pinned.
- [ ] Metrics baseline noted (`docs/METRICS.md`).

## Post-launch (first 48h)

- [ ] Monitor Gumroad sales + support inbox.
- [ ] Triage issues; log in `docs/ROADMAP.md`.
- [ ] Confirm `wf-verify` runs clean on buyer machines (no env surprises).