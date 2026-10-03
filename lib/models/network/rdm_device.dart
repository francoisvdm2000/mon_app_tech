import 'package:flutter/foundation.dart';

import 'rdm_uid.dart';

/// Une fixture RDM découverte sur le réseau (via ArtTod), avec ses
/// paramètres lus/modifiables via GET/SET RDM.
@immutable
class RdmDevice {
  final RdmUid uid;
  final int universe;

  final String? manufacturerLabel;
  final String? deviceLabel;
  final String? softwareVersionLabel;

  final int? dmxFootprint;
  final int? dmxStartAddress;
  final int? personalityCurrent;
  final int? personalityCount;
  final bool? identifyOn;

  /// true pendant qu'une requête GET de détails est en cours pour ce device.
  final bool isLoadingDetails;

  /// true pendant qu'un SET est en cours (désactive les actions concurrentes).
  final bool isApplyingChange;

  final String? error;
  final DateTime lastSeen;

  const RdmDevice({
    required this.uid,
    required this.universe,
    this.manufacturerLabel,
    this.deviceLabel,
    this.softwareVersionLabel,
    this.dmxFootprint,
    this.dmxStartAddress,
    this.personalityCurrent,
    this.personalityCount,
    this.identifyOn,
    this.isLoadingDetails = false,
    this.isApplyingChange = false,
    this.error,
    required this.lastSeen,
  });

  RdmDevice copyWith({
    int? universe,
    String? manufacturerLabel,
    String? deviceLabel,
    String? softwareVersionLabel,
    int? dmxFootprint,
    int? dmxStartAddress,
    int? personalityCurrent,
    int? personalityCount,
    bool? identifyOn,
    bool? isLoadingDetails,
    bool? isApplyingChange,
    String? error,
    bool clearError = false,
    DateTime? lastSeen,
  }) {
    return RdmDevice(
      uid: uid,
      universe: universe ?? this.universe,
      manufacturerLabel: manufacturerLabel ?? this.manufacturerLabel,
      deviceLabel: deviceLabel ?? this.deviceLabel,
      softwareVersionLabel: softwareVersionLabel ?? this.softwareVersionLabel,
      dmxFootprint: dmxFootprint ?? this.dmxFootprint,
      dmxStartAddress: dmxStartAddress ?? this.dmxStartAddress,
      personalityCurrent: personalityCurrent ?? this.personalityCurrent,
      personalityCount: personalityCount ?? this.personalityCount,
      identifyOn: identifyOn ?? this.identifyOn,
      isLoadingDetails: isLoadingDetails ?? this.isLoadingDetails,
      isApplyingChange: isApplyingChange ?? this.isApplyingChange,
      error: clearError ? null : (error ?? this.error),
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }
}
