import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../app/ui/widgets.dart'; // SectionCard
import 'laser_calculations.dart';

class LaserBeamSizePage extends StatefulWidget {
  const LaserBeamSizePage({super.key});

  @override
  State<LaserBeamSizePage> createState() => _LaserBeamSizePageState();
}

class _LaserBeamSizePageState extends State<LaserBeamSizePage> {
  final TextEditingController _diameterController = TextEditingController();
  final TextEditingController _divergenceController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();

  double? _d0Mm;
  double? _thetaMrad;
  double? _distanceM;

  @override
  void initState() {
    super.initState();
    _diameterController.addListener(_recompute);
    _divergenceController.addListener(_recompute);
    _distanceController.addListener(_recompute);
  }

  @override
  void dispose() {
    _diameterController.dispose();
    _divergenceController.dispose();
    _distanceController.dispose();
    super.dispose();
  }

  String _fmt(num v, {int digits = 2}) {
    final s = v.toStringAsFixed(digits);
    if (digits == 0) return s;
    return s.replaceFirst(RegExp(r'\.?0+$'), '');
  }

  double? _parse(String raw) {
    return double.tryParse(raw.trim().replaceAll(',', '.'));
  }

  void _recompute() {
    setState(() {
      _d0Mm = _parse(_diameterController.text);
      _thetaMrad = _parse(_divergenceController.text);
      _distanceM = _parse(_distanceController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottomPad = MediaQuery.of(context).viewPadding.bottom;

    final d0Mm = _d0Mm;
    final thetaMrad = _thetaMrad;
    final distM = _distanceM;

    final bool ok = (d0Mm != null && d0Mm > 0) &&
        (thetaMrad != null && thetaMrad > 0) &&
        (distM != null && distM >= 0);

    double? dAtDistMm;
    double? radiusMm;
    double? areaCm2;

    if (ok) {
      final dAtDistM = LaserCalculations.beamDiameterAtDistanceMeter(
        outputDiameterMeter: d0Mm / 1000.0,
        divergenceRad: thetaMrad / 1000.0,
        distanceMeter: distM,
      );

      dAtDistMm = dAtDistM * 1000.0;
      radiusMm = dAtDistMm / 2.0;
      final areaMm2 = 3.141592653589793 * radiusMm * radiusMm;
      areaCm2 = areaMm2 / 100.0;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.laserBeamSizeTitle),
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottomPad),
          child: Column(
            children: [
              SectionCard(
                title: loc.laserBeamInputsTitle,
                icon: Icons.straighten,
                child: Column(
                  children: [
                    TextField(
                      controller: _diameterController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: loc.laserDiameterLabel,
                        hintText: loc.laserDiameterHint,
                        prefixIcon: const Icon(Icons.circle_outlined),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _divergenceController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: loc.laserDivergenceLabel,
                        hintText: loc.laserDivergenceHint,
                        prefixIcon: const Icon(Icons.change_circle_outlined),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _distanceController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: loc.laserBeamDistanceLabel,
                        hintText: loc.laserBeamDistanceHint,
                        prefixIcon: const Icon(Icons.social_distance),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      loc.laserBeamFormulaHint,
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
                title: loc.laserBeamResultsTitle,
                icon: Icons.analytics_outlined,
                child: Column(
                  children: [
                    if (!ok)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          loc.laserInvalidInputs,
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.70)),
                        ),
                      )
                    else ...[
                      _ResultRow(
                        label: loc.laserBeamDiameterAtDistance,
                        value: _fmt(dAtDistMm!, digits: 2),
                        unit: 'mm',
                      ),
                      const SizedBox(height: 10),
                      _ResultRow(
                        label: loc.laserBeamRadiusAtDistance,
                        value: _fmt(radiusMm!, digits: 2),
                        unit: 'mm',
                      ),
                      const SizedBox(height: 10),
                      _ResultRow(
                        label: loc.laserBeamAreaAtDistance,
                        value: _fmt(areaCm2!, digits: 2),
                        unit: 'cm²',
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                loc.laserDisclaimerShort,
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

class _ResultRow extends StatelessWidget {
  final String label;
  final String value;
  final String unit;

  const _ResultRow({
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
