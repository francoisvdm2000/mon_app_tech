import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';
import 'engine/hoist_library.dart';
import 'engine/rigging_truss_engine.dart';
import 'engine/truss_library.dart';
import 'widgets/rigging_result_card.dart';
import 'widgets/rigging_truss_diagram.dart';

/// Charge par moteur : truss suspendu à 2–6 moteurs.
///
/// - 2 moteurs : statique exacte (système isostatique).
/// - 3+ moteurs : répartition théorique d'une poutre continue, moteurs
///   supposés parfaitement à niveau → gros avertissement dans l'UI.
/// - Vérification truss optionnelle : moment max comparé à la valeur
///   admissible relevée dans le tableau fabricant (UDL ou CPL).
class RiggingTrussLoadPage extends StatefulWidget {
  const RiggingTrussLoadPage({super.key});

  @override
  State<RiggingTrussLoadPage> createState() => _RiggingTrussLoadPageState();
}

class _PointLoadRow {
  _PointLoadRow(String position, String mass)
      : position = TextEditingController(text: position),
        mass = TextEditingController(text: mass);

  final TextEditingController position;
  final TextEditingController mass;

  void dispose() {
    position.dispose();
    mass.dispose();
  }
}

class _RiggingTrussLoadPageState extends State<RiggingTrussLoadPage> {
  static const int _maxMotors = 6;
  static const List<int> _motorOptions = [2, 3, 4, 5, 6];

  final _lengthController = TextEditingController(text: '8');
  final _selfWeightController = TextEditingController(text: '5');
  final _extraUdlController = TextEditingController(text: '2');
  final _fixtureCountController = TextEditingController(text: '6');
  final _fixtureWeightController = TextEditingController(text: '25');
  final _extraPerMotorController = TextEditingController(text: '10');
  final _wllController = TextEditingController(text: '500');
  final _dynamicController = TextEditingController(text: '1.2');
  final _allowableController = TextEditingController();

  /// Always [_maxMotors] controllers; only the first [_motorCount] are shown.
  final List<TextEditingController> _motorControllers =
      List.generate(_maxMotors, (_) => TextEditingController());

  final List<_PointLoadRow> _pointLoads = [];

  int _motorCount = 2;
  TrussAllowableType _allowableType = TrussAllowableType.udl;

  /// Truss chosen in the library (null = manual allowable value).
  final List<TrussModel> _models = TrussLibrary.available();
  TrussModel? _model;

  /// Hoist chosen in the library (null = manual WLL).
  final List<HoistModel> _hoists = HoistLibrary.available();
  HoistModel? _hoist;

  @override
  void initState() {
    super.initState();
    _spreadMotors();
  }

  @override
  void dispose() {
    for (final c in [
      _lengthController,
      _selfWeightController,
      _extraUdlController,
      _fixtureCountController,
      _fixtureWeightController,
      _extraPerMotorController,
      _wllController,
      _dynamicController,
      _allowableController,
      ..._motorControllers,
    ]) {
      c.dispose();
    }
    for (final row in _pointLoads) {
      row.dispose();
    }
    super.dispose();
  }

  /// Hoists evenly spaced from one end of the truss to the other.
  void _spreadMotors() {
    final length = _parseNumber(_lengthController.text) ?? 0;
    for (var k = 0; k < _motorCount; k++) {
      final x = length * k / (_motorCount - 1);
      _motorControllers[k].text = _formatNumber(x, decimals: 2);
    }
  }

  // ── Calculation ─────────────────────────────────────────────────────────

  List<TrussPointLoad> _allPointLoads(double length) {
    final loads = <TrussPointLoad>[];
    final count = (_parseNumber(_fixtureCountController.text) ?? 0).round();
    final unit = _parseNumber(_fixtureWeightController.text) ?? 0;
    if (count > 0 && unit > 0 && length > 0) {
      for (var k = 0; k < count; k++) {
        loads.add(TrussPointLoad(length * (k + 0.5) / count, unit));
      }
    }
    for (final row in _pointLoads) {
      final p = _parseNumber(row.position.text);
      final m = _parseNumber(row.mass.text);
      if (p != null && m != null) loads.add(TrussPointLoad(p, m));
    }
    return loads;
  }

