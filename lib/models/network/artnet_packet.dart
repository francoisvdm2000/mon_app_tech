/// Paquet Art-Net ArtDMX parsé depuis un datagramme UDP.
class ArtNetPacket {
  final int universe; // 0-32767  (Net << 8 | SubUni)
  final int sequence;
  final List<int> dmxData; // Toujours 512 valeurs
  final String sourceIp;
  final DateTime receivedAt;

  const ArtNetPacket({
    required this.universe,
    required this.sequence,
    required this.dmxData,
    required this.sourceIp,
    required this.receivedAt,
  });

  /// Parse un datagramme UDP brut. Retourne null si invalide ou pas ArtDMX.
  static ArtNetPacket? parse(List<int> data, String sourceIp) {
    // Minimum header : 18 bytes
    if (data.length < 18) return null;

    // "Art-Net\0" (8 bytes)
    const header = [0x41, 0x72, 0x74, 0x2D, 0x4E, 0x65, 0x74, 0x00];
    for (int i = 0; i < 8; i++) {
      if (data[i] != header[i]) return null;
    }

    // OpCode 0x5000 = ArtDMX (little-endian)
    final opCode = data[8] | (data[9] << 8);
    if (opCode != 0x5000) return null;

    // Sequence (offset 12), SubUni (offset 14), Net (offset 15)
    final sequence = data[12];
    final subUni = data[14];
    final net = data[15] & 0x7F;
    final universe = (net << 8) | subUni;

    // Length (offset 16-17, big-endian)
    final length = (data[16] << 8) | data[17];
    if (data.length < 18 + length) return null;

    final raw = data.sublist(18, 18 + length);
    final dmxData = List<int>.from(raw);
    while (dmxData.length < 512) {
      dmxData.add(0);
    }

    return ArtNetPacket(
      universe: universe,
      sequence: sequence,
      dmxData: dmxData,
      sourceIp: sourceIp,
      receivedAt: DateTime.now(),
    );
  }
}
