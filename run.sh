#!/bin/bash
# Run script for adventofcode2025 - builds and fixes macOS rpath issue

cd "$(dirname "$0")"

# Build first
./bin/alr build || exit 1

BIN="./bin/adventofcode2025"
RPATH="/Users/ganepomu/.local/share/alire/toolchains/gnat_native_14.2.1_cc5517d6/lib"

# Remove duplicate rpath if it exists
install_name_tool -delete_rpath "$RPATH" "$BIN" 2>/dev/null || true

# Run the program with all arguments
exec "$BIN" "$@"
