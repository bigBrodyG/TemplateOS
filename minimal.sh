#!/usr/bin/env bash
set -euo pipefail

# Minimal bootstrap script. Installs a tiny toolset, asks whether to request
# the full environment, and finally cleans the repository so that only README.md remains.

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { printf "${GREEN}[✓]${NC} %s\n" "$1"; }
warn()  { printf "${YELLOW}[!]${NC} %s\n" "$1"; }

echo "================================================"
echo "TemplateOS Minimal Bootstrap"
echo "================================================"

echo "[1/3] Updating package index..."
sudo apt-get update -qq
info "apt index updated."

echo "[2/3] Installing essentials (git, curl, python3, pip)..."
sudo apt-get install -y -qq git curl python3 python3-pip
info "Essentials installed."

echo "[3/3] Installing minimal Python tooling (pwntools)..."
python3 -m pip install --user --quiet pwntools
info "Minimal Python tooling ready."

echo ""
read -r -p "Serve la versione completa con tutti i tool di cybersecurity? [y/N] " answer
if [[ "${answer:-}" =~ ^[Yy]$ ]]; then
  warn "La versione full non è inclusa in questo pacchetto minimale."
  echo "Chiedi al maintainer o recupera il profilo avanzato dal repository dedicato."
else
  info "Versione completa non richiesta. Puoi sempre chiederla in seguito."
fi

echo ""
echo "Pulizia della repository (verrà conservato solo README.md)..."
find "${REPO_ROOT}" -mindepth 1 \
  -not -path "${REPO_ROOT}/.git" \
  -not -path "${REPO_ROOT}/.git/*" \
  -not -name "README.md" \
  -exec rm -rf {} + 2>/dev/null || warn "Alcuni file potrebbero già essere stati rimossi."

info "Pulizia completata. Rimane solo README.md nella radice del repository."
echo "Script terminato."
echo "================================================"
