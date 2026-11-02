#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
test -f templates/SPEC.md
test -f templates/PLAN.md
test -f templates/ACCEPTANCE.md
test -x ~/.local/bin/wf-verify
test -f ~/.config/opencode/commands/spec.md
test -f ~/.config/opencode/commands/verify.md
test -f ~/.config/opencode/commands/review.md
test -f ~/.config/opencode/commands/ship.md
test -f ~/.config/opencode/commands/flow.md
test -f ~/.config/opencode/agents/implementer.md
test -f commands/spec.md
test -f agents/implementer.md
test -x install.sh
test -x selftest.sh
./selftest.sh >/tmp/opencode/selftest.log 2>&1 || { cat /tmp/opencode/selftest.log; exit 1; }
echo "WORKFLOW-KIT VERIFY OK"
