import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/network/ping_service.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF00E5FF);
const _kBg = Color(0xFF0D0D14);
const _kCard = Color(0xFF161622);
const _kField = Color(0xFF0E0E18);
const _kGood = Color(0xFF00E676);
const _kOk = Color(0xFFFFD740);
const _kSlow = Color(0xFFFF9100);
const _kBad = Color(0xFFFF5252);
const _kRecentKey = 'ping_recent_hosts';

Color _latencyColor(double? ms) {
  if (ms == null) return _kBad;
  if (ms < 10) return _kGood;
  if (ms < 50) return _kOk;
  return _kSlow;
}

class _Result {
  final int seq;
  final double? ms;
  final DateTime at;
  const _Result(this.seq, this.ms, this.at);
}

/// Outil Ping (gratuit) : ping continu ou N paquets, latence en direct,
/// pertes et statistiques min / moy / max.
class PingPage extends StatefulWidget {
  final String? initialHost;
  const PingPage({super.key, this.initialHost});

  @override
  State<PingPage> createState() => _PingPageState();
}

class _PingPageState extends State<PingPage> {
  final _hostCtrl = TextEditingController();
  final _results = <_Result>[];
  List<String> _recent = [];
  int _count = 0; // 0 = continu
  bool _running = false;
  bool _unresolved = false;
  String? _resolvedIp;
  int _runId = 0;

  @override
  void initState() {
    super.initState();
    _hostCtrl.text = widget.initialHost ?? '';
    _loadRecent();
    if (widget.initialHost == null) _prefillGateway();
  }

