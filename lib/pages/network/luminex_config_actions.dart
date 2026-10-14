import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/luminex_device.dart';
import '../../models/network/luminex_group.dart';
import '../../models/network/luminex_port.dart';
import '../../services/network/luminex_service.dart';

const _kAccent = Color(0xFF00E5FF);
const _kWarn = Color(0xFFFFB300);
const _kDanger = Color(0xFFFF5252);
const _kSheet = Color(0xFF1A1A2E);

/// Texte d'erreur lisible pour un échec d'écriture.
String luminexWriteErrorText(LuminexWriteResult r, AppLocalizations loc) {
  final base = switch (r.error) {
    LuminexWriteError.unreachable => loc.luminexCfgErrUnreachable,
    LuminexWriteError.unauthorized => loc.luminexCfgErrUnauthorized,
    LuminexWriteError.rejected => loc.luminexCfgErrRejected,
    LuminexWriteError.notApplied => loc.luminexCfgErrNotApplied,
    LuminexWriteError.trunkPort => loc.luminexCfgTrunkLocked,
    LuminexWriteError.protectedPort => loc.luminexCfgErrProtected,
    LuminexWriteError.unknownGroup => loc.luminexCfgErrUnknownGroup,
    LuminexWriteError.noPoe => loc.luminexCfgErrNoPoe,
    LuminexWriteError.noFreeSlot => loc.luminexCfgErrNoSlot,
    null => loc.luminexCfgErrRejected,
  };
  final reason = r.reason;
  return loc.luminexCfgFailed(
      reason != null && reason.isNotEmpty ? '$base ($reason)' : base);
}

/// Affiche le résultat d'une écriture ; propose « Annuler » si possible.
void showLuminexWriteResult(
  BuildContext context,
  LuminexWriteResult result,
  AppLocalizations loc, {
  String? successText,
  LuminexService? service,
  String? ip,
}) {
  final messenger = ScaffoldMessenger.maybeOf(context);
  if (messenger == null) return;
  messenger.hideCurrentSnackBar();
  final undo = result.undo;
  messenger.showSnackBar(
    SnackBar(
      backgroundColor: result.ok ? const Color(0xFF1E2A26) : const Color(0xFF3A1E22),
      content: Text(
        result.ok
            ? (successText ?? loc.luminexCfgDone)
            : luminexWriteErrorText(result, loc),
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 6),
      action: result.ok && undo != null && service != null && ip != null
          ? SnackBarAction(
              label: loc.luminexCfgUndo,
              textColor: _kAccent,
              onPressed: () async {
                final r = await service.restorePort(ip, undo);
                if (!context.mounted) return;
                showLuminexWriteResult(context, r, loc,
                    successText: loc.luminexCfgUndone);
              },
            )
          : null,
    ),
  );
}

/// Dialogue de confirmation : [summary] décrit le changement
/// (« Port 5 (PU 1) : MA-NET → s-ACN »), [warning] un risque éventuel.
Future<bool> confirmLuminexChange(
  BuildContext context,
  AppLocalizations loc, {
  required String summary,
  String? warning,
  bool danger = false,
}) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: _kSheet,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        loc.luminexCfgConfirmTitle,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            summary,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 14,
              height: 1.4,
            ),
          ),
          if (warning != null) ...[
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.warning_rounded,
                    size: 18, color: danger ? _kDanger : _kWarn),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    warning,
                    style: TextStyle(
                      color: danger ? _kDanger : _kWarn,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: Text(loc.luminexCfgCancel,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.55))),
        ),
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: Text(
            loc.luminexCfgApply,
            style: TextStyle(
              color: danger ? _kDanger : _kAccent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
  return ok == true;
}

/// Saisie d'un nom (port ou switch). Renvoie null si annulé.
Future<String?> askLuminexName(
  BuildContext context,
  AppLocalizations loc, {
  required String title,
  required String initial,
}) async {
  final controller = TextEditingController(text: initial);
  final result = await showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: _kSheet,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 16)),
      content: TextField(
        controller: controller,
        autofocus: true,
        maxLength: 32,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: loc.luminexCfgName,
          hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.35)),
          counterStyle: TextStyle(color: Colors.white.withValues(alpha: 0.35)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: _kAccent),
          ),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.05),
        ),
        onSubmitted: (v) => Navigator.of(ctx).pop(v),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: Text(loc.luminexCfgCancel,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.55))),
        ),
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(controller.text),
          child: Text(loc.luminexCfgApply,
              style: const TextStyle(
                  color: _kAccent, fontWeight: FontWeight.w700)),
        ),
      ],
    ),
  );
  controller.dispose();
  return result;
}

