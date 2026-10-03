import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF00E5FF);
const _kMaxDevices = 24;

final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
  final text = newValue.text;
  if (text.isEmpty) return newValue;
  if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
  final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
  if (seps > 1) return oldValue;
  return newValue;
});

/// Classes de puissance PoE standard (IEEE 802.3af/at/bt) : la puissance
/// indiquée est celle allouée côté injecteur/switch (PSE) pour cette
/// classe — c'est cette valeur, et non la puissance réellement garantie à
/// l'appareil une fois les pertes câble déduites, qui compte dans le budget
/// total du switch. Choisir une classe pré-remplit simplement le champ de
/// puissance ; il reste modifiable à la main pour un besoin réel différent.
class _PoeClassOption {
  final int number;
  final double watts;
  final String standard;
  // Nom commercial (imprimé sur la doc/le matériel) correspondant à la
  // norme IEEE : PoE = 802.3af, PoE+ = 802.3at, PoE++ = 802.3bt. Affiché en
  // premier dans le menu car c'est généralement ce que les gens reconnaissent
  // le plus vite, avant le numéro de classe ou la norme elle-même.
  final String badge;
  const _PoeClassOption(this.number, this.watts, this.standard, this.badge);
}

const _kPoeClasses = <_PoeClassOption>[
  _PoeClassOption(0, 15.4, '802.3af', 'PoE'),
  _PoeClassOption(1, 4.0, '802.3af', 'PoE'),
  _PoeClassOption(2, 7.0, '802.3af', 'PoE'),
  _PoeClassOption(3, 15.4, '802.3af', 'PoE'),
  _PoeClassOption(4, 30.0, '802.3at · Type 2', 'PoE+'),
  _PoeClassOption(5, 45.0, '802.3bt · Type 3', 'PoE++'),
  _PoeClassOption(6, 60.0, '802.3bt · Type 3', 'PoE++'),
  _PoeClassOption(7, 75.0, '802.3bt · Type 4', 'PoE++'),
  _PoeClassOption(8, 90.0, '802.3bt · Type 4', 'PoE++'),
];

// Classe 3 (15,4 W, 802.3af) : correspond à l'ancienne valeur par défaut
// unique de ce calculateur, conservée comme réglage initial.
const _kDefaultClassIndex = 3;

String _fmtClassW(double v) =>
    v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1);

class NetworkPoeBudgetPage extends StatefulWidget {
  const NetworkPoeBudgetPage({super.key});

  @override
  State<NetworkPoeBudgetPage> createState() => _NetworkPoeBudgetPageState();
}

class _NetworkPoeBudgetPageState extends State<NetworkPoeBudgetPage> {
  final _budgetCtrl = TextEditingController(text: '130');
  final List<TextEditingController> _deviceControllers = [
    TextEditingController(text: '15.4'),
    TextEditingController(text: '15.4'),
  ];
  // Index dans _kPoeClasses par appareil, ou null si l'appareil a été
  // modifié à la main (valeur ne correspondant plus à une classe standard).
  final List<int?> _deviceClassIndex = [_kDefaultClassIndex, _kDefaultClassIndex];

  @override
  void dispose() {
    _budgetCtrl.dispose();
    for (final c in _deviceControllers) {
      c.dispose();
    }
    super.dispose();
  }

