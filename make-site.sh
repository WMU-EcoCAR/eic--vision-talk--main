#!/usr/bin/env bash
# Build index.html, the page GitHub Pages serves, from slides.html.
# slides.html is a page fragment (no <html>/<head>), so it can also be published as a Claude artifact.
set -euo pipefail
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  sed -n '1,/<\/style>/p' slides.html
  printf '</head>\n<body>\n'
  sed '1,/<\/style>/d' slides.html
  printf '</body>\n</html>\n'
} > index.html
echo "Wrote index.html"
