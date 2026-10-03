import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../app/ui/widgets.dart';
import 'timecode_calculations.dart';
import 'timecode_page.dart' show kTimecodeAccent;
import '../about/about_favorites.dart';
import 'package:mon_app_tech/app/constants.dart';

/// Convertit un timecode d'un débit à un autre (ex: 25 fps -> 29.97 DF),
/// en tenant compte du Drop-Frame si nécessaire.
class TimecodeConverterPage extends StatefulWidget {
  const TimecodeConverterPage({super.key});

  @override
  State<TimecodeConverterPage> createState() => _TimecodeConverterPageState();
}

class _TimecodeConverterPageState extends State<TimecodeConverterPage> {
  final _tcController = TextEditingController(text: '01:00:00:00');

  TimecodeRate _from = kTimecodeRates[2]; // 25 fps
  TimecodeRate _to = kTimecodeRates[3]; // 29.97 fps NDF

  String _result = '';

  @override
  void dispose() {
    _tcController.dispose();
    super.dispose();
  }

  void _swap() {
    setState(() {
      final tmp = _from;
      _from = _to;
      _to = tmp;
    });
  }

  void _convert() {
    final loc = AppLocalizations.of(context);
    final input = _tcController.text;
    final frames = TimecodeMath.parse(input, _from);

    if (frames == null) {
      setState(() {
        _result = loc.timecodeConverterErrorInvalid(_from.label, _from.frameBase);
      });
      return;
    }

    final convertedFrames = TimecodeMath.convertFrameCount(frames, _from, _to);
    final outTc = TimecodeMath.formatClock(convertedFrames, _to);
    final seconds = TimecodeMath.framesToSeconds(frames, _from);

    setState(() {
      _result = loc.timecodeConverterResult(
        _to.label,
        outTc,
        seconds.toStringAsFixed(3),
      );
    });
  }

  DropdownButtonFormField<TimecodeRate> _rateDropdown({
    required TimecodeRate value,
    required String label,
    required ValueChanged<TimecodeRate?> onChanged,
  }) {
    return DropdownButtonFormField<TimecodeRate>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(labelText: label),
      items: kTimecodeRates
          .map((r) => DropdownMenuItem(value: r, child: Text(r.label)))
          .toList(),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.timecodeConverterTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:timecode_converter', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          SectionCard(
            accentColor: kSectionTimecode,
            title: loc.timecodeConverterSourceCardTitle,
            icon: Icons.input_rounded,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _tcController,
                  decoration: InputDecoration(
                    labelText: loc.timecodeConverterFieldLabel,
                    hintText: loc.timecodeConverterFieldHint,
                  ),
                ),
                const SizedBox(height: 12),
                _rateDropdown(
                  value: _from,
                  label: loc.timecodeConverterSourceRateLabel,
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _from = v);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: IconButton(
              tooltip: loc.timecodeConverterSwapTooltip,
              onPressed: _swap,
              icon: const Icon(Icons.swap_vert_rounded),
              color: kTimecodeAccent,
            ),
          ),
          const SizedBox(height: 4),
          SectionCard(
            accentColor: kSectionTimecode,
            title: loc.timecodeConverterTargetCardTitle,
            icon: Icons.flag_outlined,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _rateDropdown(
                  value: _to,
                  label: loc.timecodeConverterTargetRateLabel,
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _to = v);
                  },
                ),
                const SizedBox(height: 14),
                ElevatedButton(
                  onPressed: _convert,
                  child: Text(loc.timecodeConverterButton),
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
