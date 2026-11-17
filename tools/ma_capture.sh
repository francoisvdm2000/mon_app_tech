#!/bin/bash
# Capture du trafic MA / Art-Net / sACN / mDNS / SNMP pour analyse (ShowTech Tools).
# Usage : sudo bash tools/ma_capture.sh [interface]
# Résultat : tools/ma_capture/ (pcap + réponses SNMP)

cd "$(dirname "$0")" || exit 1
OUT="ma_capture"
mkdir -p "$OUT"
exec > >(tee "$OUT/log.txt") 2>&1
CONSOLE_IP="${CONSOLE_IP:-192.168.201.3}"

IFACE="$1"
if [ -z "$IFACE" ]; then
  echo "Interfaces avec une adresse IP :"
  for i in $(ifconfig -l); do
    ip=$(ipconfig getifaddr "$i" 2>/dev/null)
    [ -n "$ip" ] && [ "$i" != "lo0" ] && echo "  $i  $ip"
  done
  # On prend la première interface active qui n'est pas le Wi-Fi (en0 sur MacBook Air)
  for i in $(ifconfig -l); do
    ip=$(ipconfig getifaddr "$i" 2>/dev/null)
    if [ -n "$ip" ] && [ "$i" != "lo0" ] && [ "$i" != "en0" ]; then IFACE="$i"; break; fi
  done
  [ -z "$IFACE" ] && IFACE="en0"
fi
echo ">> Capture sur $IFACE ($(ipconfig getifaddr $IFACE)) pendant 60 s…"

tcpdump -ni "$IFACE" -w "$OUT/ma_capture.pcap" \
  'udp port 30020 or udp port 5353 or udp port 161 or udp port 6454 or udp port 5568 or ip multicast or igmp' &
PID=$!
sleep 1
# Rejoint les groupes multicast + envoie des ArtPoll (sinon le switch filtre tout)
python3 ma_listen.py "$(ipconfig getifaddr $IFACE)" 58 &
LPID=$!
sleep 5
echo ">> Groupes multicast actifs sur $IFACE :"
netstat -gn -f inet | grep -E "$IFACE|236\.4|239\.255" | head -30
echo ">> Ping console $CONSOLE_IP :"
ping -c 3 -t 3 "$CONSOLE_IP"
echo ">> ARP console :"
arp -n "$CONSOLE_IP"
echo ">> Web console :"
curl -s -m 3 "http://$CONSOLE_IP/" | head -c 600; echo
wait $LPID
kill $PID 2>/dev/null; wait $PID 2>/dev/null
ifconfig "$IFACE" > "$OUT/interface.txt"

echo ">> IP sources vues :"
tcpdump -nr "$OUT/ma_capture.pcap" 2>/dev/null | awk '{print $3}' | sed -E 's/\.[0-9]+:?$//' \
  | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$' | sort -u | tee "$OUT/ips.txt"

echo ">> Interrogation SNMP (sysDescr, sysName, sysObjectID)…"
: > "$OUT/snmp.txt"
echo "$CONSOLE_IP" >> "$OUT/ips.txt"
while read -r ip; do
  echo "== $ip" >> "$OUT/snmp.txt"
  snmpget -v2c -c public -t 1 -r 0 "$ip" \
    1.3.6.1.2.1.1.1.0 1.3.6.1.2.1.1.5.0 1.3.6.1.2.1.1.2.0 >> "$OUT/snmp.txt" 2>&1
done < "$OUT/ips.txt"

chmod -R a+r "$OUT"
echo ">> Terminé. Fichiers dans tools/$OUT/ — dis à Claude que c'est prêt."
