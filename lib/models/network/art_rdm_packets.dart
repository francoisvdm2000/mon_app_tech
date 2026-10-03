import 'dart:typed_data';

import 'rdm_uid.dart';

/// Construction/parsing des paquets Art-Net qui transportent le RDM :
/// ArtTodRequest (0x8000), ArtTodData (0x8100), ArtRdm (0x8300).
///
/// Layouts vérifiés contre l'implémentation de référence OLA
/// (OpenLightingProject/ola, plugins/artnet/ArtNetPackets.h) plutôt que
/// reconstruits de mémoire — les décalages d'octets ici comptent vraiment,
/// une erreur ne fait pas planter l'app mais empêche silencieusement tout
/// dialogue avec du vrai matériel.

const List<int> _kArtNetHeader = [
  0x41, 0x72, 0x74, 0x2D, 0x4E, 0x65, 0x74, 0x00, // "Art-Net\0"
];

bool _hasArtNetHeader(List<int> data) {
  if (data.length < 10) return false;
  for (var i = 0; i < 8; i++) {
    if (data[i] != _kArtNetHeader[i]) return false;
  }
  return true;
}

int _opCode(List<int> data) => data[8] | (data[9] << 8);

/// ArtTodRequest (OpCode 0x8000) : demande à un node sa table des devices
/// RDM (Table Of Devices) pour un univers donné.
///
/// Champs après ID+OpCode : ProtVerHi(1) ProtVerLo(1) Filler1(1) Filler2(1)
/// Spare1..7(7) Net(1) Command(1) AddCount(1) Address[AddCount].
Uint8List buildArtTodRequest(int universe) {
  final net = (universe >> 8) & 0x7F;
  final subUni = universe & 0xFF;

  final p = BytesBuilder();
  p.add(_kArtNetHeader);
  p.add([0x00, 0x80]); // OpCode 0x8000, transmis low byte first
  p.add([0x00, 14]); // ProtVerHi, ProtVerLo
  p.add([0x00, 0x00]); // Filler1, Filler2
  p.add(List.filled(7, 0)); // Spare1..7
  p.addByte(net);
  p.addByte(0x00); // Command : TodFull (demande complète)
  p.addByte(1); // AddCount
  p.addByte(subUni); // Address[0]

  return p.toBytes();
}

/// Table des UIDs renvoyée par un node dans un ArtTodData (OpCode 0x8100).
///
/// Champs après ID+OpCode : ProtVerHi(1) ProtVerLo(1) RdmVer(1) Port(1)
/// Spare1..7(7) Net(1) CommandResponse(1) Address(1) UidTotalHi(1)
/// UidTotalLo(1) BlockCount(1) UidCount(1) Tod[UidCount*6].
class ArtTodDataPacket {
  final int universe;
  final int physicalPort;
  final List<RdmUid> uids;

  const ArtTodDataPacket({
    required this.universe,
    required this.physicalPort,
    required this.uids,
  });

  static ArtTodDataPacket? parse(List<int> data) {
    if (!_hasArtNetHeader(data) || _opCode(data) != 0x8100) return null;
    if (data.length < 28) return null;

    final physicalPort = data[13];
    final net = data[21];
    final address = data[23];
    final universe = (net << 8) | address;
    final uidCount = data[27];

    final uids = <RdmUid>[];
    var offset = 28;
    for (var i = 0; i < uidCount && offset + 6 <= data.length; i++) {
      uids.add(RdmUid.fromBytes(data, offset));
      offset += 6;
    }

    return ArtTodDataPacket(universe: universe, physicalPort: physicalPort, uids: uids);
  }
}

/// Encapsule un message RDM déjà encodé (voir [RdmMessage.encode], sans le
/// Start Code 0xCC) dans un paquet ArtRdm (OpCode 0x8300), pour un univers
/// donné.
///
/// Champs après ID+OpCode : ProtVerHi(1) ProtVerLo(1) RdmVer(1) Filler2(1)
/// Spare1..7(7) Net(1) Command(1) Address(1) puis les données RDM.
Uint8List buildArtRdm(int universe, List<int> rdmMessageBytes) {
  final net = (universe >> 8) & 0x7F;
  final subUni = universe & 0xFF;

  final p = BytesBuilder();
  p.add(_kArtNetHeader);
  p.add([0x00, 0x83]); // OpCode 0x8300, transmis low byte first
  p.add([0x00, 14]); // ProtVerHi, ProtVerLo
  p.addByte(0x01); // RdmVer
  p.addByte(0x00); // Filler2
  p.add(List.filled(7, 0)); // Spare1..7
  p.addByte(net);
  p.addByte(0x00); // Command : Process RDM packet (seule valeur définie)
  p.addByte(subUni); // Address
  p.add(rdmMessageBytes);

  return p.toBytes();
}

/// Extrait le message RDM brut (sans Start Code, tel que produit par
/// [buildArtRdm]) d'un paquet ArtRdm reçu (OpCode 0x8300), avec son univers.
/// Retourne null si ce n'est pas un ArtRdm valide.
class ParsedArtRdm {
  final int universe;
  final List<int> rdmData;

  const ParsedArtRdm({required this.universe, required this.rdmData});
}

ParsedArtRdm? parseArtRdm(List<int> data) {
  if (!_hasArtNetHeader(data) || _opCode(data) != 0x8300) return null;
  if (data.length <= 24) return null;

  final net = data[21];
  final address = data[23];
  final universe = (net << 8) | address;

  return ParsedArtRdm(universe: universe, rdmData: data.sublist(24));
}
