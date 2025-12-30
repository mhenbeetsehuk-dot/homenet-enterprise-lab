#!/bin/bash

OUT="docs/system-info.md"

mkdir -p docs

{
echo "# System Information"
echo
echo "**OS Version:**"
lsb_release -d 2>/dev/null || cat /etc/os-release | grep PRETTY_NAME
echo
echo "**IP Address(es):**"
ip -4 addr | grep inet | grep -v 127
echo
echo "**Hostname:**"
hostname
echo
echo "**Domain / Realm:**"
realm list 2>/dev/null || echo "Not domain joined"
echo
echo "**DNS Backend:**"
resolvectl status 2>/dev/null | grep -E "DNS Servers|Current DNS Server"
echo
echo "**Date Completed:**"
date +"%Y-%m-%d %H:%M:%S"
} > "$OUT"

echo "System information written to $OUT"
