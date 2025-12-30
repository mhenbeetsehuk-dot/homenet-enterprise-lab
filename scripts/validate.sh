#!/usr/bin/env bash
set -euo pipefail

echo "=== HOMENET CI: validations ==="

echo
echo "[1] Markdown files present?"
md_count=$(find docs -type f -name "*.md" | wc -l | tr -d ' ')
if [[ "$md_count" -lt 1 ]]; then
  echo "ERROR: No .md files found under docs/"
  exit 1
fi
echo "OK: Found $md_count Markdown file(s)"

echo
echo "[2] YAML parse check (configs/**/*.yml|yaml)"
python3 - <<'PY'
import glob, sys
import yaml
files = glob.glob("configs/**/*.yml", recursive=True) + glob.glob("configs/**/*.yaml", recursive=True)
if not files:
    print("WARNING: No YAML files found under configs/")
    sys.exit(0)
bad=[]
for f in files:
    try:
        with open(f, "r", encoding="utf-8") as fp:
            yaml.safe_load(fp)
    except Exception as e:
        bad.append((f, str(e)))
if bad:
    print("ERROR: YAML parse failures:")
    for f,e in bad:
        print(f" - {f}: {e}")
    sys.exit(1)
print(f"OK: YAML parsed successfully for {len(files)} file(s)")
PY

echo
echo "[3] Basic secret pattern scan (best-effort)"

# High-risk patterns only (avoid false positives like 'secrets.ldb' in documentation)
if grep -RInE "(bindpw|AKIA[0-9A-Z]{16}|BEGIN PRIVATE KEY)" . >/dev/null 2>&1; then
  echo "ERROR: High-risk secret material detected in repository."
  exit 1
fi

# Flag password assignments only in configs/ (not in docs/)
if grep -RInE --exclude="validate.sh" "(bindpw|AKIA[0-9A-Z]{16}|BEGIN PRIVATE KEY)" configs scripts .github 2>/dev/null; then

  echo "ERROR: 'password=' found in configs/. Replace with <REDACTED> or env vars."
  exit 1
fi

echo "OK: No high-risk secrets detected"

echo
echo "=== Validation complete ==="
