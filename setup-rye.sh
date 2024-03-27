#!/usr/bin/env bash

set -euxo pipefail

cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")"

TEMP_FILE=$(mktemp)

curl -fsSL "https://github.com/astral-sh/rye/releases/download/$RYE_VERSION/rye-x86_64-linux.gz" | gunzip > "$TEMP_FILE"
chmod +x "$TEMP_FILE"
"$TEMP_FILE" self install --yes

rm "$TEMP_FILE"

echo "$HOME/.rye/shims" >> "$GITHUB_PATH"
