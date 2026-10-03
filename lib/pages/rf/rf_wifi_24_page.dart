import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF9C27B0);

// ─── Données canaux 2.4 GHz ───────────────────────────────────────────────────
// Europe : 13 canaux, espacement 5 MHz, largeur 22 MHz (standard 802.11b/g)
// Canal n : centre = 2407 + 5n MHz
class _Channel {
  final int number;
  final int centerMhz;
  final bool nonOverlapping; // 1, 6, 11 (22 MHz) ou 1, 5, 9, 13 (20 MHz)

  const _Channel(this.number, this.centerMhz, {this.nonOverlapping = false});

  int get startMhz => centerMhz - 11;
  int get endMhz => centerMhz + 11;
}

const _channels = [
  _Channel(1,  2412, nonOverlapping: true),
  _Channel(2,  2417),
  _Channel(3,  2422),
  _Channel(4,  2427),
  _Channel(5,  2432),
  _Channel(6,  2437, nonOverlapping: true),
  _Channel(7,  2442),
  _Channel(8,  2447),
  _Channel(9,  2452),
  _Channel(10, 2457),
  _Channel(11, 2462, nonOverlapping: true),
  _Channel(12, 2467),
  _Channel(13, 2472),
];

const _kSpectrumStart = 2400;
const _kSpectrumEnd   = 2485;
const _kSpectrumRange = _kSpectrumEnd - _kSpectrumStart; // 85 MHz

class RfWifi24Page extends StatefulWidget {
  const RfWifi24Page({super.key});

  @override
  State<RfWifi24Page> createState() => _RfWifi24PageState();
}

class _RfWifi24PageState extends State<RfWifi24Page> {
  // Canaux sélectionnés (pour vérifier les conflits)
  final Set<int> _selected = {1, 6, 11};

  bool _overlaps(int a, int b) {
    final ca = _channels[a - 1];
    final cb = _channels[b - 1];
    return ca.startMhz < cb.endMhz && cb.startMhz < ca.endMhz;
  }

  bool _hasConflict() {
    final list = _selected.toList();
    for (int i = 0; i < list.length; i++) {
      for (int j = i + 1; j < list.length; j++) {
        if (_overlaps(list[i], list[j])) return true;
      }
    }
    return false;
  }

