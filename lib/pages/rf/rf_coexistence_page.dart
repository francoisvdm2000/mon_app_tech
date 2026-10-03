import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

class _Protocol {
  final String name;
  final String freqRange;
  final int startMhzOffset; // offset from 2400 MHz
  final int widthMhz;
  final String type;
  final String note;
  final Color color;
  final bool isAv; // protocole audiovisuel

  const _Protocol({
    required this.name,
    required this.freqRange,
    required this.startMhzOffset,
    required this.widthMhz,
    required this.type,
    required this.note,
    required this.color,
    this.isAv = false,
  });
}

List<_Protocol> _protocols(AppLocalizations l10n) => [
      _Protocol(
        name: l10n.rfCoexProtocolWifi24Name,
        freqRange: '2400–2484 MHz',
        startMhzOffset: 0,
        widthMhz: 84,
        type: l10n.rfCoexTypeDsssOfdm,
        note: l10n.rfCoexProtocolWifi24Note,
        color: const Color(0xFF00B4D8),
      ),
      _Protocol(
        name: l10n.rfCoexProtocolBluetoothClassicName,
        freqRange: '2402–2480 MHz',
        startMhzOffset: 2,
        widthMhz: 78,
        type: l10n.rfCoexTypeFhss79,
        note: l10n.rfCoexProtocolBluetoothClassicNote,
        color: const Color(0xFF4361EE),
      ),
      _Protocol(
        name: l10n.rfCoexProtocolBluetoothLeName,
        freqRange: '2402–2480 MHz',
        startMhzOffset: 2,
        widthMhz: 78,
        type: l10n.rfCoexTypeFhss40,
        note: l10n.rfCoexProtocolBluetoothLeNote,
        color: const Color(0xFF7B2FBE),
      ),
      _Protocol(
        name: l10n.rfCoexProtocolZigbeeName,
        freqRange: '2405–2480 MHz',
        startMhzOffset: 5,
        widthMhz: 75,
        type: l10n.rfCoexTypeDsss16,
        note: l10n.rfCoexProtocolZigbeeNote,
        color: const Color(0xFFFF9F1C),
      ),
      _Protocol(
        name: l10n.rfCoexProtocolDigitalMics24Name,
        freqRange: '2400–2484 MHz',
        startMhzOffset: 0,
        widthMhz: 84,
        type: l10n.rfCoexTypeFhssDsss,
        note: l10n.rfCoexProtocolDigitalMics24Note,
        color: const Color(0xFFFF6B6B),
        isAv: true,
      ),
      _Protocol(
        name: l10n.rfCoexProtocolWirelessDmxName,
        freqRange: '2402–2480 MHz',
        startMhzOffset: 2,
        widthMhz: 78,
        type: l10n.rfCoexTypeFhss,
        note: l10n.rfCoexProtocolWirelessDmxNote,
        color: const Color(0xFFFFB703),
        isAv: true,
      ),
      _Protocol(
        name: l10n.rfCoexProtocolWirelessVideoName,
        freqRange: '2400–2484 MHz',
        startMhzOffset: 0,
        widthMhz: 84,
        type: l10n.rfCoexTypeOfdm,
        note: l10n.rfCoexProtocolWirelessVideoNote,
        color: const Color(0xFF06D6A0),
        isAv: true,
      ),
    ];

