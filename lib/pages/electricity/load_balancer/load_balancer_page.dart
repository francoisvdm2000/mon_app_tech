// lib/pages/electricity/load_balancer/load_balancer_page.dart
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'load_balancer_models.dart';
import 'load_balancer_storage.dart';
import 'load_balancer_fixture_picker.dart';
import '../../about/about_favorites.dart';

class ElectricityLoadBalancerPage extends StatefulWidget {
  const ElectricityLoadBalancerPage({super.key});

  @override
  State<ElectricityLoadBalancerPage> createState() =>
      _ElectricityLoadBalancerPageState();
}

class _ElectricityLoadBalancerPageState
    extends State<ElectricityLoadBalancerPage> {
  LoadDistribution _dist = LoadDistribution.empty;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final saved = await LoadBalancerStorage.load();
    if (!mounted) return;
    setState(() {
      _dist = saved;
      _loading = false;
    });
  }

  Future<void> _save(LoadDistribution d) async {
    setState(() => _dist = d);
    await LoadBalancerStorage.save(d);
  }

  Future<void> _addFixture() async {
    final item = await showFixturePickerSheet(
      context,
      voltageType: _dist.voltageType,
    );
    if (item == null) return;
    await _save(_dist.copyWith(items: [..._dist.items, item]));
  }

  Future<void> _reset() async {
    final loc = AppLocalizations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF161622),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(loc.lbResetDialogTitle,
            style: const TextStyle(color: Colors.white)),
        content: Text(
          loc.lbResetDialogBody,
          style: const TextStyle(color: Colors.white54),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(loc.commonCancel, style: const TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(loc.lbClearAction, style: const TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
    if (confirm != true) return;
    await _save(_dist.copyWith(items: []));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.lbPageTitle),
        actions: [
          const AboutPinButton(pageId: 'tool:electricity_load_balancer', sectionId: 'main'),
          if (_dist.items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.restart_alt),
              tooltip: loc.lbResetTooltip,
              onPressed: _reset,
            ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator(color: Colors.amber))
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
                      children: [
                        // ── Config tableau ───────────────────────
                        _PanelConfigCard(
                          dist: _dist,
                          onVoltageChanged: (v) =>
                              _save(_dist.copyWith(voltageType: v)),
                          onSizeChanged: (v) =>
                              _save(_dist.copyWith(panelSize: v)),
                          onCosPhiChanged: (v) =>
                              _save(_dist.copyWith(cosPhi: v)),
                        ),

                        const SizedBox(height: 14),

                        // ── Jauges par phase ─────────────────────
                        _PhaseGaugesCard(dist: _dist),

                        const SizedBox(height: 14),

                        // ── Liste fixtures ───────────────────────
                        if (_dist.items.isEmpty)
                          _EmptyState(onAdd: _addFixture)
                        else
                          _FixtureListCard(
                            dist: _dist,
                            onRemove: (id) => _save(_dist.copyWith(
                              items:
                                  _dist.items.where((i) => i.id != id).toList(),
                            )),
                            onPhaseChanged: (id, phase) {
                              final updated = _dist.items.map((i) {
                                if (i.id == id) return i.copyWith(phase: phase);
                                return i;
                              }).toList();
                              _save(_dist.copyWith(items: updated));
                            },
                            onQuantityChanged: (id, qty) {
                              final updated = _dist.items.map((i) {
                                if (i.id == id) {
                                  return i.copyWith(quantity: qty);
                                }
                                return i;
                              }).toList();
                              _save(_dist.copyWith(items: updated));
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: _loading
          ? null
          : FloatingActionButton.extended(
              onPressed: _addFixture,
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              icon: const Icon(Icons.add),
              label: Text(loc.commonAdd,
                  style: const TextStyle(fontWeight: FontWeight.w800)),
            ),
    );
  }
}

// ─── Config du tableau ────────────────────────────────────────────────────────

class _PanelConfigCard extends StatelessWidget {
  const _PanelConfigCard({
    required this.dist,
    required this.onVoltageChanged,
    required this.onSizeChanged,
    required this.onCosPhiChanged,
  });

  final LoadDistribution dist;
  final ValueChanged<PanelVoltageType> onVoltageChanged;
  final ValueChanged<PanelSize> onSizeChanged;
  final ValueChanged<double> onCosPhiChanged;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return _Card(
      icon: Icons.electrical_services,
      title: loc.lbPanelConfigTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Voltage type
          _ConfigLabel(loc.lbVoltageTypeLabel),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: PanelVoltageType.values.map((v) {
              final sel = dist.voltageType == v;
              return _Chip(
                label: v.label,
                selected: sel,
                color: Colors.amber,
                onTap: () => onVoltageChanged(v),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          // Panel size
          _ConfigLabel(loc.lbPanelSizeLabel),
          const SizedBox(height: 6),
          Row(
            children: PanelSize.values.map((s) {
              final sel = dist.panelSize == s;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onSizeChanged(s),
                  child: Container(
                    margin: EdgeInsets.only(
                        right: s != PanelSize.values.last ? 8 : 0),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: sel
                          ? Colors.purpleAccent.withValues(alpha: 0.18)
                          : const Color(0xFF1A1A2E),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: sel ? Colors.purpleAccent : Colors.white12,
                        width: sel ? 1.5 : 1,
                      ),
                    ),
                    child: Text(
                      s.label,
                      style: TextStyle(
                        color: sel ? Colors.purpleAccent : Colors.white54,
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          // Cos phi
          _ConfigLabel(loc.lbCosPhiLabel),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.amber,
                    inactiveTrackColor: Colors.white12,
                    thumbColor: Colors.amber,
                    overlayColor: Colors.amber.withValues(alpha: 0.12),
                    trackHeight: 3,
                  ),
                  child: Slider(
                    value: dist.cosPhi,
                    min: 0.5,
                    max: 1.0,
                    divisions: 10,
                    onChanged: onCosPhiChanged,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 40,
                child: Text(
                  dist.cosPhi.toStringAsFixed(1),
                  style: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Jauges par phase ─────────────────────────────────────────────────────────

class _PhaseGaugesCard extends StatelessWidget {
  const _PhaseGaugesCard({required this.dist});
  final LoadDistribution dist;

  @override
  Widget build(BuildContext context) {
    final phases = dist.availablePhases;
    final maxA = dist.panelSize.ampere.toDouble();

    return _Card(
      icon: Icons.bolt,
      title: AppLocalizations.of(context).lbPhaseGaugesTitle,
      child: Column(
        children: phases.map((p) {
          final current = dist.currentForDisplay(p);
          final ratio = (current / maxA).clamp(0.0, 1.0);
          final overloaded = current > maxA;
          final color = _gaugeColor(ratio);

          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _phaseColor(p).withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: _phaseColor(p).withValues(alpha: 0.5)),
                      ),
                      child: Text(
                        p.label,
                        style: TextStyle(
                          color: _phaseColor(p),
                          fontWeight: FontWeight.w900,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '${dist.totalWattForPhase(p)} W',
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 13),
                      ),
                    ),
                    Text(
                      overloaded
                          ? '⚠ ${current.toStringAsFixed(1)} A'
                          : '${current.toStringAsFixed(1)} A',
                      style: TextStyle(
                        color: overloaded ? Colors.redAccent : color,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '/ ${dist.panelSize.ampere} A',
                      style:
                          const TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: ratio,
                    minHeight: 8,
                    backgroundColor: Colors.white12,
                    valueColor: AlwaysStoppedAnimation(color),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _gaugeColor(double ratio) {
    if (ratio < 0.7) return Colors.greenAccent;
    if (ratio < 0.9) return Colors.orange;
    return Colors.redAccent;
  }
}

// ─── Liste des fixtures ───────────────────────────────────────────────────────

class _FixtureListCard extends StatelessWidget {
  const _FixtureListCard({
    required this.dist,
    required this.onRemove,
    required this.onPhaseChanged,
    required this.onQuantityChanged,
  });

  final LoadDistribution dist;
  final ValueChanged<String> onRemove;
  final void Function(String id, PhaseAssignment phase) onPhaseChanged;
  final void Function(String id, int quantity) onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    final int totalW = dist.items.fold(0, (s, i) => s + i.totalPowerWatt);

    return _Card(
      icon: Icons.list_alt,
      title: AppLocalizations.of(context).lbFixturesListTitle(dist.items.length, totalW),
      child: Column(
        children: dist.items.map((item) {
          final phases = dist.availablePhases;
          return _FixtureRow(
            item: item,
            availablePhases: phases,
            onRemove: () => onRemove(item.id),
            onPhaseChanged: (p) => onPhaseChanged(item.id, p),
            onQuantityChanged: (q) => onQuantityChanged(item.id, q),
          );
        }).toList(),
      ),
    );
  }
}

class _FixtureRow extends StatelessWidget {
  const _FixtureRow({
    required this.item,
    required this.availablePhases,
    required this.onRemove,
    required this.onPhaseChanged,
    required this.onQuantityChanged,
  });

  final LoadItem item;
  final List<PhaseAssignment> availablePhases;
  final VoidCallback onRemove;
  final ValueChanged<PhaseAssignment> onPhaseChanged;
  final ValueChanged<int> onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      item.manufacturer,
                      style:
                          const TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text(
                '${item.totalPowerWatt} W',
                style: const TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              IconButton(
                icon: const Icon(Icons.delete_outline,
                    color: Colors.white24, size: 20),
                onPressed: onRemove,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              // Quantité
              _SmallBtn(
                  icon: Icons.remove,
                  onTap: item.quantity > 1
                      ? () => onQuantityChanged(item.quantity - 1)
                      : null),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '×${item.quantity}',
                  style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w800,
                      fontSize: 14),
                ),
              ),
              _SmallBtn(
                  icon: Icons.add,
                  onTap: item.quantity < 99
                      ? () => onQuantityChanged(item.quantity + 1)
                      : null),
              const Spacer(),
              // Phase selector
              ...availablePhases.map((p) {
                final sel = item.phase == p;
                return GestureDetector(
                  onTap: () => onPhaseChanged(p),
                  child: Container(
                    margin: const EdgeInsets.only(left: 6),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: sel
                          ? _phaseColor(p).withValues(alpha: 0.18)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: sel ? _phaseColor(p) : Colors.white12,
                        width: sel ? 1.5 : 1,
                      ),
                    ),
                    child: Text(
                      p.label,
                      style: TextStyle(
                        color: sel ? _phaseColor(p) : Colors.white38,
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class _SmallBtn extends StatelessWidget {
  const _SmallBtn({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon,
          color: onTap != null ? Colors.white54 : Colors.white12, size: 18),
    );
  }
}

// ─── Empty state ──────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onAdd});
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            const Text('🔌', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 14),
            Text(
              loc.lbEmptyTitle,
              style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(
              loc.lbEmptyBody,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white38, fontSize: 13),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add, size: 18),
              label: Text(loc.lbAddFixtureButton),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.amber,
                side: const BorderSide(color: Colors.amber),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Shared widgets ───────────────────────────────────────────────────────────

Color _phaseColor(PhaseAssignment p) => switch (p) {
      PhaseAssignment.l1 || PhaseAssignment.l1l2 => Colors.lightBlueAccent,
      PhaseAssignment.l2 || PhaseAssignment.l2l3 => Colors.greenAccent,
      PhaseAssignment.l3 || PhaseAssignment.l3l1 => Colors.orangeAccent,
    };

class _Card extends StatelessWidget {
  const _Card({required this.icon, required this.title, required this.child});
  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white70, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _ConfigLabel extends StatelessWidget {
  const _ConfigLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white38,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      );
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? color.withValues(alpha: 0.18)
              : const Color(0xFF1A1A2E),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? color : Colors.white12,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? color : Colors.white54,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
