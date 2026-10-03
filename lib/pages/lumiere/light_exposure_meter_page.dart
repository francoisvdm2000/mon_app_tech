import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';
import '../shared/result_reveal.dart';

const _kAccent = Color(0xFFFFB703); // ambre lumière (identique à lumiere_page.dart)

// Constante d'étalonnage "lumière incidente" ISO (plage usuelle 240–400,
// valeur médiane couramment utilisée par les posemètres du commerce).
const double _kCalibrationConstant = 250;

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
  final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (seps > 1) return oldValue;
  return newValue;
});

class _AperturePreset {
  final double fNumber;
  const _AperturePreset(this.fNumber);
}

const _aperturePresets = [
  _AperturePreset(1.4),
  _AperturePreset(2.0),
  _AperturePreset(2.8),
  _AperturePreset(4.0),
  _AperturePreset(5.6),
  _AperturePreset(8.0),
  _AperturePreset(11.0),
  _AperturePreset(16.0),
];

class _ShutterPreset {
  final double denominator; // vitesse = 1 / denominator (secondes)
  const _ShutterPreset(this.denominator);
}

const _shutterPresets = [
  _ShutterPreset(30),
  _ShutterPreset(60),
  _ShutterPreset(125),
  _ShutterPreset(250),
  _ShutterPreset(500),
  _ShutterPreset(1000),
];

/// Posemètre indicatif : calcule l'éclairement (lux) à partir des réglages
/// d'exposition d'un appareil photo (ISO, vitesse, ouverture) — la méthode
/// classique du posemètre à lumière incidente. Ne nécessite ni caméra ni
/// permission : les valeurs se lisent directement sur l'appareil photo ou
/// sur l'app caméra du téléphone (mode manuel / infos EXIF).
class LightExposureMeterPage extends StatefulWidget {
  const LightExposureMeterPage({super.key});

  @override
  State<LightExposureMeterPage> createState() => _LightExposureMeterPageState();
}

class _LightExposureMeterPageState extends State<LightExposureMeterPage> {
  final _isoCtrl = TextEditingController(text: '100');
  final _apertureCtrl = TextEditingController(text: '5.6');
  final _shutterDenomCtrl = TextEditingController(text: '125');

