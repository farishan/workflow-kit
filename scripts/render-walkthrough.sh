#!/usr/bin/env bash
# Render the workflow-kit walkthrough video (terminal + browser) and stitch.
# Requires: vhs, ttyd, ffmpeg, node, screenwright (npm i -g github:0xjesus/screenwright or local)
# TTS voice-over: set ELEVENLABS_API_KEY (and optionally ELEVENLABS_VOICE_ID) in env.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
mkdir -p dist
export PATH="$HOME/go/bin:$HOME/.local/bin:$PATH"

# 1. Terminal segment (VHS)
echo "== rendering terminal segment =="
vhs docs/video-walkthrough.tape

# 2. Serve site for browser segment
echo "== serving site =="
python3 -m http.server 8791 --directory "$ROOT/site" >/tmp/opencode/httpd-walkthrough.log 2>&1 &
HTTPD=$!
sleep 1
trap 'kill $HTTPD 2>/dev/null || true' EXIT

# 3. Browser segment (Screenwright) with ElevenLabs TTS via env
echo "== rendering browser segment =="
if [[ -f .env.local ]]; then
  set -a; . ./.env.local; set +a
fi
node --env-file="$ROOT/.env.local" /tmp/opencode/sw/node_modules/screenwright/scripts/run-example.js "$ROOT/docs/video-walkthrough-browser.json" 2>&1 | tail -8

echo "== done =="
ls -lh dist/workflow-kit-*.mp4 2>/dev/null