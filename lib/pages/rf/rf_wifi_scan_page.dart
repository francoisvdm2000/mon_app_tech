import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:wifi_scan/wifi_scan.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF9C27B0);

// ─── Helpers fréquence → canal ────────────────────────────────────────────────
int? _channelFromFreq(int freqMhz) {
  if (freqMhz == 2484) return 14;
  if (freqMhz >= 2412 && freqMhz <= 2472) return (freqMhz - 2407) ~/ 5;
  if (freqMhz >= 5160 && freqMhz <= 5885) return (freqMhz - 5000) ~/ 5;
  return null;
}

String _bandLabel(int freqMhz) {
  if (freqMhz < 3000) return '2.4 GHz';
  if (freqMhz < 6000) return '5 GHz';
  return '6 GHz';
}

Color _rssiColor(int rssi) {
  if (rssi >= -50) return Colors.greenAccent;
  if (rssi >= -65) return const Color(0xFF00E5FF);
  if (rssi >= -75) return Colors.orangeAccent;
  return Colors.redAccent;
}

String _rssiLabel(int rssi, AppLocalizations loc) {
  if (rssi >= -50) return loc.rfWifiRssiExcellent;
  if (rssi >= -65) return loc.rfWifiRssiBon;
  if (rssi >= -75) return loc.rfWifiRssiMoyen;
  return loc.rfWifiRssiFaible;
}

double _rssiBar(int rssi) => ((rssi + 100) / 65).clamp(0.0, 1.0);

// ─── Page ─────────────────────────────────────────────────────────────────────
class RfWifiScanPage extends StatefulWidget {
  const RfWifiScanPage({super.key});

  @override
  State<RfWifiScanPage> createState() => _RfWifiScanPageState();
}

class _RfWifiScanPageState extends State<RfWifiScanPage> {
  List<WiFiAccessPoint> _results = [];
  bool _scanning = false;
  String? _errorMsg;
  bool _grouped = true; // groupé par bande ou liste plate

  Future<void> _scan() async {
    setState(() {
      _scanning = true;
      _errorMsg = null;
    });

    try {
      // Vérifie si le scan est possible
      final canScan = await WiFiScan.instance.canStartScan(askPermissions: true);
      if (canScan != CanStartScan.yes) {
        if (!mounted) return;
        final loc = AppLocalizations.of(context);
        setState(() {
          _errorMsg = switch (canScan) {
            CanStartScan.noLocationPermissionRequired =>
              loc.rfWifiScanErrLocationRequired,
            CanStartScan.noLocationPermissionDenied =>
              loc.rfWifiScanErrLocationDenied,
            CanStartScan.noLocationServiceDisabled =>
              loc.rfWifiScanErrLocationDisabled,
            CanStartScan.notSupported =>
              loc.rfWifiScanErrNotSupported,
            CanStartScan.failed =>
              loc.rfWifiScanErrFailed,
            _ => loc.rfWifiScanErrDefault,
          };
          _scanning = false;
        });
        return;
      }

      await WiFiScan.instance.startScan();

      // Attendre que les résultats soient disponibles
      await Future.delayed(const Duration(seconds: 2));

      final canGet = await WiFiScan.instance.canGetScannedResults(askPermissions: true);
      if (canGet != CanGetScannedResults.yes) {
        if (!mounted) return;
        setState(() {
          _errorMsg = AppLocalizations.of(context).rfWifiScanErrReadResults;
          _scanning = false;
        });
        return;
      }

      final aps = await WiFiScan.instance.getScannedResults();
      // Trier par RSSI décroissant
      aps.sort((a, b) => b.level.compareTo(a.level));
      setState(() {
        _results = aps;
        _scanning = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMsg = AppLocalizations.of(context).rfWifiScanErrGeneric(e.toString());
        _scanning = false;
      });
    }
  }

