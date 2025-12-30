#!/usr/bin/env bash
set -euo pipefail

SMB_CONF="configs/samba/smb.conf"

echo "=== Samba config validation ==="

if [[ ! -f "$SMB_CONF" ]]; then
  echo "ERROR: $SMB_CONF not found"
  exit 1
fi

echo "Running testparm against $SMB_CONF"
# -s: suppress prompts, -v: verbose (optional), --parameter-name not needed
testparm -s "$SMB_CONF" >/dev/null

echo "OK: Samba smb.conf passed testparm"
