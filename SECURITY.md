# Security Policy

## Reporting a vulnerability

Please report security issues privately. Do **not** open a public issue for a
suspected vulnerability.

- Preferred: GitHub Security Advisories for this repo
  (`Security` tab → `Report a vulnerability`).
- Otherwise contact the maintainer via the email listed on the GitHub profile.

Include: affected file/version, reproduction steps, impact, and suggested fix.
We aim to acknowledge within 5 business days.

## Scope

In scope: `bin/wf-verify`, install scripts, hooks, GitHub Actions workflows,
and anything that executes code or writes to the filesystem.

Out of scope: third-party tools (Go, Bun, Node, etc.) and user project code.

## No secrets in config

`~/.config/opencode/opencode.json` (and any committed config) must **never**
contain real API keys or tokens — this is the opencode.json issue: keys pasted
into provider `settings.apiKey` leak into repos, logs, and shell history.

Rules:
- Keep `opencode.json` out of version control; add it to `.gitignore`.
- Prefer environment variables / a secrets manager; reference them, never inline.
- If a key was committed, rotate it immediately and purge from history.
- Redact keys in bug reports, logs, and snippets (`sk-…`, `nvapi-…`).

## Supported versions

Only the latest release (`main` / current tag) receives security fixes.