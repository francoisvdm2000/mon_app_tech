import 'dart:typed_data';

import 'rdm_uid.dart';

/// Classes de commande RDM (ANSI E1.20 §6.2.10).
class RdmCommandClass {
  static const int discoveryCommand = 0x10;
  static const int discoveryCommandResponse = 0x11;
  static const int getCommand = 0x20;
  static const int getCommandResponse = 0x21;
  static const int setCommand = 0x30;
  static const int setCommandResponse = 0x31;
}

/// Valeurs du champ "Port ID / Response Type" côté réponse (ANSI E1.20).
class RdmResponseType {
  static const int ack = 0x00;
  static const int ackTimer = 0x01;
  static const int nackReason = 0x02;
  static const int ackOverflow = 0x03;
}

/// PIDs standards RDM couverts par cet outil — le strict nécessaire pour
/// lire/modifier une fixture : adresse DMX, personality (mode), libellé,
/// identify. Les PIDs propriétaires par fabricant ne sont pas couverts (ce
/// serait un chantier à part, lié au catalogue GDTF).
class RdmPid {
  static const int discUniqueBranch = 0x0001;
  static const int supportedParameters = 0x0050;
  static const int deviceInfo = 0x0060;
  static const int manufacturerLabel = 0x0081;
  static const int deviceLabel = 0x0082;
  static const int softwareVersionLabel = 0x00C0;
  static const int dmxPersonality = 0x00E0;
  static const int dmxStartAddress = 0x00F0;
  static const int identifyDevice = 0x1000;
}

/// Un message RDM (ANSI E1.20 §6.2).
///
/// Encodage vérifié contre l'implémentation de référence OLA
/// (OpenLightingProject) : le "RDM Data" transporté par un paquet Art-Net
/// ArtRdm ne contient PAS le Start Code RDM (0xCC) — celui-ci est implicite
/// (le paquet Art-Net ArtRdm signale déjà "ceci est du RDM"). Les octets
/// commencent directement au Sub-Start-Code (0x01). Le champ Message Length
/// compte néanmoins ce Start Code fantôme (valeur = 24 + PDL), et le
/// checksum est initialisé à 0xCC avant de sommer les octets réellement
/// transmis (Sub-Start-Code → fin des données paramètre).
class RdmMessage {
  final RdmUid destUid;
  final RdmUid sourceUid;
  final int transactionNumber;
  final int portIdOrResponseType;
  final int messageCount;
  final int subDevice;
  final int commandClass;
  final int pid;
  final List<int> data;

  const RdmMessage({
    required this.destUid,
    required this.sourceUid,
    required this.transactionNumber,
    required this.portIdOrResponseType,
    required this.messageCount,
    required this.subDevice,
    required this.commandClass,
    required this.pid,
    required this.data,
  });

  /// Encode le message tel qu'il doit être placé dans le champ "RDM Data"
  /// d'un paquet ArtRdm (donc SANS le Start Code 0xCC).
  Uint8List encode() {
    final pdl = data.length;
    final messageLength = 24 + pdl; // inclut le Start Code fantôme

    final body = BytesBuilder();
    body.addByte(0x01); // SUB_START_CODE
    body.addByte(messageLength & 0xFF);
    body.add(destUid.toBytes());
    body.add(sourceUid.toBytes());
    body.addByte(transactionNumber & 0xFF);
    body.addByte(portIdOrResponseType & 0xFF);
    body.addByte(messageCount & 0xFF);
    body.addByte((subDevice >> 8) & 0xFF);
    body.addByte(subDevice & 0xFF);
    body.addByte(commandClass & 0xFF);
    body.addByte((pid >> 8) & 0xFF);
    body.addByte(pid & 0xFF);
    body.addByte(pdl & 0xFF);
    body.add(data);

    final bodyBytes = body.toBytes(); // 23 + pdl octets, Sub-Start-Code inclus

    int checksum = 0xCC; // Start Code RDM : jamais transmis, mais compté
    for (final b in bodyBytes) {
      checksum += b;
    }
    checksum &= 0xFFFF;

    final out = BytesBuilder();
    out.add(bodyBytes);
    out.addByte((checksum >> 8) & 0xFF);
    out.addByte(checksum & 0xFF);
    return out.toBytes();
  }

  /// Décode un message RDM reçu dans le champ "RDM Data" d'un ArtRdm (donc
  /// à partir du Sub-Start-Code, sans Start Code 0xCC). Retourne null si la
  /// trame est trop courte, mal formée, ou si le checksum ne correspond pas.
  static RdmMessage? decode(List<int> bytes) {
    if (bytes.length < 25) return null; // 23 (header) + 0 (pdl min) + 2 (checksum)
    if (bytes[0] != 0x01) return null; // SUB_START_CODE

    final messageLength = bytes[1]; // = 24 + pdl
    final actualLength = messageLength - 1; // = 23 + pdl, octets avant checksum
    if (actualLength < 23 || bytes.length < actualLength + 2) return null;

    int sum = 0xCC;
    for (var i = 0; i < actualLength; i++) {
      sum += bytes[i];
    }
    sum &= 0xFFFF;
    final checksum = (bytes[actualLength] << 8) | bytes[actualLength + 1];
    if (sum != checksum) return null;

    final destUid = RdmUid.fromBytes(bytes, 2);
    final sourceUid = RdmUid.fromBytes(bytes, 8);
    final transactionNumber = bytes[14];
    final portIdOrResponseType = bytes[15];
    final messageCount = bytes[16];
    final subDevice = (bytes[17] << 8) | bytes[18];
    final commandClass = bytes[19];
    final pid = (bytes[20] << 8) | bytes[21];
    final pdl = bytes[22];
    if (23 + pdl > actualLength) return null;
    final data = bytes.sublist(23, 23 + pdl);

    return RdmMessage(
      destUid: destUid,
      sourceUid: sourceUid,
      transactionNumber: transactionNumber,
      portIdOrResponseType: portIdOrResponseType,
      messageCount: messageCount,
      subDevice: subDevice,
      commandClass: commandClass,
      pid: pid,
      data: data,
    );
  }
}

/// Contenu décodé d'une réponse GET DEVICE_INFO (PID 0x0060, 19 octets,
/// ANSI E1.20 §10.5.1) — donne en un seul GET l'essentiel : empreinte DMX,
/// adresse de départ, personality courante/nombre.
class RdmDeviceInfo {
  final int dmxFootprint;
  final int personalityCurrent;
  final int personalityCount;
  final int dmxStartAddress;
  final int subDeviceCount;
  final int sensorCount;

  const RdmDeviceInfo({
    required this.dmxFootprint,
    required this.personalityCurrent,
    required this.personalityCount,
    required this.dmxStartAddress,
    required this.subDeviceCount,
    required this.sensorCount,
  });

  static RdmDeviceInfo? parse(List<int> data) {
    if (data.length < 19) return null;
    return RdmDeviceInfo(
      dmxFootprint: (data[10] << 8) | data[11],
      personalityCurrent: data[12],
      personalityCount: data[13],
      dmxStartAddress: (data[14] << 8) | data[15],
      subDeviceCount: (data[16] << 8) | data[17],
      sensorCount: data[18],
    );
  }
}

/// Décode un champ ASCII RDM (label fabricant/device/version) : les octets
/// ne sont pas forcément terminés par un null, et peuvent en contenir —
/// on nettoie les deux cas.
String decodeRdmAscii(List<int> data) {
  final withoutNulls = data.where((b) => b != 0).toList();
  return String.fromCharCodes(withoutNulls).trim();
}
