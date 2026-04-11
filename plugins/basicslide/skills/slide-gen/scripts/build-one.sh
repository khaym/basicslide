#!/bin/bash
# Build a single Marp slide file to PNG images in dist/
# Usage: npm run build:one -- <file>
#   e.g. npm run build:one -- slides/my-deck.md

set -euo pipefail

file="${1:?Usage: npm run build:one -- <file>}"
name="$(basename "${file}" .md)"

npx marp --no-config --theme-set themes/ --html --images png --image-scale 1 "${file}" -o "dist/${name}.png"
