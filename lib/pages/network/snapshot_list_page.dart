import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/network_snapshot.dart';
import '../../models/network/network_snapshot_diff.dart';
import '../../services/network/network_snapshot_service.dart';
import 'snapshot_comparison_page.dart';
import '../about/about_favorites.dart';

class SnapshotListPage extends StatefulWidget {
  const SnapshotListPage({super.key});

  @override
  State<SnapshotListPage> createState() => _SnapshotListPageState();
}

class _SnapshotListPageState extends State<SnapshotListPage> {
  static const _kAccent = Color(0xFF64FFDA); // vert menthe snapshots

  final _service = NetworkSnapshotService();
  List<NetworkSnapshot> _snapshots = [];
  bool _loading = true;
  final Set<String> _selected = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final data = await _service.loadAll();
    if (!mounted) return;
    setState(() {
      _snapshots = data;
      _loading = false;
    });
  }

  Future<void> _delete(NetworkSnapshot s) async {
    await _service.delete(s.id);
    setState(() {
      _snapshots.removeWhere((x) => x.id == s.id);
      _selected.remove(s.id);
    });
  }

  void _toggleSelect(String id) {
    setState(() {
      if (_selected.contains(id)) {
        _selected.remove(id);
      } else {
        if (_selected.length < 2) {
          _selected.add(id);
        } else {
          // Remplace le plus ancien
          _selected.remove(_selected.first);
          _selected.add(id);
        }
      }
    });
  }

  void _compare() {
    if (_selected.length < 2) return;
    final ids = _selected.toList();
    final a = _snapshots.firstWhere((s) => s.id == ids[0]);
    final b = _snapshots.firstWhere((s) => s.id == ids[1]);

    // A = le plus ancien, B = le plus récent
    final sorted = a.createdAt.isBefore(b.createdAt) ? [a, b] : [b, a];
    final diff = NetworkSnapshotDiff.compare(sorted[0], sorted[1]);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SnapshotComparisonPage(diff: diff),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.snapshotPageTitle,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: const [
          AboutPinButton(pageId: 'tool:network_snapshot_list', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _snapshots.isEmpty
              ? _buildEmpty(loc)
              : _buildList(loc),
      bottomNavigationBar: _selected.length == 2
          ? SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: ElevatedButton.icon(
                  onPressed: _compare,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _kAccent,
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  icon: const Icon(Icons.compare_arrows_rounded),
                  label: Text(
                    loc.snapshotComparisonTitle,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildEmpty(AppLocalizations loc) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.photo_library_outlined,
                size: 52, color: Colors.white.withValues(alpha: 0.18)),
            const SizedBox(height: 16),
            Text(
              loc.snapshotEmpty,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white38, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(AppLocalizations loc) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
      children: [
        if (_snapshots.length >= 2)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              loc.snapshotComparisonSelectTwo,
              style: const TextStyle(color: Colors.white38, fontSize: 12.5),
            ),
          ),
        ..._snapshots.reversed.map((s) {
          final isSelected = _selected.contains(s.id);
          final selectionIndex = _selected.toList().indexOf(s.id);
          return _SnapshotCard(
            snapshot: s,
            accent: _kAccent,
            isSelected: isSelected,
            selectionLabel: isSelected
                ? (selectionIndex == 0
                    ? loc.snapshotSnapshotA
                    : loc.snapshotSnapshotB)
                : null,
            onTap: _snapshots.length >= 2
                ? () => _toggleSelect(s.id)
                : null,
            onDelete: () => _confirmDelete(context, loc, s),
          );
        }),
      ],
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    AppLocalizations loc,
    NetworkSnapshot s,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E2E),
        title: Text(loc.snapshotDeleteConfirm,
            style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(loc.diagCancelButton),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(loc.snapshotDeleteButton,
                style: const TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
    if (confirmed == true) _delete(s);
  }
}

// ─── Card snapshot ──────────────────────────────────────────────────────────

class _SnapshotCard extends StatelessWidget {
  final NetworkSnapshot snapshot;
  final Color accent;
  final bool isSelected;
  final String? selectionLabel;
  final VoidCallback? onTap;
  final VoidCallback onDelete;

  const _SnapshotCard({
    required this.snapshot,
    required this.accent,
    required this.isSelected,
    required this.onDelete,
    this.selectionLabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected
        ? accent
        : Colors.white.withValues(alpha: 0.08);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF161622),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: isSelected ? 1.5 : 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              // Indicateur de sélection
              if (onTap != null) ...[
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? accent.withValues(alpha: 0.18)
                        : Colors.white.withValues(alpha: 0.05),
                    border: Border.all(
                      color: isSelected
                          ? accent
                          : Colors.white.withValues(alpha: 0.20),
                      width: 1.5,
                    ),
                  ),
                  child: isSelected
                      ? Icon(Icons.check_rounded, color: accent, size: 15)
                      : null,
                ),
                const SizedBox(width: 12),
              ],
              // Infos
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (selectionLabel != null) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                              color: accent.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              selectionLabel!,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: accent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        Text(
                          _formatDate(snapshot.createdAt),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 10,
                      runSpacing: 4,
                      children: [
                        _Chip(
                            icon: Icons.devices_rounded,
                            label: '${snapshot.devices.length}',
                            color: accent),
                        if (snapshot.artnetUniverses.isNotEmpty)
                          _Chip(
                            icon: Icons.broadcast_on_personal_rounded,
                            label: '${snapshot.artnetUniverses.length}',
                            color: const Color(0xFFFFB703),
                          ),
                        if (snapshot.sacnUniverses.isNotEmpty)
                          _Chip(
                            icon: Icons.hub_rounded,
                            label: '${snapshot.sacnUniverses.length}',
                            color: const Color(0xFF7C4DFF),
                          ),
                        if (snapshot.ndiSources.isNotEmpty)
                          _Chip(
                            icon: Icons.videocam_rounded,
                            label: '${snapshot.ndiSources.length}',
                            color: const Color(0xFF00BCD4),
                          ),
                        if (snapshot.diagnostic != null)
                          _Chip(
                            icon: Icons.favorite_rounded,
                            label: '${snapshot.diagnostic!.score}',
                            color: _scoreColor(snapshot.diagnostic!.score),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              // Bouton supprimer
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline_rounded,
                    color: Colors.white30, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _formatDate(DateTime dt) {
    final d = dt.toLocal();
    final date =
        '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
    final time =
        '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
    return '$date $time';
  }

  static Color _scoreColor(int score) {
    if (score >= 80) return const Color(0xFF00E676);
    if (score >= 50) return const Color(0xFFFFB703);
    return const Color(0xFFFF5252);
  }
}

class _Chip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _Chip({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: color.withValues(alpha: 0.80)),
        const SizedBox(width: 3),
        Text(label,
            style: TextStyle(
                fontSize: 12,
                color: color.withValues(alpha: 0.80),
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
