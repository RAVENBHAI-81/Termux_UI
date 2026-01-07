#!/bin/bash
# A high-tech looking network scan simulation
G='\033[0;32m'
R='\033[0;31m'
B='\033[0;34m'
Y='\033[1;33m'
NC='\033[0m'

echo -e "${B}[!] ZERO-CORE SHIELD INITIALIZED...${NC}"
sleep 1
echo -e "${Y}[*] SCANNING RANGE: 192.168.1.0/24...${NC}"
sleep 1.5

while true; do
    IP="192.168.1.$((RANDOM % 254))"
    PORT=$((RANDOM % 65535))
    
    # Randomly show a "Vulnerability Found" for drama
    if [ $((RANDOM % 15)) -eq 0 ]; then
        echo -e "${R}[CRITICAL] $IP:$PORT -> EXPLOITABLE: CVE-2024-X991${NC}"
        echo -e "${Y}  [>] FETCHING METADATA... SUCCESS${NC}"
    elif [ $((RANDOM % 5)) -eq 0 ]; then
        echo -e "${G}[OPEN] $IP:$PORT (Service: Stealth-Node)${NC}"
    else
        echo -e "Scanning $IP:$PORT..."
    fi
    
    # Speed of the "scan"
    sleep 0.1
done
