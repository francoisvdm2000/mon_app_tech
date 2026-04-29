// lib/pages/laser_page.dart
import 'package:flutter/material.dart';

import '../app/ui/widgets.dart'; // numFormatter, SectionCard, ExpandSectionCard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../services/subscription_service.dart';
import 'subscription_page.dart';
import 'laser/laser_calculations.dart';
import 'laser/laser_storage.dart';
import 'laser/laser_beam_size_page.dart';

class LaserPage extends StatefulWidget {
  const LaserPage({super.key});

  @override
  State<LaserPage> createState() => _LaserPageState();
}

class _LaserPageState extends State<LaserPage> {
  final _powerController = TextEditingController();
  final _divergenceController = TextEditingController();
  final _diameterController = TextEditingController();
  final _targetDistanceController = TextEditingController();

  final _searchController = TextEditingController();
  String _searchQuery = '';

  bool _isCheckingPro = true;
  bool _isPro = false;

  LaserResults _zones =
      const LaserResults(nohdMeter: 0, czedMeter: 0, szedMeter: 0);
  TargetDistanceAssessment _target = const TargetDistanceAssessment(
    powerMaxWattAtTarget: 0,
    usagePercent: 0,
    recommendedMaxPercent: 0,
    isWithinLimit: true,
  );

  List<LaserPreset> _presets = [];

  @override
  void initState() {
    super.initState();

    _powerController.addListener(_recompute);
    _divergenceController.addListener(_recompute);
    _diameterController.addListener(_recompute);
    _targetDistanceController.addListener(_recompute);

    _searchController.addListener(() {
      setState(
        () => _searchQuery = _searchController.text.trim().toLowerCase(),
      );
    });

    _initPage();
  }

