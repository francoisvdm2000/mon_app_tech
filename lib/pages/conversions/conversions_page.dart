import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';
import 'volume_calculator_section.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF06D6A0); // teal conversions

class ConversionsPage extends StatelessWidget {
  const ConversionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.conversionsTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:conversions', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            _ConversionSection(
              icon: Icons.straighten,
              title: loc.conversionsDistanceTitle,
              children: [
                _SmartConversionCard(
                  title: loc.conversionsDistanceTitle,
                  units: _distanceUnits,
                ),
              ],
            ),
            _ConversionSection(
              icon: Icons.thermostat,
              title: loc.conversionsTemperatureTitle,
              children: [
                _SmartConversionCard(
                  title: loc.conversionCelsiusFahrenheit,
                  units: _temperatureUnits,
                ),
              ],
            ),
            _ConversionSection(
              icon: Icons.architecture,
              title: loc.conversionsAnglesTitle,
              children: [
                _SmartConversionCard(
                  title: loc.conversionDegreesRadians,
                  units: _angleUnits,
                ),
                _SmartConversionCard(
                  title: loc.conversionSlopePercentDegrees,
                  units: _slopeUnits,
                ),
              ],
            ),
            _ConversionSection(
              icon: Icons.video_settings,
              title: loc.conversionsVideoTitle,
              children: [
                _SmartConversionCard(
                  title: loc.conversionNitsFootLambert,
                  units: _videoLuminanceUnits,
                ),
                _SmartConversionCard(
                  title: loc.conversionFpsFrameTime,
                  units: _videoFrameUnits,
                ),
              ],
            ),
            _ConversionSection(
              icon: Icons.graphic_eq,
              title: loc.conversionsAudioTitle,
              children: [
                _SmartConversionCard(
                  title: loc.conversionDelayDistance,
                  units: _audioDelayDistanceUnits,
                ),
                _SmartConversionCard(
                  title: loc.conversionBpmMs,
                  units: _audioTempoUnits,
                ),
                _SmartConversionCard(
                  title: loc.conversionAudioLevel,
                  units: _audioLevelUnits,
                ),
              ],
            ),
            _ConversionSection(
              icon: Icons.memory,
              title: loc.conversionsDmxTitle,
              children: [
                _SmartConversionCard(
                  title: loc.conversionDmxPercent,
                  units: _dmxValueUnits,
                ),
                _SmartConversionCard(
                  title: loc.conversionEightBitSixteenBit,
                  units: _dmxBitDepthUnits,
                ),
                _DmxAbsoluteCard(),
              ],
            ),
            _ConversionSection(
              imageAsset: 'assets/tool_icons/icone_volume.png',
              title: loc.conversionsVolumesTitle,
              children: const [
                VolumeCalculatorCard(),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              loc.conversionsDisclaimer,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.45),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConversionSection extends StatelessWidget {
  const _ConversionSection({
    this.icon,
    this.imageAsset,
    required this.title,
    required this.children,
  });

  final IconData? icon;
  final String? imageAsset;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ExpansionTile(
          leading: imageAsset != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(imageAsset!, width: 36, height: 36, fit: BoxFit.cover),
                )
              : Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: _kAccent.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: _kAccent, size: 20),
                ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          collapsedIconColor: Colors.white38,
          iconColor: _kAccent,
          collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          children: children,
        ),
      ),
    );
  }
}

class _SmartConversionCard extends StatefulWidget {
  const _SmartConversionCard({
    required this.title,
    required this.units,
  });

  final String title;
  final List<_ConversionUnit> units;

  @override
  State<_SmartConversionCard> createState() => _SmartConversionCardState();
}

class _SmartConversionCardState extends State<_SmartConversionCard> {
  final TextEditingController _leftController = TextEditingController();
  final TextEditingController _rightController = TextEditingController();

  late _ConversionUnit _leftUnit;
  late _ConversionUnit _rightUnit;

  bool _updating = false;
  bool _lastEditedLeft = true;

  @override
  void initState() {
    super.initState();
    _leftUnit = widget.units.first;
    _rightUnit = widget.units.length > 1 ? widget.units[1] : widget.units.first;
  }

  @override
  void dispose() {
    _leftController.dispose();
    _rightController.dispose();
    super.dispose();
  }

  double? _parse(String value) {
    final normalized = value.replaceAll(',', '.').trim();
    if (normalized.isEmpty) return null;
    return double.tryParse(normalized);
  }

  String _format(double value, int decimals) {
    if (value.isNaN || value.isInfinite) return '';

    final rounded = value.toStringAsFixed(decimals);
    return rounded.replaceFirst(RegExp(r'\.?0+$'), '').replaceAll('.', ',');
  }

  double _clampForUnit(double value, _ConversionUnit unit) {
    var result = value;
    if (unit.min != null && result < unit.min!) result = unit.min!;
    if (unit.max != null && result > unit.max!) result = unit.max!;
    return result;
  }

