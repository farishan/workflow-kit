#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if command -v tsc >/dev/null 2>&1; then
  tsc --noEmit
  echo "TS-STANDALONE VERIFY OK"
else
  echo "tsc not available; skip"
fi
