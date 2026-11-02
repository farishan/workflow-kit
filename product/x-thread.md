# X thread — workflow-kit launch

1/ Stop vibe-coding.

I built workflow-kit: a files-only agentic workflow kit for AI-assisted coding (OpenCode, Claude Code, Cursor).

Spec → implement → verify → review → ship. Repeatable. github.com/farishan/workflow-kit

2/ The problem: AI coding without a loop = one-shot guesses, no verification, no review. You ship bugs you can't see.

workflow-kit enforces the loop: write a SPEC, spawn workers, implement, run wf-verify (auto-detects Go/Node/Rust/Python/…), review, ship.

3/ What's inside (free, MIT):
- templates/ (SPEC, PLAN, ACCEPTANCE)
- bin/wf-verify (universal verifier)
- commands/ (/spec /plan /verify /test /review /ship /flow /status)
- agents/ (implementer, tester, reviewer, architect, …)
- docs/PLAYBOOK.md

4/ Drop into ~/.config/opencode. Works offline. No build, no lock-in, no telemetry.

Free core on GitHub. Pro ($29) adds a polished landing template, video walkthrough, priority support, commercial license. Team ($99) up to 5 seats + onboarding.

5/ Launch code LAUNCH20 = 20% off through Nov 16:
https://farishan1.gumroad.com/l/sknrfm (Pro)
https://farishan1.gumroad.com/l/oxfqak (Team)

Feedback welcome. What's the one step in your AI coding flow you wish were automated?