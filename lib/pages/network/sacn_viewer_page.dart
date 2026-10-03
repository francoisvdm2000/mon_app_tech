import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/dmx_universe.dart';
import '../../services/network/sacn_service.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF7C4DFF);

class SacnViewerPage extends StatefulWidget {
  const SacnViewerPage({super.key});

  @override
  State<SacnViewerPage> createState() => _SacnViewerPageState();
}

class _SacnViewerPageState extends State<SacnViewerPage> {
  final _service = SacnService();
  StreamSubscription<Map<int, DmxUniverse>>? _sub;

  Map<int, DmxUniverse> _universes = {};
  int? _selectedUniverse;
  bool _showActiveOnly = false;
  String? _errorMsg;

  @override
  void dispose() {
    _sub?.cancel();
    _service.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    setState(() => _errorMsg = null);
    try {
      await _service.start();
      _sub = _service.stream.listen((universes) {
        if (!mounted) return;
        setState(() => _universes = universes);
      });
      setState(() {});
    } catch (e) {
      if (!mounted) return;
      setState(() => _errorMsg = e.toString());
    }
  }

  void _stop() {
    _sub?.cancel();
    _sub = null;
    _service.stop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final isRunning = _service.isRunning;
    final sortedUniverses = _universes.keys.toList()..sort();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.sacnTitle,
          style:
              const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        actions: const [
          AboutPinButton(pageId: 'tool:network_sacn_viewer', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          24 + MediaQuery.paddingOf(context).bottom,
        ),
        children: [
          // ── Info ──────────────────────────────────────────────────────────
          _InfoBanner(
              text: loc.sacnPlatformInfo, color: Colors.deepPurpleAccent),
          const SizedBox(height: 8),
          if (Platform.isIOS) ...[
            _InfoBanner(
              text: loc.sacnIosMulticastNote,
              color: Colors.orangeAccent,
              icon: Icons.warning_amber_rounded,
            ),
            const SizedBox(height: 8),
          ],

          // ── Status + bouton ────────────────────────────────────────────────
          _StatusAndButton(
            isRunning: isRunning,
            onStart: _start,
            onStop: _stop,
            loc: loc,
          ),

          // ── Erreur ────────────────────────────────────────────────────────
          if (_errorMsg != null) ...[
            const SizedBox(height: 10),
            _InfoBanner(
              text: loc.sacnErrorBind,
              color: Colors.redAccent,
              icon: Icons.error_outline_rounded,
            ),
          ],

          // ── Univers reçus ─────────────────────────────────────────────────
          if (sortedUniverses.isNotEmpty) ...[
            const SizedBox(height: 16),
            _SectionLabel(loc.sacnUniversesTitle),
            const SizedBox(height: 8),
            ...sortedUniverses.map((u) {
              final uni = _universes[u]!;
              final selected = _selectedUniverse == u;
              return _UniverseCard(
                universe: uni,
                selected: selected,
                loc: loc,
                onTap: () => setState(() {
                  _selectedUniverse = selected ? null : u;
                  _showActiveOnly = false;
                }),
                showActiveOnly: _showActiveOnly,
                onToggleActive: selected
                    ? (val) => setState(() => _showActiveOnly = val)
                    : null,
              );
            }),
          ] else if (isRunning) ...[
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 36,
                    height: 36,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: _kAccent.withValues(alpha: 0.50),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    loc.sacnNoPackets,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.35),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Widgets ──────────────────────────────────────────────────────────────────

class _InfoBanner extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  const _InfoBanner({
    required this.text,
    required this.color,
    this.icon = Icons.info_outline_rounded,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color.withValues(alpha: 0.80), size: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.60),
                  height: 1.35,
                ),
              ),
            ),
          ],
        ),
      );
}

