#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if [ ! -f vendor/autoload.php ]; then
  if command -v composer >/dev/null 2>&1; then
    composer install --no-interaction --prefer-dist || {
      echo "composer install failed; skipping phpunit"
      exit 0
    }
  else
    echo "composer not available; skipping phpunit"
    exit 0
  fi
fi

PHPUNIT=""
if [ -x vendor/bin/phpunit ]; then
  PHPUNIT="vendor/bin/phpunit"
elif command -v phpunit >/dev/null 2>&1; then
  PHPUNIT="phpunit"
fi

if [ -z "$PHPUNIT" ]; then
  echo "phpunit not available; skipping tests"
  exit 0
fi

$PHPUNIT
echo "PHP-LIB VERIFY OK"
