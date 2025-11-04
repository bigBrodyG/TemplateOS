#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ADVANCED="${SCRIPT_DIR}/setup-advanced.sh"
FALLBACK="${SCRIPT_DIR}/setup-fallback.sh"

echo "=============================================="
echo "Executing advanced setup (.devcontainer/setup-advanced.sh)"
echo "=============================================="
if bash "${ADVANCED}"; then
  echo "Advanced setup completed successfully."
  exit 0
fi

STATUS=$?
echo "----------------------------------------------"
echo "Advanced setup exited with status ${STATUS}."
echo "Falling back to legacy setup script."
echo "----------------------------------------------"

if [[ -x "${FALLBACK}" ]]; then
  bash "${FALLBACK}"
  exit $?
else
  echo "Fallback script ${FALLBACK} not found or not executable."
  exit ${STATUS}
fi

