import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/network_device.dart';
import '../../models/network/ndi_source.dart';
import '../../models/network/network_snapshot.dart';
import '../../models/network/network_snapshot_diff.dart';

class SnapshotComparisonPage extends StatelessWidget {
  final NetworkSnapshotDiff diff;

  const SnapshotComparisonPage({super.key, required this.diff});

  static const _kColorAdded = Color(0xFF00E676);
  static const _kColorRemoved = Color(0xFFFF5252);
  static const _kAccent = Color(0xFF64FFDA);

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
          loc.snapshotComparisonTitle,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
        children: [
          _buildSnapshotHeaders(loc),
          const SizedBox(height: 20),
          if (!diff.hasChanges)
            _buildNoChanges(loc)
          else ...[
            _buildSection(
              context: context,
              loc: loc,
              title: loc.snapshotDevices,
              icon: Icons.devices_rounded,
              color: _kAccent,
              added: diff.addedDevices
                  .map((d) => _deviceLabel(d))
                  .toList(),
              removed: diff.removedDevices
                  .map((d) => _deviceLabel(d))
                  .toList(),
            ),
            _buildSection(
              context: context,
              loc: loc,
              title: loc.snapshotArtnetUniverses,
              icon: Icons.broadcast_on_personal_rounded,
              color: const Color(0xFFFFB703),
              added: diff.addedArtnetUniverses
                  .map((u) => 'Universe $u')
                  .toList(),
              removed: diff.removedArtnetUniverses
                  .map((u) => 'Universe $u')
                  .toList(),
            ),
            _buildSection(
              context: context,
              loc: loc,
              title: loc.snapshotSacnUniverses,
              icon: Icons.hub_rounded,
              color: const Color(0xFF7C4DFF),
              added: diff.addedSacnUniverses
                  .map((u) => 'Universe $u')
                  .toList(),
              removed: diff.removedSacnUniverses
                  .map((u) => 'Universe $u')
                  .toList(),
            ),
            _buildSection(
              context: context,
              loc: loc,
              title: loc.snapshotNdiSources,
              icon: Icons.videocam_rounded,
              color: const Color(0xFF00BCD4),
              added: diff.addedNdiSources
                  .map((s) => _ndiLabel(s))
                  .toList(),
              removed: diff.removedNdiSources
                  .map((s) => _ndiLabel(s))
                  .toList(),
            ),
            _buildAlertsSection(loc),
          ],
        ],
      ),
    );
  }

  // ─── En-têtes snapshot A / B ─────────────────────────────────────────────

  Widget _buildSnapshotHeaders(AppLocalizations loc) {
    return Row(
      children: [
        Expanded(child: _SnapshotHeader(
          label: loc.snapshotSnapshotA,
          snapshot: diff.snapshotA,
          color: Colors.white38,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.arrow_forward_rounded,
              color: Colors.white30, size: 20),
        ),
        Expanded(child: _SnapshotHeader(
          label: loc.snapshotSnapshotB,
          snapshot: diff.snapshotB,
          color: _kAccent,
        )),
      ],
    );
  }

  // ─── Aucune différence ───────────────────────────────────────────────────

  Widget _buildNoChanges(AppLocalizations loc) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        children: [
          Icon(Icons.check_circle_outline_rounded,
              size: 40, color: _kColorAdded.withValues(alpha: 0.70)),
          const SizedBox(height: 12),
          Text(
            loc.snapshotNoChanges,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // ─── Section générique ajouté / disparu ──────────────────────────────────

  Widget _buildSection({
    required BuildContext context,
    required AppLocalizations loc,
    required String title,
    required IconData icon,
    required Color color,
    required List<String> added,
    required List<String> removed,
  }) {
    if (added.isEmpty && removed.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 8),
              Text(title,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: color)),
            ],
          ),
          if (added.isNotEmpty) ...[
            const SizedBox(height: 10),
            _DiffGroup(
                label: loc.snapshotAdded,
                items: added,
                color: _kColorAdded),
          ],
          if (removed.isNotEmpty) ...[
            const SizedBox(height: 10),
            _DiffGroup(
                label: loc.snapshotRemoved,
                items: removed,
                color: _kColorRemoved),
          ],
        ],
      ),
    );
  }

  // ─── Section alertes ─────────────────────────────────────────────────────

  Widget _buildAlertsSection(AppLocalizations loc) {
    if (diff.newAlerts.isEmpty && diff.resolvedAlerts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded,
                  color: const Color(0xFFFFB703), size: 18),
              const SizedBox(width: 8),
              Text(
                loc.snapshotAlerts,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFB703)),
              ),
            ],
          ),
          if (diff.newAlerts.isNotEmpty) ...[
            const SizedBox(height: 10),
            _DiffGroup(
              label: loc.snapshotAdded,
              items: diff.newAlerts.map((a) => a.code).toList(),
              color: _kColorRemoved,
            ),
          ],
          if (diff.resolvedAlerts.isNotEmpty) ...[
            const SizedBox(height: 10),
            _DiffGroup(
              label: loc.snapshotRemoved,
              items: diff.resolvedAlerts.map((a) => a.code).toList(),
              color: _kColorAdded,
            ),
          ],
        ],
      ),
    );
  }

  // ─── Helpers labels ──────────────────────────────────────────────────────

  static String _deviceLabel(NetworkDevice d) {
    if (d.hostname != null && d.hostname!.isNotEmpty) {
      return '${d.hostname} (${d.ip})';
    }
    return d.ip;
  }

  static String _ndiLabel(NdiSource s) {
    if (s.host != null && s.host!.isNotEmpty) {
      return '${s.name} (${s.ip})';
    }
    return '${s.name} · ${s.ip}';
  }
}

// ─── En-tête snapshot ────────────────────────────────────────────────────────

class _SnapshotHeader extends StatelessWidget {
  final String label;
  final NetworkSnapshot snapshot;
  final Color color;

  const _SnapshotHeader({
    required this.label,
    required this.snapshot,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final d = snapshot.createdAt.toLocal();
    final date =
        '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}';
    final time =
        '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: color,
                  letterSpacing: 0.5)),
          const SizedBox(height: 4),
          Text(date,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
          Text(time,
              style: TextStyle(
                  fontSize: 11, color: Colors.white.withValues(alpha: 0.50))),
        ],
      ),
    );
  }
}

// ─── Groupe diff ─────────────────────────────────────────────────────────────

class _DiffGroup extends StatelessWidget {
  final String label;
  final List<String> items;
  final Color color;

  const _DiffGroup({
    required this.label,
    required this.items,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: color),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 3),
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.white.withValues(alpha: 0.70),
                ),
              ),
            )),
      ],
    );
  }
}