  double? _p(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.').trim());

  void _addDevice() {
    if (_deviceControllers.length >= _kMaxDevices) return;
    setState(() {
      _deviceControllers.add(TextEditingController(text: '15.4'));
      _deviceClassIndex.add(_kDefaultClassIndex);
    });
  }

  void _removeDevice(int index) {
    if (_deviceControllers.length <= 1) return;
    setState(() {
      _deviceControllers.removeAt(index).dispose();
      _deviceClassIndex.removeAt(index);
    });
  }

  void _selectClass(int index, int? classIndex) {
    setState(() {
      _deviceClassIndex[index] = classIndex;
      if (classIndex != null) {
        _deviceControllers[index].text =
            _fmtClassW(_kPoeClasses[classIndex].watts);
      }
    });
  }

  void _onManualEdit(int index) {
    setState(() {
      // Si la valeur tapée à la main ne correspond plus à la puissance de
      // la classe actuellement sélectionnée, on repasse en "Manuel" plutôt
      // que de laisser le menu afficher une classe qui ne correspond plus
      // à ce qui est réellement saisi.
      final classIndex = _deviceClassIndex[index];
      if (classIndex != null) {
        final selectedWatts = _kPoeClasses[classIndex].watts;
        if (_p(_deviceControllers[index]) != selectedWatts) {
          _deviceClassIndex[index] = null;
        }
      }
    });
  }

  double? get _totalConsumption {
    final values = _deviceControllers
        .map(_p)
        .where((v) => v != null && v > 0)
        .cast<double>()
        .toList();
    if (values.isEmpty) return null;
    return values.reduce((a, b) => a + b);
  }

  String _fmtW(double v) {
    if (v == v.roundToDouble()) return '${v.toStringAsFixed(0)} W';
    return '${v.toStringAsFixed(1)} W';
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;
    final budget = _p(_budgetCtrl) ?? 0;
    final total = _totalConsumption;
    final remaining = total == null ? null : budget - total;
    final over = remaining != null && remaining < 0;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.networkPoeTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:network_poe_budget', sectionId: 'main'),
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
            // ── Budget switch/injecteur ─────────────────────────────────────
            _Card(
              icon: Icons.power_rounded,
              title: loc.networkPoeBudgetLabel,
              child: _NumField(
                controller: _budgetCtrl,
                label: loc.networkPoeBudgetLabel,
                hint: '130',
                unit: 'W',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: 14),

            // ── Appareils ────────────────────────────────────────────────────
            _Card(
              icon: Icons.devices_other_rounded,
              title: loc.networkPoeDeviceLabel,
              child: Column(
                children: [
                  for (var i = 0; i < _deviceControllers.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2, bottom: 6),
                                  child: Text(
                                    '${loc.networkPoeDeviceLabel} ${i + 1}',
                                    style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white
                                            .withValues(alpha: 0.55)),
                                  ),
                                ),
                                _PoeClassDropdown(
                                  loc: loc,
                                  value: _deviceClassIndex[i],
                                  onChanged: (idx) => _selectClass(i, idx),
                                ),
                                const SizedBox(height: 8),
                                _NumField(
                                  controller: _deviceControllers[i],
                                  label: loc.networkPoeDevicePowerLabel,
                                  hint: '15.4',
                                  unit: 'W',
                                  onChanged: (_) => _onManualEdit(i),
                                ),
                              ],
                            ),
                          ),
                          if (_deviceControllers.length > 1) ...[
                            const SizedBox(width: 4),
                            IconButton(
                              onPressed: () => _removeDevice(i),
                              icon: Icon(Icons.close_rounded,
                                  color: Colors.white.withValues(alpha: 0.45)),
                            ),
                          ],
                        ],
                      ),
                    ),
                  if (_deviceControllers.length < _kMaxDevices)
                    OutlinedButton.icon(
                      onPressed: _addDevice,
                      icon: const Icon(Icons.add_rounded, size: 18),
                      label: Text(loc.networkPoeAddDevice),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _kAccent,
                        side: BorderSide(color: _kAccent.withValues(alpha: 0.45)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // ── Résultat ─────────────────────────────────────────────────────
            _Card(
              icon: Icons.calculate_outlined,
              title: loc.networkPoeTotalTitle,
              child: total == null
                  ? _EmptyState(message: loc.networkPoeEmptyState)
                  : Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 16),
                          decoration: BoxDecoration(
                            color: (over ? Colors.redAccent : _kAccent)
                                .withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: (over ? Colors.redAccent : _kAccent)
                                    .withValues(alpha: 0.35),
                                width: 1.5),
                          ),
                          child: Text(
                            _fmtW(total),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: over ? Colors.redAccent : _kAccent,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        _BreakdownRow(
                          label: loc.networkPoeRemainingLabel,
                          value: _fmtW(remaining ?? 0),
                          valueColor: over ? Colors.redAccent : Colors.greenAccent,
                        ),
                        if (over) ...[
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.redAccent.withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color:
                                      Colors.redAccent.withValues(alpha: 0.35)),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.warning_amber_rounded,
                                    color: Colors.redAccent, size: 18),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    loc.networkPoeWarningOver,
                                    style: TextStyle(
                                        fontSize: 12.5,
                                        color: Colors.redAccent
                                            .withValues(alpha: 0.90)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
            ),
            const SizedBox(height: 14),
            Text(
              loc.networkPoeFormulaNote,
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

class _BreakdownRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  const _BreakdownRow({required this.label, required this.value, this.valueColor});

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
                  color: valueColor ?? Colors.white.withValues(alpha: 0.80))),
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

class _PoeClassDropdown extends StatelessWidget {
  final AppLocalizations loc;
  final int? value;
  final ValueChanged<int?> onChanged;

  const _PoeClassDropdown({
    required this.loc,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int?>(
      initialValue: value,
      isExpanded: true,
      dropdownColor: const Color(0xFF1B1B29),
      style: const TextStyle(color: Colors.white, fontSize: 13),
      icon: Icon(Icons.expand_more_rounded,
          color: Colors.white.withValues(alpha: 0.45)),
      decoration: InputDecoration(
        labelText: loc.networkPoeClassLabel,
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
        DropdownMenuItem<int?>(
          value: null,
          child: Text(loc.networkPoeClassManual,
              overflow: TextOverflow.ellipsis),
        ),
        for (var i = 0; i < _kPoeClasses.length; i++)
          DropdownMenuItem<int?>(
            value: i,
            child: Text(
              '${_kPoeClasses[i].badge} · ${loc.networkPoeClassWord} '
              '${_kPoeClasses[i].number} · '
              '${_fmtClassW(_kPoeClasses[i].watts)} W',
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
      onChanged: onChanged,
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