  @override
  void dispose() {
    _isoCtrl.dispose();
    _apertureCtrl.dispose();
    _shutterDenomCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  String _fmtLux(double lux) {
    if (lux >= 1000) return lux.toStringAsFixed(0);
    if (lux >= 100) return lux.toStringAsFixed(0);
    if (lux >= 10) return lux.toStringAsFixed(1);
    return lux.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final iso = _p(_isoCtrl);
    final aperture = _p(_apertureCtrl);
    final shutterDenom = _p(_shutterDenomCtrl);

    double? lux;
    if (iso != null &&
        iso > 0 &&
        aperture != null &&
        aperture > 0 &&
        shutterDenom != null &&
        shutterDenom > 0) {
      // Lux = (N² × C × vitesse⁻¹_dénominateur) / ISO
      // avec t = 1 / shutterDenom (secondes)
      lux = (aperture * aperture * _kCalibrationConstant * shutterDenom) / iso;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.lightExposureMeterTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:light_exposure_meter', sectionId: 'main'),
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
            // ── ISO ──────────────────────────────────────────────────────
            _Card(
              icon: Icons.iso_rounded,
              title: loc.lightExposureMeterIsoLabel,
              child: _NumField(
                controller: _isoCtrl,
                label: loc.lightExposureMeterIsoLabel,
                hint: '100',
                unit: 'ISO',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),

            // ── Ouverture ────────────────────────────────────────────────
            _Card(
              icon: Icons.camera_rounded,
              title: loc.lightExposureMeterApertureLabel,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _aperturePresets.map((preset) {
                      final sel = aperture == preset.fNumber;
                      return GestureDetector(
                        onTap: () => setState(() {
                          _apertureCtrl.text = preset.fNumber % 1 == 0
                              ? preset.fNumber.toStringAsFixed(0)
                              : preset.fNumber.toStringAsFixed(1);
                        }),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 140),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 9),
                          decoration: BoxDecoration(
                            color: sel
                                ? _kAccent.withValues(alpha: 0.16)
                                : const Color(0xFF0E0E18),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: sel
                                  ? _kAccent
                                  : Colors.white.withValues(alpha: 0.12),
                              width: sel ? 1.5 : 1,
                            ),
                          ),
                          child: Text(
                            'f/${preset.fNumber % 1 == 0 ? preset.fNumber.toStringAsFixed(0) : preset.fNumber.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: sel ? _kAccent : Colors.white60,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),
                  _NumField(
                    controller: _apertureCtrl,
                    label: loc.lightExposureMeterApertureLabel,
                    hint: '5.6',
                    unit: 'f/',
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Vitesse ──────────────────────────────────────────────────
            _Card(
              icon: Icons.shutter_speed_rounded,
              title: loc.lightExposureMeterShutterLabel,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _shutterPresets.map((preset) {
                      final sel = shutterDenom == preset.denominator;
                      return GestureDetector(
                        onTap: () => setState(() {
                          _shutterDenomCtrl.text =
                              preset.denominator.toStringAsFixed(0);
                        }),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 140),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 9),
                          decoration: BoxDecoration(
                            color: sel
                                ? _kAccent.withValues(alpha: 0.16)
                                : const Color(0xFF0E0E18),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: sel
                                  ? _kAccent
                                  : Colors.white.withValues(alpha: 0.12),
                              width: sel ? 1.5 : 1,
                            ),
                          ),
                          child: Text(
                            '1/${preset.denominator.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: sel ? _kAccent : Colors.white60,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),
                  _NumField(
                    controller: _shutterDenomCtrl,
                    label: loc.lightExposureMeterShutterDenomLabel,
                    hint: '125',
                    unit: '1/x s',
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Résultat ─────────────────────────────────────────────────
            _Card(
              icon: Icons.wb_sunny_rounded,
              title: loc.lightExposureMeterResultTitle,
              child: ResultReveal(
                show: lux != null,
                child: lux == null
                    ? const SizedBox.shrink()
                    : Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 16),
                        decoration: BoxDecoration(
                          color: _kAccent.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: _kAccent.withValues(alpha: 0.35),
                              width: 1.5),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '${_fmtLux(lux)} lux',
                              style: const TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: _kAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 14),

            // ── Repères ──────────────────────────────────────────────────
            _Card(
              icon: Icons.bookmark_border_rounded,
              title: loc.lightExposureMeterReferenceTitle,
              child: Column(
                children: [
                  _RefRow(
                      label: loc.lightExposureMeterRefMoonlight,
                      value: '0.1–1 lux'),
                  _RefRow(
                      label: loc.lightExposureMeterRefDimStage,
                      value: '20–100 lux'),
                  _RefRow(
                      label: loc.lightExposureMeterRefOffice,
                      value: '300–500 lux'),
                  _RefRow(
                      label: loc.lightExposureMeterRefOvercast,
                      value: '1 000–2 000 lux'),
                  _RefRow(
                      label: loc.lightExposureMeterRefFollowSpot,
                      value: '2 000–10 000 lux'),
                  _RefRow(
                      label: loc.lightExposureMeterRefSunlight,
                      value: '50 000–100 000 lux'),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              loc.lightExposureMeterFormulaNote,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.28),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RefRow extends StatelessWidget {
  final String label;
  final String value;
  const _RefRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF0E0E18),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(label,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.70))),
            ),
            Text(value,
                style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: _kAccent.withValues(alpha: 0.85))),
          ],
        ),
      ),
    );
  }
}

// ─── Widgets partagés (locaux à cette page) ────────────────────────────────
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

class _NumField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String unit;
  final ValueChanged<String> onChanged;

  const _NumField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.unit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [_numFmt],
      style: const TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixText: unit,
        filled: true,
        fillColor: const Color(0xFF0E0E18),
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
        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.55)),
        suffixStyle: TextStyle(color: Colors.white.withValues(alpha: 0.45)),
      ),
    );
  }
}
