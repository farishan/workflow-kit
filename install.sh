#!/usr/bin/env bash
# Install workflow-kit into ~/.config/opencode and ~/.local/bin.
# Works both from a cloned checkout and via:  curl -fsSL <url>/install.sh | bash
set -euo pipefail

REPO="farishan/workflow-kit"
DEST="${WORKFLOW_KIT_DIR:-$HOME/dev/workflow-kit}"
BRANCH="${WORKFLOW_KIT_BRANCH:-main}"

# Detect a local checkout (commands/ present next to this script).
SCRIPT_DIR=""
if [[ -n "${BASH_SOURCE[0]:-}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)" || SCRIPT_DIR=""
fi

if [[ -n "$SCRIPT_DIR" && -d "$SCRIPT_DIR/commands" ]]; then
  ROOT="$SCRIPT_DIR"
else
  # Remote / bootstrap mode: clone (or update) then re-exec from the checkout.
  if [[ ! -d "$DEST/.git" ]]; then
    echo "Cloning $REPO into $DEST ..."
    git clone "https://github.com/$REPO.git" "$DEST"
  else
    echo "Updating $DEST ..."
    git -C "$DEST" pull --ff-only || true
  fi
  ROOT="$DEST"
  exec bash "$ROOT/install.sh"
fi

mkdir -p ~/.config/opencode/commands ~/.config/opencode/agents ~/.config/opencode/templates ~/.local/bin
cp "$ROOT"/commands/*.md ~/.config/opencode/commands/
cp "$ROOT"/agents/*.md ~/.config/opencode/agents/ 2>/dev/null || true
cp "$ROOT"/templates/* ~/.config/opencode/templates/
cp "$ROOT/bin/wf-verify" ~/.local/bin/wf-verify
mkdir -p ~/.config/workflow-kit/hooks
cp "$ROOT"/hooks/* ~/.config/workflow-kit/hooks/ 2>/dev/null || true
chmod +x ~/.local/bin/wf-verify
echo "installed workflow-kit into ~/.config/opencode (ROOT=$ROOT)"