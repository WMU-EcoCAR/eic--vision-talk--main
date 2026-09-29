#!/usr/bin/env bash
# Rebuild the printable flyer PDF (US Letter) and a PNG preview from the HTML.
# Edit "EcoCAR talk flyer.html" (date, time, room, text), then run this.
set -euo pipefail
cd "$(dirname "$0")"
html="file://$PWD/EcoCAR talk flyer.html"
google-chrome --headless=new --disable-gpu --no-pdf-header-footer \
  --virtual-time-budget=8000 --print-to-pdf="EcoCAR talk flyer.pdf" "$html" 2>/dev/null
google-chrome --headless=new --disable-gpu --hide-scrollbars --window-size=816,1056 \
  --virtual-time-budget=8000 --screenshot="EcoCAR talk flyer.png" "$html" 2>/dev/null
echo "Wrote EcoCAR talk flyer.pdf and .png"
