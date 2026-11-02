# workflow-demo — Specification (v0)

Demo project proving the agentic workflow kit end-to-end.

## 1. Purpose
Tiny Go program exposing `Add(a,b int) int`, used to demonstrate
spec → implement → verify → ship.

## 2. Scope
In: Add function, unit test, verify.sh.
Out: everything else.

## 3. Verification
`wf-verify .` exits 0 (gofmt clean, build, tests pass).
