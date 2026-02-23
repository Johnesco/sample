#!/bin/bash
# Sample seed sweep (wrapper)
# Delegates to the generic testing framework with sample-specific config.
#
# Usage:
#   wsl -e bash tests/find-seeds.sh                # default sweep
#   wsl -e bash tests/find-seeds.sh --max 500      # search range (default: 200)
#   wsl -e bash tests/find-seeds.sh --stop         # stop on first pass (default)
#   wsl -e bash tests/find-seeds.sh --no-stop      # continue sweep after finding pass

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
INFORM7_ROOT="/mnt/c/code/i7/inform7"
CONFIG="$SCRIPT_DIR/project.conf"

exec bash "$INFORM7_ROOT/tools/testing/find-seeds.sh" --config "$CONFIG" "$@"
