// Calculateur de volume — cube, pavé droit, cylindre, sphère, cône, pyramide.
// Style aligné sur les autres cartes de conversions_page.dart.
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';

const _kAccentVolume = Color(0xFF06D6A0);

enum _VolumeShape { cube, box, cylinder, sphere, cone, squarePyramid }

IconData _shapeIcon(_VolumeShape s) {
  switch (s) {
    case _VolumeShape.cube:
      return Icons.crop_square;
    case _VolumeShape.box:
      return Icons.view_in_ar;
    case _VolumeShape.cylinder:
      return Icons.circle_outlined;
    case _VolumeShape.sphere:
      return Icons.blur_circular;
    case _VolumeShape.cone:
      return Icons.change_history;
    case _VolumeShape.squarePyramid:
      return Icons.signpost;
  }
}

String _shapeLabel(AppLocalizations loc, _VolumeShape s) {
  switch (s) {
    case _VolumeShape.cube:
      return loc.volumeShapeCube;
    case _VolumeShape.box:
      return loc.volumeShapeBox;
    case _VolumeShape.cylinder:
      return loc.volumeShapeCylinder;
    case _VolumeShape.sphere:
      return loc.volumeShapeSphere;
    case _VolumeShape.cone:
      return loc.volumeShapeCone;
    case _VolumeShape.squarePyramid:
      return loc.volumeShapeSquarePyramid;
  }
}

enum _FieldKind { side, length, width, height, radius, radiusBase, sideBase }

String _fieldLabel(AppLocalizations loc, _FieldKind k) {
  switch (k) {
    case _FieldKind.side:
      return loc.volumeFieldSide;
    case _FieldKind.length:
      return loc.volumeFieldLength;
    case _FieldKind.width:
      return loc.volumeFieldWidth;
    case _FieldKind.height:
      return loc.volumeFieldHeight;
    case _FieldKind.radius:
      return loc.volumeFieldRadius;
    case _FieldKind.radiusBase:
      return loc.volumeFieldRadiusBase;
    case _FieldKind.sideBase:
      return loc.volumeFieldSideBase;
  }
}

// Les unités de mesure (mm, cm, m, inch, ft) restent volontairement non
// traduites, comme les autres unités techniques de conversions_page.dart.
enum _LengthUnit {
  mm('mm', 0.001),
  cm('cm', 0.01),
  m('m', 1.0),
  inch('inch', 0.0254),
  ft('ft', 0.3048);

  const _LengthUnit(this.label, this.toMeters);
  final String label;
  final double toMeters;
}

class VolumeCalculatorCard extends StatefulWidget {
  const VolumeCalculatorCard({super.key});

  @override
  State<VolumeCalculatorCard> createState() => _VolumeCalculatorCardState();
}

class _VolumeCalculatorCardState extends State<VolumeCalculatorCard> {
  _VolumeShape _shape = _VolumeShape.cube;
  _LengthUnit _unit = _LengthUnit.cm;

  // Contrôleurs génériques réutilisés selon la forme sélectionnée.
  final Map<String, TextEditingController> _controllers = {
    'a': TextEditingController(),
    'b': TextEditingController(),
    'c': TextEditingController(),
    'r': TextEditingController(),
    'h': TextEditingController(),
  };

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  double? _val(String key) {
    final raw = _controllers[key]!.text.replaceAll(',', '.').trim();
    if (raw.isEmpty) return null;
    return double.tryParse(raw);
  }

  List<_ShapeField> get _fields {
    switch (_shape) {
      case _VolumeShape.cube:
        return [const _ShapeField('a', _FieldKind.side)];
      case _VolumeShape.box:
        return [
          const _ShapeField('a', _FieldKind.length),
          const _ShapeField('b', _FieldKind.width),
          const _ShapeField('c', _FieldKind.height),
        ];
      case _VolumeShape.cylinder:
        return [
          const _ShapeField('r', _FieldKind.radius),
          const _ShapeField('h', _FieldKind.height),
        ];
      case _VolumeShape.sphere:
        return [const _ShapeField('r', _FieldKind.radius)];
      case _VolumeShape.cone:
        return [
          const _ShapeField('r', _FieldKind.radiusBase),
          const _ShapeField('h', _FieldKind.height),
        ];
      case _VolumeShape.squarePyramid:
        return [
          const _ShapeField('a', _FieldKind.sideBase),
          const _ShapeField('h', _FieldKind.height),
        ];
    }
  }

