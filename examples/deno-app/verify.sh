#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
deno check . && deno test
