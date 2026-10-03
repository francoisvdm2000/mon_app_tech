/// État d'un port d'un switch Luminex GigaCore.
class LuminexPort {
  final int portNr;
  final String? name;

  /// true = lié, false = hors ligne, null = inconnu (Gen1 sans endpoint link)
  final bool? linkUp;

  /// Vitesse en Mb/s (10, 100, 1000, 10000…), null si inconnu
  final int? speedMbps;

  /// true = full-duplex, false = half-duplex, null si inconnu
  final bool? fullDuplex;

  // ── PoE ────────────────────────────────────────────────────────────────────
  final bool poeSupported;
  final String? poeMode; // "auto", "force", "off", null
  final bool? poeActive;
  final bool? poeFault;

  // ── Compteurs trafic ───────────────────────────────────────────────────────
  final int rxErrors;
  final int txErrors;
  final int rxOctets;
  final int txOctets;

  const LuminexPort({
    required this.portNr,
    this.name,
    this.linkUp,
    this.speedMbps,
    this.fullDuplex,
    this.poeSupported = false,
    this.poeMode,
    this.poeActive,
    this.poeFault,
    this.rxErrors = 0,
    this.txErrors = 0,
    this.rxOctets = 0,
    this.txOctets = 0,
  });

  LuminexPort copyWith({
    String? name,
    bool? linkUp,
    int? speedMbps,
    bool? fullDuplex,
    bool? poeSupported,
    String? poeMode,
    bool? poeActive,
    bool? poeFault,
    int? rxErrors,
    int? txErrors,
    int? rxOctets,
    int? txOctets,
  }) {
    return LuminexPort(
      portNr: portNr,
      name: name ?? this.name,
      linkUp: linkUp ?? this.linkUp,
      speedMbps: speedMbps ?? this.speedMbps,
      fullDuplex: fullDuplex ?? this.fullDuplex,
      poeSupported: poeSupported ?? this.poeSupported,
      poeMode: poeMode ?? this.poeMode,
      poeActive: poeActive ?? this.poeActive,
      poeFault: poeFault ?? this.poeFault,
      rxErrors: rxErrors ?? this.rxErrors,
      txErrors: txErrors ?? this.txErrors,
      rxOctets: rxOctets ?? this.rxOctets,
      txOctets: txOctets ?? this.txOctets,
    );
  }
}
