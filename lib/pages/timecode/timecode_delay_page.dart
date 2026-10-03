import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../app/ui/widgets.dart';
import 'timecode_calculations.dart';
import '../about/about_favorites.dart';
import 'package:mon_app_tech/app/constants.dart';

enum _InputUnit { frames, ms }

/// Convertisseur retard vidéo/audio : frames <-> millisecondes, pour un
/// débit donné. Le calcul le plus fréquent en régie (lip-sync, calage
/// LED/processeur vidéo).
class TimecodeDelayPage extends StatefulWidget {
  const TimecodeDelayPage({super.key});

  @override
  State<TimecodeDelayPage> createState() => _TimecodeDelayPageState();
}

class _TimecodeDelayPageState extends State<TimecodeDelayPage> {
  final _valueController = TextEditingController(text: '1');
  TimecodeRate _rate = kTimecodeRates[2]; // 25 fps
  _InputUnit _unit = _InputUnit.frames;
  String _result = '';

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  void _convert() {
    final loc = AppLocalizations.of(context);
    final raw = _valueController.text.trim().replaceAll(',', '.');
    final value = double.tryParse(raw);

    if (value == null) {
      setState(() => _result = loc.timecodeDelayErrorInvalid);
      return;
    }

    if (_unit == _InputUnit.frames) {
      final frames = value.round();
      final ms = TimecodeMath.framesToMs(frames, _rate);
      setState(() {
        _result = loc.timecodeDelayResultFromFrames(
          frames,
          _rate.label,
          ms.toStringAsFixed(2),
          TimecodeMath.formatDuration(frames, _rate),
        );
      });
    } else {
      final frames = TimecodeMath.msToFrames(value, _rate);
      setState(() {
        _result = loc.timecodeDelayResultFromMs(
          value.toStringAsFixed(2),
          _rate.label,
          frames,
          TimecodeMath.formatDuration(frames, _rate),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.timecodeDelayTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:timecode_delay', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          SectionCard(
            accentColor: kSectionTimecode,
            title: loc.timecodeDelayCardTitle,
            icon: Icons.compare_arrows_rounded,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  loc.timecodeDelayIntro,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 14),
                DropdownButtonFormField<TimecodeRate>(
                  initialValue: _rate,
                  isExpanded: true,
                  decoration:
                      InputDecoration(labelText: loc.timecodeDelayRateLabel),
                  items: kTimecodeRates
                      .map((r) =>
                          DropdownMenuItem(value: r, child: Text(r.label)))
                      .toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _rate = v);
                  },
                ),
                const SizedBox(height: 12),
                SegmentedButton<_InputUnit>(
                  segments: [
                    ButtonSegment(
                      value: _InputUnit.frames,
                      label: Text(loc.timecodeDelayUnitFrames),
                    ),
                    ButtonSegment(
                      value: _InputUnit.ms,
                      label: Text(loc.timecodeDelayUnitMs),
                    ),
                  ],
                  selected: {_unit},
                  onSelectionChanged: (s) => setState(() => _unit = s.first),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _valueController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: _unit == _InputUnit.frames
                        ? loc.timecodeDelayValueLabelFrames
                        : loc.timecodeDelayValueLabelMs,
                  ),
                ),
                const SizedBox(height: 14),
                ElevatedButton(
                  onPressed: _convert,
                  child: Text(loc.timecodeDelayButton),
                ),
                const SizedBox(height: 12),
                ResultBox(_result),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