  bool _hasConflictWith(int n) {
    for (final other in _selected) {
      if (other != n && _overlaps(n, other)) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final conflict = _hasConflict();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.rfWifi24PageTitle,
            style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:rf_wifi_24', sectionId: 'main'),
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
            // ── Spectre visuel ────────────────────────────────────────────────
            _Card(
              icon: Icons.bar_chart_rounded,
              title: loc.rfWifi24SpectrumTitle,
              child: Column(
                children: [
                  SizedBox(
                    height: 110,
                    child: CustomPaint(
                      size: const Size(double.infinity, 110),
                      painter: _SpectrumPainter(
                          selected: _selected, channels: _channels),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _Legend(color: _kAccent, label: loc.rfWifi24LegendNonOverlap),
                      const SizedBox(width: 16),
                      _Legend(color: Colors.greenAccent, label: loc.rfWifi24LegendOk),
                      const SizedBox(width: 16),
                      _Legend(color: Colors.redAccent, label: loc.rfWifi24LegendConflict),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Simulateur de conflits ────────────────────────────────────────
            _Card(
              icon: Icons.wifi_rounded,
              title: loc.rfWifi24SimulateTitle,
              trailing: conflict
                  ? _Badge(label: 'CONFLIT', color: Colors.redAccent)
                  : _Badge(label: 'OK', color: Colors.greenAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    loc.rfWifi24SelectChannels,
                    style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.white.withValues(alpha: 0.55)),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(13, (i) {
                      final n = i + 1;
                      final sel = _selected.contains(n);
                      final hasConflict = sel && _hasConflictWith(n);
                      Color color;
                      if (hasConflict) {
                        color = Colors.redAccent;
                      } else if (sel) {
                        color = Colors.greenAccent;
                      } else if (_channels[i].nonOverlapping) {
                        color = _kAccent;
                      } else {
                        color = Colors.white38;
                      }
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (sel) {
                              _selected.remove(n);
                            } else {
                              _selected.add(n);
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: sel
                                ? color.withValues(alpha: 0.18)
                                : const Color(0xFF0E0E18),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: sel ? color : Colors.white.withValues(alpha: 0.12),
                              width: sel ? 1.5 : 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '$n',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: sel ? color : Colors.white54,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  if (conflict) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.redAccent.withValues(alpha: 0.35)),
                      ),
                      child: Text(
                        loc.rfWifi24ConflictWarning,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent.withValues(alpha: 0.90),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Tableau des canaux ────────────────────────────────────────────
            _Card(
              icon: Icons.table_rows_rounded,
              title: loc.rfWifi24ChannelTableTitle,
              child: Column(
                children: [
                  _TableHeader(),
                  const SizedBox(height: 6),
                  ..._channels.map((ch) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: _ChannelRow(ch: ch),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Conseils pratiques ────────────────────────────────────────────
            _Card(
              icon: Icons.tips_and_updates_rounded,
              title: loc.rfWifi24BestPractices,
              child: Column(
                children: [
                  _TipRow(
                    icon: Icons.check_circle_outline_rounded,
                    color: Colors.greenAccent,
                    text: loc.rfWifi24Tip1,
                  ),
                  _TipRow(
                    icon: Icons.check_circle_outline_rounded,
                    color: Colors.greenAccent,
                    text: loc.rfWifi24Tip2,
                  ),
                  _TipRow(
                    icon: Icons.warning_amber_rounded,
                    color: Colors.orangeAccent,
                    text: loc.rfWifi24Tip3,
                  ),
                  _TipRow(
                    icon: Icons.info_outline_rounded,
                    color: const Color(0xFF9C27B0),
                    text: loc.rfWifi24Tip4,
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

// ─── Spectrum Painter ─────────────────────────────────────────────────────────
class _SpectrumPainter extends CustomPainter {
  final Set<int> selected;
  final List<_Channel> channels;

  const _SpectrumPainter({required this.selected, required this.channels});

  bool _overlapsWithSelected(int n) {
    for (final other in selected) {
      if (other != n) {
        final ca = channels[n - 1];
        final cb = channels[other - 1];
        if (ca.startMhz < cb.endMhz && cb.startMhz < ca.endMhz) return true;
      }
    }
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    const double rowH = 16.0;
    const double rowGap = 2.0;
    const double labelH = 18.0;

    // Background
    final bgPaint = Paint()
      ..color = const Color(0xFF0E0E18)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(8)),
      bgPaint,
    );

    final double usableW = size.width - 16;
    final double offsetX = 8;

    double xFor(int mhz) =>
        offsetX + (mhz - _kSpectrumStart) / _kSpectrumRange * usableW;

    // Draw channel bars (row = channel index % 3 for stagger)
    for (int i = 0; i < channels.length; i++) {
      final ch = channels[i];
      final n = ch.number;
      final isSelected = selected.contains(n);
      final hasConflict = isSelected && _overlapsWithSelected(n);

      Color color;
      if (hasConflict) {
        color = Colors.redAccent;
      } else if (isSelected) {
        color = Colors.greenAccent;
      } else if (ch.nonOverlapping) {
        color = const Color(0xFF9C27B0);
      } else {
        color = Colors.white24;
      }

      final row = i % 4;
      final top = labelH + row * (rowH + rowGap);
      final left = xFor(ch.startMhz);
      final right = xFor(ch.endMhz);

      final barPaint = Paint()
        ..color = color.withValues(alpha: isSelected ? 0.45 : 0.20)
        ..style = PaintingStyle.fill;
      final borderPaint = Paint()
        ..color = color.withValues(alpha: isSelected ? 0.90 : 0.40)
        ..style = PaintingStyle.stroke
        ..strokeWidth = isSelected ? 1.5 : 0.8;

      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(left, top, right - left, rowH),
        const Radius.circular(3),
      );
      canvas.drawRRect(rect, barPaint);
      canvas.drawRRect(rect, borderPaint);

      // Channel label inside bar
      final tp = TextPainter(
        text: TextSpan(
          text: '$n',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w900,
            color: color.withValues(alpha: isSelected ? 1.0 : 0.70),
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      final cx = left + (right - left) / 2 - tp.width / 2;
      final cy = top + rowH / 2 - tp.height / 2;
      tp.paint(canvas, Offset(cx, cy));
    }

    // Frequency labels at bottom
    const freqLabels = [2410, 2420, 2430, 2440, 2450, 2460, 2470, 2480];
    final labelPaint = TextPainter(textDirection: TextDirection.ltr);
    for (final f in freqLabels) {
      final x = xFor(f);
      // Tick
      canvas.drawLine(
        Offset(x, size.height - 8),
        Offset(x, size.height - 4),
        Paint()
          ..color = Colors.white24
          ..strokeWidth = 0.8,
      );
      labelPaint.text = TextSpan(
        text: '$f',
        style: const TextStyle(fontSize: 7, color: Colors.white38),
      );
      labelPaint.layout();
      labelPaint.paint(canvas, Offset(x - labelPaint.width / 2, size.height - 14));
    }
  }

  @override
  bool shouldRepaint(_SpectrumPainter old) =>
      old.selected != selected;
}

// ─── Widgets ──────────────────────────────────────────────────────────────────
class _TableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        children: [
          _Hdr(loc.rfWifi24HdrChannel, 44),
          _Hdr(loc.rfWifi24HdrCenter, 72),
          _Hdr(loc.rfWifi24HdrStart, 72),
          _Hdr(loc.rfWifi24HdrEnd, 72),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}

class _Hdr extends StatelessWidget {
  final String text;
  final double width;
  const _Hdr(this.text, this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Colors.white.withValues(alpha: 0.40),
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

class _ChannelRow extends StatelessWidget {
  final _Channel ch;
  const _ChannelRow({required this.ch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: ch.nonOverlapping
            ? _kAccent.withValues(alpha: 0.07)
            : const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ch.nonOverlapping
              ? _kAccent.withValues(alpha: 0.25)
              : Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 44,
            child: Text(
              'Ch ${ch.number}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w900,
                color: ch.nonOverlapping ? _kAccent : Colors.white70,
              ),
            ),
          ),
          SizedBox(
            width: 72,
            child: Text(
              '${ch.centerMhz} MHz',
              style: const TextStyle(
                  fontFamily: 'monospace', fontSize: 12, color: Colors.white70),
            ),
          ),
          SizedBox(
            width: 72,
            child: Text(
              '${ch.startMhz} MHz',
              style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 11,
                  color: Colors.white.withValues(alpha: 0.45)),
            ),
          ),
          SizedBox(
            width: 72,
            child: Text(
              '${ch.endMhz} MHz',
              style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 11,
                  color: Colors.white.withValues(alpha: 0.45)),
            ),
          ),
          if (ch.nonOverlapping)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: _kAccent.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: _kAccent.withValues(alpha: 0.40)),
              ),
              child: const Text(
                '★',
                style: TextStyle(fontSize: 10, color: _kAccent),
              ),
            ),
        ],
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
            decoration:
                BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
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
  const _TipRow(
      {required this.icon, required this.color, required this.text});

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

class _Badge extends StatelessWidget {
  final String label;
  final Color color;
  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.45)),
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w800, color: color)),
    );
  }
}

class _Card extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;
  final Widget? trailing;

  const _Card(
      {required this.icon,
      required this.title,
      required this.child,
      this.trailing});

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
            if (trailing != null) trailing!,
          ]),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}
