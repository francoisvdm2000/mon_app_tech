import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../app/ui/widgets.dart';
import '../../models/network/rdm_device.dart';
import '../../services/network/rdm_service.dart';
import '../about/about_favorites.dart';
import 'package:mon_app_tech/app/constants.dart';

const _kRdmAccent = Color(0xFF00E5FF); // Cyan réseau, cohérent avec le reste de la section

/// Outil RDM : découverte des fixtures RDM sur le réseau (via ArtTod) et
/// lecture/modification de leurs paramètres (via ArtRdm) — adresse DMX,
/// personality (mode), libellé, identify.
///
/// Nécessite un node compatible qui proxy le RDM au-dessus de son
/// interface Art-Net (Luminex, Pathport, passerelles ETC...) — un simple
/// node DMX grand public ne répondra pas et le scan restera vide.
class RdmPage extends StatefulWidget {
  const RdmPage({super.key});

  @override
  State<RdmPage> createState() => _RdmPageState();
}

class _RdmPageState extends State<RdmPage> {
  final RdmService _service = rdmService;

  @override
  void initState() {
    super.initState();
    _service.addListener(_onChanged);
    _start();
  }

  Future<void> _start() async {
    try {
      await _service.start();
    } catch (_) {
      // lastError déjà positionné côté service, affiché dans l'UI.
    }
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _service.removeListener(_onChanged);
    super.dispose();
  }

  Future<void> _scan() async {
    await _service.scan();
  }

  Future<void> _confirmAndApply({
    required String message,
    required Future<bool> Function() apply,
  }) async {
    final loc = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF161622),
        title: Text(loc.rdmEditTitle, style: const TextStyle(color: Colors.white)),
        content: Text(message, style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(loc.rdmCancelButton),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: _kRdmAccent, foregroundColor: Colors.black),
            child: Text(loc.rdmConfirmButton),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    if (!mounted) return;

    final ok = await apply();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(ok ? loc.rdmSetSuccess : loc.rdmSetFailed)),
    );
  }

  Future<void> _editStartAddress(RdmDevice device) async {
    final loc = AppLocalizations.of(context);
    final ctrl = TextEditingController(text: '${device.dmxStartAddress ?? 1}');
    final value = await showDialog<int>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF161622),
        title: Text(loc.rdmStartAddressLabel, style: const TextStyle(color: Colors.white)),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          inputFormatters: [intFormatter],
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(loc.rdmCancelButton),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, int.tryParse(ctrl.text)),
            style: FilledButton.styleFrom(backgroundColor: _kRdmAccent, foregroundColor: Colors.black),
            child: Text(loc.rdmConfirmButton),
          ),
        ],
      ),
    );
    if (value == null || value < 1 || value > 512) return;
    if (!mounted) return;

    await _confirmAndApply(
      message: loc.rdmConfirmSetStartAddress(device.uid.label, value),
      apply: () => _service.setStartAddress(device.uid, value),
    );
  }

  Future<void> _editPersonality(RdmDevice device) async {
    final loc = AppLocalizations.of(context);
    final count = device.personalityCount ?? 1;
    final current = device.personalityCurrent ?? 1;
    final value = await showDialog<int>(
      context: context,
      builder: (ctx) => SimpleDialog(
        backgroundColor: const Color(0xFF161622),
        title: Text(loc.rdmPersonalityLabel, style: const TextStyle(color: Colors.white)),
        children: List.generate(count, (i) => i + 1)
            .map((n) => SimpleDialogOption(
                  onPressed: () => Navigator.pop(ctx, n),
                  child: Text(
                    '$n${n == current ? '  ✓' : ''}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ))
            .toList(),
      ),
    );
    if (value == null || value == current) return;
    if (!mounted) return;

    await _confirmAndApply(
      message: loc.rdmConfirmSetPersonality(device.uid.label, value),
      apply: () => _service.setPersonality(device.uid, value),
    );
  }

  Future<void> _editLabel(RdmDevice device) async {
    final loc = AppLocalizations.of(context);
    final ctrl = TextEditingController(text: device.deviceLabel ?? '');
    final value = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF161622),
        title: Text(loc.rdmEditTitle, style: const TextStyle(color: Colors.white)),
        content: TextField(controller: ctrl, autofocus: true, maxLength: 32),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(loc.rdmCancelButton),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, ctrl.text.trim()),
            style: FilledButton.styleFrom(backgroundColor: _kRdmAccent, foregroundColor: Colors.black),
            child: Text(loc.rdmConfirmButton),
          ),
        ],
      ),
    );
    if (value == null || value.isEmpty || value == device.deviceLabel) return;
    if (!mounted) return;

    await _confirmAndApply(
      message: loc.rdmConfirmSetLabel(device.uid.label, value),
      apply: () => _service.setDeviceLabel(device.uid, value),
    );
  }

  Future<void> _toggleIdentify(RdmDevice device) async {
    await _service.setIdentify(device.uid, !(device.identifyOn ?? false));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final devices = _service.devices;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.rdmPageTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:network_rdm', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _service.isScanning ? null : _scan,
        backgroundColor: _kRdmAccent,
        foregroundColor: Colors.black,
        icon: _service.isScanning
            ? const SizedBox(
                width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
            : const Icon(Icons.radar_rounded),
        label: Text(_service.isScanning ? loc.rdmScanningStatus : loc.rdmScanButton),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber_rounded, color: Colors.orangeAccent, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      loc.rdmWriteWarning,
                      style: const TextStyle(color: Colors.orangeAccent, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (_service.lastError != null) ...[
              Text(
                _service.lastError!,
                style: const TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
              const SizedBox(height: 12),
            ],
            if (devices.isEmpty && !_service.isScanning)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  loc.rdmEmptyState,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white54),
                ),
              )
            else ...[
              MiniPill(loc.rdmDeviceCountLabel(devices.length)),
              const SizedBox(height: 12),
              ...devices.map((d) => _DeviceCard(
                    device: d,
                    onEditStartAddress: () => _editStartAddress(d),
                    onEditPersonality: () => _editPersonality(d),
                    onEditLabel: () => _editLabel(d),
                    onToggleIdentify: () => _toggleIdentify(d),
                    onRefresh: () => _service.refreshDevice(d.uid),
                  )),
            ],
          ],
        ),
      ),
    );
  }
}

