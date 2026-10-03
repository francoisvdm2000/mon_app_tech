import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/bandwidth_snapshot.dart';
import '../../services/network/broadcast_bandwidth_service.dart';
import '../about/about_favorites.dart';

const _kBg     = Color(0xFF0D0D14);
const _kCard   = Color(0xFF161622);
const _kAccent = Color(0xFF00E5FF);

/// Couleurs par protocole — doit correspondre à [BroadcastBandwidthService.protocols].
const _kProtoColors = <String, Color>{
  'Art-Net': Color(0xFFFFB300),
  'sACN':    Color(0xFF7C4DFF),
  'MA-Net':  Color(0xFFE040FB),
};

const _kHistory = 60; // secondes affichées sur le graphe

class BroadcastBandwidthPage extends StatefulWidget {
  const BroadcastBandwidthPage({super.key});

  @override
  State<BroadcastBandwidthPage> createState() =>
      _BroadcastBandwidthPageState();
}

class _BroadcastBandwidthPageState extends State<BroadcastBandwidthPage>
    with SingleTickerProviderStateMixin {
  late final BroadcastBandwidthService _svc;
  final List<BandwidthSnapshot> _history = [];
  BandwidthSnapshot _current = BandwidthSnapshot.empty();

  // Animation pulsing du dot
  late final AnimationController _pulse;
  late final Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
    _pulseAnim = CurvedAnimation(parent: _pulse, curve: Curves.easeInOut);

    _svc = BroadcastBandwidthService();
    _svc.start().then((_) {
      _svc.stream.listen((snap) {
        if (!mounted) return;
        setState(() {
          _current = snap;
          _history.add(snap);
          if (_history.length > _kHistory) _history.removeAt(0);
        });
      });
    });
  }

  @override
  void dispose() {
    _pulse.dispose();
    _svc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.bwBroadcastPageTitle,
            style: const TextStyle(fontWeight: FontWeight.w800)),
        actions: const [
          AboutPinButton(pageId: 'tool:network_broadcast_bandwidth', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: Column(
        children: [
          // ── Barre de statut ───────────────────────────────────────────────
          _StatusBar(
            pulseAnim: _pulseAnim,
            totalKbps: _current.totalKbps,
            loc: loc,
          ),

          // ── Graphe ────────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: SizedBox(
              height: 180,
              child: _BandwidthChart(history: _history),
            ),
          ),

          // ── Légende & valeurs ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: _Legend(current: _current, loc: loc),
          ),

          const Spacer(),

          // ── Bannière d'avertissement ──────────────────────────────────────
          Padding(
            padding: EdgeInsets.fromLTRB(
                16, 0, 16, 16 + MediaQuery.paddingOf(context).bottom),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFB300).withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: const Color(0xFFFFB300).withValues(alpha: 0.20)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.warning_amber_rounded,
                      color: Color(0xFFFFB300), size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      loc.bwBroadcastWarning,
                      style: const TextStyle(
                          color: Color(0xFFFFB300),
                          fontSize: 12,
                          height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Barre de statut ─────────────────────────────────────────────────────────

class _StatusBar extends StatelessWidget {
  final Animation<double> pulseAnim;
  final double totalKbps;
  final AppLocalizations loc;

  const _StatusBar(
      {required this.pulseAnim,
      required this.totalKbps,
      required this.loc});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.white.withValues(alpha: 0.07))),
        ),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: pulseAnim,
              builder: (_, __) => Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _kAccent
                      .withValues(alpha: 0.5 + pulseAnim.value * 0.5),
                  boxShadow: [
                    BoxShadow(
                      color:
                          _kAccent.withValues(alpha: pulseAnim.value * 0.45),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(loc.bwBroadcastListening,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.50),
                    fontSize: 13)),
            const Spacer(),
            _TotalBadge(kbps: totalKbps, loc: loc),
          ],
        ),
      );
}

class _TotalBadge extends StatelessWidget {
  final double kbps;
  final AppLocalizations loc;
  const _TotalBadge({required this.kbps, required this.loc});

  @override
  Widget build(BuildContext context) {
    final text = kbps >= 1000
        ? '${(kbps / 1000).toStringAsFixed(2)} ${loc.bwUnitMbps}'
        : '${kbps.toStringAsFixed(0)} ${loc.bwUnitKbps}';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _kAccent.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _kAccent.withValues(alpha: 0.22)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(loc.bwBroadcastTotal,
              style: TextStyle(
                  color: _kAccent.withValues(alpha: 0.60),
                  fontSize: 11,
                  fontWeight: FontWeight.w600)),
          const SizedBox(width: 6),
          Text(text,
              style: const TextStyle(
                  color: _kAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'monospace')),
        ],
      ),
    );
  }
}

