# dev.to post — workflow-kit

Title: Stop vibe-coding: a repeatable spec → verify → ship loop for AI coding

Tags: ai, productivity, opensource, devtools

Body:

Most AI coding today is one-shot. You prompt, you accept, you ship — and find out later what broke.

I built **workflow-kit**: a files-only agentic workflow kit (OpenCode / Claude Code / Cursor) that enforces a loop:

1. **Spec** — /spec writes SPEC.md + acceptance criteria
2. **Plan** — /plan decomposes into tasks
3. **Implement** — subagent personas do the work
4. **Verify** — `wf-verify` auto-detects your stack (Go, Node, Rust, Deno, Ruby, TS, Make, Python) and runs tests/lint/fmt
5. **Review** — /review checks the diff against the spec
6. **Ship** — /ship commits + tags

Drop into `~/.config/opencode`. Works offline. No build, no lock-in, no telemetry.

Free core is MIT: https://github.com/farishan/workflow-kit

Pro ($29) adds a polished landing template, video walkthrough, priority support, commercial license. Team ($99) up to 5 seats + onboarding.

Launch code **LAUNCH20** = 20% off through Nov 16:
- Pro: https://farishan1.gumroad.com/l/sknrfm
- Team: https://farishan1.gumroad.com/l/oxfqak

What's the one step in your AI coding flow you wish were automated? Let me know in the comments.