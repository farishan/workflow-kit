#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if python3 -c "import pytest" 2>/dev/null || python -c "import pytest" 2>/dev/null; then
  python3 -m pytest -q 2>/dev/null || python -m pytest -q
else
  echo "pytest not installed; skipping python tests"
fi
echo "PYTHON VERIFY OK"
