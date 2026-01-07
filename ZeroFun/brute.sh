#!/bin/bash
# A visual-only brute force simulator for demonstration
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}[+] INITIALIZING BRUTE FORCE ENGINE...${NC}"
sleep 1
echo -e "${GREEN}[+] TARGET: 192.168.1.105 (SECURE_VAULT)${NC}"
sleep 1
echo -e "${GREEN}[+] LOADING WORDLIST: /usr/share/wordlists/rockyou.txt${NC}"
sleep 2

while true; do
    # Generate a random 8-character string
    PASS=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 8)
    # 5% chance to show a "Partial Match" for effect
    if [ $((RANDOM % 20)) -eq 0 ]; then
        echo -e "${RED}[-] ATTEMPT: $PASS | STATUS: FAILED (HASH_MISMATCH)${NC}"
    else
        echo -e "ATTEMPTING: $PASS..."
    fi
    # Speed of the "guessing"
    sleep 0.05
done
