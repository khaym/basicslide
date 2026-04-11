#!/bin/bash
# check-font-size.sh — Pre-check CSS font-size declarations against design-guideline thresholds
#
# Usage: scripts/check-font-size.sh slides/foo.md
#
# Thresholds (from design-guideline/visual-rules.md Accessibility Baseline):
#   Body text (p, li):       >= 22px (--font-size-base)
#   Headings (h1-h4):        >= 34px (--font-size-xl)
#   Captions/labels:         >= 16px (--font-size-sm)
#   Footnotes/page numbers:  >= 14px (--font-size-xs)
#
# Exit code: 0 = all pass, 1 = violations found, 2 = usage/runtime error

set -euo pipefail

FILE="${1:?Usage: $0 <slide.md>}"

if [ ! -f "$FILE" ]; then
  echo "Error: file not found: $FILE" >&2
  exit 2
fi

# Extract style block and analyse with awk
# Use a temp file so awk's exit code is preserved
tmpout=$(mktemp)
trap 'rm -f "$tmpout"' EXIT

sed -n '/<style>/,/<\/style>/{ /<style>/d; /<\/style>/d; p; }' "$FILE" | awk '
BEGIN {
  base = 20
  violations = 0
  sel = ""
}

# Track selector: line containing {
/\{/ && !/\/\*/ {
  s = $0
  gsub(/[ \t]*\{.*/, "", s)
  gsub(/^[ \t]+/, "", s)
  gsub(/[ \t]+$/, "", s)
  if (s != "") sel = s
}

# Detect base font-size on section
sel == "section" && /font-size:[ \t]*[0-9]+px/ && !/var\(/ {
  v = $0
  gsub(/.*font-size:[ \t]*/, "", v)
  gsub(/px.*/, "", v)
  if (v + 0 > 0) base = v + 0
  next
}

# Process font-size declarations (skip var() and comments)
/font-size/ && !/\/\*/ && !/var\(/ {
  line = $0
  gsub(/^[ \t]+/, "", line)

  # Extract value after "font-size:"
  val = $0
  gsub(/.*font-size:[ \t]*/, "", val)
  gsub(/[; \t!].*/, "", val)

  # Split number and unit
  num = val
  gsub(/[a-z]+/, "", num)
  num = num + 0

  px = 0
  if (val ~ /rem/) {
    px = num * base
  } else if (val ~ /px/) {
    px = num
  } else if (val ~ /em/) {
    px = num * base
  }

  if (px == 0) next

  px_int = int(px + 0.5)

  # Determine threshold by selector
  threshold = 22
  category = "body"
  sl = tolower(sel)

  # Title/lead subtitle h2 serves as body text, not heading
  is_subtitle_h2 = (sl ~ /\.title[ \t]+h2/ || sl ~ /\.lead[ \t]+h2/ || sl ~ /\.key-message[ \t]+h2/)
  if (sl ~ /h[1-4]/ && !is_subtitle_h2) {
    threshold = 34; category = "heading"
  } else if (is_subtitle_h2) {
    threshold = 22; category = "subtitle"
  } else if (sl ~ /::after/ || sl ~ /page-num/ || sl ~ /footnote/) {
    threshold = 14; category = "footnote"
  } else if (sl ~ /-label/ || sl ~ /-sub/ || sl ~ /-num[^a-z]/ || sl ~ /caption/ || sl ~ /section-num/ || sl ~ /-xs/) {
    threshold = 16; category = "label"
  }

  status = "ok"
  if (px_int < threshold) {
    status = "FAIL"
    violations++
  }

  printf "%-4s  %3dpx  (min %dpx %-9s)  %-35s  %s\n", status, px_int, threshold, category, sel, line
}

END {
  print "---"
  printf "Base rem anchor: %dpx\n", base
  if (violations == 0) {
    print "PASS: All font-size declarations meet design-guideline thresholds"
    exit 0
  } else {
    printf "FAIL: %d violation(s) found\n", violations
    exit 1
  }
}
' > "$tmpout" 2>&1 || true
awk_exit=${PIPESTATUS[1]:-$?}

cat "$tmpout"

# Determine exit from output content (more reliable than pipe exit codes)
grep -q "^FAIL:" "$tmpout" && exit 1
grep -q "^PASS:" "$tmpout" && exit 0
# Neither PASS nor FAIL found — script error
exit 2
