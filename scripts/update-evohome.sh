#!/usr/bin/env bash
set -euo pipefail

HERE="$(dirname "$(readlink -f "$0")")"
TMP="/tmp/update-evohome"
RAW="https://raw.githubusercontent.com/home-assistant/core/master/homeassistant/components/evohome"

mkdir -p "$TMP"
cd "$TMP"

echo "Downloading evohome.py and const.py..."
curl -s -O "$RAW/evohome.py"
curl -s -O "$RAW/const.py"

echo "Extracting old enums..."
grep -E "HVAC_MODE|PRESET_" "$HERE/evohome_old.py" > old_values.txt || true

echo "Extracting new enums..."
grep -E "HVAC_MODE|PRESET_" evohome.py > new_values.txt || true

echo "--- Diff ---"
diff -u old_values.txt new_values.txt || true

echo "--- Done ---"