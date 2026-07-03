#!/bin/bash
# Build all 9 resume variants locally
# Requires pdflatex (MiKTeX or TeX Live)

set -e

ROOT=$(cd "$(dirname "$0")" && pwd)
BUILDS="$ROOT/builds"
mkdir -p "$BUILDS"

# slug -> tex filename (deterministic, no glob-parsing).
declare -A TEX=(
  [general]=resume.tex
  [devops]=resume-devops.tex
  [cloud]=resume-cloud.tex
  [mlops]=resume-mlops.tex
  [aiml]=resume-aiml.tex
  [sde]=resume-sde.tex
  [platform]=resume-platform.tex
  [ai-tools]=resume-ai-tools.tex
  [bigtech]=resume-bigtech.tex
)

FAILED=()

for slug in general devops cloud mlops aiml sde platform ai-tools bigtech; do
  dir="$ROOT/variants/$slug"
  tex="${TEX[$slug]}"
  name="${tex%.tex}"

  if [ ! -f "$dir/$tex" ]; then
    echo "SKIP: $dir/$tex not found"
    continue
  fi

  echo "Compiling $slug ($tex)..."
  cd "$dir"
  if pdflatex -interaction=nonstopmode "$tex" > /dev/null 2>&1; then
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
  echo "All ${#TEX[@]} variants compiled successfully."
else
  echo "FAILED variants: ${FAILED[*]}"
  exit 1
fi
