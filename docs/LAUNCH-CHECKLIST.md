# Launch checklist — workflow-kit

Pre-launch gate. Work top-down; every box must be ticked (or explicitly
deferred with a note in `docs/ROADMAP.md`) before announcing.

## Assets

- [x] `LICENSE` (MIT) present at repo root (done — v0.2).
- [x] `CHANGELOG.md` up to date; new section for the release.
- [x] `VERSION` bumped to target (e.g. `1.0.0`); tag will be `v<VERSION>`.
- [ ] Pro pack zip built: `make package` → `dist/workflow-kit-<VERSION>.zip`
      contains `pro/` (landing template, commercial license, video slot).
      See `scripts/package.sh` (note: package.sh currently excludes `pro/` and
      `selftest*`; verify zip contents before upload).
- [ ] Screenshots captured per `docs/SCREENSHOTS.md` into `site/img/`
      (terminal-verify, commands, landing, mobile).
- [x] Landing page `site/index.html` renders; Gumroad URLs replaced (not
      placeholders).
- [x] Video walkthrough recorded or placeholder shipped to buyers (open
      question #5 in `docs/PRODUCT.md`).

## Accounts / infra

- [x] GitHub repo public, default branch `main`, topics/tags set.
- [x] GitHub Pages enabled for `site/` (landing + 404). (live: farishan.github.io/workflow-kit/)
- [x] Gumroad account verified; payout + tax info complete (Gumroad is
      merchant of record; VAT handled by Gumroad).
- [ ] Support email alias live (`support@…`) + canned responses
      (`docs/PRODUCT.md` open question #4).
- [ ] Domain for landing page (if custom) pointed at Pages.

## Listing

- [x] Gumroad products created per `docs/GUMROAD-SETUP.md` (Pro $29, Team
      $99) using `product/gumroad-listing.md` copy.
- [x] Placeholder Gumroad URLs replaced in:
      - `site/index.html` (lines ~232, ~243)
      - `pro/README.md`
      - `product/gumroad-listing.md` CTA
- [x] `docs/PRICING.md` matches live Gumroad prices (incl. $15 extra seat).
- [x] Refund policy stated (14-day no-questions) on listing + `docs/PRICING.md`.
- [x] License terms (`pro/LICENSE-COMMERCIAL.md`) shipped inside paid zip.

## Tags / release

- [x] Verify gate green: `./verify.sh && ./selftest.sh` (or `make verify`).
- [x] Commit version bump + changelog; push `main`.
- [x] Annotated tag `v<VERSION>` pushed (triggers `.github/workflows/release.yml`).
- [x] GitHub Release created with zip attached.
- [ ] `install.sh` one-liner tested on a clean machine.

## Announce

- [x] Social posts drafted (`product/social-post.md`) — X + LinkedIn.
- [x] Product Hunt submission (v1) prepared with landing + screenshots.
- [ ] OpenCode marketplace listing submitted (v1).
- [x] README updated with tiers link, support email, install one-liner.
- [ ] GitHub Discussions enabled; welcome post pinned.
- [x] Metrics baseline noted (`docs/METRICS.md`).

## Post-launch (first 48h)

- [ ] Monitor Gumroad sales + support inbox.
- [ ] Triage issues; log in `docs/ROADMAP.md`.
- [ ] Confirm `wf-verify` runs clean on buyer machines (no env surprises).