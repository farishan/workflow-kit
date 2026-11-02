# Gumroad setup — workflow-kit

Step-by-step to create the paid products from `product/gumroad-listing.md`.
Do this once; update copy on re-releases.

## Prerequisites

- Gumroad account verified (payout + tax).
- Pro pack zip built (`make package`) and inspected for `pro/` contents.
- `product/gumroad-listing.md` open for copy-paste.

## Products

Create **two products** (or one product with a tier variant):

1. **workflow-kit Pro** — $29 one-time, 1 seat.
2. **workflow-kit Team** — $99 one-time, up to 5 seats (+$15/seat add-on).

## Steps (repeat for each product)

1. **New product** → Digital product → name it:
   - Pro: `workflow-kit — Pro`
   - Team: `workflow-kit — Team`
2. **Title** — paste from `product/gumroad-listing.md` → `## Title`:
   `workflow-kit — Agentic workflow kit for AI coding (OpenCode, Claude Code, Cursor)`.
3. **Subtitle** — paste `## Subtitle`.
4. **Description** — paste `## Description`. Keep the Free/Pro/Team bullets;
   for the Team product, emphasize team features (seats, onboarding, SLA).
5. **Pricing**:
   - Pro: $29 one-time.
   - Team: $99 one-time.
   - Team: add an **add-on** "Extra seat" $15 one-time, max 99.
6. **File upload** — upload the Pro pack zip (landing template + commercial
   license + video slot). For Team, upload the same zip plus shared-config
   repo template if available.
7. **License key** — enable Gumroad license keys; auto-generate per purchase.
   Buyers paste into zip; honor-system (no DRM in v0).
8. **Refund policy** — set 14-day no-questions refund (Gumroad default; confirm).
9. **Receipt / VAT** — Gumroad handles EU VAT and receipts; enable
   invoice/PO-friendly receipt for Team.
10. **Cover image** — use `site/img/landing.png` (per `docs/SCREENSHOTS.md`).
11. **Publish** product; copy its URL (`https://gumroad.com/l/workflow-kit-pro`
    / `...-team`).
12. **Wire URLs** into repo:
    - `site/index.html` (Buy Pro / Buy Team buttons)
    - `pro/README.md`
    - `product/gumroad-listing.md` CTA
    - `docs/PRICING.md` if changed.
13. **Test purchase** with a 100%-off coupon; verify download + license key
    delivery; then refund the test.

## After setup

- Record final URLs in `docs/LAUNCH-CHECKLIST.md` (Listing section).
- Tag release per `docs/RELEASE.md`; GitHub Actions attaches the free core zip.
- Paid zip is delivered only via Gumroad (not GitHub Releases).