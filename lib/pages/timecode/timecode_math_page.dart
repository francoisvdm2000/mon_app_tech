import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../app/ui/widgets.dart';
import 'timecode_calculations.dart';
import '../about/about_favorites.dart';
import 'package:mon_app_tech/app/constants.dart';

enum _MathMode { duration, offset }

/// Deux outils en un : durée entre deux timecodes, ou décalage
/// (addition/soustraction) d'un timecode par une durée donnée.
class TimecodeMathPage extends StatefulWidget {
  const TimecodeMathPage({super.key});

  @override
  State<TimecodeMathPage> createState() => _TimecodeMathPageState();
}

class _TimecodeMathPageState extends State<TimecodeMathPage> {
  _MathMode _mode = _MathMode.duration;
  TimecodeRate _rate = kTimecodeRates[2]; // 25 fps

  final _inController = TextEditingController(text: '01:00:00:00');
  final _outController = TextEditingController(text: '01:00:10:00');

  final _baseController = TextEditingController(text: '01:00:00:00');
  final _offsetController = TextEditingController(text: '00:00:05:00');
  bool _isAdd = true;

  String _result = '';

  @override
  void dispose() {
    _inController.dispose();
    _outController.dispose();
    _baseController.dispose();
    _offsetController.dispose();
    super.dispose();
  }

  void _computeDuration() {
    final loc = AppLocalizations.of(context);
    final fIn = TimecodeMath.parse(_inController.text, _rate);
    final fOut = TimecodeMath.parse(_outController.text, _rate);

    if (fIn == null || fOut == null) {
      setState(() => _result = loc.timecodeMathErrorDuration(_rate.frameBase));
      return;
    }

    final delta = fOut - fIn;
    setState(() {
      _result = loc.timecodeMathDurationResult(
        TimecodeMath.formatDuration(delta, _rate),
        delta,
        _rate.label,
      );
    });
  }

  void _computeOffset() {
    final loc = AppLocalizations.of(context);
    final base = TimecodeMath.parse(_baseController.text, _rate);
    final offset = TimecodeMath.parseDuration(_offsetController.text, _rate);

    if (base == null || offset == null) {
      setState(() => _result = loc.timecodeMathErrorOffset(_rate.frameBase));
      return;
    }

    final signedOffset = _isAdd ? offset : -offset;
    final newFrames = base + signedOffset;

    setState(() {
      _result = loc.timecodeMathOffsetResult(
        TimecodeMath.formatClock(newFrames, _rate),
      );
    });
  }

  DropdownButtonFormField<TimecodeRate> _rateDropdown(String label) {
    return DropdownButtonFormField<TimecodeRate>(
      initialValue: _rate,
      isExpanded: true,
      decoration: InputDecoration(labelText: label),
      items: kTimecodeRates
          .map((r) => DropdownMenuItem(value: r, child: Text(r.label)))
          .toList(),
      onChanged: (v) {
        if (v == null) return;
        setState(() {
          _rate = v;
          _result = '';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.timecodeMathTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:timecode_math', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          SegmentedButton<_MathMode>(
            segments: [
              ButtonSegment(
                value: _MathMode.duration,
                label: Text(loc.timecodeMathModeDuration),
                icon: const Icon(Icons.straighten_rounded),
              ),
              ButtonSegment(
                value: _MathMode.offset,
                label: Text(loc.timecodeMathModeOffset),
                icon: const Icon(Icons.exposure_rounded),
              ),
            ],
            selected: {_mode},
            onSelectionChanged: (s) => setState(() {
              _mode = s.first;
              _result = '';
            }),
          ),
          const SizedBox(height: 12),
          SectionCard(
            accentColor: kSectionTimecode,
            title: loc.timecodeMathRateCardTitle,
            icon: Icons.speed_rounded,
            child: _rateDropdown(loc.timecodeMathRateCardTitle),
          ),
          const SizedBox(height: 12),
          if (_mode == _MathMode.duration)
            SectionCard(
              accentColor: kSectionTimecode,
              title: loc.timecodeMathDurationCardTitle,
              icon: Icons.straighten_rounded,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _inController,
                    decoration: InputDecoration(
                      labelText: loc.timecodeMathTcInLabel,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _outController,
                    decoration: InputDecoration(
                      labelText: loc.timecodeMathTcOutLabel,
                    ),
                  ),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: _computeDuration,
                    child: Text(loc.timecodeMathComputeDurationButton),
                  ),
                  const SizedBox(height: 12),
                  ResultBox(_result),
                ],
              ),
            )
          else
            SectionCard(
              accentColor: kSectionTimecode,
              title: loc.timecodeMathOffsetCardTitle,
              icon: Icons.exposure_rounded,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _baseController,
                    decoration: InputDecoration(
                      labelText: loc.timecodeMathBaseTcLabel,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SegmentedButton<bool>(
                    segments: [
                      ButtonSegment(
                          value: true, label: Text(loc.timecodeMathAddLabel)),
                      ButtonSegment(
                          value: false,
                          label: Text(loc.timecodeMathSubtractLabel)),
                    ],
                    selected: {_isAdd},
                    onSelectionChanged: (s) =>
                        setState(() => _isAdd = s.first),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _offsetController,
                    decoration: InputDecoration(
                      labelText: loc.timecodeMathOffsetLabel,
                    ),
                  ),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: _computeOffset,
                    child: Text(loc.timecodeMathComputeOffsetButton),
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
