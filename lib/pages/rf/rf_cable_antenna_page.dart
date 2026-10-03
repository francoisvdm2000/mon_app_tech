import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF9C27B0);

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
  final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (seps > 1) return oldValue;
  return newValue;
});

/// Modèle d'atténuation coax : atten(dB/100m) = k1·√f(MHz) + k2·f(MHz)
/// (effet de peau + pertes diélectriques). Coefficients ajustés à partir de
/// valeurs publiées (fabricants, tables de référence usuelles en radioamateur)
/// à 450 MHz et 2400 MHz par câble, puis vérifiés par recoupement à 900 MHz —
/// à ±5 % près des valeurs constructeur sur la plage 100 MHz–2,5 GHz. Ce sont
/// des valeurs TYPIQUES : deux câbles du même nom chez des fabricants
/// différents peuvent varier ; se référer à la datasheet exacte du câble
/// utilisé pour un budget de liaison critique.
class _CoaxType {
  final String name;
  final double k1;
  final double k2;
  const _CoaxType(this.name, this.k1, this.k2);

  double lossPer100m(double freqMhz) =>
      k1 * _sqrtApprox(freqMhz) + k2 * freqMhz;
}

double _sqrtApprox(double v) {
  if (v <= 0) return 0;
  double x = v;
  double guess = v / 2;
  for (var i = 0; i < 20; i++) {
    guess = 0.5 * (guess + x / guess);
  }
  return guess;
}

const _kCoaxTypes = <_CoaxType>[
  _CoaxType('RG-58', 1.2472, 0.018542),
  _CoaxType('RG-8X', 1.1631, 0.007841),
  _CoaxType('RG-213 / RG-8', 0.6438, 0.007650),
  _CoaxType('LMR-195', 0.9801, 0.004910),
  _CoaxType('LMR-400', 0.3924, 0.001279),
];

class RfCableAntennaPage extends StatefulWidget {
  const RfCableAntennaPage({super.key});

  @override
  State<RfCableAntennaPage> createState() => _RfCableAntennaPageState();
}

class _RfCableAntennaPageState extends State<RfCableAntennaPage> {
  int _cableIndex = 2; // RG-213 par défaut : le plus courant en distribution HF
  final _cableFreqCtrl = TextEditingController(text: '500');
  final _lengthCtrl = TextEditingController(text: '30');
  final _diversityFreqCtrl = TextEditingController(text: '500');

  @override
  void dispose() {
    _cableFreqCtrl.dispose();
    _lengthCtrl.dispose();
    _diversityFreqCtrl.dispose();
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  String _fmt(double v, int decimals) => v.toStringAsFixed(decimals);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final cableFreq = _p(_cableFreqCtrl);
    final length = _p(_lengthCtrl);
    final cable = _kCoaxTypes[_cableIndex];
    final lossPer100m =
        (cableFreq != null && cableFreq > 0) ? cable.lossPer100m(cableFreq) : null;
    final totalLoss = (lossPer100m != null && length != null && length >= 0)
        ? lossPer100m * (length / 100.0)
        : null;

    final diversityFreq = _p(_diversityFreqCtrl);
    final wavelengthM =
        (diversityFreq != null && diversityFreq > 0) ? 300.0 / diversityFreq : null;
    final quarterWaveM = wavelengthM != null ? wavelengthM / 4 : null;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.rfCableAntennaTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:rf_cable_antenna', sectionId: 'main'),
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
            // ── Perte câble coaxial ────────────────────────────────────────
            _Card(
              icon: Icons.cable_rounded,
              title: loc.rfCableLossSectionTitle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _CableTypeDropdown(
                    value: _cableIndex,
                    label: loc.rfCableLossCableTypeLabel,
                    onChanged: (i) => setState(() => _cableIndex = i ?? _cableIndex),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _NumField(
                          controller: _cableFreqCtrl,
                          label: loc.rfCableAntennaFrequencyLabel,
                          hint: '500',
                          unit: 'MHz',
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _NumField(
                          controller: _lengthCtrl,
                          label: loc.rfCableLossLengthLabel,
                          hint: '30',
                          unit: 'm',
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  if (totalLoss == null || lossPer100m == null)
                    _EmptyState(message: loc.rfCableAntennaEmptyState)
                  else
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 16),
                      decoration: BoxDecoration(
                        color: _kAccent.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            color: _kAccent.withValues(alpha: 0.35), width: 1.5),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '−${_fmt(totalLoss, 1)} dB',
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: _kAccent,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${loc.rfCableLossResultLabel} · '
                            '${_fmt(lossPer100m, 1)} dB/100 m',
                            style: TextStyle(
                              fontSize: 12.5,
                              color: Colors.white.withValues(alpha: 0.55),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              loc.rfCableLossFormulaNote,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.28),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 18),

            // ── Espacement antennes diversity ───────────────────────────────
            _Card(
              icon: Icons.settings_input_antenna_rounded,
              title: loc.rfDiversitySectionTitle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _NumField(
                    controller: _diversityFreqCtrl,
                    label: loc.rfCableAntennaFrequencyLabel,
                    hint: '500',
                    unit: 'MHz',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 14),
                  if (quarterWaveM == null || wavelengthM == null)
                    _EmptyState(message: loc.rfCableAntennaEmptyState)
                  else
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 16),
                      decoration: BoxDecoration(
                        color: _kAccent.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            color: _kAccent.withValues(alpha: 0.35), width: 1.5),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${_fmt(quarterWaveM * 100, 1)} cm',
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: _kAccent,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${loc.rfDiversityResultLabel} · λ = '
                            '${_fmt(wavelengthM, 2)} m',
                            style: TextStyle(
                              fontSize: 12.5,
                              color: Colors.white.withValues(alpha: 0.55),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              loc.rfDiversityFormulaNote,
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

class _CableTypeDropdown extends StatelessWidget {
  final int value;
  final String label;
  final ValueChanged<int?> onChanged;

  const _CableTypeDropdown({
    required this.value,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      initialValue: value,
      isExpanded: true,
      dropdownColor: const Color(0xFF1B1B29),
      style: const TextStyle(color: Colors.white, fontSize: 13),
      icon: Icon(Icons.expand_more_rounded,
          color: Colors.white.withValues(alpha: 0.45)),
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        filled: true,
        fillColor: const Color(0xFF0E0E18),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
      ),
      items: [
        for (var i = 0; i < _kCoaxTypes.length; i++)
          DropdownMenuItem<int>(
            value: i,
            child: Text(_kCoaxTypes[i].name, overflow: TextOverflow.ellipsis),
          ),
      ],
      onChanged: onChanged,
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

class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(Icons.info_outline_rounded,
              color: Colors.white.withValues(alpha: 0.30), size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(message,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.40), fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