class _StatusAndButton extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onStart;
  final VoidCallback onStop;
  final AppLocalizations loc;
  const _StatusAndButton({
    required this.isRunning,
    required this.onStart,
    required this.onStop,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isRunning
                ? Colors.greenAccent.withValues(alpha: 0.10)
                : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isRunning
                  ? Colors.greenAccent.withValues(alpha: 0.35)
                  : Colors.white.withValues(alpha: 0.12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isRunning ? Colors.greenAccent : Colors.white38,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                isRunning ? loc.sacnListening : loc.sacnNotListening,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isRunning ? Colors.greenAccent : Colors.white38,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: isRunning ? onStop : onStart,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isRunning
                  ? Colors.redAccent.withValues(alpha: 0.10)
                  : _kAccent.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isRunning
                    ? Colors.redAccent.withValues(alpha: 0.40)
                    : _kAccent.withValues(alpha: 0.45),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isRunning ? Icons.stop_rounded : Icons.play_arrow_rounded,
                  color: isRunning ? Colors.redAccent : _kAccent,
                  size: 20,
                ),
                const SizedBox(width: 6),
                Text(
                  isRunning ? loc.sacnStopButton : loc.sacnStartButton,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isRunning ? Colors.redAccent : _kAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel(this.label);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
              child: Divider(
                  color: Colors.white.withValues(alpha: 0.10), height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label.toUpperCase(),
              style: const TextStyle(
                color: _kAccent,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Expanded(
              child: Divider(
                  color: Colors.white.withValues(alpha: 0.10), height: 1)),
        ],
      );
}

class _UniverseCard extends StatelessWidget {
  final DmxUniverse universe;
  final bool selected;
  final AppLocalizations loc;
  final VoidCallback onTap;
  final bool showActiveOnly;
  final ValueChanged<bool>? onToggleActive;

  const _UniverseCard({
    required this.universe,
    required this.selected,
    required this.loc,
    required this.onTap,
    required this.showActiveOnly,
    this.onToggleActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: selected
                    ? _kAccent.withValues(alpha: 0.08)
                    : const Color(0xFF161622),
                borderRadius: selected
                    ? const BorderRadius.vertical(top: Radius.circular(16))
                    : BorderRadius.circular(16),
                border: Border.all(
                  color: selected
                      ? _kAccent.withValues(alpha: 0.35)
                      : Colors.white.withValues(alpha: 0.07),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: _kAccent.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${universe.universe}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: _kAccent,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              loc.sacnUniverseTitle(universe.universe),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            if (universe.sourceName != null &&
                                universe.sourceName!.isNotEmpty) ...[
                              const SizedBox(height: 2),
                              Text(
                                loc.sacnSource(universe.sourceName!),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white.withValues(alpha: 0.45),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _StatBadge(
                            label: loc.sacnFps(universe.fps.toStringAsFixed(1)),
                            color: Colors.greenAccent,
                          ),
                          const SizedBox(height: 4),
                          _StatBadge(
                            label: loc.sacnPackets(universe.packetCount),
                            color: _kAccent,
                          ),
                        ],
                      ),
                      const SizedBox(width: 6),
                      Icon(
                        selected
                            ? Icons.expand_less_rounded
                            : Icons.expand_more_rounded,
                        color: Colors.white38,
                        size: 20,
                      ),
                    ],
                  ),
                  // Méta sACN
                  if (universe.priority != null || universe.cid != null) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        if (universe.priority != null)
                          _MetaChip(
                            label: loc.sacnPriority(universe.priority!),
                            color: _priorityColor(universe.priority!),
                          ),
                        if (universe.cid != null)
                          _MetaChip(
                            label: loc.sacnCid(_shortCid(universe.cid!)),
                            color: Colors.white38,
                          ),
                        _MetaChip(
                          label: universe.sourceIp,
                          color: Colors.white24,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),

          // DMX grid (si sélectionné)
          if (selected) ...[
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF0F0F1B),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(16)),
                border: Border.all(color: _kAccent.withValues(alpha: 0.20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        loc.sacnShowActiveOnly,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.55),
                        ),
                      ),
                      const Spacer(),
                      Switch(
                        value: showActiveOnly,
                        onChanged: onToggleActive,
                        activeThumbColor: _kAccent,
                      ),
                    ],
                  ),
                  Text(
                    loc.sacnActiveCount(universe.activeChannels),
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withValues(alpha: 0.40),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _DmxGrid(
                    channels: universe.channels,
                    showActiveOnly: showActiveOnly,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _priorityColor(int p) {
    if (p >= 200) return Colors.redAccent;
    if (p >= 150) return Colors.orangeAccent;
    if (p >= 100) return Colors.yellowAccent;
    return Colors.white38;
  }

  String _shortCid(String cid) {
    final parts = cid.split(':');
    if (parts.length >= 4) {
      return '${parts[0]}:${parts[1]}:…:${parts[parts.length - 1]}';
    }
    return cid;
  }
}

class _StatBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _StatBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w700, color: color),
        ),
      );
}

class _MetaChip extends StatelessWidget {
  final String label;
  final Color color;
  const _MetaChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color.withValues(alpha: 0.22)),
        ),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w600, color: color),
        ),
      );
}

// ─── Grille DMX ──────────────────────────────────────────────────────────────

class _DmxGrid extends StatelessWidget {
  final List<int> channels;
  final bool showActiveOnly;
  const _DmxGrid({required this.channels, required this.showActiveOnly});

  @override
  Widget build(BuildContext context) {
    final visible = showActiveOnly
        ? channels.asMap().entries.where((e) => e.value > 0).toList()
        : channels.asMap().entries.toList();

    if (visible.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 3,
      runSpacing: 3,
      children: visible
          .map((e) => _DmxCell(channel: e.key + 1, value: e.value))
          .toList(),
    );
  }
}

class _DmxCell extends StatelessWidget {
  final int channel;
  final int value;
  const _DmxCell({required this.channel, required this.value});

  @override
  Widget build(BuildContext context) {
    final norm = value / 255.0;
    final color = _valueColor(norm);

    return Tooltip(
      message: 'Ch $channel: $value',
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: color.withValues(alpha: (0.12 + norm * 0.70).clamp(0.0, 1.0)),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color:
                color.withValues(alpha: (0.20 + norm * 0.40).clamp(0.0, 1.0)),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          '$channel',
          style: TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.w700,
            color: Colors.white.withValues(alpha: value > 0 ? 0.80 : 0.25),
          ),
        ),
      ),
    );
  }

  Color _valueColor(double norm) {
    if (norm == 0) return Colors.white;
    if (norm < 0.33) return Colors.blueAccent;
    if (norm < 0.66) return Colors.orangeAccent;
    return Colors.redAccent;
  }
}
