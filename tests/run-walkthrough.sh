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
CONFIG="$SCRIPT_DIR/project.conf"

# Platform-aware ifhub root
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    I7_ROOT="/c/code/ifhub"
else
    I7_ROOT="/mnt/c/code/ifhub"
fi

exec bash "$I7_ROOT/tools/testing/run-walkthrough.sh" --config "$CONFIG" "$@"
