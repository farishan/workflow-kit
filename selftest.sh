#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
WF="$ROOT/bin/wf-verify"
pass=0; fail=0
run() {
  local dir="$1" expect="$2"
  if "$WF" "$dir" >/tmp/opencode/selftest.out 2>&1; then rc=0; else rc=$?; fi
  if [ "$rc" = "$expect" ]; then echo "PASS: $dir (exit $rc)"; pass=$((pass+1));
  else echo "FAIL: $dir expected $expect got $rc"; cat /tmp/opencode/selftest.out | tail -5; fail=$((fail+1)); fi
}
run "$ROOT/demo-go" 0
run /tmp/opencode/denodemo 0
# missing project is no-op success
mkdir -p /tmp/opencode/emptydemo && run /tmp/opencode/emptydemo 0
echo "results: pass=$pass fail=$fail"
[ "$fail" = "0" ]
