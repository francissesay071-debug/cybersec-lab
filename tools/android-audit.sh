#!/bin/bash
echo "=== QUICK ANDROID SECURITY AUDIT by @francissesay071-debug ==="
read -p "Enter target phone IP (e.g. 192.168.1.105): " ip

echo ""
echo "Scanning $ip for dangerous open ports..."
nmap -Pn -p 5555,5037,5554,62001,8080,4444 --open "$ip"

echo ""
echo "Result:"
if nmap -Pn -p 5555 "$ip" | grep -q "5555/tcp open\|5555/tcp filtered"; then
    echo "⚠  WARNING: Port 5555 is open/filtered → FULL PHONE TAKEOVER POSSIBLE!"
    echo "   Fix: Settings → Developer options → Turn OFF Wireless debugging"
else
    echo "✅ Port 5555 closed → Safe from this attack"
fi
echo ""
echo "Audit complete — share this tool!"
