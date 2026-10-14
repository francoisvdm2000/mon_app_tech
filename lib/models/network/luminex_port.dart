/// État d'un port d'un switch Luminex GigaCore.
class LuminexPort {
  final int portNr;

  /// Légende du port saisie dans le switch (ex. « PU 1 »), null si vide.
  final String? name;

  /// true = lié, false = hors ligne, null = inconnu (Gen1 sans endpoint link)
  final bool? linkUp;

  /// Vitesse en Mb/s (10, 100, 1000, 10000…), null si inconnu
  final int? speedMbps;

  /// true = full-duplex, false = half-duplex, null si inconnu
  final bool? fullDuplex;

  /// true = cage SFP, false = RJ45 (ou inconnu)
  final bool isSfp;

  /// false = port désactivé dans la config du switch, null = inconnu.
  final bool? enabled;

  // ── Appartenance ───────────────────────────────────────────────────────────

  /// Groupe (VLAN) du port en mode accès, null si trunk ou inconnu.
  final int? groupId;

  /// Trunk (ISL) auquel appartient le port, null si port d'accès.
  final int? trunkId;

  // ── Voisin LLDP ────────────────────────────────────────────────────────────

  /// Nom annoncé par l'appareil branché (LLDP), null si inconnu.
  final String? neighborName;

  /// IP de management annoncée par l'appareil branché (LLDP).
  final String? neighborIp;

  // ── PoE ────────────────────────────────────────────────────────────────────
  final bool poeSupported;
  final String? poeMode; // "auto", "force", "off", null
  final bool? poeActive;
  final bool? poeFault;

  /// Puissance PoE délivrée en milliwatts, null si inconnue.
  final int? poePowerMw;

  // ── Compteurs trafic ───────────────────────────────────────────────────────

  /// Erreurs / rejets cumulés en réception (Gen2 : in_discards).
  final int rxErrors;

  /// Erreurs / rejets cumulés en émission (Gen2 : out_discards).
  final int txErrors;
  final int rxOctets;
  final int txOctets;

  /// Débit instantané reçu par le switch sur ce port, en bit/s.
  final int? rxBps;

  /// Débit instantané émis par le switch sur ce port, en bit/s.
  final int? txBps;

  const LuminexPort({
    required this.portNr,
    this.name,
    this.linkUp,
    this.speedMbps,
    this.fullDuplex,
    this.isSfp = false,
    this.enabled,
    this.groupId,
    this.trunkId,
    this.neighborName,
    this.neighborIp,
    this.poeSupported = false,
    this.poeMode,
    this.poeActive,
    this.poeFault,
    this.poePowerMw,
    this.rxErrors = 0,
    this.txErrors = 0,
    this.rxOctets = 0,
    this.txOctets = 0,
    this.rxBps,
    this.txBps,
  });

  bool get isTrunk => trunkId != null;

  LuminexPort copyWith({
    String? name,
    bool? linkUp,
    int? speedMbps,
    bool? fullDuplex,
    bool? isSfp,
    bool? enabled,
    int? groupId,
    int? trunkId,
    String? neighborName,
    String? neighborIp,
    bool? poeSupported,
    String? poeMode,
    bool? poeActive,
    bool? poeFault,
    int? poePowerMw,
    int? rxErrors,
    int? txErrors,
    int? rxOctets,
    int? txOctets,
    int? rxBps,
    int? txBps,
  }) {
    return LuminexPort(
      portNr: portNr,
      name: name ?? this.name,
      linkUp: linkUp ?? this.linkUp,
      speedMbps: speedMbps ?? this.speedMbps,
      fullDuplex: fullDuplex ?? this.fullDuplex,
      isSfp: isSfp ?? this.isSfp,
      enabled: enabled ?? this.enabled,
      groupId: groupId ?? this.groupId,
      trunkId: trunkId ?? this.trunkId,
      neighborName: neighborName ?? this.neighborName,
      neighborIp: neighborIp ?? this.neighborIp,
      poeSupported: poeSupported ?? this.poeSupported,
      poeMode: poeMode ?? this.poeMode,
      poeActive: poeActive ?? this.poeActive,
      poeFault: poeFault ?? this.poeFault,
      poePowerMw: poePowerMw ?? this.poePowerMw,
      rxErrors: rxErrors ?? this.rxErrors,
      txErrors: txErrors ?? this.txErrors,
      rxOctets: rxOctets ?? this.rxOctets,
      txOctets: txOctets ?? this.txOctets,
      rxBps: rxBps ?? this.rxBps,
      txBps: txBps ?? this.txBps,
    );
  }
}
