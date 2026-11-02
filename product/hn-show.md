# Show HN — workflow-kit

Title: Show HN: workflow-kit – files-only agentic workflow kit for AI coding (OpenCode/Claude/Cursor)

Body:

Hi HN — I built workflow-kit, a drop-in set of files (templates, slash commands, subagent personas, universal verifier) that enforces spec → implement → verify → review → ship for AI-assisted coding.

Why: most AI coding is one-shot. No spec, no verification, no review. I wanted a repeatable loop I could drop into any project and run offline.

How it works:
- /spec writes a SPEC.md + acceptance criteria
- /plan decomposes into tasks
- implement (subagents do the work)
- wf-verify auto-detects the stack (Go, Node, Rust, Deno, Ruby, TS, Make, Python) and runs tests/lint/fmt
- /review checks diff vs spec
- /ship commits + tags

Free core is MIT on GitHub: github.com/farishan/workflow-kit
Pro ($29) / Team ($99) add a landing template, video walkthrough, priority support.

Happy to answer questions about the verifier or the agent personas. What does your current AI coding loop look like?