  /// Volume en m³, ou null tant que les champs ne sont pas tous remplis.
  double? get _volumeM3 {
    final unitFactor = _unit.toMeters;
    double? m(String key) {
      final v = _val(key);
      if (v == null) return null;
      return v * unitFactor;
    }

    switch (_shape) {
      case _VolumeShape.cube:
        final a = m('a');
        if (a == null) return null;
        return a * a * a;
      case _VolumeShape.box:
        final a = m('a'), b = m('b'), c = m('c');
        if (a == null || b == null || c == null) return null;
        return a * b * c;
      case _VolumeShape.cylinder:
        final r = m('r'), h = m('h');
        if (r == null || h == null) return null;
        return math.pi * r * r * h;
      case _VolumeShape.sphere:
        final r = m('r');
        if (r == null) return null;
        return (4.0 / 3.0) * math.pi * r * r * r;
      case _VolumeShape.cone:
        final r = m('r'), h = m('h');
        if (r == null || h == null) return null;
        return (1.0 / 3.0) * math.pi * r * r * h;
      case _VolumeShape.squarePyramid:
        final a = m('a'), h = m('h');
        if (a == null || h == null) return null;
        return (1.0 / 3.0) * a * a * h;
    }
  }

  String _fmt(double value, int decimals) {
    if (value.isNaN || value.isInfinite) return '—';
    var s = value.toStringAsFixed(decimals);
    if (s.contains('.')) {
      s = s.replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
    }
    return s.replaceAll('.', ',');
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final volume = _volumeM3;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  loc.volumeCalcCardTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              Icon(_shapeIcon(_shape), color: _kAccentVolume, size: 18),
            ],
          ),
          const SizedBox(height: 12),

          // Sélecteur de forme (chips ludiques)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _VolumeShape.values.map((s) {
              final selected = s == _shape;
              return ChoiceChip(
                label: Text(_shapeLabel(loc, s)),
                avatar: Icon(
                  _shapeIcon(s),
                  size: 16,
                  color: selected ? Colors.black : Colors.white70,
                ),
                selected: selected,
                onSelected: (_) => setState(() => _shape = s),
                selectedColor: _kAccentVolume,
                backgroundColor: Colors.white.withValues(alpha: 0.06),
                labelStyle: TextStyle(
                  color: selected ? Colors.black : Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.5,
                ),
                side: BorderSide(
                  color: selected
                      ? _kAccentVolume
                      : Colors.white.withValues(alpha: 0.12),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 14),

          // Unité d'entrée
          Row(
            children: [
              Text(
                loc.volumeCalcUnitLabel,
                style: const TextStyle(color: Colors.white54, fontSize: 12.5),
              ),
              const Spacer(),
              SizedBox(
                width: 110,
                child: DropdownButtonFormField<_LengthUnit>(
                  initialValue: _unit,
                  isExpanded: true,
                  dropdownColor: Theme.of(context).cardColor,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    isDense: true,
                  ),
                  items: _LengthUnit.values
                      .map((u) => DropdownMenuItem(
                            value: u,
                            child: Text(u.label,
                                style: const TextStyle(color: Colors.white)),
                          ))
                      .toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _unit = v);
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Champs dynamiques selon la forme
          ..._fields.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: _controllers[f.key],
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  onChanged: (_) => setState(() {}),
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: '${_fieldLabel(loc, f.kind)} (${_unit.label})',
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              )),

          const SizedBox(height: 4),

          // Résultats
          if (volume == null)
            Text(
              loc.volumeCalcPlaceholder,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.40),
                fontSize: 12.5,
                fontStyle: FontStyle.italic,
              ),
            )
          else ...[
            _VolumeResultRow(label: 'cm³', value: _fmt(volume * 1e6, 1)),
            const SizedBox(height: 6),
            _VolumeResultRow(label: 'L (dm³)', value: _fmt(volume * 1000, 3)),
            const SizedBox(height: 6),
            _VolumeResultRow(label: 'm³', value: _fmt(volume, 5)),
            const SizedBox(height: 6),
            _VolumeResultRow(
                label: 'ft³', value: _fmt(volume * 35.3146667, 4)),
            const SizedBox(height: 6),
            _VolumeResultRow(
                label: 'gal (US)', value: _fmt(volume * 264.172052, 3)),
          ],
        ],
      ),
    );
  }
}

class _ShapeField {
  const _ShapeField(this.key, this.kind);
  final String key;
  final _FieldKind kind;
}

class _VolumeResultRow extends StatelessWidget {
  const _VolumeResultRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: _kAccentVolume.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _kAccentVolume.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.70),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: _kAccentVolume,
            ),
          ),
        ],
      ),
    );
  }
}
