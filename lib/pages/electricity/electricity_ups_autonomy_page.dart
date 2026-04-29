// lib/pages/electricity/electricity_ups_autonomy_page.dart
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import 'widgets/electricity_form_widgets.dart';
import 'widgets/electricity_result_card.dart';

class ElectricityUpsAutonomyPage extends StatefulWidget {
  const ElectricityUpsAutonomyPage({super.key});

  @override
  State<ElectricityUpsAutonomyPage> createState() =>
      _ElectricityUpsAutonomyPageState();
}

class _ElectricityUpsAutonomyPageState
    extends State<ElectricityUpsAutonomyPage> {
  final _capCtrl = TextEditingController();
  final _voltCtrl = TextEditingController(text: '12');
  final _loadCtrl = TextEditingController();
  final _effCtrl = TextEditingController(text: '85');
  final _countCtrl = TextEditingController(text: '1');

  String _autonomy = '';
  String _autonomyLabel = '';
  Color _autonomyColor = Colors.greenAccent;

  @override
  void dispose() {
    _capCtrl.dispose();
    _voltCtrl.dispose();
    _loadCtrl.dispose();
    _effCtrl.dispose();
    _countCtrl.dispose();
    super.dispose();
  }

  double? _parse(String value) {
    return double.tryParse(value.trim().replaceAll(',', '.'));
  }

  void _calculate() {
    final loc = AppLocalizations.of(context);
    final capacity = _parse(_capCtrl.text);
    final voltage = _parse(_voltCtrl.text);
    final load = _parse(_loadCtrl.text);
    final efficiency = (_parse(_effCtrl.text) ?? 85) / 100;
    final count = _parse(_countCtrl.text) ?? 1;

    if (capacity == null || voltage == null || load == null || load <= 0) {
      setState(() {
        _autonomy = '—';
        _autonomyLabel = loc.electricityInsufficient;
        _autonomyColor = Colors.redAccent;
      });
      return;
    }

    final totalWh = capacity * voltage * count * efficiency;
    final hours = totalWh / load;
    final h = hours.floor();
    final m = ((hours - h) * 60).round();
    final time = h > 0 ? '${h}h ${m}min' : '$m min';
    final color = hours < 0.25
        ? Colors.redAccent
        : hours < 1
            ? Colors.orangeAccent
            : hours >= 2
                ? Colors.greenAccent
                : Colors.orangeAccent;

    setState(() {
      _autonomy = time;
      _autonomyLabel =
          loc.electricityUpsEnergyAvail(totalWh.toStringAsFixed(0));
      _autonomyColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.electricityToolUpsTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _UpsIcon(
                  icon: Icons.battery_full,
                  label: loc.electricityUpsBatterySection,
                  color: Colors.greenAccent,
                ),
                const Icon(Icons.arrow_forward, color: Colors.white24),
                const _UpsIcon(
                  icon: Icons.electrical_services,
                  label: 'UPS',
                  color: Colors.lightBlueAccent,
                ),
                const Icon(Icons.arrow_forward, color: Colors.white24),
                _UpsIcon(
                  icon: Icons.devices,
                  label: loc.electricityUpsLoadSectionTitle,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: loc.electricityUpsBatterySection,
            icon: Icons.battery_charging_full,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElectricityNumField(
                        controller: _capCtrl,
                        label: loc.electricityUpsCapacityLabel,
                        hint: loc.electricityUpsCapacityHint,
                        suffix: 'Ah',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElectricityNumField(
                        controller: _voltCtrl,
                        label: loc.electricityUpsVoltageLabel,
                        hint: loc.electricityUpsVoltageHint,
                        suffix: 'V',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElectricityNumField(
                        controller: _countCtrl,
                        label: loc.electricityUpsCountLabel,
                        hint: loc.electricityUpsCountHint,
                        suffix: 'x',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElectricityNumField(
                        controller: _effCtrl,
                        label: loc.electricityUpsEfficiencyLabel,
                        hint: loc.electricityUpsEfficiencyHint,
                        suffix: '%',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SectionCard(
            title: loc.electricityUpsLoadSectionTitle,
            icon: Icons.devices,
            child: Column(
              children: [
                ElectricityNumField(
                  controller: _loadCtrl,
                  label: loc.electricityUpsLoadLabel,
                  hint: loc.electricityUpsLoadHint,
                  suffix: 'W',
                ),
                const SizedBox(height: 8),
                Text(
                  loc.electricityUpsLoadDesc,
                  style: const TextStyle(color: Colors.white38, fontSize: 12),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _calculate,
                    icon: const Icon(Icons.battery_charging_full),
                    label: Text(loc.electricityUpsCalculate),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          if (_autonomy.isNotEmpty)
            ElectricityResultCard(
              label: _autonomyLabel,
              value: _autonomy,
              color: _autonomyColor,
              icon: Icons.timer,
            ),
          const SizedBox(height: 16),
          SectionCard(
            title: loc.electricityUpsRefTitle,
            icon: Icons.info_outline,
            child: Column(
              children: [
                _RefRow(
                  title: loc.electricityUpsRef1,
                  detail: loc.electricityUpsRef1Detail,
                ),
                _RefRow(
                  title: loc.electricityUpsRef2,
                  detail: loc.electricityUpsRef2Detail,
                ),
                _RefRow(
                  title: loc.electricityUpsRef3Title,
                  detail: loc.electricityUpsRef3Value,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UpsIcon extends StatelessWidget {
  const _UpsIcon({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: color, fontSize: 11)),
      ],
    );
  }
}

class _RefRow extends StatelessWidget {
  const _RefRow({required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
          Text(
            detail,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