// ─── Graphe CustomPainter ─────────────────────────────────────────────────────

class _BandwidthChart extends StatelessWidget {
  final List<BandwidthSnapshot> history;
  const _BandwidthChart({required this.history});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CustomPaint(
            painter: _ChartPainter(history: history),
          ),
        ),
      );
}

class _ChartPainter extends CustomPainter {
  final List<BandwidthSnapshot> history;
  static const _protocols = ['Art-Net', 'sACN', 'MA-Net'];

  _ChartPainter({required this.history});

  @override
  void paint(Canvas canvas, Size size) {
    if (history.isEmpty) {
      _drawEmpty(canvas, size);
      return;
    }

    const pad = EdgeInsets.fromLTRB(46, 12, 12, 28);
    final chartW = size.width - pad.left - pad.right;
    final chartH = size.height - pad.top - pad.bottom;

    // Calcul du max
    double maxKbps = 1.0;
    for (final snap in history) {
      final t = snap.totalKbps;
      if (t > maxKbps) maxKbps = t;
    }
    maxKbps *= 1.15; // marge 15 %

    // Grille horizontale
    final gridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.06)
      ..strokeWidth = 1;
    for (var i = 0; i <= 4; i++) {
      final y = pad.top + chartH * (1 - i / 4);
      canvas.drawLine(
          Offset(pad.left, y), Offset(pad.left + chartW, y), gridPaint);

      // Labels Y
      final kbps = maxKbps * i / 4;
      final label = kbps >= 1000
          ? '${(kbps / 1000).toStringAsFixed(1)}M'
          : '${kbps.toStringAsFixed(0)}k';
      _drawText(canvas, label, Offset(2, y - 6), 9,
          Colors.white.withValues(alpha: 0.28));
    }

    // Lignes des protocoles
    for (final proto in _protocols) {
      final color = _kProtoColors[proto] ?? Colors.white;
      final paint = Paint()
        ..color = color.withValues(alpha: 0.85)
        ..strokeWidth = 1.5
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

      final n = history.length;
      Path? path;
      for (var i = 0; i < n; i++) {
        final kbps = history[i].kbpsFor(proto);
        final x = pad.left + chartW * i / max(1, _kHistory - 1);
        final y = pad.top + chartH * (1 - (kbps / maxKbps).clamp(0, 1));
        if (path == null) {
          path = Path()..moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      if (path != null) canvas.drawPath(path, paint);
    }

    // Axe X (labels temporels)
    for (var i = 0; i <= 4; i++) {
      final secs = (_kHistory * (4 - i) / 4).round();
      final label = secs == 0 ? '0s' : '-${secs}s';
      final x = pad.left + chartW * i / 4;
      _drawText(canvas, label, Offset(x - 10, size.height - 14), 9,
          Colors.white.withValues(alpha: 0.28));
    }
  }

  void _drawEmpty(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.06)
      ..strokeWidth = 1;
    canvas.drawLine(
        Offset(46, size.height / 2),
        Offset(size.width - 12, size.height / 2),
        paint);
  }

  void _drawText(
      Canvas canvas, String text, Offset offset, double size, Color color) {
    final tp = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(
              fontSize: size,
              color: color,
              fontFamily: 'monospace')),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(_ChartPainter old) => old.history != history;
}

// ─── Légende ─────────────────────────────────────────────────────────────────

class _Legend extends StatelessWidget {
  final BandwidthSnapshot current;
  final AppLocalizations loc;
  const _Legend({required this.current, required this.loc});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Column(
          children: _kProtoColors.entries
              .map((e) => _LegendRow(
                    proto: e.key,
                    color: e.value,
                    kbps: current.kbpsFor(e.key),
                    pkts: current.pktsFor(e.key),
                    loc: loc,
                  ))
              .toList(),
        ),
      );
}

class _LegendRow extends StatelessWidget {
  final String proto;
  final Color color;
  final double kbps;
  final int pkts;
  final AppLocalizations loc;
  const _LegendRow({
    required this.proto,
    required this.color,
    required this.kbps,
    required this.pkts,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    final kbpsStr = kbps >= 1000
        ? '${(kbps / 1000).toStringAsFixed(2)} ${loc.bwUnitMbps}'
        : '${kbps.toStringAsFixed(0)} ${loc.bwUnitKbps}';
    final pktsStr = '$pkts ${loc.bwUnitPkts}';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 72,
            child: Text(proto,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: Text(kbpsStr,
                style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'monospace')),
          ),
          Text(pktsStr,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.35),
                  fontSize: 11,
                  fontFamily: 'monospace')),
        ],
      ),
    );
  }
}