String _portLabel(LuminexPort port, AppLocalizations loc) {
  final title = loc.luminexCfgPortTitle(port.portNr);
  final name = port.name ?? port.neighborName;
  return name != null ? '$title ($name)' : title;
}

String? _activeWarning(LuminexPort port, AppLocalizations loc) =>
    port.linkUp == true ? loc.luminexCfgActiveWarning : null;

// ─── Actions sur un port ──────────────────────────────────────────────────────

/// Feuille d'actions pour [port] du switch [device] (mode configuration).
Future<void> showLuminexPortActions(
  BuildContext context, {
  required LuminexService service,
  required LuminexDevice device,
  required LuminexPort port,
  required AppLocalizations loc,
}) async {
  final action = await showModalBottomSheet<_PortAction>(
    context: context,
    backgroundColor: _kSheet,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
    ),
    builder: (ctx) => SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Text(
                '${_portLabel(port, loc)}  ·  ${device.displayName}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (port.isTrunk)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Text(
                  loc.luminexCfgTrunkLocked,
                  style: TextStyle(
                    color: _kWarn.withValues(alpha: 0.9),
                    fontSize: 12.5,
                    height: 1.4,
                  ),
                ),
              ),
            _ActionTile(
              icon: Icons.highlight_rounded,
              label: loc.luminexCfgIdentifyPort,
              onTap: () => Navigator.pop(ctx, _PortAction.identify),
            ),
            _ActionTile(
              icon: Icons.edit_rounded,
              label: loc.luminexCfgRenamePort,
              onTap: () => Navigator.pop(ctx, _PortAction.rename),
            ),
            if (!port.isTrunk && device.groups.isNotEmpty)
              _ActionTile(
                icon: Icons.swap_horiz_rounded,
                label: loc.luminexCfgChangeGroup,
                onTap: () => Navigator.pop(ctx, _PortAction.group),
              ),
            if (!port.isTrunk)
              _ActionTile(
                icon: port.enabled == false
                    ? Icons.power_rounded
                    : Icons.power_off_rounded,
                label: port.enabled == false
                    ? loc.luminexCfgEnablePort
                    : loc.luminexCfgDisablePort,
                danger: port.enabled != false,
                onTap: () => Navigator.pop(ctx, _PortAction.toggleEnabled),
              ),
            if (port.poeSupported) ...[
              _ActionTile(
                icon: Icons.restart_alt_rounded,
                label: loc.luminexCfgPoeCycle,
                danger: true,
                onTap: () => Navigator.pop(ctx, _PortAction.poeCycle),
              ),
              _ActionTile(
                icon: port.poeMode == 'off'
                    ? Icons.bolt_rounded
                    : Icons.flash_off_rounded,
                label: port.poeMode == 'off'
                    ? loc.luminexCfgPoeOn
                    : loc.luminexCfgPoeOff,
                danger: port.poeMode != 'off',
                onTap: () => Navigator.pop(ctx, _PortAction.poeToggle),
              ),
            ],
            const SizedBox(height: 8),
          ],
        ),
      ),
    ),
  );
  if (action == null || !context.mounted) return;

  final ip = device.ip;
  final label = _portLabel(port, loc);

  switch (action) {
    case _PortAction.identify: {
      final r = await service.identifyPort(ip, port.portNr);
      if (!context.mounted) return;
      showLuminexWriteResult(context, r, loc,
          successText: loc.luminexCfgIdentifySent);

    }
    case _PortAction.rename: {
      final name = await askLuminexName(context, loc,
          title: '${loc.luminexCfgRenamePort} · $label',
          initial: port.name ?? '');
      if (name == null || !context.mounted) return;
      final r = await service.setPortLegend(ip, port.portNr, name);
      if (!context.mounted) return;
      showLuminexWriteResult(context, r, loc, service: service, ip: ip);

    }
    case _PortAction.group: {
      final group = await _pickGroup(context, device, port, loc);
      if (group == null || !context.mounted) return;
      final current = device.groupById(port.groupId)?.name ?? '—';
      final ok = await confirmLuminexChange(
        context,
        loc,
        summary: '$label : $current → ${group.name}',
        warning: _activeWarning(port, loc),
      );
      if (!ok || !context.mounted) return;
      final r = await service.setPortGroup(ip, port.portNr, group.id);
      if (!context.mounted) return;
      showLuminexWriteResult(context, r, loc, service: service, ip: ip);

    }
    case _PortAction.toggleEnabled: {
      final enable = port.enabled == false;
      final ok = await confirmLuminexChange(
        context,
        loc,
        summary: '$label : '
            '${enable ? loc.luminexCfgEnablePort : loc.luminexCfgDisablePort}',
        warning: enable ? null : _activeWarning(port, loc),
        danger: !enable && port.linkUp == true,
      );
      if (!ok || !context.mounted) return;
      final r = await service.setPortEnabled(ip, port.portNr, enable);
      if (!context.mounted) return;
      showLuminexWriteResult(context, r, loc, service: service, ip: ip);

    }
    case _PortAction.poeCycle: {
      final ok = await confirmLuminexChange(
        context,
        loc,
        summary: '$label : ${loc.luminexCfgPoeCycle}',
        warning: loc.luminexCfgActiveWarning,
        danger: true,
      );
      if (!ok || !context.mounted) return;
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(content: Text(loc.luminexCfgPoeCycleRunning)),
      );
      final r = await service.cyclePoe(ip, port.portNr);
      if (!context.mounted) return;
      showLuminexWriteResult(context, r, loc);

    }
    case _PortAction.poeToggle: {
      final enable = port.poeMode == 'off';
      final ok = await confirmLuminexChange(
        context,
        loc,
        summary: '$label : '
            '${enable ? loc.luminexCfgPoeOn : loc.luminexCfgPoeOff}',
        warning: enable ? null : loc.luminexCfgActiveWarning,
        danger: !enable,
      );
      if (!ok || !context.mounted) return;
      final r = await service.setPoeEnabled(ip, port.portNr, enable);
      if (!context.mounted) return;
      showLuminexWriteResult(context, r, loc);
    }
  }
}

