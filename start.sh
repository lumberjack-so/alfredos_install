#!/usr/bin/env bash
set -euo pipefail

PURCHASE_KEY="$1"
if [[ -z "${PURCHASE_KEY:-}" ]]; then
  echo "Usage: $0 <purchase_key>" >&2
  exit 1
fi

# Supabase anon public key – safe to embed (replace with your project key)
# If the user already exported SUPABASE_ANON_KEY, that value wins; otherwise we fall back to the hard-coded key below.
SUPABASE_ANON_KEY="${SUPABASE_ANON_KEY:-eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9qZmxoanZzc3FyYW1oZXh2Y2xyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY5NzYyNjgsImV4cCI6MjA2MjU1MjI2OH0.L1KrA4mC01EAiAugd5kIJ46WmqJ7ILclpkC0LA4cHp0}"

# Exchange the key for a token
BROKER="https://ojflhjvssqramhexvclr.functions.supabase.co/token-broker"
REPO="github.com/lumberjack-so/alfredOS.git"

echo "🔑 Validating license key..."
TOKEN=$(curl -sS -X POST \
  -H "Content-Type: application/json" \
  -H "apikey: ${SUPABASE_ANON_KEY}" \
  -H "Authorization: Bearer ${SUPABASE_ANON_KEY}" \
  -d "{\"purchase_key\":\"$PURCHASE_KEY\"}" "$BROKER" | jq -r .token)

if [[ -z "$TOKEN" || "$TOKEN" == "null" ]]; then
  echo "❌ Invalid purchase key" >&2
  exit 2
fi

echo "✅ License verified!"
echo "📦 Downloading Alfred..."

# Clone the repo
git clone --quiet "https://x-access-token:${TOKEN}@${REPO}" alfred
cd alfred

# Run the installer if it exists
if [[ -f "./install.sh" && -x "./install.sh" ]]; then
  echo "🚀 Running installer..."
  ./install.sh
else
  echo "✅ Alfred successfully downloaded to ./alfred"
  echo "📘 To get started, run: cd alfred"
fi
