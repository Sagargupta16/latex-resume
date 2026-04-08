#!/bin/bash
# Build all 8 resume variants locally
# Requires pdflatex (MiKTeX or TeX Live)

set -e

ROOT=$(cd "$(dirname "$0")" && pwd)
BUILDS="$ROOT/builds"
mkdir -p "$BUILDS"

VARIANTS=(general devops cloud mlops aiml sde platform ai-tools)
FAILED=()

for slug in "${VARIANTS[@]}"; do
  dir="$ROOT/variants/$slug"
  tex=$(ls "$dir"/resume*.tex 2>/dev/null | head -1)
  if [ -z "$tex" ]; then
    echo "SKIP: No .tex file found in $dir"
    continue
  fi

  name=$(basename "$tex" .tex)
  echo "Compiling $slug ($name.tex)..."

  cd "$dir"
  if pdflatex -interaction=nonstopmode "$name.tex" > /dev/null 2>&1; then
    if [ "$slug" = "general" ]; then
      cp "$name.pdf" "$ROOT/resume.pdf"
      echo "  -> resume.pdf (root)"
    else
      cp "$name.pdf" "$BUILDS/$name.pdf"
      echo "  -> builds/$name.pdf"
    fi
  else
    echo "  FAILED: $slug"
    FAILED+=("$slug")
  fi
  cd "$ROOT"
done

echo ""
if [ ${#FAILED[@]} -eq 0 ]; then
  echo "All ${#VARIANTS[@]} variants compiled successfully."
else
  echo "FAILED variants: ${FAILED[*]}"
  exit 1
fi