  // Occupation des canaux 2.4 GHz (nombre de réseaux par canal)
  Map<int, List<WiFiAccessPoint>> _channelOccupation24() {
    final map = <int, List<WiFiAccessPoint>>{};
    for (final ap in _results) {
      if (ap.frequency < 3000) {
        final ch = _channelFromFreq(ap.frequency);
        if (ch != null) {
          map.putIfAbsent(ch, () => []).add(ap);
        }
      }
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final occupation24 = _channelOccupation24();
    final nets24 = _results.where((a) => a.frequency < 3000).length;
    final nets5 = _results.where((a) => a.frequency >= 3000).length;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.rfWifiScanTitle,
            style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: [
          const AboutPinButton(pageId: 'tool:rf_wifi_scan', sectionId: 'main'),
          if (_results.isNotEmpty)
            IconButton(
              icon: Icon(
                _grouped ? Icons.list_rounded : Icons.grid_view_rounded,
                color: _kAccent,
              ),
              tooltip: _grouped ? loc.rfWifiScanGroupedTooltip : loc.rfWifiScanFlatTooltip,
              onPressed: () => setState(() => _grouped = !_grouped),
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 24 + bottom),
          children: [
            // ── Info plateforme ───────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orangeAccent.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Colors.orangeAccent.withValues(alpha: 0.25)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline_rounded,
                      color: Colors.orangeAccent.withValues(alpha: 0.80),
                      size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      loc.rfWifiScanPlatformInfo,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.60),
                          height: 1.35),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Bouton scan ───────────────────────────────────────────────────
            GestureDetector(
              onTap: _scanning ? null : _scan,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 52,
                decoration: BoxDecoration(
                  color: _scanning
                      ? _kAccent.withValues(alpha: 0.08)
                      : _kAccent.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: _kAccent.withValues(alpha: _scanning ? 0.20 : 0.50),
                      width: 1.5),
                ),
                alignment: Alignment.center,
                child: _scanning
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: _kAccent.withValues(alpha: 0.70),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(loc.rfWifiScanInProgress,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: _kAccent.withValues(alpha: 0.70))),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wifi_find_rounded,
                              color: _kAccent, size: 22),
                          const SizedBox(width: 10),
                          Text(loc.rfWifiScanStart,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: _kAccent)),
                        ],
                      ),
              ),
            ),

            // ── Erreur ────────────────────────────────────────────────────────
            if (_errorMsg != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Colors.redAccent.withValues(alpha: 0.30)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline_rounded,
                        color: Colors.redAccent, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(_errorMsg!,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withValues(alpha: 0.70))),
                    ),
                  ],
                ),
              ),
            ],

            // ── Résultats ─────────────────────────────────────────────────────
            if (_results.isNotEmpty) ...[
              const SizedBox(height: 16),

              // Résumé
              Row(
                children: [
                  _SummaryChip(
                      label: loc.rfWifiScanNetworks24(nets24),
                      sub: loc.rfWifiScanSub24,
                      color: const Color(0xFF00B4D8)),
                  const SizedBox(width: 10),
                  _SummaryChip(
                      label: loc.rfWifiScanNetworks5(nets5),
                      sub: loc.rfWifiScanSub5,
                      color: Colors.greenAccent),
                  const SizedBox(width: 10),
                  _SummaryChip(
                      label: loc.rfWifiScanTotal(_results.length),
                      sub: loc.rfWifiScanSubTotal,
                      color: _kAccent),
                ],
              ),
              const SizedBox(height: 14),

              // Occupation canaux 2.4 GHz
              if (occupation24.isNotEmpty) ...[
                _Card(
                  icon: Icons.bar_chart_rounded,
                  title: loc.rfWifiScanOccupation,
                  child: _ChannelOccupationBar(occupation: occupation24),
                ),
                const SizedBox(height: 14),
              ],

              // Liste / groupée
              if (_grouped)
                ..._buildGrouped()
              else
                ..._buildFlat(),
            ] else if (!_scanning && _errorMsg == null) ...[
              const SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    Icon(Icons.wifi_off_rounded,
                        color: Colors.white.withValues(alpha: 0.20), size: 48),
                    const SizedBox(height: 12),
                    Text(loc.rfWifiScanNoResults,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withValues(alpha: 0.35))),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<Widget> _buildGrouped() {
    final bands = <String, List<WiFiAccessPoint>>{};
    for (final ap in _results) {
      bands.putIfAbsent(_bandLabel(ap.frequency), () => []).add(ap);
    }

    return bands.entries.expand((entry) {
      final band = entry.key;
      final aps = entry.value;
      return [
        _SectionDivider(label: band),
        ...aps.map((ap) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _ApTile(ap: ap),
            )),
        const SizedBox(height: 6),
      ];
    }).toList();
  }

  List<Widget> _buildFlat() {
    return _results
        .map((ap) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _ApTile(ap: ap),
            ))
        .toList();
  }
}