  void _updateFromLeft(String value) {
    if (_updating) return;

    _lastEditedLeft = true;
    final parsed = _parse(value);

    _updating = true;
    if (parsed == null) {
      _rightController.clear();
    } else {
      final sourceValue = _clampForUnit(parsed, _leftUnit);
      final baseValue = _leftUnit.toBase(sourceValue);
      final result = _clampForUnit(_rightUnit.fromBase(baseValue), _rightUnit);
      _rightController.text = _format(result, _rightUnit.decimals);
    }
    _updating = false;
  }

  void _updateFromRight(String value) {
    if (_updating) return;

    _lastEditedLeft = false;
    final parsed = _parse(value);

    _updating = true;
    if (parsed == null) {
      _leftController.clear();
    } else {
      final sourceValue = _clampForUnit(parsed, _rightUnit);
      final baseValue = _rightUnit.toBase(sourceValue);
      final result = _clampForUnit(_leftUnit.fromBase(baseValue), _leftUnit);
      _leftController.text = _format(result, _leftUnit.decimals);
    }
    _updating = false;
  }

  void _recalculate() {
    if (_lastEditedLeft) {
      _updateFromLeft(_leftController.text);
    } else {
      _updateFromRight(_rightController.text);
    }
  }

  void _swap() {
    setState(() {
      final oldLeftUnit = _leftUnit;
      final oldLeftText = _leftController.text;

      _leftUnit = _rightUnit;
      _rightUnit = oldLeftUnit;

      _leftController.text = _rightController.text;
      _rightController.text = oldLeftText;

      _lastEditedLeft = !_lastEditedLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

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
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 12),
          _ConverterSide(
            controller: _leftController,
            unit: _leftUnit,
            units: widget.units,
            onUnitChanged: (unit) {
              setState(() => _leftUnit = unit);
              _recalculate();
            },
            onValueChanged: _updateFromLeft,
          ),
          const SizedBox(height: 6),
          Center(
            child: InkWell(
              onTap: _swap,
              borderRadius: BorderRadius.circular(20),
              child: Tooltip(
                message: loc.conversionsSwap,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: _kAccent.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                    border: Border.all(color: _kAccent.withValues(alpha: 0.30)),
                  ),
                  child: Icon(Icons.swap_vert, color: _kAccent, size: 20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          _ConverterSide(
            controller: _rightController,
            unit: _rightUnit,
            units: widget.units,
            onUnitChanged: (unit) {
              setState(() => _rightUnit = unit);
              _recalculate();
            },
            onValueChanged: _updateFromRight,
          ),
        ],
      ),
    );
  }
}

class _ConverterSide extends StatelessWidget {
  const _ConverterSide({
    required this.controller,
    required this.unit,
    required this.units,
    required this.onUnitChanged,
    required this.onValueChanged,
  });

  final TextEditingController controller;
  final _ConversionUnit unit;
  final List<_ConversionUnit> units;
  final ValueChanged<_ConversionUnit> onUnitChanged;
  final ValueChanged<String> onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 118,
          child: DropdownButtonFormField<_ConversionUnit>(
            initialValue: unit,
            isExpanded: true,
            dropdownColor: Theme.of(context).cardColor,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            ),
            items: units
                .map(
                  (item) => DropdownMenuItem<_ConversionUnit>(
                    value: item,
                    child: Text(
                      item.label,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) onUnitChanged(value);
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            onChanged: onValueChanged,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class _ResultRow extends StatelessWidget {
  const _ResultRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: _kAccent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _kAccent.withValues(alpha: 0.25)),
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
              color: _kAccent,
            ),
          ),
        ],
      ),
    );
  }
}

class _ConversionUnit {
  const _ConversionUnit({
    required this.label,
    required this.toBase,
    required this.fromBase,
    this.decimals = 3,
    this.min,
    this.max,
  });

  final String label;
  final double Function(double value) toBase;
  final double Function(double baseValue) fromBase;
  final int decimals;
  final double? min;
  final double? max;
}

/*
  Base distance: meter
*/
final List<_ConversionUnit> _distanceUnits = [
  _ConversionUnit(
    label: 'mm',
    toBase: (v) => v / 1000,
    fromBase: (v) => v * 1000,
    decimals: 2,
  ),
  _ConversionUnit(
    label: 'cm',
    toBase: (v) => v / 100,
    fromBase: (v) => v * 100,
    decimals: 2,
  ),
  _ConversionUnit(
    label: 'm',
    toBase: (v) => v,
    fromBase: (v) => v,
    decimals: 3,
  ),
  _ConversionUnit(
    label: 'km',
    toBase: (v) => v * 1000,
    fromBase: (v) => v / 1000,
    decimals: 5,
  ),
  _ConversionUnit(
    label: 'inch',
    toBase: (v) => v * 0.0254,
    fromBase: (v) => v / 0.0254,
    decimals: 3,
  ),
  _ConversionUnit(
    label: 'ft',
    toBase: (v) => v * 0.3048,
    fromBase: (v) => v / 0.3048,
    decimals: 3,
  ),
  _ConversionUnit(
    label: 'yd',
    toBase: (v) => v * 0.9144,
    fromBase: (v) => v / 0.9144,
    decimals: 3,
  ),
];