  ({TrussLoadInput? input, TrussLoadResult? result}) _calculate() {
    final length = _parseNumber(_lengthController.text);
    final selfWeight = _parseNumber(_selfWeightController.text);
    final wll = _parseNumber(_wllController.text);
    final dynamicFactor = _parseNumber(_dynamicController.text);
    final positions = <double>[];
    for (var k = 0; k < _motorCount; k++) {
      final x = _parseNumber(_motorControllers[k].text);
      if (x == null) return (input: null, result: null);
      positions.add(x);
    }
    if (length == null ||
        selfWeight == null ||
        wll == null ||
        dynamicFactor == null) {
      return (input: null, result: null);
    }
    final input = TrussLoadInput(
      lengthM: length,
      selfWeightKgPerM: selfWeight,
      extraUdlKgPerM: _parseNumber(_extraUdlController.text) ?? 0,
      motorPositionsM: positions,
      pointLoads: _allPointLoads(length),
      extraPerMotorKg: _parseNumber(_extraPerMotorController.text) ?? 0,
      dynamicFactor: dynamicFactor,
      motorWllKg: wll,
      allowableType: _allowableType,
      allowableValue: _model == null
          ? _parseNumber(_allowableController.text)
          : _model!.allowableFor(_largestSpan(positions), _allowableType),
      allowableIsNetOfSelfWeight: _model?.allowableIsNetOfSelfWeight ?? false,
    );
    return (input: input, result: RiggingTrussEngine.compute(input));
  }

  double _largestSpan(List<double> positions) {
    var span = 0.0;
    for (var k = 1; k < positions.length; k++) {
      final d = positions[k] - positions[k - 1];
      if (d > span) span = d;
    }
    return span;
  }

