# Rejoint les groupes multicast MA-Net3 / sACN et envoie des ArtPoll pendant la capture,
# pour que le switch (IGMP snooping) nous transmette le trafic.
import socket, struct, sys, time
iface_ip = sys.argv[1]; duration = int(sys.argv[2])
groups = ['236.4.1.0', '239.4.1.0', '239.255.250.214'] + [f'239.255.0.{u}' for u in range(1, 21)]
socks = []
for port, grps in ((30020, groups[:2]), (5568, groups[2:])):
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    try: s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
    except Exception: pass
    s.bind(('', port))
    for g in grps:
        try:
            s.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP,
                         socket.inet_aton(g) + socket.inet_aton(iface_ip))
            print('join OK', g)
        except OSError as e:
            print('join ERREUR', g, e)
    socks.append(s)
print('Groupes multicast demandés sur', iface_ip, '-', sum(1 for _ in socks), 'sockets')
a = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
a.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
a.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
try: a.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
except Exception: pass
a.bind((iface_ip, 0))
artpoll = b'Art-Net\x00' + struct.pack('<H', 0x2000) + struct.pack('>H', 14) + b'\x06\x00'
end = time.time() + duration
while time.time() < end:
    for dst in ('255.255.255.255', '2.255.255.255', '10.255.255.255'):
        try: a.sendto(artpoll, (dst, 6454))
        except OSError: pass
    time.sleep(3)