/*
  Base temperature: Celsius
*/
final List<_ConversionUnit> _temperatureUnits = [
  _ConversionUnit(
    label: '°C',
    toBase: (v) => v,
    fromBase: (v) => v,
    decimals: 2,
  ),
  _ConversionUnit(
    label: '°F',
    toBase: (v) => (v - 32) * 5 / 9,
    fromBase: (v) => (v * 9 / 5) + 32,
    decimals: 2,
  ),
  _ConversionUnit(
    label: 'K',
    toBase: (v) => v - 273.15,
    fromBase: (v) => v + 273.15,
    decimals: 2,
    min: 0,
  ),
];

/*
  Base angle: degree
*/
final List<_ConversionUnit> _angleUnits = [
  _ConversionUnit(
    label: '°',
    toBase: (v) => v,
    fromBase: (v) => v,
    decimals: 3,
  ),
  _ConversionUnit(
    label: 'rad',
    toBase: (v) => v * 180 / math.pi,
    fromBase: (v) => v * math.pi / 180,
    decimals: 5,
  ),
];

/*
  Base slope: degree
*/
final List<_ConversionUnit> _slopeUnits = [
  _ConversionUnit(
    label: '%',
    toBase: (v) => math.atan(v / 100) * 180 / math.pi,
    fromBase: (v) => math.tan(v * math.pi / 180) * 100,
    decimals: 3,
  ),
  _ConversionUnit(
    label: '°',
    toBase: (v) => v,
    fromBase: (v) => v,
    decimals: 3,
  ),
];

/*
  Base video luminance: nit / cd/m²
*/
final List<_ConversionUnit> _videoLuminanceUnits = [
  _ConversionUnit(
    label: 'nits',
    toBase: (v) => v,
    fromBase: (v) => v,
    decimals: 2,
    min: 0,
  ),
  _ConversionUnit(
    label: 'cd/m²',
    toBase: (v) => v,
    fromBase: (v) => v,
    decimals: 2,
    min: 0,
  ),
  _ConversionUnit(
    label: 'ft-L',
    toBase: (v) => v * 3.426,
    fromBase: (v) => v / 3.426,
    decimals: 3,
    min: 0,
  ),
];

/*
  Base frame duration: second per frame
*/
final List<_ConversionUnit> _videoFrameUnits = [
  _ConversionUnit(
    label: 'fps',
    toBase: (v) => v == 0 ? 0 : 1 / v,
    fromBase: (v) => v == 0 ? 0 : 1 / v,
    decimals: 3,
    min: 0,
  ),
  _ConversionUnit(
    label: 'ms/frame',
    toBase: (v) => v / 1000,
    fromBase: (v) => v * 1000,
    decimals: 3,
    min: 0,
  ),
  _ConversionUnit(
    label: 's/frame',
    toBase: (v) => v,
    fromBase: (v) => v,
    decimals: 5,
    min: 0,
  ),
];

/*
  Base audio delay: millisecond
  Speed of sound approximation: 343 m/s at 20°C
*/
final List<_ConversionUnit> _audioDelayDistanceUnits = [
  _ConversionUnit(
    label: 'ms',
    toBase: (v) => v,
    fromBase: (v) => v,
    decimals: 2,
    min: 0,
  ),
  _ConversionUnit(
    label: 'm',
    toBase: (v) => v / 0.343,
    fromBase: (v) => v * 0.343,
    decimals: 3,
    min: 0,
  ),
  _ConversionUnit(
    label: 'ft',
    toBase: (v) => (v * 0.3048) / 0.343,
    fromBase: (v) => (v * 0.343) / 0.3048,
    decimals: 3,
    min: 0,
  ),
];

/*
  Base tempo: quarter note duration in milliseconds
*/
final List<_ConversionUnit> _audioTempoUnits = [
  _ConversionUnit(
    label: 'BPM',
    toBase: (v) => v == 0 ? 0 : 60000 / v,
    fromBase: (v) => v == 0 ? 0 : 60000 / v,
    decimals: 2,
    min: 0,
  ),
  _ConversionUnit(
    label: '1/2 ms',
    toBase: (v) => v / 2,
    fromBase: (v) => v * 2,
    decimals: 2,
    min: 0,
  ),
  _ConversionUnit(
    label: '1/4 ms',
    toBase: (v) => v,
    fromBase: (v) => v,
    decimals: 2,
    min: 0,
  ),
  _ConversionUnit(
    label: '1/8 ms',
    toBase: (v) => v * 2,
    fromBase: (v) => v / 2,
    decimals: 2,
    min: 0,
  ),
  _ConversionUnit(
    label: '1/16 ms',
    toBase: (v) => v * 4,
    fromBase: (v) => v / 4,
    decimals: 2,
    min: 0,
  ),
];

