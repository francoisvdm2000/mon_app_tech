import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../app/ui/widgets.dart'; // SectionCard (et autres widgets maison si besoin)

class BpmPage extends StatefulWidget {
  const BpmPage({super.key});

  @override
  State<BpmPage> createState() => _BpmPageState();
}

class _BpmPageState extends State<BpmPage> {
  final TextEditingController _manualBpmController = TextEditingController();
  final List<int> _tapTimesMs = <int>[];

  double? _bpmFromTap;
  double? _bpmManual;

  @override
  void initState() {
    super.initState();
    _manualBpmController.addListener(_onManualChanged);
  }

  @override
  void dispose() {
    _manualBpmController.removeListener(_onManualChanged);
    _manualBpmController.dispose();
    super.dispose();
  }

  String _fmt(num v, {int digits = 1}) {
    final s = v.toStringAsFixed(digits);
    if (digits == 0) return s;
    return s.replaceFirst(RegExp(r'\.?0+$'), '');
  }

  void _onManualChanged() {
    final raw = _manualBpmController.text.trim().replaceAll(',', '.');
    final v = double.tryParse(raw);
    setState(() => _bpmManual = (v != null && v > 0) ? v : null);
  }

  void _tap() {
    final now = DateTime.now().millisecondsSinceEpoch;

    _tapTimesMs.add(now);
    if (_tapTimesMs.length > 8) {
      _tapTimesMs.removeAt(0);
    }

    if (_tapTimesMs.length < 2) {
      setState(() => _bpmFromTap = null);
      return;
    }

    double sum = 0;
    for (int i = 1; i < _tapTimesMs.length; i++) {
      sum += (_tapTimesMs[i] - _tapTimesMs[i - 1]).toDouble();
    }
    final avgMs = sum / (_tapTimesMs.length - 1);

    if (avgMs < 120 || avgMs > 3000) {
      setState(() => _bpmFromTap = null);
      return;
    }

    final bpm = 60000.0 / avgMs;
    setState(() => _bpmFromTap = bpm);
  }

  void _resetTap() {
    setState(() {
      _tapTimesMs.clear();
      _bpmFromTap = null;
    });
  }

  double? get _bpmActive => _bpmManual ?? _bpmFromTap;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottomPad = MediaQuery.of(context).viewPadding.bottom;

    final bpm = _bpmActive;
    final msPerBeat = bpm == null ? null : 60000.0 / bpm;
    final hz = bpm == null ? null : bpm / 60.0;
    final secPerBar44 = bpm == null ? null : (4.0 * 60.0) / bpm;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.bpmTitle),
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottomPad),
          child: Column(
            children: [
              SectionCard(
                title: loc.bpmTapTitle,
                icon: Icons.touch_app_outlined,
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 160,
                            child: ElevatedButton(
                              onPressed: _tap,
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.zero,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.music_note, size: 40),
                                  const SizedBox(height: 6),
                                  Text(
                                    loc.bpmTapButton,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton.icon(
                            onPressed: _resetTap,
                            icon: const Icon(Icons.refresh),
                            label: Text(loc.bpmResetTap),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _BpmBigValue(
                      label: loc.bpmDetectedLabel,
                      value: _bpmFromTap == null
                          ? '—'
                          : _fmt(_bpmFromTap!, digits: 1),
                      subtitle: _bpmFromTap == null ? loc.commonNone : null,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      loc.bpmTapHint,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.65),
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: loc.bpmManualTitle,
                icon: Icons.edit_outlined,
                child: Column(
                  children: [
                    TextField(
                      controller: _manualBpmController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: loc.bpmManualLabel,
                        hintText: loc.bpmManualHint,
                        prefixIcon: const Icon(Icons.speed),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      loc.bpmManualHelp,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.65),
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: loc.bpmConversionsTitle,
                icon: Icons.calculate_outlined,
                child: Column(
                  children: [
                    _ConvRow(
                      label: loc.bpmActiveLabel,
                      value:
                          bpm == null ? loc.commonNone : _fmt(bpm, digits: 1),
                      unit: 'BPM',
                    ),
                    const SizedBox(height: 10),
                    _ConvRow(
                      label: loc.bpmMsPerBeat,
                      value: msPerBeat == null
                          ? loc.commonNone
                          : _fmt(msPerBeat, digits: 0),
                      unit: 'ms',
                    ),
                    const SizedBox(height: 10),
                    _ConvRow(
                      label: loc.bpmHz,
                      value: hz == null ? loc.commonNone : _fmt(hz, digits: 3),
                      unit: 'Hz',
                    ),
                    const SizedBox(height: 10),
                    _ConvRow(
                      label: loc.bpmSecPerBar44,
                      value: secPerBar44 == null
                          ? loc.commonNone
                          : _fmt(secPerBar44, digits: 2),
                      unit: 's',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                loc.bpmDisclaimer,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.38),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConvRow extends StatelessWidget {
  final String label;
  final String value;
  final String unit;

  const _ConvRow({
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B0B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.70),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Colors.white.withValues(alpha: 0.95),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            unit,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.55),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _BpmBigValue extends StatelessWidget {
  final String label;
  final String value;
  final String? subtitle;

  const _BpmBigValue({
    required this.label,
    required this.value,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B0B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.70),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.55),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