class RfCoexistencePage extends StatelessWidget {
  const RfCoexistencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final protocols = _protocols(l10n);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          l10n.rfCoexTitle,
          style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        actions: const [
          AboutPinButton(pageId: 'tool:rf_coexistence', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 24 + bottom),
          children: [
            // ── Vue spectre ───────────────────────────────────────────────────
            _Card(
              icon: Icons.signal_cellular_alt_rounded,
              title: l10n.rfCoexBandOccupancyTitle,
              child: Column(
                children: [
                  SizedBox(
                    height: protocols.length * 28.0 + 30,
                    child: CustomPaint(
                      size: Size(double.infinity, protocols.length * 28.0 + 30),
                      painter: _CoexPainter(protocols: protocols),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: protocols.map((p) => _Legend(color: p.color, label: p.name)).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Protocoles AV ─────────────────────────────────────────────────
            _Card(
              icon: Icons.speaker_group_rounded,
              title: l10n.rfCoexAvProtocolsTitle,
              child: Column(
                children: protocols
                    .where((p) => p.isAv)
                    .map((p) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _ProtocolTile(p: p),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 14),

            // ── Tous les protocoles ───────────────────────────────────────────
            _Card(
              icon: Icons.wifi_rounded,
              title: l10n.rfCoexAllProtocolsTitle,
              child: Column(
                children: protocols
                    .map((p) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _ProtocolTile(p: p),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 14),

            // ── Conflits typiques ─────────────────────────────────────────────
            _Card(
              icon: Icons.warning_amber_rounded,
              title: l10n.rfCoexFrequentConflictsTitle,
              child: Column(
                children: [
                  _ConflictRow(
                    a: l10n.rfCoexConflictWifiCh6,
                    b: l10n.rfCoexConflictMic24,
                    risk: l10n.rfCoexRiskHigh,
                    riskColor: Colors.redAccent,
                    desc: l10n.rfCoexConflictWifiCh6Mic24Desc,
                  ),
                  _ConflictRow(
                    a: l10n.rfCoexConflictBleAdvertising,
                    b: l10n.rfCoexConflictWifiCh1,
                    risk: l10n.rfCoexRiskMedium,
                    riskColor: Colors.orangeAccent,
                    desc: l10n.rfCoexConflictBleWifiCh1Desc,
                  ),
                  _ConflictRow(
                    a: l10n.rfCoexConflictWirelessVideo,
                    b: l10n.rfCoexConflictEverythingElse,
                    risk: l10n.rfCoexRiskHigh,
                    riskColor: Colors.redAccent,
                    desc: l10n.rfCoexConflictVideoEverythingDesc,
                  ),
                  _ConflictRow(
                    a: l10n.rfCoexConflictZigbeeCh11,
                    b: l10n.rfCoexConflictWifiCh1,
                    risk: l10n.rfCoexRiskHigh,
                    riskColor: Colors.redAccent,
                    desc: l10n.rfCoexConflictZigbeeWifiCh1Desc,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Recommandations ──────────────────────────────────────────────
            _Card(
              icon: Icons.tips_and_updates_rounded,
              title: l10n.rfCoexFieldRecommendationsTitle,
              child: Column(
                children: [
                  _TipRow(
                    icon: Icons.router_rounded,
                    color: const Color(0xFF00B4D8),
                    text: l10n.rfCoexTipWifiChannels,
                  ),
                  _TipRow(
                    icon: Icons.mic_rounded,
                    color: const Color(0xFFFF6B6B),
                    text: l10n.rfCoexTipUhfMics,
                  ),
                  _TipRow(
                    icon: Icons.videocam_rounded,
                    color: const Color(0xFF06D6A0),
                    text: l10n.rfCoexTipWirelessVideo5Ghz,
                  ),
                  _TipRow(
                    icon: Icons.lightbulb_rounded,
                    color: const Color(0xFFFFB703),
                    text: l10n.rfCoexTipWirelessDmxFhss,
                  ),
                  _TipRow(
                    icon: Icons.analytics_rounded,
                    color: const Color(0xFF9C27B0),
                    text: l10n.rfCoexTipSpectrumScan,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Coexistence Spectrum Painter ─────────────────────────────────────────────
class _CoexPainter extends CustomPainter {
  final List<_Protocol> protocols;
  const _CoexPainter({required this.protocols});

  @override
  void paint(Canvas canvas, Size size) {
    const double spectrumStart = 2400;
    const double spectrumEnd = 2485;
    const double range = spectrumEnd - spectrumStart;
    const double rowH = 16.0;
    const double rowGap = 12.0;
    const double labelH = 20.0;
    const double offsetX = 8.0;
    final double usableW = size.width - 16;

    double xFor(double mhz) =>
        offsetX + ((mhz - spectrumStart) / range) * usableW;

    // Frequency axis labels
    const freqs = [2410.0, 2420.0, 2430.0, 2437.0, 2440.0, 2450.0, 2462.0, 2470.0, 2480.0];
    for (final f in freqs) {
      final x = xFor(f);
      canvas.drawLine(
        Offset(x, labelH - 4),
        Offset(x, size.height - 4),
        Paint()
          ..color = Colors.white.withValues(alpha: 0.06)
          ..strokeWidth = 0.8,
      );
      final tp = TextPainter(
        text: TextSpan(
          text: '${f.toInt()}',
          style: const TextStyle(fontSize: 7, color: Colors.white38),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(x - tp.width / 2, 0));
    }

    // Protocol bars
    for (int i = 0; i < protocols.length; i++) {
      final p = protocols[i];
      final top = labelH + i * (rowH + rowGap);
      final left = xFor(spectrumStart + p.startMhzOffset);
      final right = xFor(spectrumStart + p.startMhzOffset + p.widthMhz);

      final paint = Paint()
        ..color = p.color.withValues(alpha: 0.22)
        ..style = PaintingStyle.fill;
      final borderPaint = Paint()
        ..color = p.color.withValues(alpha: 0.65)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2;

      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(left, top, right - left, rowH),
        const Radius.circular(3),
      );
      canvas.drawRRect(rect, paint);
      canvas.drawRRect(rect, borderPaint);

      // Name label
      final tp = TextPainter(
        text: TextSpan(
          text: p.name,
          style: TextStyle(
              fontSize: 8.5,
              fontWeight: FontWeight.w700,
              color: p.color.withValues(alpha: 0.95)),
        ),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: right - left - 4);
      tp.paint(canvas, Offset(left + 4, top + (rowH - tp.height) / 2));
    }
  }

  @override
  bool shouldRepaint(_CoexPainter old) => false;
}

// ─── Widgets ──────────────────────────────────────────────────────────────────
class _ProtocolTile extends StatelessWidget {
  final _Protocol p;
  const _ProtocolTile({required this.p});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: p.color.withValues(alpha: 0.20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 50,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: p.color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        p.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.5,
                          color: p.color,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: p.color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: p.color.withValues(alpha: 0.30)),
                      ),
                      child: Text(
                        p.type,
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: p.color.withValues(alpha: 0.85)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  p.freqRange,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  p.note,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.60),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConflictRow extends StatelessWidget {
  final String a;
  final String b;
  final String risk;
  final Color riskColor;
  final String desc;

  const _ConflictRow({
    required this.a,
    required this.b,
    required this.risk,
    required this.riskColor,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: riskColor.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: riskColor.withValues(alpha: 0.20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(a,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child:
                      Icon(Icons.sync_alt_rounded, color: riskColor, size: 14),
                ),
                Text(b,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        color: Colors.white)),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(
                    color: riskColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                    border:
                        Border.all(color: riskColor.withValues(alpha: 0.40)),
                  ),
                  child: Text(risk,
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          color: riskColor)),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(desc,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.55),
                    height: 1.35)),
          ],
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;
  const _Legend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 5),
        Text(label,
            style: TextStyle(
                fontSize: 11, color: Colors.white.withValues(alpha: 0.55))),
      ],
    );
  }
}

class _TipRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const _TipRow({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.70),
                    height: 1.4)),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _Card({required this.icon, required this.title, required this.child});

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
