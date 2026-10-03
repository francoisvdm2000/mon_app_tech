import 'dart:convert';

/// Paquet sACN / E1.31 parsé depuis un datagramme UDP.
class SacnPacket {
  final int universe; // 1-63999
  final int priority; // 0-200
  final String sourceName;
  final String cid; // 16 bytes en hex
  final int sequence;
  final List<int> dmxData; // Toujours 512 valeurs
  final String sourceIp;
  final DateTime receivedAt;

  const SacnPacket({
    required this.universe,
    required this.priority,
    required this.sourceName,
    required this.cid,
    required this.sequence,
    required this.dmxData,
    required this.sourceIp,
    required this.receivedAt,
  });

  /// Parse un datagramme UDP E1.31 brut. Retourne null si invalide.
  static SacnPacket? parse(List<int> data, String sourceIp) {
    // Taille minimale E1.31
    if (data.length < 126) return null;

    // ACN Packet Identifier (offset 4, 12 bytes) = "ASC-E1.17\0\0\0"
    const acnId = [
      0x41,
      0x53,
      0x43,
      0x2D,
      0x45,
      0x31,
      0x2E,
      0x31,
      0x37,
      0x00,
      0x00,
      0x00,
    ];
    for (int i = 0; i < 12; i++) {
      if (i + 4 >= data.length || data[4 + i] != acnId[i]) return null;
    }

    // Root Vector (offset 18, 4 bytes) = 0x00000004
    if (data.length < 22) return null;
    final rootVec =
        (data[18] << 24) | (data[19] << 16) | (data[20] << 8) | data[21];
    if (rootVec != 0x00000004) return null;

    // CID (offset 22, 16 bytes)
    if (data.length < 38) return null;
    final cidBytes = data.sublist(22, 38);
    final cid =
        cidBytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(':');

    // Framing Vector (offset 40, 4 bytes) = 0x00000002
    if (data.length < 44) return null;
    final framingVec =
        (data[40] << 24) | (data[41] << 16) | (data[42] << 8) | data[43];
    if (framingVec != 0x00000002) return null;

    // Source Name (offset 44, 64 bytes, null-terminated UTF-8)
    if (data.length < 108) return null;
    final nameBytes = data.sublist(44, 108);
    final nullIdx = nameBytes.indexOf(0);
    final sourceName = utf8
        .decode(
          nullIdx >= 0 ? nameBytes.sublist(0, nullIdx) : nameBytes,
          allowMalformed: true,
        )
        .trim();

    // Priority (offset 108), Sequence (offset 111)
    if (data.length < 115) return null;
    final priority = data[108];
    final sequence = data[111];

    // Universe (offset 113-114, big-endian)
    final universe = (data[113] << 8) | data[114];
    if (universe == 0) return null;

    // DMP layer
    if (data.length < 126) return null;
    if (data[117] != 0x02) return null; // DMP Vector
    if (data[118] != 0xA1) return null; // Address & Data Type

    // Property count (offset 123-124)
    final propCount = (data[123] << 8) | data[124];
    final dataStart = 126; // offset 125 = start code (0x00), data from 126
    final dataEnd = (dataStart + propCount - 1).clamp(dataStart, data.length);

    final raw = data.sublist(dataStart, dataEnd);
    final dmxData = List<int>.from(raw);
    while (dmxData.length < 512) {
      dmxData.add(0);
    }

    return SacnPacket(
      universe: universe,
      priority: priority,
      sourceName: sourceName,
      cid: cid,
      sequence: sequence,
      dmxData: dmxData,
      sourceIp: sourceIp,
      receivedAt: DateTime.now(),
    );
  }
}
