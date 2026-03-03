#!/bin/bash
# Sample RegTest runner (wrapper)
# Delegates to the generic testing framework with sample-specific config.
#
# Usage:
#   wsl -e bash tests/run-tests.sh                    # run all tests
#   wsl -e bash tests/run-tests.sh -v                 # verbose (show transcripts)
#   wsl -e bash tests/run-tests.sh -l                 # list available tests
#   wsl -e bash tests/run-tests.sh smoke              # run only "smoke" test
#   wsl -e bash tests/run-tests.sh -v --vital smoke   # verbose, stop on first error

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
I7_ROOT="/mnt/c/code/ifhub"
CONFIG="$SCRIPT_DIR/project.conf"

exec bash "$I7_ROOT/tools/testing/run-tests.sh" --config "$CONFIG" "$@"
