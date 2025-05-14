#!/usr/bin/env bash
set -euo pipefail

PURCHASE_KEY="$1"
if [[ -z "${PURCHASE_KEY:-}" ]]; then
  echo "Usage: $0 <purchase_key>" >&2
  exit 1
fi

# Exchange the key for a token
BROKER="https://ojflhjvssqramhexvclr.functions.supabase.co/token-broker"
REPO="github.com/lumberjack-so/alfredOS.git"

echo "🔑 Validating license key..."
TOKEN=$(curl -sS -X POST -H "Content-Type: application/json" \
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
