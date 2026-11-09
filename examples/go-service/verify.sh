#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
export GOWORK=off
if [ -n "$(gofmt -l .)" ]; then echo "gofmt unformatted:"; gofmt -l .; exit 1; fi
go build ./...
go test ./...
echo "GO-SERVICE VERIFY OK"
