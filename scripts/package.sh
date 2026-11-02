#!/usr/bin/env bash
# Build a release zip of workflow-kit into dist/.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

VERSION="$(tr -d '[:space:]' < VERSION)"
if [ -z "$VERSION" ]; then
  echo "package.sh: VERSION file is empty" >&2
  exit 1
fi

OUT="dist/workflow-kit-${VERSION}.zip"
mkdir -p dist
rm -f "$OUT"

# Files/dirs to include (per release spec).
zip -r "$OUT" \
  commands agents templates bin/wf-verify docs site examples install.sh LICENSE README.md CHANGELOG.md VERSION \
  -x "*/.git/*" ".git/*" \
     "*/node_modules/*" "node_modules/*" \
     "*/target/*" "*/__pycache__/*" "*/.pytest_cache/*" \
     "*/tmp/*" "*/temp/*" "*.tmp" "*.o" \
     "dist/*" "dist/workflow-kit-*.zip" \
  >/tmp/opencode/package.log 2>&1 || { cat /tmp/opencode/package.log; exit 1; }

echo "Built $OUT"
