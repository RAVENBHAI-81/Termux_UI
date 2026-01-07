#!/bin/bash
# Simulates decrypting a secret message
GREEN='\033[0;32m'
NC='\033[0m'
MESSAGE="ACCESS_GRANTED_PROJECT_ZERO_X9"
CHARS="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*"

echo -e "${GREEN}[!] INTERCEPTING ENCRYPTED PACKET...${NC}"
sleep 1.5
echo -n "DECRYPTING: "

for (( i=0; i<${#MESSAGE}; i++ )); do
    for (( j=0; j<10; j++ )); do
        # Print a random character
        echo -ne "${CHARS:$((RANDOM % ${#CHARS})):1}"
        sleep 0.02
        echo -ne "\b" # Move cursor back
    done
    echo -ne "${MESSAGE:$i:1}" # Print the correct character
done
echo -e "\n${GREEN}[+] DECRYPTION COMPLETE.${NC}"
