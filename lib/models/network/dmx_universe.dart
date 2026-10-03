/// État courant d'un univers DMX reçu (Art-Net ou sACN).
class DmxUniverse {
  final int universe;
  final List<int> channels; // 512 valeurs 0-255
  final String sourceIp;
  final int packetCount;
  final double fps;
  final DateTime lastUpdate;

  // Champs sACN uniquement (null pour Art-Net)
  final String? sourceName;
  final int? priority;
  final String? cid;

  const DmxUniverse({
    required this.universe,
    required this.channels,
    required this.sourceIp,
    required this.packetCount,
    required this.fps,
    required this.lastUpdate,
    this.sourceName,
    this.priority,
    this.cid,
  });

  /// Nombre de canaux avec une valeur > 0.
  int get activeChannels => channels.where((v) => v > 0).length;

  Map<String, dynamic> toJson() => {
        'universe': universe,
        'channels': channels,
        'sourceIp': sourceIp,
        'packetCount': packetCount,
        'fps': fps,
        'lastUpdate': lastUpdate.toIso8601String(),
        'sourceName': sourceName,
        'priority': priority,
        'cid': cid,
      };

  factory DmxUniverse.fromJson(Map<String, dynamic> json) => DmxUniverse(
        universe: json['universe'] as int,
        channels: List<int>.from(json['channels'] as List),
        sourceIp: json['sourceIp'] as String,
        packetCount: json['packetCount'] as int,
        fps: (json['fps'] as num).toDouble(),
        lastUpdate: DateTime.parse(json['lastUpdate'] as String),
        sourceName: json['sourceName'] as String?,
        priority: json['priority'] as int?,
        cid: json['cid'] as String?,
      );

  DmxUniverse copyWith({
    List<int>? channels,
    String? sourceIp,
    int? packetCount,
    double? fps,
    DateTime? lastUpdate,
    String? sourceName,
    int? priority,
    String? cid,
  }) {
    return DmxUniverse(
      universe: universe,
      channels: channels ?? List<int>.from(this.channels),
      sourceIp: sourceIp ?? this.sourceIp,
      packetCount: packetCount ?? this.packetCount,
      fps: fps ?? this.fps,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      sourceName: sourceName ?? this.sourceName,
      priority: priority ?? this.priority,
      cid: cid ?? this.cid,
    );
  }
}
