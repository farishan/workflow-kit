#!/usr/bin/env bash
# Install workflow-kit into ~/.config/opencode and ~/.local/bin
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
mkdir -p ~/.config/opencode/commands ~/.config/opencode/agents ~/.config/opencode/templates ~/.local/bin
cp "$ROOT"/commands/*.md ~/.config/opencode/commands/
cp "$ROOT"/agents/*.md ~/.config/opencode/agents/ 2>/dev/null || true
cp "$ROOT"/templates/* ~/.config/opencode/templates/
cp "$ROOT/bin/wf-verify" ~/.local/bin/wf-verify
chmod +x ~/.local/bin/wf-verify
echo "installed"
