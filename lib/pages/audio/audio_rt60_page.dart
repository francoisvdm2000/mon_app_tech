import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';
import '../shared/result_reveal.dart';

const _kAccent = Color(0xFF00E5FF);

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
  final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (seps > 1) return oldValue;
  return newValue;
});

class _AbsorptionPreset {
  final String Function(AppLocalizations) labelBuilder;
  final double alpha;
  const _AbsorptionPreset(this.labelBuilder, this.alpha);
}

final _absorptionPresets = <_AbsorptionPreset>[
  _AbsorptionPreset((loc) => loc.audioRt60PresetHard, 0.05),
  _AbsorptionPreset((loc) => loc.audioRt60PresetMedium, 0.15),
  _AbsorptionPreset((loc) => loc.audioRt60PresetTreated, 0.30),
  _AbsorptionPreset((loc) => loc.audioRt60PresetAbsorbent, 0.50),
];

class AudioRt60Page extends StatefulWidget {
  const AudioRt60Page({super.key});

  @override
  State<AudioRt60Page> createState() => _AudioRt60PageState();
}

class _AudioRt60PageState extends State<AudioRt60Page> {
  final _lengthCtrl = TextEditingController(text: '10');
  final _widthCtrl = TextEditingController(text: '8');
  final _heightCtrl = TextEditingController(text: '4');
  int _presetIndex = 1;
  final _alphaCtrl = TextEditingController(text: '0.15');

  @override
  void dispose() {
    _lengthCtrl.dispose();
    _widthCtrl.dispose();
    _heightCtrl.dispose();
    _alphaCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final length = _p(_lengthCtrl);
    final width = _p(_widthCtrl);
    final height = _p(_heightCtrl);
    final alpha = (_p(_alphaCtrl) ?? 0).clamp(0.01, 1.0);

    double? volume;
    double? surface;
    double? rt60;
    if (length != null &&
        width != null &&
        height != null &&
        length > 0 &&
        width > 0 &&
        height > 0) {
      volume = length * width * height;
      surface = 2 * (length * width + length * height + width * height);
      final absorption = alpha * surface;
      if (absorption > 0) {
        rt60 = 0.161 * volume / absorption;
      }
    }

    String? qualLabel;
    if (rt60 != null) {
      if (rt60 > 1.5) {
        qualLabel = loc.audioRt60QualLive;
      } else if (rt60 >= 0.4) {
        qualLabel = loc.audioRt60QualComfortable;
      } else {
        qualLabel = loc.audioRt60QualDry;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.audioRt60Title,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_rt60', sectionId: 'main'),
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
            // ── Dimensions ───────────────────────────────────────────────────
            _Card(
              icon: Icons.straighten_rounded,
              title: loc.audioRt60LengthLabel,
              child: Column(
                children: [
                  _NumField(
                    controller: _lengthCtrl,
                    label: loc.audioRt60LengthLabel,
                    hint: '10',
                    unit: 'm',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  _NumField(
                    controller: _widthCtrl,
                    label: loc.audioRt60WidthLabel,
                    hint: '8',
                    unit: 'm',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  _NumField(
                    controller: _heightCtrl,
                    label: loc.audioRt60HeightLabel,
                    hint: '4',
                    unit: 'm',
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Absorption ───────────────────────────────────────────────────
            _Card(
              icon: Icons.blur_on_rounded,
              title: loc.audioRt60AbsorptionLabel,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(_absorptionPresets.length, (i) {
                      final preset = _absorptionPresets[i];
                      final sel = _presetIndex == i;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _presetIndex = i;
                            _alphaCtrl.text = preset.alpha.toStringAsFixed(2);
                          });
                        },
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
                            preset.labelBuilder(loc),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: sel ? _kAccent : Colors.white60,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 12),
                  _NumField(
                    controller: _alphaCtrl,
                    label: loc.audioRt60AbsorptionLabel,
                    hint: '0.15',
                    unit: 'α',
                    onChanged: (_) => setState(() {}),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Résultat ─────────────────────────────────────────────────────
            _Card(
              icon: Icons.calculate_outlined,
              title: loc.audioRt60ResultTitle,
              child: ResultReveal(
                show: rt60 != null,
                child: rt60 == null
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          Container(
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
                                  '${rt60.toStringAsFixed(2)} s',
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color: _kAccent,
                                  ),
                                ),
                                if (qualLabel != null) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    qualLabel,
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                      color: _kAccent.withValues(alpha: 0.80),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          _InfoRow(
                            label: loc.audioRt60VolumeLabel,
                            value: '${volume!.toStringAsFixed(1)} m³',
                          ),
                          _InfoRow(
                            label: loc.audioRt60SurfaceLabel,
                            value: '${surface!.toStringAsFixed(1)} m²',
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              loc.audioRt60FormulaNote,
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

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(
                    fontSize: 12.5, color: Colors.white.withValues(alpha: 0.55))),
          ),
          Text(value,
              style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withValues(alpha: 0.80))),
        ],
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
