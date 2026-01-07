#!/bin/bash
# Minimal Binary Rain Effect
GREEN='\033[0;32m'
NC='\033[0m'
COLUMNS=$(tput cols)

clear
echo -e "${GREEN}--- ZERO SYSTEM OVERRIDE ---${NC}"
sleep 1

while true; do
    # Create a line of random 0s and 1s
    for i in $(seq 1 $COLUMNS); do
        if [ $((RANDOM % 5)) -eq 0 ]; then
            echo -ne "${GREEN}$((RANDOM % 2))${NC}"
        else
            echo -ne " "
        fi
    done
    echo "" # New line
    sleep 0.05
done
