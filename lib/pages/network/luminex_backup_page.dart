import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

import '../../models/network/luminex_backup.dart';
import '../../models/network/luminex_device.dart';
import '../../services/network/luminex_backup_store.dart';
import '../../services/network/luminex_service.dart';
import 'luminex_config_actions.dart';
import 'package:mon_app_tech/services/review_prompt_service.dart';

const _kAccent = Color(0xFF00E5FF);
const _kWarn = Color(0xFFFFB300);
const _kDanger = Color(0xFFFF5252);
const _kCard = Color(0xFF161622);
const _kBg = Color(0xFF0D0D14);

/// Sauvegardes de configuration d'un switch GigaCore : créer, comparer,
/// partager, importer, restaurer.
class LuminexBackupPage extends StatefulWidget {
  final LuminexService service;
  final String ip;

  const LuminexBackupPage({super.key, required this.service, required this.ip});

  @override
  State<LuminexBackupPage> createState() => _LuminexBackupPageState();
}

class _LuminexBackupPageState extends State<LuminexBackupPage> {
  StreamSubscription<List<LuminexDevice>>? _subscription;
  LuminexDevice? _device;
  List<({File file, LuminexBackup backup})> _backups = [];
  bool _busy = false;
  String? _busyText;

  @override
  void initState() {
    super.initState();
    _device = _find(widget.service.devices);
    _subscription = widget.service.stream.listen((devices) {
      if (mounted) setState(() => _device = _find(devices));
    });
    _reload();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  LuminexDevice? _find(List<LuminexDevice> devices) {
    for (final d in devices) {
      if (d.ip == widget.ip) return d;
    }
    return null;
  }

  Future<void> _reload() async {
    final list = await LuminexBackupStore.list();
    if (mounted) setState(() => _backups = list);
  }

  Future<T?> _run<T>(String text, Future<T> Function() job) async {
    setState(() {
      _busy = true;
      _busyText = text;
    });
    try {
      return await job();
    } finally {
      if (mounted) {
        setState(() {
          _busy = false;
          _busyText = null;
        });
      }
    }
  }

  void _toast(String text, {bool error = false}) {
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
      backgroundColor:
          error ? const Color(0xFF3A1E22) : const Color(0xFF1E2A26),
      content: Text(text, style: const TextStyle(color: Colors.white)),
    ));
  }

  // ─── Actions ───────────────────────────────────────────────────────────────

  Future<void> _backupNow(AppLocalizations loc) async {
    final r = await _run(loc.luminexBackupNow,
        () => widget.service.createBackup(widget.ip));
    if (r == null || !mounted) return;
    final backup = r.backup;
    if (backup == null) {
      _toast(
        luminexWriteErrorText(
            LuminexWriteResult.failure(
                r.error ?? LuminexWriteError.rejected, r.reason),
            loc),
        error: true,
      );
      return;
    }
    await LuminexBackupStore.save(backup);
    await _reload();
    if (mounted) _toast(loc.luminexBackupDone);
  }

  Future<void> _import(AppLocalizations loc) async {
    FilePickerResult? picked;
    try {
      picked = await FilePicker.platform.pickFiles(
        type: FileType.any,
        withData: true,
      );
    } catch (_) {
      picked = null;
    }
    final bytes = picked?.files.firstOrNull?.bytes;
    if (bytes == null) return;
    final backup = await LuminexBackupStore.importBytes(bytes);
    if (!mounted) return;
    if (backup == null) {
      _toast(loc.luminexBackupImportInvalid, error: true);
      return;
    }
    await _reload();
    if (mounted) _toast(loc.luminexBackupDone);
  }

  Future<void> _share(File file, BuildContext tileContext) async {
    final box = tileContext.findRenderObject() as RenderBox?;
    Rect? origin;
    if (box != null && box.hasSize) {
      origin = box.localToGlobal(Offset.zero) & box.size;
    }
    await Share.shareXFiles(
      [XFile(file.path, mimeType: 'application/json')],
      sharePositionOrigin: origin,
    );
    ReviewPromptService.onSuccess();
  }

  Future<void> _delete(File file) async {
    await LuminexBackupStore.delete(file);
    await _reload();
  }

  Future<void> _restorePorts(LuminexBackup backup, AppLocalizations loc) async {
    final device = _device;
    if (device == null) return;
    final count = backup.portRestorePayload(device).length;
    if (count == 0) {
      _toast(loc.luminexBackupNoDiff);
      return;
    }
    final ok = await confirmLuminexChange(
      context,
      loc,
      summary: '${device.displayName} · ${loc.luminexBackupConfirmPorts(count)}',
      warning: loc.luminexCfgActiveWarning,
    );
    if (!ok || !mounted) return;
    final r = await _run(loc.luminexBackupRestoreRunning,
        () => widget.service.restorePortsFromBackup(widget.ip, backup));
    if (r == null || !mounted) return;
    showLuminexWriteResult(context, r, loc,
        successText: loc.luminexBackupRestored);
  }

  Future<void> _restoreFull(LuminexBackup backup, AppLocalizations loc) async {
    final device = _device;
    if (device == null) return;
    final backupIp = backup.profileIp;
    final canTakeIp =
        backupIp != null && backupIp.isNotEmpty && backupIp != widget.ip;
    var keepIp = true;

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog(
          backgroundColor: const Color(0xFF1A1A2E),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(loc.luminexBackupRestoreFull,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${device.displayName} · ${loc.luminexBackupConfirmFull}',
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85), height: 1.4),
              ),
              const SizedBox(height: 12),
              Text(
                loc.luminexBackupRestoreFullHint,
                style: const TextStyle(
                    color: _kDanger, fontSize: 13, height: 1.4),
              ),
              if (backup.model != null &&
                  device.model != null &&
                  backup.model != device.model) ...[
                const SizedBox(height: 10),
                Text(
                  loc.luminexBackupModelMismatch,
                  style:
                      const TextStyle(color: _kWarn, fontSize: 13, height: 1.4),
                ),
              ],
              if (canTakeIp) ...[
                const SizedBox(height: 12),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  value: !keepIp,
                  activeThumbColor: _kAccent,
                  onChanged: (v) => setLocal(() => keepIp = !v),
                  title: Text(
                    loc.luminexBackupUseBackupIp(backupIp),
                    style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 13),
                  ),
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(loc.luminexCfgCancel,
                  style:
                      TextStyle(color: Colors.white.withValues(alpha: 0.55))),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(loc.luminexCfgApply,
                  style: const TextStyle(
                      color: _kDanger, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
    if (ok != true || !mounted) return;

    final r = await _run(
      loc.luminexBackupRestoreRunning,
      () => widget.service
          .restoreFullBackup(widget.ip, backup, keepIp: keepIp),
    );
    if (r == null || !mounted) return;
    showLuminexWriteResult(context, r, loc,
        successText: loc.luminexBackupRestored);
  }

  void _showDiff(LuminexBackup backup, AppLocalizations loc) {
    final device = _device;
    if (device == null) return;
    final diffs = backup.diff(device);
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0xFF1A1A2E),
      showDragHandle: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (ctx) => SafeArea(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.sizeOf(ctx).height * 0.8),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            children: [
              Text(
                diffs.isEmpty
                    ? loc.luminexBackupNoDiff
                    : loc.luminexBackupDiffCount(diffs.length),
                style: TextStyle(
                  color: diffs.isEmpty ? const Color(0xFF00C853) : _kWarn,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              if (diffs.isNotEmpty)
                Row(
                  children: [
                    const Expanded(flex: 4, child: SizedBox()),
                    Expanded(
                      flex: 3,
                      child: Text(loc.luminexBackupColBackup,
                          style: _headStyle),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(loc.luminexBackupColNow, style: _headStyle),
                    ),
                  ],
                ),
              for (final d in diffs) _DiffRow(diff: d, loc: loc),
            ],
          ),
        ),
      ),
    );
  }

  static final _headStyle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: Colors.white.withValues(alpha: 0.35),
  );

  // ─── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final device = _device;
    final reachable = device?.isReachable == true;

    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          '${loc.luminexBackupTitle} · ${device?.displayName ?? widget.ip}',
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.file_open_rounded,
                color: _kAccent.withValues(alpha: 0.8)),
            tooltip: loc.luminexBackupImport,
            onPressed: _busy ? null : () => _import(loc),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.fromLTRB(
                16, 12, 16, 24 + MediaQuery.paddingOf(context).bottom),
            children: [
              Text(
                loc.luminexBackupHint,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.45,
                  color: Colors.white.withValues(alpha: 0.45),
                ),
              ),
              const SizedBox(height: 14),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: _kAccent,
                  foregroundColor: _kBg,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed:
                    _busy || !reachable ? null : () => _backupNow(loc),
                icon: const Icon(Icons.save_rounded),
                label: Text(loc.luminexBackupNow,
                    style: const TextStyle(fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 18),
              if (_backups.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    loc.luminexBackupEmpty,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.white.withValues(alpha: 0.35)),
                  ),
                ),
              for (final b in _backups) ...[
                _BackupTile(
                  entry: b,
                  isThisSwitch: _isThisSwitch(b.backup, device),
                  enabled: !_busy && reachable,
                  loc: loc,
                  onCompare: () => _showDiff(b.backup, loc),
                  onShare: (ctx) => _share(b.file, ctx),
                  onDelete: () => _delete(b.file),
                  onRestorePorts: () => _restorePorts(b.backup, loc),
                  onRestoreFull: () => _restoreFull(b.backup, loc),
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
          if (_busy)
            Positioned.fill(
              child: ColoredBox(
                color: Colors.black.withValues(alpha: 0.55),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(color: _kAccent),
                      const SizedBox(height: 14),
                      Text(_busyText ?? '',
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  bool _isThisSwitch(LuminexBackup b, LuminexDevice? device) {
    if (device == null) return false;
    if (b.serial != null && device.serial != null) {
      return b.serial == device.serial;
    }
    return b.sourceIp == device.ip;
  }
}

class _BackupTile extends StatelessWidget {
  final ({File file, LuminexBackup backup}) entry;
  final bool isThisSwitch;
  final bool enabled;
  final AppLocalizations loc;
  final VoidCallback onCompare;
  final void Function(BuildContext) onShare;
  final VoidCallback onDelete;
  final VoidCallback onRestorePorts;
  final VoidCallback onRestoreFull;

  const _BackupTile({
    required this.entry,
    required this.isThisSwitch,
    required this.enabled,
    required this.loc,
    required this.onCompare,
    required this.onShare,
    required this.onDelete,
    required this.onRestorePorts,
    required this.onRestoreFull,
  });

  @override
  Widget build(BuildContext context) {
    final b = entry.backup;
    final d = b.createdAt;
    String two(int v) => v.toString().padLeft(2, '0');
    final date = '${two(d.day)}/${two(d.month)}/${d.year} '
        '${two(d.hour)}:${two(d.minute)}';

    return Container(
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isThisSwitch
              ? _kAccent.withValues(alpha: 0.35)
              : Colors.white.withValues(alpha: 0.07),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(14, 12, 6, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.inventory_2_rounded,
                  color: _kAccent.withValues(alpha: isThisSwitch ? 1 : 0.4),
                  size: 22),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      b.switchName ?? b.sourceIp,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      [
                        date,
                        if (b.model != null) b.model!,
                        b.profileIp ?? b.sourceIp,
                      ].join('  ·  '),
                      style: TextStyle(
                        fontSize: 11.5,
                        color: Colors.white.withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (btnContext) => IconButton(
                  icon: Icon(Icons.ios_share_rounded,
                      color: Colors.white.withValues(alpha: 0.55), size: 20),
                  tooltip: loc.luminexBackupShare,
                  onPressed: () => onShare(btnContext),
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete_outline_rounded,
                    color: Colors.white.withValues(alpha: 0.35), size: 20),
                tooltip: loc.luminexBackupDelete,
                onPressed: onDelete,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 2,
            children: [
              _chip(Icons.compare_arrows_rounded, loc.luminexBackupCompare,
                  enabled ? onCompare : null, _kAccent),
              _chip(Icons.settings_ethernet_rounded,
                  loc.luminexBackupRestorePorts,
                  enabled ? onRestorePorts : null, _kWarn),
              _chip(Icons.settings_backup_restore_rounded,
                  loc.luminexBackupRestoreFull,
                  enabled ? onRestoreFull : null, _kDanger),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(IconData icon, String label, VoidCallback? onTap, Color color) =>
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: color,
          disabledForegroundColor: Colors.white.withValues(alpha: 0.2),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          visualDensity: VisualDensity.compact,
        ),
        onPressed: onTap,
        icon: Icon(icon, size: 16),
        label: Text(label, style: const TextStyle(fontSize: 12.5)),
      );
}

class _DiffRow extends StatelessWidget {
  final LuminexBackupDiff diff;
  final AppLocalizations loc;

  const _DiffRow({required this.diff, required this.loc});

  String _value(String v) => switch (diff.kind) {
        LuminexBackupDiffKind.portEnabled =>
          v == 'true' ? loc.luminexOn : loc.luminexOff,
        LuminexBackupDiffKind.portLegend => v.isEmpty ? '—' : v,
        _ => v,
      };

  @override
  Widget build(BuildContext context) {
    final port = diff.portNr ?? 0;
    final label = switch (diff.kind) {
      LuminexBackupDiffKind.model => loc.luminexBackupDiffModel,
      LuminexBackupDiffKind.switchName => loc.luminexBackupDiffName,
      LuminexBackupDiffKind.groupName =>
        loc.luminexBackupDiffGroupName(diff.groupId ?? 0),
      LuminexBackupDiffKind.portTrunk => loc.luminexBackupDiffPortTrunk(port),
      LuminexBackupDiffKind.portGroup => loc.luminexBackupDiffPortGroup(port),
      LuminexBackupDiffKind.portEnabled =>
        loc.luminexBackupDiffPortEnabled(port),
      LuminexBackupDiffKind.portLegend => loc.luminexBackupDiffPortLegend(port),
    };
    final style = TextStyle(
        fontSize: 12.5, color: Colors.white.withValues(alpha: 0.85));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(label,
                style: style.copyWith(
                    color: Colors.white.withValues(alpha: 0.55))),
          ),
          Expanded(flex: 3, child: Text(_value(diff.backupValue), style: style)),
          Expanded(
            flex: 3,
            child: Text(_value(diff.liveValue),
                style: style.copyWith(color: _kWarn)),
          ),
        ],
      ),
    );
  }
}