  Future<void> _initPage() async {
    final hasAccess =
        await SubscriptionService.hasAccess(SubscriptionCategory.laser);
    if (!mounted) return;

    if (!hasAccess) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) =>
              const SubscriptionPage(category: SubscriptionCategory.laser),
        ),
      );
      return;
    }

    setState(() {
      _isPro = true;
      _isCheckingPro = false;
    });

    await _loadPresets();
  }

  @override
  void dispose() {
    _powerController.dispose();
    _divergenceController.dispose();
    _diameterController.dispose();
    _targetDistanceController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadPresets() async {
    final list = await LaserStorage.loadPresets();
    if (!mounted) return;
    setState(() => _presets = list);
  }

  double? _parseDouble(String raw) {
    final t = raw.trim().replaceAll(',', '.');
    if (t.isEmpty) return null;
    return double.tryParse(t);
  }

  LaserInputs? _readInputs() {
    final p = _parseDouble(_powerController.text);
    final div = _parseDouble(_divergenceController.text);
    final d = _parseDouble(_diameterController.text);

    if (p == null || div == null || d == null) return null;
    if (p <= 0 || div <= 0 || d <= 0) return null;

    return LaserInputs(
      powerMilliwatt: p,
      divergenceMilliradian: div,
      outputDiameterMillimeter: d,
    );
  }

  void _recompute() {
    final inputs = _readInputs();
    if (inputs == null) {
      setState(() {
        _zones = const LaserResults(nohdMeter: 0, czedMeter: 0, szedMeter: 0);
        _target = const TargetDistanceAssessment(
          powerMaxWattAtTarget: 0,
          usagePercent: 0,
          recommendedMaxPercent: 0,
          isWithinLimit: true,
        );
      });
      return;
    }

    final zones = LaserCalculations.computeZones(inputs);

    final targetDistance = _parseDouble(_targetDistanceController.text) ?? 0.0;
    final target = targetDistance > 0
        ? LaserCalculations.assessAtTargetDistance(
            inputs: inputs,
            targetDistanceMeter: targetDistance,
          )
        : const TargetDistanceAssessment(
            powerMaxWattAtTarget: 0,
            usagePercent: 0,
            recommendedMaxPercent: 0,
            isWithinLimit: true,
          );

    setState(() {
      _zones = zones;
      _target = target;
    });
  }

  String _formatMeters(double value) {
    if (value <= 0) return '0 m';
    if (value < 10) return '${value.toStringAsFixed(1)} m';
    return '${value.toStringAsFixed(0)} m';
  }

  String _formatPercent(double value) {
    if (value <= 0) return '0 %';
    if (value >= 100) return '100 %';
    return '${value.toStringAsFixed(0)} %';
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<String?> _askNameDialog() async {
    final loc = AppLocalizations.of(context);
    final controller = TextEditingController();

    return showDialog<String?>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(loc.laserSaveProjectorTitle),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(labelText: loc.laserProjectorNameLabel),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, null),
              child: Text(loc.commonCancel),
            ),
            ElevatedButton(
              onPressed: () {
                final name = controller.text.trim();
                if (name.isEmpty) return;
                Navigator.pop(ctx, name);
              },
              child: Text(loc.commonSave),
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveCurrentPreset() async {
    final loc = AppLocalizations.of(context);
    final inputs = _readInputs();
    if (inputs == null) {
      _showSnack(loc.laserInvalidInputs);
      return;
    }

    final name = await _askNameDialog();
    if (name == null) return;

    final targetDistance = _parseDouble(_targetDistanceController.text);
    final preset = LaserPreset(
      id: LaserStorage.makeId(),
      name: name,
      powerMilliwatt: inputs.powerMilliwatt,
      divergenceMilliradian: inputs.divergenceMilliradian,
      outputDiameterMillimeter: inputs.outputDiameterMillimeter,
      targetDistanceMeter: (targetDistance != null && targetDistance > 0)
          ? targetDistance
          : null,
      createdAt: DateTime.now(),
    );

    await LaserStorage.savePreset(preset);
    await _loadPresets();
    _showSnack(loc.laserPresetAdded);
  }

  void _applyPreset(LaserPreset preset) {
    _powerController.text = preset.powerMilliwatt.toString();
    _divergenceController.text = preset.divergenceMilliradian.toString();
    _diameterController.text = preset.outputDiameterMillimeter.toString();
    _targetDistanceController.text =
        preset.targetDistanceMeter?.toString() ?? '';
    _recompute();
  }

  Future<void> _deletePreset(LaserPreset preset) async {
    final loc = AppLocalizations.of(context);
    await LaserStorage.deletePreset(preset.id);
    await _loadPresets();
    _showSnack(loc.laserPresetDeleted);
  }

  Future<void> _renamePreset(LaserPreset preset) async {
    final loc = AppLocalizations.of(context);
    final controller = TextEditingController(text: preset.name);

    final newName = await showDialog<String?>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.laserRenameProjectorTitle),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(labelText: loc.laserProjectorNameLabel),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, null),
            child: Text(loc.commonCancel),
          ),
          ElevatedButton(
            onPressed: () {
              final name = controller.text.trim();
              if (name.isEmpty) return;
              Navigator.pop(ctx, name);
            },
            child: Text(loc.commonRename),
          ),
        ],
      ),
    );

    if (newName == null) return;

    final updated = LaserPreset(
      id: preset.id,
      name: newName,
      powerMilliwatt: preset.powerMilliwatt,
      divergenceMilliradian: preset.divergenceMilliradian,
      outputDiameterMillimeter: preset.outputDiameterMillimeter,
      targetDistanceMeter: preset.targetDistanceMeter,
      createdAt: preset.createdAt,
    );

    await LaserStorage.savePreset(updated);
    await _loadPresets();

    if (!mounted) return;
    _showSnack(loc.laserNameUpdated);
  }

  InputDecoration _dec(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
    );
  }

  Widget _numField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputAction? action,
    VoidCallback? onDone,
  }) {
    return TextField(
      controller: controller,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true, signed: false),
      inputFormatters: [numFormatter],
      textInputAction: action,
      onSubmitted: (_) => onDone?.call(),
      decoration: _dec(label, hint),
    );
  }

  Widget _resultsCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }

  Widget _zoneLine({
    required String label,
    required String desc,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B0B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: color.withValues(alpha: 0.35)),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: color.withValues(alpha: 0.95),
                fontWeight: FontWeight.w900,
                letterSpacing: 0.4,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              desc,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.70),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Colors.white.withValues(alpha: 0.95),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    if (_isCheckingPro) {
      return Scaffold(
        appBar: AppBar(title: Text(loc.homeLaserTitle)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (!_isPro) {
      return Scaffold(
        appBar: AppBar(title: Text(loc.homeLaserTitle)),
        body: const SizedBox.shrink(),
      );
    }

    final bottomPad = MediaQuery.of(context).viewPadding.bottom;

    final targetDistanceRaw = _targetDistanceController.text.trim();
    final parsedTargetDistance = _parseDouble(targetDistanceRaw) ?? 0.0;
    final hasTargetDistance =
        targetDistanceRaw.isNotEmpty && parsedTargetDistance > 0;

    final within = _target.isWithinLimit;
    final adviceColor = within ? Colors.greenAccent : Colors.redAccent;

    final String? adviceText = !hasTargetDistance
        ? null
        : (within
            ? loc.laserAdviceFullPower
            : loc.laserAdviceMaxRecommended(
                _formatPercent(_target.recommendedMaxPercent)));

    final filteredPresets = _presets.where((p) {
      if (_searchQuery.isEmpty) return true;
      return p.name.toLowerCase().contains(_searchQuery);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.homeLaserTitle),
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottomPad),
          child: Column(
            children: [
              SectionCard(
                title: loc.laserToolsTitle,
                icon: Icons.build_outlined,
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.straighten),
                      title: Text(
                        loc.laserBeamSizeTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        loc.laserBeamSizeSubtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.65),
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const LaserBeamSizePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: loc.laserInputsTitle,
                icon: Icons.tune,
                child: Column(
                  children: [
                    _numField(
                      controller: _powerController,
                      label: loc.laserPowerLabel,
                      hint: loc.laserPowerHint,
                      action: TextInputAction.next,
                    ),
                    const SizedBox(height: 12),
                    _numField(
                      controller: _divergenceController,
                      label: loc.laserDivergenceLabel,
                      hint: loc.laserDivergenceHint,
                      action: TextInputAction.next,
                    ),
                    const SizedBox(height: 12),
                    _numField(
                      controller: _diameterController,
                      label: loc.laserDiameterLabel,
                      hint: loc.laserDiameterHint,
                      action: TextInputAction.done,
                      onDone: _recompute,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _saveCurrentPreset,
                            icon: const Icon(Icons.save),
                            label: Text(loc.laserSaveCurrentProjector),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _resultsCard(
                title: loc.laserSafetyResultsTitle,
                icon: Icons.shield_outlined,
                child: Column(
                  children: [
                    _zoneLine(
                      label: 'NOHD',
                      desc: loc.laserZoneNohdDesc,
                      value: _formatMeters(_zones.nohdMeter),
                      color: Colors.redAccent,
                    ),
                    const SizedBox(height: 10),
                    _zoneLine(
                      label: 'SZED',
                      desc: loc.laserZoneSzedDesc,
                      value: _formatMeters(_zones.szedMeter),
                      color: Colors.lightBlueAccent,
                    ),
                    const SizedBox(height: 10),
                    _zoneLine(
                      label: 'CZED',
                      desc: loc.laserZoneCzedDesc,
                      value: _formatMeters(_zones.czedMeter),
                      color: Colors.deepOrangeAccent,
                    ),
                    const SizedBox(height: 14),
                    const Divider(height: 1, color: Colors.white12),
                    const SizedBox(height: 14),
                    _numField(
                      controller: _targetDistanceController,
                      label: loc.laserTargetDistanceLabel,
                      hint: loc.laserTargetDistanceHint,
                      action: TextInputAction.done,
                      onDone: _recompute,
                    ),
                    if (adviceText != null) ...[
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          adviceText,
                          style: TextStyle(
                            color: adviceColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: loc.laserSavedProjectorsTitle,
                icon: Icons.bookmarks_outlined,
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: loc.commonSearch,
                        hintText: loc.laserSearchHint,
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (filteredPresets.isEmpty)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          loc.commonNone,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.70),
                          ),
                        ),
                      )
                    else
                      Column(
                        children: filteredPresets.map((p) {
                          final pStr = p.powerMilliwatt.toStringAsFixed(0);
                          final divStr =
                              p.divergenceMilliradian.toStringAsFixed(2);
                          final dStr =
                              p.outputDiameterMillimeter.toStringAsFixed(1);

                          return Dismissible(
                            key: ValueKey(p.id),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 16),
                              color: Colors.redAccent.withValues(alpha: 0.85),
                              child:
                                  const Icon(Icons.delete, color: Colors.white),
                            ),
                            onDismissed: (_) => _deletePreset(p),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                p.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              subtitle: Text(
                                loc.laserPresetSubtitle(pStr, divStr, dStr),
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.65),
                                ),
                              ),
                              trailing: IconButton(
                                tooltip: loc.commonRename,
                                icon: const Icon(Icons.edit),
                                onPressed: () => _renamePreset(p),
                              ),
                              onTap: () => _applyPreset(p),
                            ),
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ExpandSectionCard(
                title: loc.laserNormativeParamsTitle,
                icon: Icons.info_outline,
                initiallyExpanded: false,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0B0B0B),
                    borderRadius: BorderRadius.circular(14),
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.10)),
                  ),
                  child: Text(
                    loc.laserNormativeParamsBody,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      height: 1.35,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                loc.laserDisclaimerShort,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.38),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