class _DeviceCard extends StatelessWidget {
  final RdmDevice device;
  final VoidCallback onEditStartAddress;
  final VoidCallback onEditPersonality;
  final VoidCallback onEditLabel;
  final VoidCallback onToggleIdentify;
  final VoidCallback onRefresh;

  const _DeviceCard({
    required this.device,
    required this.onEditStartAddress,
    required this.onEditPersonality,
    required this.onEditLabel,
    required this.onToggleIdentify,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final busy = device.isLoadingDetails || device.isApplyingChange;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SectionCard(
        accentColor: kSectionNetwork,
        title: device.deviceLabel?.isNotEmpty == true ? device.deviceLabel! : device.uid.label,
        icon: Icons.lightbulb_outline,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                MiniPill('${loc.rdmUidLabel} ${device.uid.label}'),
                if (device.manufacturerLabel?.isNotEmpty == true)
                  MiniPill('${loc.rdmManufacturerLabel}: ${device.manufacturerLabel}'),
                if (device.dmxFootprint != null)
                  MiniPill('${loc.rdmFootprintLabel}: ${device.dmxFootprint}'),
                if (device.softwareVersionLabel?.isNotEmpty == true)
                  MiniPill('${loc.rdmSoftwareVersionLabel}: ${device.softwareVersionLabel}'),
              ],
            ),
            const SizedBox(height: 12),
            if (busy) const LinearProgressIndicator(minHeight: 2),
            if (device.error != null) ...[
              const SizedBox(height: 8),
              Text(loc.rdmNoResponse, style: const TextStyle(color: Colors.redAccent, fontSize: 12)),
            ],
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton.icon(
                  onPressed: busy ? null : onEditStartAddress,
                  icon: const Icon(Icons.pin_outlined, size: 16),
                  label: Text(
                      '${loc.rdmStartAddressLabel}: ${device.dmxStartAddress ?? '—'}'),
                ),
                OutlinedButton.icon(
                  onPressed: busy || device.personalityCount == null ? null : onEditPersonality,
                  icon: const Icon(Icons.tune_rounded, size: 16),
                  label: Text(
                      '${loc.rdmPersonalityLabel}: ${device.personalityCurrent ?? '—'}/${device.personalityCount ?? '—'}'),
                ),
                OutlinedButton.icon(
                  onPressed: busy ? null : onEditLabel,
                  icon: const Icon(Icons.edit_outlined, size: 16),
                  label: Text(loc.rdmEditTitle),
                ),
                OutlinedButton.icon(
                  onPressed: busy ? null : onToggleIdentify,
                  icon: Icon(
                    device.identifyOn == true ? Icons.flash_on : Icons.flash_off,
                    size: 16,
                    color: device.identifyOn == true ? _kRdmAccent : null,
                  ),
                  label: Text(loc.rdmIdentifyButton),
                ),
                IconButton(
                  tooltip: loc.rdmRefreshTooltip,
                  onPressed: busy ? null : onRefresh,
                  icon: const Icon(Icons.refresh_rounded, size: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
