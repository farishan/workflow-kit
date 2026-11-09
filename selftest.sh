#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
WF="$ROOT/bin/wf-verify"
mkdir -p /tmp/opencode/denodemo
cat >/tmp/opencode/denodemo/deno.json <<'EOF'
{ "tasks": { "test": "deno test" } }
EOF
printf 'export function add(a:number,b:number){return a+b;}\nDeno.test("add",()=>{if(add(1,2)!==3) throw new Error("bad");});\n' >/tmp/opencode/denodemo/main.ts
mkdir -p /tmp/opencode/brokengo
printf 'module brokengo\ngo 1.24\n' >/tmp/opencode/brokengo/go.mod
printf 'package main\nfunc main(){ fmt.Println("x") }\n' >/tmp/opencode/brokengo/main.go
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
# broken Go project should fail
run /tmp/opencode/brokengo 1
run "$ROOT/examples/bun-app" 0
run "$ROOT/examples/go-service" 0
run "$ROOT/examples/rust-cli" 0
run "$ROOT/examples/python-pkg" 0
run "$ROOT/examples/deno-app" 0
run "$ROOT/examples/php-lib" 0
run "$ROOT/examples/ts-standalone" 0
run "$ROOT/examples/make-app" 0
run "$ROOT/examples/ruby-app" 0
echo "results: pass=$pass fail=$fail"
[ "$fail" = "0" ]
