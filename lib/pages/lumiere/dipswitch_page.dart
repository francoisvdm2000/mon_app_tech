import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'dipswitch_calculations.dart';

class DipSwitchPage extends StatefulWidget {
  const DipSwitchPage({super.key});

  @override
  State<DipSwitchPage> createState() => _DipSwitchPageState();
}

class _DipSwitchPageState extends State<DipSwitchPage> {
  final _addressController = TextEditingController();
  final _intervalController = TextEditingController(text: '1');

  bool _didInitDependencies = false;
  bool _isUpdating = false;
  bool _useAddressMinusOne = false; // OFF par défaut
  List<bool> _switches = List<bool>.filled(9, false);

  @override
  void initState() {
    super.initState();
    _addressController.addListener(_onAddressChanged);
    _intervalController.addListener(_recomputeText);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didInitDependencies) return;
    _didInitDependencies = true;
    // Safe: context is ready here (localizations/theme can be read).
    _recomputeText();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _intervalController.dispose();
    super.dispose();
  }

  int? _parseInt(String raw) {
    final t = raw.trim();
    if (t.isEmpty) return null;
    return int.tryParse(t);
  }

  int _clampInt(int v, int min, int max) {
    if (v < min) return min;
    if (v > max) return max;
    return v;
  }

  int _addressToBinaryValue(int address) {
    if (_useAddressMinusOne) {
      return _clampInt(address - 1, 0, 511);
    }
    return _clampInt(address, 0, 511);
  }

  int _binaryValueToAddress(int value) {
    final v = _clampInt(value, 0, 511);
    if (_useAddressMinusOne) {
      return _clampInt(v + 1, 1, 512);
    }
    return _clampInt(v == 0 ? 1 : v, 1, 512);
  }

  void _resetAll() {
    setState(() {
      _isUpdating = true;
      _addressController.clear();
      _intervalController.text = '1';
      _useAddressMinusOne = false;
      _switches = List<bool>.filled(9, false);
      _isUpdating = false;
    });
  }

  void _onAddressChanged() {
    if (_isUpdating) return;

    final a = _parseInt(_addressController.text);
    if (a == null || a < 1 || a > 512) {
      setState(() {
        _switches = List<bool>.filled(9, false);
      });
      return;
    }

    final value = _addressToBinaryValue(a);
    setState(() {
      _switches = DipSwitchCalculations.addressToSwitches(value);
    });
  }

  void _onSwitchToggled(int index) {
    setState(() {
      _switches[index] = !_switches[index];
    });

    final v = DipSwitchCalculations.switchesToAddress(_switches);
    final addr = _binaryValueToAddress(v);

    _isUpdating = true;
    _addressController.text = addr.toString();
    _isUpdating = false;

  }

  void _nextAddress() {
    final a = _parseInt(_addressController.text) ?? 1;
    final step = _parseInt(_intervalController.text) ?? 1;
    final safeStep = step <= 0 ? 1 : step;

    final next = a + safeStep;

    if (next > 512) {
      // ✅ on signale en rouge, sans avancer
      return;
    }

    _isUpdating = true;
    _addressController.text = next.toString();
    _isUpdating = false;

    _onAddressChanged();
  }

  void _toggleAddressMode(bool v) {
    setState(() {
      _useAddressMinusOne = v;
    });
    _onAddressChanged();
  }

  void _recomputeText() {
    final loc = AppLocalizations.of(context);

    final a = _parseInt(_addressController.text);
    final stepRaw = _parseInt(_intervalController.text) ?? 1;
    final step = stepRaw <= 0 ? 1 : stepRaw;

    final lines = <String>[];

    lines.add(loc.dipSwitchResultHeader);
    lines.add('');
    lines.add(
      loc.dipSwitchResultModeLine(
        _useAddressMinusOne
            ? loc.dipSwitchModeAddressMinusOne
            : loc.dipSwitchModeAddressDirect,
      ),
    );
    lines.add('');

    if (a == null) {
      lines.add(loc.dipSwitchResultAddressNotProvided);
    } else {
      final value = _addressToBinaryValue(a);
      lines.add(loc.dipSwitchResultAddressLine(a.toString()));
      lines.add(loc.dipSwitchResultBinaryValueLine(value.toString()));
    }

    lines.add(
      loc.dipSwitchResultIntervalLine(
        step.toString(),
        loc.dipSwitchChannelUnit,
      ),
    );

    setState(() {});
  }

  Widget _dipSwitch() {
    final loc = AppLocalizations.of(context);

    // Dimensions de base
    const double baseDipWidth = 28;
    const double baseDipHeight = 60;
    const double baseKnobHeight = 22;
    const double baseSpacing = 14;

    // Largeur idéale (9 switches uniquement, plus de légende)
    const double perSwitchWidth = baseDipWidth + baseSpacing;
    const double idealTotalWidth = (9 * perSwitchWidth) - baseSpacing;

    return LayoutBuilder(
      builder: (context, constraints) {
        final available = constraints.maxWidth;

        // Scale down uniquement sur petits écrans
        final scale = (available / idealTotalWidth).clamp(0.72, 1.0);

        final dipWidth = baseDipWidth * scale;
        final dipHeight = baseDipHeight * scale;
        final knobHeight = baseKnobHeight * scale;
        final spacing = baseSpacing * scale;

        Widget dipToggle(int i) {
          final weight = DipSwitchCalculations.weights[i];
          final on = _switches[i];

          return Padding(
            padding: EdgeInsets.only(right: i == 8 ? 0 : spacing),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    loc.dipSwitchSwitchLabel((i + 1).toString()),
                    style:
                        TextStyle(color: Colors.white70, fontSize: 12 * scale),
                  ),
                ),
                SizedBox(height: 4 * scale),
                Text(
                  '($weight)',
                  style: TextStyle(color: Colors.white54, fontSize: 12 * scale),
                ),
                SizedBox(height: 6 * scale),
                GestureDetector(
                  onTap: () => _onSwitchToggled(i),
                  child: Container(
                    width: dipWidth,
                    height: dipHeight,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4 * scale),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Stack(
                      children: [
                        // Repères intégrés (gain de place, explicite)
                        Positioned(
                          top: 4 * scale,
                          left: 0,
                          right: 0,
                          child: Text(
                            loc.dipSwitchOnLabel,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 9 * scale,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 4 * scale,
                          left: 0,
                          right: 0,
                          child: Text(
                            loc.dipSwitchOffLabel,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 9 * scale,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        // Knob
                        Align(
                          alignment:
                              on ? Alignment.topCenter : Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.all(3 * scale),
                            height: knobHeight,
                            decoration: BoxDecoration(
                              color: on
                                  ? Colors.greenAccent
                                  : Colors.grey.shade700,
                              borderRadius: BorderRadius.circular(3 * scale),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF0B0B0B),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                loc.dipSwitchScrollHint,
                style: TextStyle(color: Colors.white54, fontSize: 12 * scale),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (int i = 0; i < 9; i++) dipToggle(i),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.lightDmxSwitchTitle),
        actions: [
          IconButton(
            tooltip: loc.dipSwitchResetTooltip,
            onPressed: _resetAll,
            icon: const Icon(Icons.restart_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          children: [
            ExpandSectionCard(
              title: loc.dipSwitchInputsTitle,
              icon: Icons.edit,
              initiallyExpanded: true,
              child: Column(
                children: [
                  TextField(
                    controller: _addressController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.dipSwitchAddressLabel,
                      hintText: loc.dipSwitchAddressHint,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _intervalController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [numFormatter],
                    decoration: InputDecoration(
                      labelText: loc.dipSwitchIntervalLabel,
                      hintText: loc.dipSwitchIntervalHint,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          loc.dipSwitchUseAddressMinusOneLabel,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                      Switch(
                        value: _useAddressMinusOne,
                        onChanged: _toggleAddressMode,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _nextAddress,
                      child: Text(loc.dipSwitchNextAddressButton),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            ExpandSectionCard(
              title: loc.dipSwitchSectionTitle,
              icon: Icons.tune,
              initiallyExpanded: true,
              child: _dipSwitch(),
            ),
          ],
        ),
      ),
    );
  }
}