/*
  Base audio level: volt RMS
*/
final List<_ConversionUnit> _audioLevelUnits = [
  _ConversionUnit(
    label: 'V',
    toBase: (v) => v,
    fromBase: (v) => v,
    decimals: 4,
    min: 0,
  ),
  _ConversionUnit(
    label: 'dBu',
    toBase: (v) => 0.775 * math.pow(10, v / 20).toDouble(),
    fromBase: (v) => v <= 0 ? 0 : 20 * math.log(v / 0.775) / math.ln10,
    decimals: 2,
  ),
  _ConversionUnit(
    label: 'dBV',
    toBase: (v) => math.pow(10, v / 20).toDouble(),
    fromBase: (v) => v <= 0 ? 0 : 20 * math.log(v) / math.ln10,
    decimals: 2,
  ),
];

/*
  Base DMX value: 8-bit 0-255
*/
final List<_ConversionUnit> _dmxValueUnits = [
  _ConversionUnit(
    label: 'DMX',
    toBase: (v) => v,
    fromBase: (v) => v,
    decimals: 0,
    min: 0,
    max: 255,
  ),
  _ConversionUnit(
    label: '%',
    toBase: (v) => (v / 100) * 255,
    fromBase: (v) => (v / 255) * 100,
    decimals: 1,
    min: 0,
    max: 100,
  ),
];

/*
  Base DMX bit depth: 16-bit 0-65535
*/
final List<_ConversionUnit> _dmxBitDepthUnits = [
  _ConversionUnit(
    label: '8 bit',
    toBase: (v) => (v / 255) * 65535,
    fromBase: (v) => (v / 65535) * 255,
    decimals: 0,
    min: 0,
    max: 255,
  ),
  _ConversionUnit(
    label: '16 bit',
    toBase: (v) => v,
    fromBase: (v) => v,
    decimals: 0,
    min: 0,
    max: 65535,
  ),
];

class _DmxAbsoluteCard extends StatefulWidget {
  const _DmxAbsoluteCard();

  @override
  State<_DmxAbsoluteCard> createState() => _DmxAbsoluteCardState();
}

class _DmxAbsoluteCardState extends State<_DmxAbsoluteCard> {
  final TextEditingController _universeController =
      TextEditingController(text: '1');

  final TextEditingController _addressController =
      TextEditingController(text: '1');

  final TextEditingController _absoluteController = TextEditingController();

  int _absolute = 1;
  int _resultUniverse = 1;
  int _resultAddress = 1;

  @override
  void dispose() {
    _universeController.dispose();
    _addressController.dispose();
    _absoluteController.dispose();
    super.dispose();
  }

  int _parse(String value, int fallback) {
    return int.tryParse(value.trim()) ?? fallback;
  }

  void _calculateAbsolute() {
    final universe = _parse(_universeController.text, 1).clamp(1, 9999);
    final address = _parse(_addressController.text, 1).clamp(1, 512);

    setState(() {
      _absolute = ((universe - 1) * 512) + address;
    });
  }

  void _calculateUniverseAddress() {
    final absolute = _parse(_absoluteController.text, 1).clamp(1, 999999);

    setState(() {
      _resultUniverse = ((absolute - 1) ~/ 512) + 1;
      _resultAddress = ((absolute - 1) % 512) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

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
          Text(
            loc.conversionDmxAbsolute,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            loc.conversionDmxToAbsoluteHint,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.55),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _universeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: loc.conversionDmxUniverseLabel,
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (_) => _calculateAbsolute(),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _addressController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: loc.conversionDmxAddressLabel,
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (_) => _calculateAbsolute(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _ResultRow(label: loc.conversionDmxAbsoluteLabel, value: '$_absolute'),
          Divider(height: 28, color: Colors.white.withValues(alpha: 0.08)),
          Text(
            loc.conversionDmxFromAbsoluteHint,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.55),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _absoluteController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: loc.conversionDmxAbsoluteLabel,
              border: const OutlineInputBorder(),
            ),
            onChanged: (_) => _calculateUniverseAddress(),
          ),
          const SizedBox(height: 12),
          _ResultRow(label: loc.conversionDmxUniverseLabel, value: '$_resultUniverse'),
          const SizedBox(height: 8),
          _ResultRow(label: loc.conversionDmxAddressLabel, value: '$_resultAddress'),
        ],
      ),
    );
  }
}