  // ── UI ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final calc = _calculate();
    final input = calc.input;
    final result = calc.result;
    final valid = input != null && result != null && result.isValid;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.riggingToolTrussLoadTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:rigging_truss_load', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          _trussCard(loc),
          const SizedBox(height: 14),
          _motorsCard(loc),
          const SizedBox(height: 14),
          _loadsCard(loc),
          const SizedBox(height: 14),
          _checkCard(loc, valid ? result.largestSpanM : null),
          const SizedBox(height: 14),
          RiggingResultCard(
            title: loc.riggingResultsTitle,
            icon: Icons.fact_check_outlined,
            children: valid
                ? _results(loc, input, result)
                : [
                    Text(
                      loc.riggingTrussInvalidInput,
                      style: const TextStyle(
                          color: Colors.orangeAccent, height: 1.3),
                    ),
                  ],
          ),
          const SizedBox(height: 14),
          _note(loc.riggingTrussDisclaimer, Icons.shield_outlined,
              strong: true),
        ],
      ),
    );
  }

  Widget _trussCard(AppLocalizations loc) {
    return RiggingResultCard(
      title: loc.riggingTrussSectionTruss,
      icon: Icons.linear_scale,
      children: [
        _numberField(
          controller: _lengthController,
          label: loc.riggingTrussLengthLabel,
          suffix: loc.riggingUnitMeters,
        ),
        const SizedBox(height: 12),
        _numberField(
          controller: _selfWeightController,
          label: loc.riggingTrussSelfWeightLabel,
          suffix: loc.riggingUnitKgPerMeter,
          // A self-weight typed by hand no longer matches the chosen truss.
          onEdited: () => _model = null,
        ),
        const SizedBox(height: 12),
        _numberField(
          controller: _extraUdlController,
          label: loc.riggingTrussExtraUdlLabel,
          suffix: loc.riggingUnitKgPerMeter,
        ),
      ],
    );
  }

  Widget _hoistPicker(AppLocalizations loc) {
    final hoist = _hoist;
    final hintStyle = TextStyle(
      color: Colors.white.withValues(alpha: 0.5),
      fontSize: 12,
      height: 1.3,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputDecorator(
          decoration: InputDecoration(
            labelText: loc.riggingHoistModelLabel,
            filled: true,
            fillColor: const Color(0xFF141418),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: hoist?.id ?? '',
              isExpanded: true,
              items: [
                DropdownMenuItem(
                  value: '',
                  child: Text(loc.riggingHoistModelManual),
                ),
                for (final h in _hoists)
                  DropdownMenuItem(
                    value: h.id,
                    child: Text(
                      h.validated
                          ? h.displayName
                          : '${h.displayName} (${loc.riggingTrussModelUnchecked})',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
              onChanged: (id) => setState(() {
                _hoist =
                    (id == null || id.isEmpty) ? null : HoistLibrary.byId(id);
                final h = _hoist;
                if (h != null) {
                  _wllController.text = _formatNumber(h.wllKg, decimals: 0);
                }
              }),
            ),
          ),
        ),
        if (hoist != null) ...[
          const SizedBox(height: 8),
          if (hoist.hoistClass.isNotEmpty)
            Text(loc.riggingHoistModelClassNote(hoist.hoistClass),
                style: hintStyle),
          if (hoist.weightKg != null && hoist.chainKgPerM != null) ...[
            const SizedBox(height: 4),
            Text(
              loc.riggingHoistModelWeights(
                _formatNumber(hoist.weightKg!, decimals: 1),
                _formatNumber(hoist.chainKgPerM!, decimals: 2),
              ),
              style: hintStyle,
            ),
          ],
        ],
      ],
    );
  }

  Widget _motorsCard(AppLocalizations loc) {
    return RiggingResultCard(
      title: loc.riggingTrussSectionMotors,
      icon: Icons.precision_manufacturing_outlined,
      children: [
        _smallLabel(loc.riggingTrussMotorCountLabel),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _motorOptions.map((n) {
            final selected = _motorCount == n;
            return GestureDetector(
              onTap: () => setState(() {
                _motorCount = n;
                _spreadMotors();
              }),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 140),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: selected
                      ? Colors.amber.withValues(alpha: 0.16)
                      : const Color(0xFF141418),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selected ? Colors.amber : Colors.white24,
                    width: selected ? 1.5 : 1,
                  ),
                ),
                child: Text(
                  '$n',
                  style: TextStyle(
                    color: selected ? Colors.amber : Colors.white54,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        for (var k = 0; k < _motorCount; k++) ...[
          _numberField(
            controller: _motorControllers[k],
            label: loc.riggingTrussMotorPositionLabel(k + 1),
            suffix: loc.riggingUnitMeters,
          ),
          const SizedBox(height: 10),
        ],
        Row(
          children: [
            Expanded(
              child: Text(
                loc.riggingTrussPositionsHint,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 12,
                  height: 1.3,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () => setState(_spreadMotors),
              icon: const Icon(Icons.align_horizontal_center, size: 18),
              label: Text(loc.riggingTrussSpreadMotors),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _hoistPicker(loc),
        const SizedBox(height: 12),
        _numberField(
          controller: _wllController,
          label: loc.riggingTrussMotorWllLabel,
          suffix: loc.riggingUnitKg,
          // A WLL typed by hand no longer matches the chosen hoist.
          onEdited: () => _hoist = null,
        ),
        const SizedBox(height: 12),
        _numberField(
          controller: _extraPerMotorController,
          label: loc.riggingTrussExtraPerMotorLabel,
          suffix: loc.riggingUnitKg,
        ),
        const SizedBox(height: 12),
        _numberField(
          controller: _dynamicController,
          label: loc.riggingTrussDynamicFactorLabel,
          suffix: '×',
        ),
      ],
    );
  }

  Widget _loadsCard(AppLocalizations loc) {
    return RiggingResultCard(
      title: loc.riggingTrussSectionLoads,
      icon: Icons.lightbulb_outline,
      children: [
        Row(
          children: [
            Expanded(
              child: _numberField(
                controller: _fixtureCountController,
                label: loc.riggingTrussFixtureCountLabel,
                suffix: '',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _numberField(
                controller: _fixtureWeightController,
                label: loc.riggingTrussFixtureWeightLabel,
                suffix: loc.riggingUnitKg,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _smallLabel(loc.riggingTrussPointLoadsLabel),
        const SizedBox(height: 8),
        for (var k = 0; k < _pointLoads.length; k++) ...[
          Row(
            children: [
              Expanded(
                child: _numberField(
                  controller: _pointLoads[k].position,
                  label: loc.riggingTrussPositionLabel,
                  suffix: loc.riggingUnitMeters,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _numberField(
                  controller: _pointLoads[k].mass,
                  label: loc.riggingTrussMassLabel,
                  suffix: loc.riggingUnitKg,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.white54),
                onPressed: () {
                  final row = _pointLoads.removeAt(k);
                  setState(() {});
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => row.dispose());
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () {
              final length = _parseNumber(_lengthController.text) ?? 0;
              setState(() => _pointLoads.add(
                    _PointLoadRow(_formatNumber(length / 2, decimals: 2), '50'),
                  ));
            },
            icon: const Icon(Icons.add),
            label: Text(loc.riggingTrussAddPointLoad),
          ),
        ),
      ],
    );
  }

  Widget _checkCard(AppLocalizations loc, double? largestSpan) {
    final model = _model;
    final tableRow = (model == null || largestSpan == null)
        ? null
        : model.rowFor(largestSpan);
    final tableValue = (model == null || largestSpan == null)
        ? null
        : model.allowableFor(largestSpan, _allowableType);
    final unit = _allowableType == TrussAllowableType.udl
        ? loc.riggingUnitKgPerMeter
        : loc.riggingUnitKg;
    final hintStyle = TextStyle(
      color: Colors.white.withValues(alpha: 0.5),
      fontSize: 12,
      height: 1.3,
    );

    return RiggingResultCard(
      title: loc.riggingTrussSectionCheck,
      icon: Icons.table_chart_outlined,
      children: [
        InputDecorator(
          decoration: InputDecoration(
            labelText: loc.riggingTrussModelLabel,
            filled: true,
            fillColor: const Color(0xFF141418),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: model?.id ?? '',
              isExpanded: true,
              items: [
                DropdownMenuItem(
                  value: '',
                  child: Text(loc.riggingTrussModelManual),
                ),
                for (final m in _models)
                  DropdownMenuItem(
                    value: m.id,
                    child: Text(
                      m.validated
                          ? m.displayName
                          : '${m.displayName} (${loc.riggingTrussModelUnchecked})',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
              onChanged: (id) => setState(() {
                _model =
                    (id == null || id.isEmpty) ? null : TrussLibrary.byId(id);
                final m = _model;
                if (m != null) {
                  _selfWeightController.text =
                      _formatNumber(m.weightKgPerM, decimals: 1);
                }
              }),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SegmentedButton<TrussAllowableType>(
          segments: [
            ButtonSegment(
              value: TrussAllowableType.udl,
              label: Text(loc.riggingTrussAllowableUdl),
            ),
            ButtonSegment(
              value: TrussAllowableType.cpl,
              label: Text(loc.riggingTrussAllowableCpl),
            ),
          ],
          selected: {_allowableType},
          onSelectionChanged: (v) => setState(() => _allowableType = v.first),
          showSelectedIcon: false,
        ),
        const SizedBox(height: 12),
        if (model == null) ...[
          _numberField(
            controller: _allowableController,
            label: loc.riggingTrussAllowableValueLabel(
              largestSpan == null
                  ? '–'
                  : _formatNumber(largestSpan, decimals: 2),
            ),
            suffix: unit,
          ),
          const SizedBox(height: 8),
          Text(loc.riggingTrussAllowableHint, style: hintStyle),
        ] else ...[
          if (tableRow == null || tableValue == null)
            Text(
              loc.riggingTrussOutOfTable,
              style: const TextStyle(color: Colors.orangeAccent, height: 1.3),
            )
          else
            RiggingValueRow(
              label: loc.riggingTrussTableValueLabel(
                _formatNumber(tableRow.spanM, decimals: 0),
              ),
              value: '${_formatNumber(tableValue, decimals: 1)} $unit',
            ),
          const SizedBox(height: 8),
          if (!model.validated) ...[
            Text(
              loc.riggingTrussUncheckedNote,
              style: const TextStyle(
                color: Colors.orangeAccent,
                fontSize: 12,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 6),
          ],
          Text(loc.riggingTrussTableSource(model.source), style: hintStyle),
          const SizedBox(height: 4),
          Text(
            model.allowableIsNetOfSelfWeight
                ? loc.riggingTrussNetNote
                : loc.riggingTrussGrossNote,
            style: hintStyle,
          ),
        ],
      ],
    );
  }

  List<Widget> _results(
    AppLocalizations loc,
    TrussLoadInput input,
    TrussLoadResult r,
  ) {
    final maxUtil = r.maxMotorUtilisation;
    final String statusLabel;
    final String statusDescription;
    final Color statusColor;
    if (r.uplift) {
      statusLabel = loc.riggingStatusDanger;
      statusDescription = loc.riggingTrussUpliftDescription;
      statusColor = Colors.redAccent;
    } else if (maxUtil > 1) {
      statusLabel = loc.riggingStatusDanger;
      statusDescription = loc.riggingTrussOverloadDescription;
      statusColor = Colors.redAccent;
    } else if (maxUtil > 0.8) {
      statusLabel = loc.riggingStatusWatch;
      statusDescription = loc.riggingTrussWatchDescription;
      statusColor = Colors.orangeAccent;
    } else {
      statusLabel = loc.riggingStatusOk;
      statusDescription = loc.riggingTrussOkDescription;
      statusColor = Colors.greenAccent;
    }

    final trussUtil = r.trussUtilisation;

    return [
      RiggingStatusBanner(
        label: statusLabel,
        description: statusDescription,
        color: statusColor,
        icon: statusColor == Colors.greenAccent
            ? Icons.check_circle_outline
            : Icons.warning_amber_rounded,
      ),
      const SizedBox(height: 14),
      RiggingTrussDiagram(
        lengthM: input.lengthM,
        motorPositionsM: input.motorPositionsM,
        motorColors: [
          for (final m in r.motors)
            m.reactionKg < 0 ? Colors.redAccent : _utilColor(m.utilisation),
        ],
        motorLabels: [
          for (final m in r.motors) _formatNumber(m.designKg, decimals: 0),
        ],
        loadPositionsM: [for (final p in input.pointLoads) p.positionM],
      ),
      const SizedBox(height: 6),
      for (var k = 0; k < r.motors.length; k++)
        RiggingValueRow(
          label: loc.riggingTrussMotorResultLabel(
            k + 1,
            _formatNumber(r.motors[k].positionM, decimals: 2),
          ),
          value: '${_formatNumber(r.motors[k].designKg, decimals: 1)} '
              '${loc.riggingUnitKg} · '
              '${_formatNumber(r.motors[k].designKn, decimals: 2)} '
              '${loc.riggingUnitKn} · '
              '${_formatNumber(r.motors[k].utilisation * 100, decimals: 0)} %',
          color: r.motors[k].reactionKg < 0
              ? Colors.redAccent
              : _utilColor(r.motors[k].utilisation),
        ),
      const Divider(height: 20, color: Colors.white12),
      RiggingValueRow(
        label: loc.riggingTrussTotalLoadLabel,
        value: '${_formatNumber(r.totalDesignKg, decimals: 1)} '
            '${loc.riggingUnitKg}',
      ),
      RiggingValueRow(
        label: loc.riggingTrussLargestSpanLabel,
        value: '${_formatNumber(r.largestSpanM, decimals: 2)} '
            '${loc.riggingUnitMeters}',
      ),
      RiggingValueRow(
        label: loc.riggingTrussMaxMomentLabel(
          _formatNumber(r.maxMomentPositionM, decimals: 2),
        ),
        value: '${_formatNumber(r.maxMomentKnm, decimals: 2)} '
            '${loc.riggingUnitKnm}',
      ),
      if (trussUtil != null)
        RiggingValueRow(
          label: loc.riggingTrussUsageLabel,
          value: '${_formatNumber(trussUtil * 100, decimals: 0)} %',
          color: _utilColor(trussUtil),
        ),
      if (r.isHyperstatic) ...[
        const SizedBox(height: 12),
        _note(loc.riggingTrussHyperstaticWarning, Icons.warning_amber_rounded,
            color: Colors.orangeAccent),
      ],
      if (r.hasCantilever) ...[
        const SizedBox(height: 10),
        _note(loc.riggingTrussCantileverNote, Icons.info_outline),
      ],
      if (trussUtil != null) ...[
        const SizedBox(height: 10),
        _note(loc.riggingTrussCheckNote, Icons.info_outline),
      ],
    ];
  }

  // ── Helpers ─────────────────────────────────────────────────────────────

  Color _utilColor(double u) {
    if (u > 1) return Colors.redAccent;
    if (u > 0.8) return Colors.orangeAccent;
    return Colors.greenAccent;
  }

  Widget _smallLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withValues(alpha: 0.72),
        fontSize: 13,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _note(String text, IconData icon,
      {Color? color, bool strong = false}) {
    final c = color ?? Colors.white;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color == null
            ? Colors.white.withValues(alpha: strong ? 0.05 : 0.03)
            : c.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color == null
              ? Colors.white.withValues(alpha: strong ? 0.14 : 0.08)
              : c.withValues(alpha: 0.45),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon,
              color: color ?? Colors.white.withValues(alpha: 0.45), size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: strong ? 12.5 : 11.5,
                color: color != null
                    ? Colors.white.withValues(alpha: 0.8)
                    : Colors.white.withValues(alpha: strong ? 0.7 : 0.5),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberField({
    required TextEditingController controller,
    required String label,
    required String suffix,
    VoidCallback? onEdited,
  }) {
    return TextField(
      controller: controller,
      onChanged: (_) => setState(() => onEdited?.call()),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9\.,]')),
      ],
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffix.isEmpty ? null : suffix,
        filled: true,
        fillColor: const Color(0xFF141418),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

double? _parseNumber(String value) {
  return double.tryParse(value.trim().replaceAll(',', '.'));
}

String _formatNumber(double value, {int decimals = 2}) {
  return value.toStringAsFixed(decimals);
}
