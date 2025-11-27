#!/bin/bash

# Simple Automated Nmap Scanner for your CyberSec-Lab
# Usage: ./nmap-scan.sh 192.168.1.1   or   ./nmap-scan.sh scanme.nmap.org

if [ -z "$1" ]; then
    echo "Usage: $0 <target>"
    echo "Example: $0 192.168.1.10"
    echo "Example: $0 scanme.nmap.org"
    exit 1
fi

TARGET=$1
DATE=$(date +%F_%H-%M)
OUTPUT="results/nmap_$TARGET_$DATE"

mkdir -p results

echo "Starting scan against $TARGET ..."
echo "Results will be saved in $OUTPUT"

nmap -sS -sV -O -p- -oN "$OUTPUT.txt" -oX "$OUTPUT.xml" "$TARGET"

echo ""
echo "Scan finished! Check the files in the results/ folder"
