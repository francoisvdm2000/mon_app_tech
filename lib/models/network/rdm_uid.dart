/// UID RDM (ANSI E1.20) : 2 octets d'ID fabricant + 4 octets d'ID device.
/// Représentation textuelle standard : "7A70:00000001".
class RdmUid {
  final int manufacturerId; // 16 bits
  final int deviceId; // 32 bits

  const RdmUid({required this.manufacturerId, required this.deviceId});

  /// UID "broadcast tous fabricants, tous devices" (utilisé pour adresser
  /// tous les responders, ex. lors d'un DISC_UNIQUE_BRANCH — non utilisé
  /// directement ici car la découverte passe par ArtTod, mais utile en
  /// référence).
  static const RdmUid broadcastAll =
      RdmUid(manufacturerId: 0xFFFF, deviceId: 0xFFFFFFFF);

  /// UID "contrôleur" de cette app, dans la plage ESTA réservée au
  /// prototypage / usage interne (0x7FF0–0x7FFF) : cette app n'agit jamais
  /// comme responder RDM, seulement comme contrôleur qui envoie des GET/SET,
  /// donc un UID informel suffit (pas besoin d'un ID fabricant ESTA officiel).
  static const RdmUid controller =
      RdmUid(manufacturerId: 0x7FF0, deviceId: 0x00000001);

  factory RdmUid.fromBytes(List<int> bytes, int offset) {
    final manufacturerId = (bytes[offset] << 8) | bytes[offset + 1];
    final deviceId = (bytes[offset + 2] << 24) |
        (bytes[offset + 3] << 16) |
        (bytes[offset + 4] << 8) |
        bytes[offset + 5];
    return RdmUid(manufacturerId: manufacturerId, deviceId: deviceId);
  }

  List<int> toBytes() => [
        (manufacturerId >> 8) & 0xFF,
        manufacturerId & 0xFF,
        (deviceId >> 24) & 0xFF,
        (deviceId >> 16) & 0xFF,
        (deviceId >> 8) & 0xFF,
        deviceId & 0xFF,
      ];

  String get label =>
      '${manufacturerId.toRadixString(16).padLeft(4, '0').toUpperCase()}:'
      '${deviceId.toRadixString(16).padLeft(8, '0').toUpperCase()}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RdmUid &&
          other.manufacturerId == manufacturerId &&
          other.deviceId == deviceId);

  @override
  int get hashCode => Object.hash(manufacturerId, deviceId);

  @override
  String toString() => label;
}
