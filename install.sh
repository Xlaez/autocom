#!/usr/bin/env bash

set -euo pipefail

TARGET_DIR="${HOME}/.local/bin"
TARGET="${TARGET_DIR}/autocom"

mkdir -p "$TARGET_DIR"
cp "$(cd "$(dirname "$0")" && pwd)/ac" "$TARGET"
chmod +x "$TARGET"

echo "Installed: $TARGET"
echo "Ensure ${TARGET_DIR} is in your PATH."
