#!/bin/bash
# Sample walkthrough test runner (wrapper)
# Delegates to the generic testing framework with sample-specific config.
#
# Usage:
#   wsl -e bash tests/run-walkthrough.sh                  # Inform 7, golden seed
#   wsl -e bash tests/run-walkthrough.sh --seed 42        # Override seed
#   wsl -e bash tests/run-walkthrough.sh --no-seed        # True randomness
#   wsl -e bash tests/run-walkthrough.sh --diff           # Compare output vs saved baseline
#   wsl -e bash tests/run-walkthrough.sh --quiet          # Suppress diagnostic output, just exit code
#   wsl -e bash tests/run-walkthrough.sh --no-save        # Don't overwrite saved output file

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
INFORM7_ROOT="/mnt/c/code/i7/inform7"
CONFIG="$SCRIPT_DIR/project.conf"

exec bash "$INFORM7_ROOT/tools/testing/run-walkthrough.sh" --config "$CONFIG" "$@"
