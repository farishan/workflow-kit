#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
bun run typecheck && bun test && bun run build
