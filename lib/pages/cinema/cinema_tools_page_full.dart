import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';
import '../shared/app_grid_tile.dart';
import '../about/about_favorites.dart';

class CinemaToolsPage extends StatelessWidget {
  const CinemaToolsPage({super.key});

  static const routeName = '/cinema-tools';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.cinemaTitle)),
      body: SafeArea(
        // Encoches / bords arrondis (paysage) : marges latérales sûres.
        top: false,
        bottom: false,
        child: ListView(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          32 + MediaQuery.of(context).padding.bottom,
        ),
        children: [
          Text(
            loc.cinemaIntroTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(loc.cinemaIntroBody),
          const SizedBox(height: 16),
          AppGridView(
            children: [
              _ToolTile(
                icon: Icons.camera_alt_outlined,
                title: loc.cinemaFieldOfViewTitle,
                subtitle: loc.cinemaFieldOfViewSubtitle,
                page: const FieldOfViewPage(),
              ),
              _ToolTile(
                icon: Icons.person_pin_circle_outlined,
                title: loc.cinemaSubjectDistanceTitle,
                subtitle: loc.cinemaSubjectDistanceSubtitle,
                page: const SubjectDistancePage(),
              ),
              _ToolTile(
                icon: Icons.blur_on_outlined,
                title: loc.cinemaDepthOfFieldTitle,
                subtitle: loc.cinemaDepthOfFieldSubtitle,
                page: const DepthOfFieldPage(),
              ),
              _ToolTile(
                icon: Icons.aspect_ratio_outlined,
                title: loc.cinemaLensEquivalenceTitle,
                subtitle: loc.cinemaLensEquivalenceSubtitle,
                page: const LensEquivalencePage(),
              ),
              _ToolTile(
                icon: Icons.crop_16_9_outlined,
                title: loc.cinemaAnamorphicTitle,
                subtitle: loc.cinemaAnamorphicSubtitle,
                page: const AnamorphicPage(),
              ),
              _ToolTile(
                icon: Icons.shutter_speed_outlined,
                title: loc.cinemaShutterTitle,
                subtitle: loc.cinemaShutterSubtitle,
                page: const ShutterPage(),
              ),
              _ToolTile(
                icon: Icons.flash_on_outlined,
                title: loc.cinemaFlickerTitle,
                subtitle: loc.cinemaFlickerSubtitle,
                page: const FlickerFreePage(),
              ),
              _ToolTile(
                icon: Icons.filter_b_and_w_outlined,
                title: loc.cinemaNdExposureTitle,
                subtitle: loc.cinemaNdExposureSubtitle,
                page: const NdExposurePage(),
              ),
              _ToolTile(
                icon: Icons.sd_storage_outlined,
                title: loc.cinemaRecordingStorageTitle,
                subtitle: loc.cinemaRecordingStorageSubtitle,
                page: const RecordingStoragePage(),
              ),
              _ToolTile(
                icon: Icons.timer_outlined,
                title: loc.cinemaTimecodeTitle,
                subtitle: loc.cinemaTimecodeSubtitle,
                page: const TimecodePage(),
              ),
              _ToolTile(
                icon: Icons.slow_motion_video_outlined,
                title: loc.cinemaSlowMotionTitle,
                subtitle: loc.cinemaSlowMotionSubtitle,
                page: const SlowMotionPage(),
              ),
              _ToolTile(
                icon: Icons.theaters_outlined,
                title: loc.cinemaProjectionTitle,
                subtitle: loc.cinemaProjectionSubtitle,
                page: const CinemaProjectionPage(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _InfoBox(text: loc.cinemaGlobalDisclaimer),
        ],
      ),
      ),
    );
  }
}

const _kAccentCinema = Color(0xFFFF6B6B);

class _ToolTile extends StatelessWidget {
  const _ToolTile({
    required this.icon,
    required this.title,
    required this.page,
    this.subtitle,
  });

  final IconData icon;
  final String   title;
  final String?  subtitle;
  final Widget   page;

  @override
  Widget build(BuildContext context) {
    return AppGridTile(
      icon: icon,
      label: title,
      subtitle: subtitle,
      accentColor: _kAccentCinema,
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => page),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  const _InfoBox({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _kAccentCinema.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            size: 20,
            color: _kAccentCinema.withValues(alpha: 0.75),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.65),
                fontSize: 12.5,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _kAccentCinema.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _ResultLine extends StatelessWidget {
  const _ResultLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.70),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14,
                color: _kAccentCinema,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NumberField extends StatelessWidget {
  const _NumberField({
    required this.label,
    required this.controller,
    this.suffix,
    this.helper,
    this.onChanged,
    this.textInputType,
  });

  final String label;
  final TextEditingController controller;
  final String? suffix;
  final String? helper;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: textInputType ??
            const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          suffixText: suffix,
          helperText: helper,
          border: const OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class _DropdownField<T> extends StatelessWidget {
  const _DropdownField({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<T>(
        initialValue: value,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: items,
        selectedItemBuilder: (context) {
          return items.map((item) {
            final child = item.child;
            if (child is Text) {
              return Text(
                child.data ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              );
            }
            return child;
          }).toList();
        },
        onChanged: onChanged,
      ),
    );
  }
}

class _CalcShell extends StatelessWidget {
  const _CalcShell({
    required this.title,
    required this.description,
    required this.inputs,
    required this.results,
    this.info,
    this.pageId,
  });

  final String title;
  final String description;
  final List<Widget> inputs;
  final List<Widget> results;
  final String? info;
  final String? pageId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: pageId == null
            ? null
            : [
                AboutPinButton(pageId: pageId!, sectionId: 'main'),
                const SizedBox(width: 4),
              ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          32 + MediaQuery.of(context).padding.bottom,
        ),
        children: [
          Text(description),
          const SizedBox(height: 16),
          ...inputs,
          const SizedBox(height: 8),
          _ResultCard(children: results),
          if (info != null) ...[
            const SizedBox(height: 16),
            _InfoBox(text: info!),
          ],
        ],
      ),
    );
  }
}

class SensorPreset {
  const SensorPreset(this.name, this.widthMm, this.heightMm);

  final String name;
  final double widthMm;
  final double heightMm;

  double get diagonalMm => math.sqrt(widthMm * widthMm + heightMm * heightMm);
}

const List<SensorPreset> _sensorPresets = [
  SensorPreset('Full Frame 36 × 24 mm', 36, 24),
  SensorPreset('Super 35 24.89 × 18.66 mm', 24.89, 18.66),
  SensorPreset('APS-C 23.6 × 15.7 mm', 23.6, 15.7),
  SensorPreset('Micro 4/3 17.3 × 13 mm', 17.3, 13),
  SensorPreset('1” 13.2 × 8.8 mm', 13.2, 8.8),
  SensorPreset('ARRI Alexa 35 Open Gate 27.99 × 19.22 mm', 27.99, 19.22),
  SensorPreset('ARRI Alexa Mini LF Open Gate 36.70 × 25.54 mm', 36.70, 25.54),
  SensorPreset('RED V-Raptor 8K VV 40.96 × 21.60 mm', 40.96, 21.60),
];

String _fmt(double value, {int decimals = 2}) {
  if (value.isNaN || value.isInfinite) return '—';
  return value.toStringAsFixed(decimals);
}

double _read(TextEditingController controller, double fallback) {
  final raw = controller.text.trim().replaceAll(',', '.');
  return double.tryParse(raw) ?? fallback;
}

int _readInt(TextEditingController controller, int fallback) {
  final raw = controller.text.trim();
  return int.tryParse(raw) ?? fallback;
}

double _deg(double radians) => radians * 180 / math.pi;

double _fov(double sizeMm, double focalMm) {
  if (focalMm <= 0) return double.nan;
  return _deg(2 * math.atan(sizeMm / (2 * focalMm)));
}

class FieldOfViewPage extends StatefulWidget {
  const FieldOfViewPage({super.key});

  @override
  State<FieldOfViewPage> createState() => _FieldOfViewPageState();
}

class _FieldOfViewPageState extends State<FieldOfViewPage> {
  final focal = TextEditingController(text: '35');
  SensorPreset sensor = _sensorPresets.first;

  @override
  void dispose() {
    focal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focalMm = _read(focal, 35);

    return _CalcShell(
      pageId: 'tool:cinema_field_of_view',
      title: AppLocalizations.of(context).cinemaFieldOfViewTitle,
      description: AppLocalizations.of(context).cinemaFieldOfViewDescription,
      inputs: [
        _DropdownField<SensorPreset>(
          label: AppLocalizations.of(context).cinemaSensorLabel,
          value: sensor,
          items: _sensorPresets
              .map((s) => DropdownMenuItem(
                    value: s,
                    child: Text(
                      s.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          onChanged: (v) => setState(() => sensor = v ?? sensor),
        ),
        _NumberField(
          label: AppLocalizations.of(context).cinemaFocalLengthLabel,
          suffix: 'mm',
          controller: focal,
          onChanged: (_) => setState(() {}),
        ),
      ],
      results: [
        _ResultLine(
            label: AppLocalizations.of(context).cinemaHorizontalAngleResult,
            value: '${_fmt(_fov(sensor.widthMm, focalMm))}°'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaVerticalAngleResult,
            value: '${_fmt(_fov(sensor.heightMm, focalMm))}°'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaDiagonalAngleResult,
            value: '${_fmt(_fov(sensor.diagonalMm, focalMm))}°'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaSensorDiagonalResult,
            value: '${_fmt(sensor.diagonalMm)} mm'),
      ],
      info: AppLocalizations.of(context).cinemaFieldOfViewInfo,
    );
  }
}

class SubjectDistancePage extends StatefulWidget {
  const SubjectDistancePage({super.key});

  @override
  State<SubjectDistancePage> createState() => _SubjectDistancePageState();
}

class _SubjectDistancePageState extends State<SubjectDistancePage> {
  final focal = TextEditingController(text: '35');
  final subjectHeight = TextEditingController(text: '1.80');
  final frameFill = TextEditingController(text: '80');
  SensorPreset sensor = _sensorPresets.first;

  @override
  void dispose() {
    focal.dispose();
    subjectHeight.dispose();
    frameFill.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focalMm = _read(focal, 35);
    final subjectHeightM = _read(subjectHeight, 1.8);
    final fill = (_read(frameFill, 80) / 100).clamp(0.01, 1.0);
    final distanceM =
        (subjectHeightM * focalMm) / ((sensor.heightMm / 1000) * fill);

    return _CalcShell(
      pageId: 'tool:cinema_subject_distance',
      title: AppLocalizations.of(context).cinemaSubjectDistanceTitle,
      description:
          AppLocalizations.of(context).cinemaSubjectDistanceDescription,
      inputs: [
        _DropdownField<SensorPreset>(
          label: AppLocalizations.of(context).cinemaSensorLabel,
          value: sensor,
          items: _sensorPresets
              .map((s) => DropdownMenuItem(
                    value: s,
                    child: Text(
                      s.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          onChanged: (v) => setState(() => sensor = v ?? sensor),
        ),
        _NumberField(
            label: AppLocalizations.of(context).cinemaFocalLengthLabel,
            suffix: 'mm',
            controller: focal,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaSubjectHeightLabel,
            suffix: 'm',
            controller: subjectHeight,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaFrameFillLabel,
            suffix: '%',
            controller: frameFill,
            onChanged: (_) => setState(() {})),
      ],
      results: [
        _ResultLine(
            label: AppLocalizations.of(context).cinemaEstimatedDistanceResult,
            value: '${_fmt(distanceM)} m'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaFrameHeightResult,
            value: '${_fmt(subjectHeightM / fill)} m'),
      ],
      info: AppLocalizations.of(context).cinemaSubjectDistanceInfo,
    );
  }
}

class DepthOfFieldPage extends StatefulWidget {
  const DepthOfFieldPage({super.key});

  @override
  State<DepthOfFieldPage> createState() => _DepthOfFieldPageState();
}

class _DepthOfFieldPageState extends State<DepthOfFieldPage> {
  final focal = TextEditingController(text: '50');
  final aperture = TextEditingController(text: '2.8');
  final distance = TextEditingController(text: '3');
  final coc = TextEditingController(text: '0.03');

  @override
  void dispose() {
    focal.dispose();
    aperture.dispose();
    distance.dispose();
    coc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final f = _read(focal, 50);
    final n = _read(aperture, 2.8);
    final sMm = _read(distance, 3) * 1000;
    final c = _read(coc, 0.03);
    final h = (f * f) / (n * c) + f;
    final near = (h * sMm) / (h + (sMm - f));
    final farDenominator = h - (sMm - f);
    final far =
        farDenominator <= 0 ? double.infinity : (h * sMm) / farDenominator;
    final total = far.isInfinite ? double.infinity : far - near;

    return _CalcShell(
      pageId: 'tool:cinema_depth_of_field',
      title: AppLocalizations.of(context).cinemaDepthOfFieldTitle,
      description: AppLocalizations.of(context).cinemaDepthOfFieldDescription,
      inputs: [
        _NumberField(
            label: AppLocalizations.of(context).cinemaFocalLengthLabel,
            suffix: 'mm',
            controller: focal,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaApertureLabel,
            suffix: 'f/',
            controller: aperture,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaSubjectDistanceInputLabel,
            suffix: 'm',
            controller: distance,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaCocLabel,
            suffix: 'mm',
            controller: coc,
            helper: AppLocalizations.of(context).cinemaCocHelper,
            onChanged: (_) => setState(() {})),
      ],
      results: [
        _ResultLine(
            label: AppLocalizations.of(context).cinemaHyperfocalResult,
            value: '${_fmt(h / 1000)} m'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaNearLimitResult,
            value: '${_fmt(near / 1000)} m'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaFarLimitResult,
            value: far.isInfinite ? '∞' : '${_fmt(far / 1000)} m'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaTotalDepthResult,
            value: total.isInfinite ? '∞' : '${_fmt(total / 1000)} m'),
      ],
      info: AppLocalizations.of(context).cinemaDepthOfFieldInfo,
    );
  }
}

class LensEquivalencePage extends StatefulWidget {
  const LensEquivalencePage({super.key});

  @override
  State<LensEquivalencePage> createState() => _LensEquivalencePageState();
}

class _LensEquivalencePageState extends State<LensEquivalencePage> {
  final focal = TextEditingController(text: '35');
  SensorPreset fromSensor = _sensorPresets[1];
  SensorPreset toSensor = _sensorPresets.first;

  @override
  void dispose() {
    focal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focalMm = _read(focal, 35);
    final crop = toSensor.diagonalMm / fromSensor.diagonalMm;
    final equivalent = focalMm * crop;

    return _CalcShell(
      pageId: 'tool:cinema_lens_equivalence',
      title: AppLocalizations.of(context).cinemaLensEquivalenceTitle,
      description:
          AppLocalizations.of(context).cinemaLensEquivalenceDescription,
      inputs: [
        _DropdownField<SensorPreset>(
          label: AppLocalizations.of(context).cinemaSourceSensorLabel,
          value: fromSensor,
          items: _sensorPresets
              .map((s) => DropdownMenuItem(
                    value: s,
                    child: Text(
                      s.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          onChanged: (v) => setState(() => fromSensor = v ?? fromSensor),
        ),
        _DropdownField<SensorPreset>(
          label: AppLocalizations.of(context).cinemaTargetSensorLabel,
          value: toSensor,
          items: _sensorPresets
              .map((s) => DropdownMenuItem(
                    value: s,
                    child: Text(
                      s.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          onChanged: (v) => setState(() => toSensor = v ?? toSensor),
        ),
        _NumberField(
            label: AppLocalizations.of(context).cinemaSourceFocalLengthLabel,
            suffix: 'mm',
            controller: focal,
            onChanged: (_) => setState(() {})),
      ],
      results: [
        _ResultLine(
            label: AppLocalizations.of(context).cinemaEquivalentFocalResult,
            value: '${_fmt(equivalent)} mm'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaAppliedFactorResult,
            value: '×${_fmt(crop, decimals: 3)}'),
      ],
      info: AppLocalizations.of(context).cinemaLensEquivalenceInfo,
    );
  }
}

class AnamorphicPage extends StatefulWidget {
  const AnamorphicPage({super.key});

  @override
  State<AnamorphicPage> createState() => _AnamorphicPageState();
}

class _AnamorphicPageState extends State<AnamorphicPage> {
  final sensorRatio = TextEditingController(text: '1.78');
  final squeeze = TextEditingController(text: '2.0');
  final focal = TextEditingController(text: '50');

  @override
  void dispose() {
    sensorRatio.dispose();
    squeeze.dispose();
    focal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ratio = _read(sensorRatio, 1.78);
    final squeezeValue = _read(squeeze, 2.0);
    final focalMm = _read(focal, 50);
    final finalRatio = ratio * squeezeValue;
    final horizontalEquivalent = focalMm / squeezeValue;

    return _CalcShell(
      pageId: 'tool:cinema_anamorphic',
      title: AppLocalizations.of(context).cinemaAnamorphicTitle,
      description: AppLocalizations.of(context).cinemaAnamorphicDescription,
      inputs: [
        _NumberField(
            label: AppLocalizations.of(context).cinemaSensorRecordingRatioLabel,
            controller: sensorRatio,
            helper:
                AppLocalizations.of(context).cinemaSensorRecordingRatioHelper,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaAnamorphicFactorLabel,
            suffix: '×',
            controller: squeeze,
            helper: AppLocalizations.of(context).cinemaAnamorphicFactorHelper,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaOpticalFocalLengthLabel,
            suffix: 'mm',
            controller: focal,
            onChanged: (_) => setState(() {})),
      ],
      results: [
        _ResultLine(
            label: AppLocalizations.of(context).cinemaFinalRatioResult,
            value: '${_fmt(finalRatio)}:1'),
        _ResultLine(
            label: AppLocalizations.of(context)
                .cinemaHorizontalEquivalentFocalResult,
            value: '${_fmt(horizontalEquivalent)} mm'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaVerticalFocalResult,
            value: '${_fmt(focalMm)} mm'),
      ],
      info: AppLocalizations.of(context).cinemaAnamorphicInfo,
    );
  }
}

class ShutterPage extends StatefulWidget {
  const ShutterPage({super.key});

  @override
  State<ShutterPage> createState() => _ShutterPageState();
}

class _ShutterPageState extends State<ShutterPage> {
  final fps = TextEditingController(text: '25');
  final angle = TextEditingController(text: '180');

  @override
  void dispose() {
    fps.dispose();
    angle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fpsValue = _read(fps, 25);
    final angleValue = _read(angle, 180);
    final exposure = fpsValue <= 0 ? double.nan : angleValue / 360 / fpsValue;
    final denominator = exposure <= 0 ? double.nan : 1 / exposure;

    return _CalcShell(
      pageId: 'tool:cinema_shutter',
      title: AppLocalizations.of(context).cinemaShutterTitle,
      description: AppLocalizations.of(context).cinemaShutterDescription,
      inputs: [
        _NumberField(
            label: AppLocalizations.of(context).cinemaFramerateLabel,
            suffix: 'fps',
            controller: fps,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaShutterAngleLabel,
            suffix: '°',
            controller: angle,
            onChanged: (_) => setState(() {})),
      ],
      results: [
        _ResultLine(
            label: AppLocalizations.of(context).cinemaExposureTimeResult,
            value: '${_fmt(exposure, decimals: 5)} s'),
        _ResultLine(
            label:
                AppLocalizations.of(context).cinemaEquivalentShutterSpeedResult,
            value: '1/${_fmt(denominator, decimals: 0)} s'),
      ],
      info: AppLocalizations.of(context).cinemaShutterInfo,
    );
  }
}

class FlickerFreePage extends StatefulWidget {
  const FlickerFreePage({super.key});

  @override
  State<FlickerFreePage> createState() => _FlickerFreePageState();
}

class _FlickerFreePageState extends State<FlickerFreePage> {
  double mains = 50;

  @override
  Widget build(BuildContext context) {
    final speeds = List<int>.generate(8, (i) => ((i + 1) * mains).round());

    return _CalcShell(
      pageId: 'tool:cinema_flicker_free',
      title: AppLocalizations.of(context).cinemaFlickerTitle,
      description: AppLocalizations.of(context).cinemaFlickerDescription,
      inputs: [
        _DropdownField<double>(
          label: AppLocalizations.of(context).cinemaMainsFrequencyLabel,
          value: mains,
          items: [
            DropdownMenuItem(
              value: 50,
              child: Text(AppLocalizations.of(context).cinemaMains50Hz),
            ),
            DropdownMenuItem(
              value: 60,
              child: Text(AppLocalizations.of(context).cinemaMains60Hz),
            ),
          ],
          onChanged: (v) => setState(() => mains = v ?? mains),
        ),
      ],
      results: [
        _ResultLine(
            label: AppLocalizations.of(context).cinemaRecommendedSpeedsResult,
            value: speeds.map((s) => '1/$s').join('  ·  ')),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaMainsBaseResult,
            value: '${_fmt(mains, decimals: 0)} Hz'),
      ],
      info: AppLocalizations.of(context).cinemaFlickerInfo,
    );
  }
}

class NdExposurePage extends StatefulWidget {
  const NdExposurePage({super.key});

  @override
  State<NdExposurePage> createState() => _NdExposurePageState();
}

class _NdExposurePageState extends State<NdExposurePage> {
  final stops = TextEditingController(text: '3');

  @override
  void dispose() {
    stops.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stopValue = _read(stops, 3);
    final density = stopValue * 0.3;
    final factor = math.pow(2, stopValue).toDouble();

    return _CalcShell(
      pageId: 'tool:cinema_nd_exposure',
      title: AppLocalizations.of(context).cinemaNdExposureTitle,
      description: AppLocalizations.of(context).cinemaNdExposureDescription,
      inputs: [
        _NumberField(
            label: AppLocalizations.of(context).cinemaReductionLabel,
            suffix: 'stops',
            controller: stops,
            onChanged: (_) => setState(() {})),
      ],
      results: [
        _ResultLine(
            label: AppLocalizations.of(context).cinemaNdDensityResult,
            value: 'ND ${_fmt(density, decimals: 1)}'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaNdFactorResult,
            value: 'ND ${_fmt(factor, decimals: 0)}'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaApproxTransmissionResult,
            value: '${_fmt(100 / factor)} %'),
      ],
      info: AppLocalizations.of(context).cinemaNdExposureInfo,
    );
  }
}

class RecordingStoragePage extends StatefulWidget {
  const RecordingStoragePage({super.key});

  @override
  State<RecordingStoragePage> createState() => _RecordingStoragePageState();
}

class _RecordingStoragePageState extends State<RecordingStoragePage> {
  final capacity = TextEditingController(text: '256');
  final bitrate = TextEditingController(text: '400');

  @override
  void dispose() {
    capacity.dispose();
    bitrate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final capacityGb = _read(capacity, 256);
    final bitrateMbps = _read(bitrate, 400);
    final totalMb = capacityGb * 8000;
    final seconds = bitrateMbps <= 0 ? double.nan : totalMb / bitrateMbps;
    final minutes = seconds / 60;
    final hours = minutes / 60;
    final gbPerHour = bitrateMbps * 3600 / 8000;

    return _CalcShell(
      pageId: 'tool:cinema_recording_storage',
      title: AppLocalizations.of(context).cinemaRecordingStorageTitle,
      description:
          AppLocalizations.of(context).cinemaRecordingStorageDescription,
      inputs: [
        _NumberField(
            label: AppLocalizations.of(context).cinemaMediaCapacityLabel,
            suffix: 'GB',
            controller: capacity,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaBitrateLabel,
            suffix: 'Mb/s',
            controller: bitrate,
            helper: AppLocalizations.of(context).cinemaBitrateHelper,
            onChanged: (_) => setState(() {})),
      ],
      results: [
        _ResultLine(
            label: AppLocalizations.of(context).cinemaAvailableDurationResult,
            value: '${_fmt(hours)} h'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaAvailableDurationResult,
            value: '${_fmt(minutes, decimals: 0)} min'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaStorageConsumptionResult,
            value: '${_fmt(gbPerHour)} GB/h'),
      ],
      info: AppLocalizations.of(context).cinemaRecordingStorageInfo,
    );
  }
}

class TimecodePage extends StatefulWidget {
  const TimecodePage({super.key});

  @override
  State<TimecodePage> createState() => _TimecodePageState();
}

class _TimecodePageState extends State<TimecodePage> {
  final fps = TextEditingController(text: '25');
  final tcIn = TextEditingController(text: '01:00:00:00');
  final tcOut = TextEditingController(text: '01:02:30:00');

  @override
  void dispose() {
    fps.dispose();
    tcIn.dispose();
    tcOut.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fpsValue = _readInt(fps, 25).clamp(1, 120);
    final inFrames = _parseTc(tcIn.text, fpsValue);
    final outFrames = _parseTc(tcOut.text, fpsValue);
    final durationFrames = outFrames - inFrames;
    final durationSeconds = durationFrames / fpsValue;

    return _CalcShell(
      pageId: 'tool:cinema_timecode',
      title: AppLocalizations.of(context).cinemaTimecodeTitle,
      description: AppLocalizations.of(context).cinemaTimecodeDescription,
      inputs: [
        _NumberField(
            label: AppLocalizations.of(context).cinemaIntegerFramerateLabel,
            suffix: 'fps',
            controller: fps,
            helper: AppLocalizations.of(context).cinemaIntegerFramerateHelper,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaTcInLabel,
            controller: tcIn,
            helper: AppLocalizations.of(context).cinemaTimecodeFormatHelper,
            textInputType: TextInputType.text,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaTcOutLabel,
            controller: tcOut,
            helper: AppLocalizations.of(context).cinemaTimecodeFormatHelper,
            textInputType: TextInputType.text,
            onChanged: (_) => setState(() {})),
      ],
      results: [
        _ResultLine(
            label: AppLocalizations.of(context).cinemaTcInFramesResult,
            value: '$inFrames'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaTcOutFramesResult,
            value: '$outFrames'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaDurationFramesResult,
            value: '$durationFrames'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaDurationResult,
            value: _secondsToReadable(durationSeconds)),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaDurationTcResult,
            value: _framesToTc(durationFrames.abs(), fpsValue)),
      ],
      info: AppLocalizations.of(context).cinemaTimecodeInfo,
    );
  }
}

int _parseTc(String value, int fps) {
  final parts = value.trim().split(RegExp(r'[:;]'));
  if (parts.length != 4) return 0;
  final h = int.tryParse(parts[0]) ?? 0;
  final m = int.tryParse(parts[1]) ?? 0;
  final s = int.tryParse(parts[2]) ?? 0;
  final f = int.tryParse(parts[3]) ?? 0;
  return (((h * 60 + m) * 60 + s) * fps) + f;
}

String _framesToTc(int frames, int fps) {
  var remaining = frames;
  final h = remaining ~/ (fps * 3600);
  remaining %= fps * 3600;
  final m = remaining ~/ (fps * 60);
  remaining %= fps * 60;
  final s = remaining ~/ fps;
  final f = remaining % fps;
  String two(int v) => v.toString().padLeft(2, '0');
  return '${two(h)}:${two(m)}:${two(s)}:${two(f)}';
}

String _secondsToReadable(double seconds) {
  if (seconds.isNaN || seconds.isInfinite) return '—';
  final sign = seconds < 0 ? '-' : '';
  final total = seconds.abs().round();
  final h = total ~/ 3600;
  final m = (total % 3600) ~/ 60;
  final s = total % 60;
  return '$sign${h}h ${m}min ${s}s';
}

class SlowMotionPage extends StatefulWidget {
  const SlowMotionPage({super.key});

  @override
  State<SlowMotionPage> createState() => _SlowMotionPageState();
}

class _SlowMotionPageState extends State<SlowMotionPage> {
  final captureFps = TextEditingController(text: '100');
  final playbackFps = TextEditingController(text: '25');
  final realDuration = TextEditingController(text: '10');

  @override
  void dispose() {
    captureFps.dispose();
    playbackFps.dispose();
    realDuration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final capture = _read(captureFps, 100);
    final playback = _read(playbackFps, 25);
    final real = _read(realDuration, 10);
    final factor = playback <= 0 ? double.nan : capture / playback;
    final screenDuration = real * factor;

    return _CalcShell(
      pageId: 'tool:cinema_slow_motion',
      title: AppLocalizations.of(context).cinemaSlowMotionTitle,
      description: AppLocalizations.of(context).cinemaSlowMotionDescription,
      inputs: [
        _NumberField(
            label: AppLocalizations.of(context).cinemaCaptureFramerateLabel,
            suffix: 'fps',
            controller: captureFps,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaPlaybackFramerateLabel,
            suffix: 'fps',
            controller: playbackFps,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaRealDurationLabel,
            suffix: 's',
            controller: realDuration,
            onChanged: (_) => setState(() {})),
      ],
      results: [
        _ResultLine(
            label: AppLocalizations.of(context).cinemaSlowMotionFactorResult,
            value: '×${_fmt(factor)}'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaPlaybackDurationResult,
            value: '${_fmt(screenDuration)} s'),
      ],
      info: AppLocalizations.of(context).cinemaSlowMotionInfo,
    );
  }
}

class CinemaProjectionPage extends StatefulWidget {
  const CinemaProjectionPage({super.key});

  @override
  State<CinemaProjectionPage> createState() => _CinemaProjectionPageState();
}

class _CinemaProjectionPageState extends State<CinemaProjectionPage> {
  final width = TextEditingController(text: '12');
  final ratio = TextEditingController(text: '2.39');
  final throwRatio = TextEditingController(text: '1.6');
  final lumens = TextEditingController(text: '15000');
  final gain = TextEditingController(text: '1.0');

  @override
  void dispose() {
    width.dispose();
    ratio.dispose();
    throwRatio.dispose();
    lumens.dispose();
    gain.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthM = _read(width, 12);
    final ratioValue = _read(ratio, 2.39);
    final throwValue = _read(throwRatio, 1.6);
    final lumensValue = _read(lumens, 15000);
    final gainValue = _read(gain, 1.0);
    final heightM = ratioValue <= 0 ? double.nan : widthM / ratioValue;
    final areaM2 = widthM * heightM;
    final distanceM = widthM * throwValue;
    final nits = areaM2 <= 0
        ? double.nan
        : (lumensValue * gainValue) / (math.pi * areaM2);
    final footLamberts = nits / 3.426;

    return _CalcShell(
      pageId: 'tool:cinema_projection',
      title: AppLocalizations.of(context).cinemaProjectionTitle,
      description: AppLocalizations.of(context).cinemaProjectionDescription,
      inputs: [
        _NumberField(
            label: AppLocalizations.of(context).cinemaScreenWidthLabel,
            suffix: 'm',
            controller: width,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaImageRatioLabel,
            controller: ratio,
            helper: AppLocalizations.of(context).cinemaImageRatioHelper,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaThrowRatioLabel,
            controller: throwRatio,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaProjectorLumensLabel,
            suffix: 'lumens',
            controller: lumens,
            onChanged: (_) => setState(() {})),
        _NumberField(
            label: AppLocalizations.of(context).cinemaScreenGainLabel,
            controller: gain,
            onChanged: (_) => setState(() {})),
      ],
      results: [
        _ResultLine(
            label: AppLocalizations.of(context).cinemaScreenHeightResult,
            value: '${_fmt(heightM)} m'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaScreenAreaResult,
            value: '${_fmt(areaM2)} m²'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaProjectorDistanceResult,
            value: '${_fmt(distanceM)} m'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaApproxLuminanceResult,
            value: '${_fmt(nits)} nits'),
        _ResultLine(
            label: AppLocalizations.of(context).cinemaApproxLuminanceResult,
            value: '${_fmt(footLamberts)} ft-L'),
      ],
      info: AppLocalizations.of(context).cinemaProjectionInfo,
    );
  }
}