  @override
  void dispose() {
    _runId++;
    _hostCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadRecent() async {
    try {
      final p = await SharedPreferences.getInstance();
      if (!mounted) return;
      setState(() => _recent = p.getStringList(_kRecentKey) ?? []);
    } catch (_) {}
  }

  Future<void> _saveRecent(String host) async {
    _recent = [host, ..._recent.where((h) => h != host)].take(6).toList();
    try {
      final p = await SharedPreferences.getInstance();
      await p.setStringList(_kRecentKey, _recent);
    } catch (_) {}
  }

  Future<void> _prefillGateway() async {
    try {
      final gw = await NetworkInfo().getWifiGatewayIP();
      if (!mounted || _hostCtrl.text.isNotEmpty) return;
      if (gw != null && gw.isNotEmpty && gw != '0.0.0.0') {
        setState(() => _hostCtrl.text = gw);
      }
    } catch (_) {}
  }

  // ─── Stats ─────────────────────────────────────────────────────────────────

  int get _sent => _results.length;
  Iterable<double> get _times => _results.where((r) => r.ms != null).map((r) => r.ms!);
  int get _received => _times.length;
  double get _lossPct => _sent == 0 ? 0 : (_sent - _received) * 100 / _sent;
  double? get _min => _received == 0 ? null : _times.reduce(math.min);
  double? get _max => _received == 0 ? null : _times.reduce(math.max);
  double? get _avg =>
      _received == 0 ? null : _times.reduce((a, b) => a + b) / _received;

  // ─── Actions ───────────────────────────────────────────────────────────────

  Future<void> _start() async {
    FocusScope.of(context).unfocus();
    final host = _hostCtrl.text.trim();
    if (host.isEmpty) return;
    HapticFeedback.lightImpact();

    setState(() {
      _running = true;
      _unresolved = false;
      _results.clear();
      _resolvedIp = null;
    });

    final ip = await PingService.resolve(host);
    if (!mounted) return;
    if (ip == null) {
      setState(() {
        _running = false;
        _unresolved = true;
      });
      return;
    }
    setState(() => _resolvedIp = ip);
    _saveRecent(host);

    final myRun = ++_runId;
    var seq = 0;
    while (mounted && _runId == myRun && (_count == 0 || seq < _count)) {
      final t0 = DateTime.now();
      final ms = await PingService.pingOnce(ip, seq: seq);
      if (!mounted || _runId != myRun) return;
      setState(() {
        _results.add(_Result(seq, ms, DateTime.now()));
        if (_results.length > 500) _results.removeAt(0);
      });
      seq++;
      if (_count != 0 && seq >= _count) break;
      final wait = const Duration(seconds: 1) - DateTime.now().difference(t0);
      if (wait > Duration.zero) await Future.delayed(wait);
    }
    if (mounted && _runId == myRun) setState(() => _running = false);
  }

  void _stop() {
    _runId++;
    setState(() => _running = false);
  }

  // ─── UI ────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.pingTitle,
            style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:network_ping', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 24 + bottom),
          children: [
            _buildTargetCard(loc),
            const SizedBox(height: 14),
            _buildLiveCard(loc),
            if (_results.isNotEmpty) ...[
              const SizedBox(height: 14),
              _buildStats(loc),
              const SizedBox(height: 14),
              _buildLog(loc),
            ],
            const SizedBox(height: 16),
            Text(
              loc.pingNote,
              style: TextStyle(
                  fontSize: 11.5, height: 1.4, color: Colors.white.withValues(alpha: 0.35)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTargetCard(AppLocalizations loc) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _kAccent.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _hostCtrl,
            enabled: !_running,
            keyboardType: TextInputType.url,
            autocorrect: false,
            textInputAction: TextInputAction.go,
            onSubmitted: (_) => _start(),
            style: const TextStyle(
                color: Colors.white, fontFamily: 'monospace', fontSize: 17),
            decoration: InputDecoration(
              labelText: loc.pingHostLabel,
              hintText: '192.168.1.1',
              prefixIcon: const Icon(Icons.gps_fixed_rounded, color: _kAccent, size: 20),
              filled: true,
              fillColor: _kField,
              errorText: _unresolved ? loc.pingHostInvalid : null,
              labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.55)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: _kAccent, width: 1.5),
              ),
            ),
          ),
          if (_recent.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final h in _recent)
                  ActionChip(
                    label: Text(h,
                        style: const TextStyle(fontFamily: 'monospace', fontSize: 12)),
                    avatar: Icon(Icons.history_rounded,
                        size: 14, color: Colors.white.withValues(alpha: 0.5)),
                    backgroundColor: Colors.white.withValues(alpha: 0.05),
                    side: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
                    labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.75)),
                    onPressed: _running
                        ? null
                        : () => setState(() => _hostCtrl.text = h),
                  ),
              ],
            ),
          ],
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: SegmentedButton<int>(
                  segments: [
                    const ButtonSegment(value: 4, label: Text('4')),
                    const ButtonSegment(value: 10, label: Text('10')),
                    ButtonSegment(
                        value: 0,
                        label: Text(loc.pingCountContinuous),
                        icon: const Icon(Icons.all_inclusive_rounded, size: 16)),
                  ],
                  selected: {_count},
                  showSelectedIcon: false,
                  onSelectionChanged: _running
                      ? null
                      : (s) => setState(() => _count = s.first),
                  style: ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    foregroundColor: WidgetStateProperty.resolveWith((st) =>
                        st.contains(WidgetState.selected)
                            ? _kBg
                            : Colors.white.withValues(alpha: 0.7)),
                    backgroundColor: WidgetStateProperty.resolveWith((st) =>
                        st.contains(WidgetState.selected) ? _kAccent : Colors.transparent),
                    side: WidgetStatePropertyAll(
                        BorderSide(color: Colors.white.withValues(alpha: 0.15))),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 44,
                child: FilledButton.icon(
                  onPressed: _running ? _stop : _start,
                  icon: Icon(_running ? Icons.stop_rounded : Icons.play_arrow_rounded),
                  label: Text(_running ? loc.pingStop : loc.pingStart,
                      style: const TextStyle(fontWeight: FontWeight.w800)),
                  style: FilledButton.styleFrom(
                    backgroundColor: _running ? _kBad : _kAccent,
                    foregroundColor: _running ? Colors.white : _kBg,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLiveCard(AppLocalizations loc) {
    final last = _results.isEmpty ? null : _results.last;
    final color = last == null ? _kAccent : _latencyColor(last.ms);

    final String big;
    final String unit;
    if (last == null) {
      big = '—';
      unit = '';
    } else if (last.ms == null) {
      big = '✕';
      unit = '';
    } else {
      big = last.ms! < 10 ? last.ms!.toStringAsFixed(1) : last.ms!.toStringAsFixed(0);
      unit = 'ms';
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withValues(alpha: 0.16), _kCard],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withValues(alpha: 0.30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(big,
                  style: TextStyle(
                      fontSize: 48,
                      height: 1,
                      fontWeight: FontWeight.w900,
                      color: color,
                      fontFeatures: const [FontFeature.tabularFigures()])),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(unit,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: color.withValues(alpha: 0.8))),
              ),
              const Spacer(),
              if (_running)
                _Pulse(color: color)
              else if (_resolvedIp != null)
                Text(_resolvedIp!,
                    style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.4))),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _verdict(loc),
            style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
                color: Colors.white.withValues(alpha: 0.80)),
          ),
          const SizedBox(height: 14),
          SizedBox(height: 44, child: _HistoryBars(results: _results)),
        ],
      ),
    );
  }

  String _verdict(AppLocalizations loc) {
    if (_results.isEmpty) return loc.pingIdle;
    if (_received == 0) return loc.pingVerdictDown;
    if (_lossPct > 0) return loc.pingVerdictLossy;
    if ((_avg ?? 0) < 10) return loc.pingVerdictGood;
    return loc.pingVerdictOk;
  }

  Widget _buildStats(AppLocalizations loc) {
    String fmt(double? v) => v == null ? '—' : v.toStringAsFixed(v < 10 ? 1 : 0);
    final items = [
      (loc.pingSent, '$_sent', Colors.white),
      (loc.pingReceived, '$_received', _kGood),
      (loc.pingLoss, '${_lossPct.toStringAsFixed(0)} %', _lossPct > 0 ? _kBad : Colors.white),
      (loc.pingMin, fmt(_min), Colors.white),
      (loc.pingAvg, fmt(_avg), _latencyColor(_avg)),
      (loc.pingMax, fmt(_max), Colors.white),
    ];
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1.9,
      children: [
        for (final (label, value, color) in items)
          Container(
            decoration: BoxDecoration(
              color: _kCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(value,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: color,
                        fontFeatures: const [FontFeature.tabularFigures()])),
                const SizedBox(height: 2),
                Text(label.toUpperCase(),
                    style: TextStyle(
                        fontSize: 9.5,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.40))),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildLog(AppLocalizations loc) {
    final lines = _results.reversed.take(30).toList();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        children: [
          for (final r in lines)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                        color: _latencyColor(r.ms), shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 44,
                    child: Text('#${r.seq + 1}',
                        style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.35))),
                  ),
                  Expanded(
                    child: Text(
                      r.ms == null
                          ? loc.pingTimeout
                          : '${r.ms!.toStringAsFixed(r.ms! < 10 ? 2 : 1)} ms',
                      style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12.5,
                          color: r.ms == null
                              ? _kBad
                              : Colors.white.withValues(alpha: 0.80)),
                    ),
                  ),
                  Text(
                    '${r.at.hour.toString().padLeft(2, '0')}:${r.at.minute.toString().padLeft(2, '0')}:${r.at.second.toString().padLeft(2, '0')}',
                    style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 11,
                        color: Colors.white.withValues(alpha: 0.28)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// ─── Barres d'historique ─────────────────────────────────────────────────────

class _HistoryBars extends StatelessWidget {
  final List<_Result> results;
  const _HistoryBars({required this.results});

  @override
  Widget build(BuildContext context) {
    const maxBars = 40;
    final shown = results.length > maxBars
        ? results.sublist(results.length - maxBars)
        : results;
    final peak = shown
        .where((r) => r.ms != null)
        .fold<double>(10, (m, r) => math.max(m, r.ms!));

    return LayoutBuilder(builder: (context, c) {
      final w = (c.maxWidth - (maxBars - 1) * 3) / maxBars;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 0; i < maxBars; i++) ...[
            if (i > 0) const SizedBox(width: 3),
            Builder(builder: (_) {
              final idx = i - (maxBars - shown.length);
              if (idx < 0) {
                return Container(
                  width: w,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(2),
                  ),
                );
              }
              final r = shown[idx];
              final h = r.ms == null
                  ? c.maxHeight
                  : math.max(4.0, c.maxHeight * (r.ms! / peak));
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: w,
                height: h,
                decoration: BoxDecoration(
                  color: _latencyColor(r.ms)
                      .withValues(alpha: r.ms == null ? 0.35 : 0.85),
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }),
          ],
        ],
      );
    });
  }
}

class _Pulse extends StatefulWidget {
  final Color color;
  const _Pulse({required this.color});

  @override
  State<_Pulse> createState() => _PulseState();
}

class _PulseState extends State<_Pulse> with SingleTickerProviderStateMixin {
  late final _ctrl =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))
        ..repeat();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _ctrl,
        builder: (_, __) => SizedBox(
          width: 22,
          height: 22,
          child: Stack(alignment: Alignment.center, children: [
            Container(
              width: 8 + 14 * _ctrl.value,
              height: 8 + 14 * _ctrl.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color.withValues(alpha: 0.35 * (1 - _ctrl.value)),
              ),
            ),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
            ),
          ]),
        ),
      );
}
