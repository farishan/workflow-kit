#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
gofmt -w .
go build ./...
go test ./...
echo "DEMO VERIFY OK"
