import 'dart:async';

import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../app/ui/widgets.dart';
import 'timecode_calculations.dart';
import '../about/about_favorites.dart';
import 'package:mon_app_tech/app/constants.dart';

/// Compte à rebours live vers un TC cible : on saisit le TC actuel du show
/// (et le débit), on démarre, et l'app extrapole le TC en direct à partir
/// de l'horloge du téléphone pour afficher le temps restant avant le TC
/// cible — pratique en régie pour suivre un compte à rebours sans avoir à
/// tout recalculer à la main.
class TimecodeCountdownPage extends StatefulWidget {
  const TimecodeCountdownPage({super.key});

  @override
  State<TimecodeCountdownPage> createState() => _TimecodeCountdownPageState();
}

class _TimecodeCountdownPageState extends State<TimecodeCountdownPage> {
  TimecodeRate _rate = kTimecodeRates[2]; // 25 fps

  final _currentTcController = TextEditingController(text: '00:00:00:00');
  final _targetTcController = TextEditingController(text: '00:10:00:00');

  Timer? _timer;
  DateTime? _refWallClock;
  int? _refFrames;
  int? _targetFrames;

  bool get _running => _timer != null;
  String _liveDisplay = '';
  String _error = '';

  @override
  void dispose() {
    _timer?.cancel();
    _currentTcController.dispose();
    _targetTcController.dispose();
    super.dispose();
  }

  void _fillNow() {
    final now = DateTime.now();
    final tc =
        '${_p2(now.hour)}:${_p2(now.minute)}:${_p2(now.second)}:00';
    setState(() => _currentTcController.text = tc);
  }

  String _p2(int v) => v.toString().padLeft(2, '0');

  void _start() {
    final loc = AppLocalizations.of(context);
    final startFrames = TimecodeMath.parse(_currentTcController.text, _rate);
    final targetFrames = TimecodeMath.parse(_targetTcController.text, _rate);

    if (startFrames == null || targetFrames == null) {
      setState(() {
        _error = loc.timecodeCountdownErrorInvalid(_rate.frameBase);
      });
      return;
    }

    _timer?.cancel();
    _refFrames = startFrames;
    _targetFrames = targetFrames;
    _refWallClock = DateTime.now();
    _error = '';

    _timer = Timer.periodic(const Duration(milliseconds: 200), (_) => _tick());
    // _tick() déclenche déjà son propre setState (pour afficher _liveDisplay
    // et faire apparaître la carte "En direct" via _running).
    _tick();
  }

  void _stop() {
    _timer?.cancel();
    setState(() {
      _timer = null;
      _liveDisplay = '';
    });
  }

  void _tick() {
    if (_refFrames == null || _refWallClock == null || _targetFrames == null) {
      return;
    }
    if (!mounted) return;

    final loc = AppLocalizations.of(context);
    final elapsedMs = DateTime.now().difference(_refWallClock!).inMilliseconds;
    final elapsedFrames = (elapsedMs / 1000.0 * _rate.realFps).round();
    final liveFrames = _refFrames! + elapsedFrames;
    final remaining = _targetFrames! - liveFrames;

    final liveTc = TimecodeMath.formatClock(liveFrames, _rate);
    final remainingText = remaining >= 0
        ? TimecodeMath.formatDuration(remaining, _rate)
        : loc.timecodeCountdownOverdue(
            TimecodeMath.formatDuration(-remaining, _rate));

    setState(() {
      _liveDisplay = loc.timecodeCountdownLiveText(liveTc, remainingText);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.timecodeCountdownTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:timecode_countdown', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          SectionCard(
            accentColor: kSectionTimecode,
            title: loc.timecodeCountdownSettingsCardTitle,
            icon: Icons.settings_outlined,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<TimecodeRate>(
                  initialValue: _rate,
                  isExpanded: true,
                  decoration: InputDecoration(
                      labelText: loc.timecodeCountdownRateLabel),
                  items: kTimecodeRates
                      .map((r) =>
                          DropdownMenuItem(value: r, child: Text(r.label)))
                      .toList(),
                  onChanged: _running
                      ? null
                      : (v) {
                          if (v == null) return;
                          setState(() => _rate = v);
                        },
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _currentTcController,
                        enabled: !_running,
                        decoration: InputDecoration(
                          labelText: loc.timecodeCountdownCurrentTcLabel,
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: loc.timecodeCountdownFillNowTooltip,
                      onPressed: _running ? null : _fillNow,
                      icon: const Icon(Icons.schedule_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _targetTcController,
                  enabled: !_running,
                  decoration: InputDecoration(
                    labelText: loc.timecodeCountdownTargetTcLabel,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _running ? null : _start,
                        icon: const Icon(Icons.play_arrow_rounded),
                        label: Text(loc.timecodeCountdownStartButton),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _running ? _stop : null,
                        icon: const Icon(Icons.stop_rounded),
                        label: Text(loc.timecodeCountdownStopButton),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ResultBox(_error),
              ],
            ),
          ),
          if (_running) ...[
            const SizedBox(height: 12),
            SectionCard(
              accentColor: kSectionTimecode,
              title: loc.timecodeCountdownLiveCardTitle,
              icon: Icons.hourglass_bottom_rounded,
              child: ResultBox(_liveDisplay),
            ),
          ],
        ],
      ),
    );
  }
}
