import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../app/ui/widgets.dart';

class VideoCameraExposurePage extends StatefulWidget {
  const VideoCameraExposurePage({super.key});

  @override
  State<VideoCameraExposurePage> createState() =>
      _VideoCameraExposurePageState();
}

class _VideoCameraExposurePageState extends State<VideoCameraExposurePage> {
  final _luxCtrl = TextEditingController();
  final _isoCtrl = TextEditingController(text: '800');
  final _shutterCtrl = TextEditingController(text: '0.01'); // 1/100s
  final _apertureCtrl = TextEditingController(text: '2.8');

  String _evOut = '';
  String _apertureOut = '';
  String _shutterOut = '';

  @override
  void initState() {
    super.initState();
    for (final c in [_luxCtrl, _isoCtrl, _shutterCtrl, _apertureCtrl]) {
      c.addListener(_recompute);
    }
    // compute once for default fields (except lux)
    WidgetsBinding.instance.addPostFrameCallback((_) => _recompute());
  }

  @override
  void dispose() {
    for (final c in [_luxCtrl, _isoCtrl, _shutterCtrl, _apertureCtrl]) {
      c.dispose();
    }
    super.dispose();
  }

  double? _parse(String raw) {
    final t = raw.trim().replaceAll(',', '.');
    if (t.isEmpty) return null;
    return double.tryParse(t);
  }

  bool _ok(double? v) => v != null && v > 0;

  String _fmt(double v, {int decimals = 2}) {
    final s = v.toStringAsFixed(decimals);
    if (s.endsWith('.00')) return s.substring(0, s.length - 3);
    if (s.endsWith('.0')) return s.substring(0, s.length - 2);
    return s;
  }

  // Quick field approximation:
  // EV100 ≈ log2(lux / 2.5)
  double? _ev100FromLux(double lux) {
    if (lux <= 0) return null;
    return math.log(lux / 2.5) / math.ln2;
  }

  // EV100 relation with camera exposure:
  // EV100 = log2(N^2 / t) - log2(ISO/100)
  // => N = sqrt(t * 2^(EV100) * ISO/100)
  double? _apertureFromLuxIsoShutter({
    required double lux,
    required double iso,
    required double shutterSec,
  }) {
    final ev100 = _ev100FromLux(lux);
    if (ev100 == null) return null;
    if (iso <= 0 || shutterSec <= 0) return null;
    final factor = math.pow(2.0, ev100) * (iso / 100.0);
    return math.sqrt(shutterSec * factor);
  }

  // t = N^2 / (2^(EV100) * ISO/100)
  double? _shutterFromLuxIsoAperture({
    required double lux,
    required double iso,
    required double aperture,
  }) {
    final ev100 = _ev100FromLux(lux);
    if (ev100 == null) return null;
    if (iso <= 0 || aperture <= 0) return null;
    final denom = math.pow(2.0, ev100) * (iso / 100.0);
    return (aperture * aperture) / denom;
  }

  void _recompute() {
    if (!mounted) return;
    final loc = AppLocalizations.of(context);

    final lux = _parse(_luxCtrl.text);
    final iso = _parse(_isoCtrl.text);
    final shutter = _parse(_shutterCtrl.text);
    final ap = _parse(_apertureCtrl.text);

    String evTxt = loc.videoCamEvEmpty;
    String apTxt = '';
    String shTxt = '';

    if (_ok(lux)) {
      final ev100 = _ev100FromLux(lux!);
      if (ev100 != null) {
        evTxt = loc.videoCamEvValue(_fmt(ev100, decimals: 2));
      }
    }

    // Mode A: aperture
    if (_ok(lux) && _ok(iso) && _ok(shutter)) {
      final n = _apertureFromLuxIsoShutter(
        lux: lux!,
        iso: iso!,
        shutterSec: shutter!,
      );
      if (n != null && n.isFinite && n > 0) {
        apTxt = loc.videoCamApertureResult(_fmt(n, decimals: 2));
      }
    }

    // Mode B: shutter
    if (_ok(lux) && _ok(iso) && _ok(ap)) {
      final t = _shutterFromLuxIsoAperture(
        lux: lux!,
        iso: iso!,
        aperture: ap!,
      );
      if (t != null && t.isFinite && t > 0) {
        final sec = t;
        String frac = '';
        if (sec < 1) {
          final inv = (1 / sec).round();
          if (inv > 0) frac = ' (≈ 1/$inv)';
        }
        shTxt =
            loc.videoCamShutterResult('${_fmt(sec, decimals: 4)}$frac');
      }
    }

    setState(() {
      _evOut = evTxt;
      _apertureOut = apTxt;
      _shutterOut = shTxt;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(title: Text(loc.videoCamPageTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              SectionCard(
                title: loc.videoCamInfoTitle,
                icon: Icons.info_outline,
                child: Text(
                  loc.videoCamIntro,
                  style: const TextStyle(height: 1.25),
                ),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: loc.videoCamInputsTitle,
                icon: Icons.tune,
                child: Column(
                  children: [
                    TextField(
                      controller: _luxCtrl,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [numFormatter],
                      decoration: InputDecoration(
                        labelText: loc.videoCamLuxLabel,
                        hintText: loc.videoCamLuxHint,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _isoCtrl,
                            keyboardType: TextInputType.number,
                            inputFormatters: [numFormatter],
                            decoration: InputDecoration(
                              labelText: loc.videoCamIsoLabel,
                              hintText: loc.videoCamIsoHint,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _shutterCtrl,
                            keyboardType:
                                const TextInputType.numberWithOptions(
                                    decimal: true),
                            inputFormatters: [numFormatter],
                            decoration: InputDecoration(
                              labelText: loc.videoCamShutterLabel,
                              hintText: loc.videoCamShutterHint,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _apertureCtrl,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [numFormatter],
                      decoration: InputDecoration(
                        labelText: loc.videoCamApertureLabel,
                        hintText: loc.videoCamApertureHint,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ResultBox(_evOut.isEmpty ? loc.videoCamEvEmpty : _evOut),
                    if (_apertureOut.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      ResultBox(_apertureOut),
                    ],
                    if (_shutterOut.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      ResultBox(_shutterOut),
                    ],
                    const SizedBox(height: 10),
                    Text(
                      loc.videoCamNote,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.70),
                        fontSize: 12,
                        height: 1.25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
