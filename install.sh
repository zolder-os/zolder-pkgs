#!/usr/bin/env bash
set -euo pipefail

# Base URL for the ZolderOS package repo and signing key. v0 ships from the
# default GitHub Pages URL; once a custom domain is registered (zolderos.dev
# is not yet owned), flip this to the custom host.
BASE="${ZOLDER_REPO_BASE:-https://zolder-os.github.io/zolder-pkgs}"

CHANNEL="${1:-edge}"

if ! command -v pacman >/dev/null; then
  echo "ZolderOS requires Arch Linux (or derivative)." >&2
  exit 1
fi

# Trust the signing key
curl -fsSL "${BASE}/keys/release.asc" | sudo pacman-key --add -
sudo pacman-key --lsign-key __ZOLDER_KEY_ID__

# Add the repo
if ! grep -q "\[zolder-${CHANNEL}\]" /etc/pacman.conf; then
  echo "
[zolder-${CHANNEL}]
SigLevel = Required DatabaseRequired
Server = ${BASE}/${CHANNEL}/x86_64
" | sudo tee -a /etc/pacman.conf
fi

sudo pacman -Sy
echo "ZolderOS ${CHANNEL} channel added. Install with: sudo pacman -S zolder-core"