enum _PortAction { identify, rename, group, toggleEnabled, poeCycle, poeToggle }

Future<LuminexGroup?> _pickGroup(
  BuildContext context,
  LuminexDevice device,
  LuminexPort port,
  AppLocalizations loc,
) {
  final groups = [...device.groups]..sort((a, b) => a.vid.compareTo(b.vid));
  return showModalBottomSheet<LuminexGroup>(
    context: context,
    backgroundColor: _kSheet,
    showDragHandle: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
    ),
    builder: (ctx) => SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(ctx).height * 0.75,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Text(
                '${loc.luminexCfgChangeGroup} · ${_portLabel(port, loc)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            for (final g in groups)
              ListTile(
                leading: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: g.colorValue != null
                        ? Color(g.colorValue!)
                        : _kAccent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                title: Text(g.name,
                    style: const TextStyle(color: Colors.white)),
                subtitle: Text('VLAN ${g.vid}',
                    style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.40))),
                trailing: g.id == port.groupId
                    ? const Icon(Icons.check_rounded, color: _kAccent)
                    : null,
                enabled: g.id != port.groupId,
                onTap: () => Navigator.pop(ctx, g),
              ),
          ],
        ),
      ),
    ),
  );
}

// ─── Actions sur le switch ────────────────────────────────────────────────────

Future<void> identifyLuminexSwitch(
  BuildContext context,
  LuminexService service,
  LuminexDevice device,
  AppLocalizations loc,
) async {
  final r = await service.identifySwitch(device.ip);
  if (!context.mounted) return;
  showLuminexWriteResult(context, r, loc,
      successText: loc.luminexCfgIdentifySent);
}

Future<void> renameLuminexSwitch(
  BuildContext context,
  LuminexService service,
  LuminexDevice device,
  AppLocalizations loc,
) async {
  final name = await askLuminexName(context, loc,
      title: loc.luminexCfgRenameSwitch, initial: device.name ?? '');
  if (name == null || name.trim().isEmpty || !context.mounted) return;
  final r = await service.setSwitchName(device.ip, name);
  if (!context.mounted) return;
  showLuminexWriteResult(context, r, loc);
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool danger;

  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.danger = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = danger ? _kWarn : _kAccent;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        label,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.9),
          fontSize: 14.5,
        ),
      ),
      onTap: onTap,
    );
  }
}
