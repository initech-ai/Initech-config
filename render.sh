#!/usr/bin/env bash
set -euo pipefail

BRANCH=${1:-$(git rev-parse --abbrev-ref HEAD)}
APPS_DIR="apps"
OUTPUT_DIR="apps-rendered"

echo "Rendering manifests for branch: $BRANCH"

if [ ! -d "$APPS_DIR" ]; then
  echo "Error: $APPS_DIR directory not found"
  exit 1
fi

for template in "$APPS_DIR/templates"/*.yaml; do
  service=$(basename "$template")
  helm template apps "$APPS_DIR" \
    --set branch="$BRANCH" \
    --show-only "templates/$service" \
    > "$OUTPUT_DIR/$service"
done
