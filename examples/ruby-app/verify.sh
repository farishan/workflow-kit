#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if ! command -v bundle >/dev/null 2>&1; then
  echo "bundler not available; skip"
  exit 0
fi
if ! bundle exec rspec --version >/dev/null 2>&1; then
  echo "rspec not available; skip"
  exit 0
fi
bundle exec rspec
echo "RUBY-APP VERIFY OK"
