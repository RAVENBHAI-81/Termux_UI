#!/bin/bash

echo -e "\e[1;36m[ RX ] Quick system check...\e[0m"

# ----------------------------
# SAFE CACHE CLEAN
# ----------------------------
find ~/.cache -type f -mtime +2 -delete 2>/dev/null
find ~/.cache -type d -empty -delete 2>/dev/null

echo -e "\e[1;32m[ OK ] Cache cleaned.\e[0m"

# ----------------------------
# LIGHT SECURITY SCAN
# (Only scripts, not whole HOME)
# ----------------------------
echo -e "\e[1;33m[ SCAN ] Checking scripts...\e[0m"

SCAN_DIRS=(
    "$HOME"
    "$HOME/bin"
    "$HOME/scripts"
)

PATTERNS=(
    "rm -rf /"
    "dd if="
    "mkfs"
    "curl .* sh"
    "wget .* sh"
)

THREATS=0

for dir in "${SCAN_DIRS[@]}"; do
    [ -d "$dir" ] || continue

    for p in "${PATTERNS[@]}"; do
        COUNT=$(grep -R "$p" "$dir" \
        --include="*.sh" \
        --exclude-dir={.git,node_modules} \
        2>/dev/null | wc -l)

        ((THREATS+=COUNT))
    done
done

if [ "$THREATS" -gt 0 ]; then
    echo -e "\e[1;31m[ WARNING ] $THREATS suspicious entries found!\e[0m"
else
    echo -e "\e[1;32m[ SAFE ] No threats found.\e[0m"
fi