// ─── Barre occupation canaux ──────────────────────────────────────────────────
class _ChannelOccupationBar extends StatelessWidget {
  final Map<int, List<WiFiAccessPoint>> occupation;
  const _ChannelOccupationBar({required this.occupation});

  @override
  Widget build(BuildContext context) {
    final maxCount =
        occupation.values.map((l) => l.length).fold(0, (a, b) => a > b ? a : b);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(13, (i) {
            final ch = i + 1;
            final aps = occupation[ch] ?? [];
            final count = aps.length;
            final frac = maxCount > 0 ? count / maxCount : 0.0;
            final isNonOverlap = ch == 1 || ch == 6 || ch == 11;

            Color color;
            if (count == 0) {
              color = Colors.white12;
            } else if (count <= 1) {
              color = Colors.greenAccent;
            } else if (count <= 3) {
              color = Colors.orangeAccent;
            } else {
              color = Colors.redAccent;
            }

            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (count > 0)
                    Text('$count',
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: color)),
                  const SizedBox(height: 2),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: frac.clamp(0.05, 1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: color
                              .withValues(alpha: count > 0 ? 0.60 : 0.15),
                          borderRadius: BorderRadius.circular(3),
                          border: isNonOverlap
                              ? Border.all(
                                  color: color.withValues(alpha: 0.80),
                                  width: 1.5)
                              : null,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text('$ch',
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: isNonOverlap
                              ? FontWeight.w800
                              : FontWeight.w400,
                          color: isNonOverlap
                              ? _kAccent.withValues(alpha: 0.90)
                              : Colors.white38)),
                ],
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Text(AppLocalizations.of(context).rfWifiScanNonOverlapNote,
            style: TextStyle(
                fontSize: 10,
                color: Colors.white.withValues(alpha: 0.35))),
      ],
    );
  }
}

// ─── Tile réseau WiFi ─────────────────────────────────────────────────────────
class _ApTile extends StatelessWidget {
  final WiFiAccessPoint ap;
  const _ApTile({required this.ap});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final ch = _channelFromFreq(ap.frequency);
    final color = _rssiColor(ap.level);
    final bar = _rssiBar(ap.level);
    final ssid =
        (ap.ssid.isEmpty) ? loc.rfWifiScanHidden : ap.ssid;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Row(
        children: [
          Icon(Icons.wifi_rounded, color: color, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ssid,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
                const SizedBox(height: 3),
                Row(
                  children: [
                    if (ch != null)
                      _Tag(
                          label: 'Ch $ch',
                          color: _kAccent.withValues(alpha: 0.80)),
                    const SizedBox(width: 6),
                    _Tag(
                        label: _bandLabel(ap.frequency),
                        color: Colors.white38),
                    if (ap.capabilities.isNotEmpty) ...[
                      const SizedBox(width: 6),
                      _Tag(
                          label: ap.capabilities.contains('WPA3')
                              ? 'WPA3'
                              : ap.capabilities.contains('WPA2')
                                  ? 'WPA2'
                                  : ap.capabilities.contains('WPA')
                                      ? 'WPA'
                                      : 'Open',
                          color: Colors.white24),
                    ],
                  ],
                ),
                const SizedBox(height: 5),
                // Barre RSSI
                LayoutBuilder(builder: (context, constraints) {
                  return Stack(
                    children: [
                      Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: bar,
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.60),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${ap.level} dBm',
                  style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: color)),
              Text(_rssiLabel(ap.level, loc),
                  style: TextStyle(
                      fontSize: 10,
                      color: color.withValues(alpha: 0.70))),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Widgets ──────────────────────────────────────────────────────────────────
class _Tag extends StatelessWidget {
  final String label;
  final Color color;
  const _Tag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: color.withValues(alpha: 0.30)),
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: color)),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  final String label;
  final String sub;
  final Color color;
  const _SummaryChip(
      {required this.label, required this.sub, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(label,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: color)),
            Text(sub,
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.white.withValues(alpha: 0.40))),
          ],
        ),
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  final String label;
  const _SectionDivider({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 10),
      child: Row(
        children: [
          Expanded(
              child: Divider(
                  color: Colors.white.withValues(alpha: 0.10), height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(label.toUpperCase(),
                style: const TextStyle(
                    color: _kAccent,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5)),
          ),
          Expanded(
              child: Divider(
                  color: Colors.white.withValues(alpha: 0.10), height: 1)),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;
  const _Card(
      {required this.icon, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: [
            Icon(icon, color: Colors.white70, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.1)),
            ),
          ]),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}
