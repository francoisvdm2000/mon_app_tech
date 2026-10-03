import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart';
import '../../l10n_gen/app_localizations.dart';
import '../../services/network/dmx_sender_service.dart';
import 'virtual_console_source_page.dart';
import '../about/about_favorites.dart';
import 'package:mon_app_tech/app/constants.dart';

/// Console virtuelle : émet du Art-Net / sACN en WiFi pour tester des
/// machines, depuis de simples faders ou depuis une vraie fixture GDTF
/// (recherche GDTF Share, import .gdtf local, ou fixture déjà patchée
/// via l'outil d'import MVR).
///
/// Étape 1/3 : réglages réseau (protocole, univers, cible) + démarrage
/// de l'émission. L'étape suivante (choix de la source) est une page
/// séparée pour garder chaque écran simple et lisible.
class VirtualConsolePage extends StatefulWidget {
  const VirtualConsolePage({super.key});

  @override
  State<VirtualConsolePage> createState() => _VirtualConsolePageState();
}

class _VirtualConsolePageState extends State<VirtualConsolePage> {
  static const kVConsoleAccent = Color(0xFF4CC9F0);

  final DmxSenderService _service = dmxSenderService;

  final TextEditingController _universeCtrl = TextEditingController();
  final TextEditingController _universeCountCtrl = TextEditingController();
  final TextEditingController _manualIpCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _universeCtrl.text = '${_service.universe}';
    _universeCountCtrl.text = '${_service.universeCount}';
    _manualIpCtrl.text = _service.manualIp;
    _service.addListener(_onServiceChanged);
  }

  void _onServiceChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _service.removeListener(_onServiceChanged);
    _universeCtrl.dispose();
    _universeCountCtrl.dispose();
    _manualIpCtrl.dispose();
    super.dispose();
  }

  Future<void> _toggleRun() async {
    if (_service.isRunning) {
      _service.stop();
      setState(() {});
      return;
    }
    try {
      await _service.start();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).vconsoleStartFailed(e))),
      );
    }
    if (mounted) setState(() {});
  }

  void _blackout() {
    _service.blackout();
    setState(() {});
  }

  void _goToSource() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const VirtualConsoleSourcePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final running = _service.isRunning;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.vconsoleTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:console_virtual', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: [
            SectionCard(
              accentColor: kSectionConsole,
              title: loc.vconsoleSectionConnection,
              icon: Icons.wifi_tethering,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SegmentedButton<DmxProtocol>(
                    segments: const [
                      ButtonSegment(value: DmxProtocol.artnet, label: Text('Art-Net')),
                      ButtonSegment(value: DmxProtocol.sacn, label: Text('sACN')),
                    ],
                    selected: {_service.protocol},
                    onSelectionChanged: running
                        ? null
                        : (s) => setState(() => _service.protocol = s.first),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _universeCtrl,
                          enabled: !running,
                          keyboardType: TextInputType.number,
                          inputFormatters: [intFormatter],
                          decoration: InputDecoration(labelText: loc.vconsoleUniverseLabel),
                          onChanged: (v) {
                            final n = int.tryParse(v);
                            if (n != null && n >= 1) _service.universe = n;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _universeCountCtrl,
                          enabled: !running,
                          keyboardType: TextInputType.number,
                          inputFormatters: [intFormatter],
                          decoration:
                              InputDecoration(labelText: loc.vconsoleUniverseCountLabel),
                          onChanged: (v) {
                            final n = int.tryParse(v);
                            if (n != null && n >= 1) _service.universeCount = n;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ChoiceChip(
                        label: Text(loc.vconsoleTargetBroadcast),
                        selected: _service.targetMode == DmxTargetMode.broadcast,
                        onSelected: running
                            ? null
                            : (_) => setState(
                                () => _service.targetMode = DmxTargetMode.broadcast),
                      ),
                      ChoiceChip(
                        label: Text(loc.vconsoleTargetUnicast),
                        selected: _service.targetMode == DmxTargetMode.unicast,
                        onSelected: running
                            ? null
                            : (_) => setState(
                                () => _service.targetMode = DmxTargetMode.unicast),
                      ),
                    ],
                  ),
                  if (_service.targetMode == DmxTargetMode.unicast) ...[
                    const SizedBox(height: 12),
                    TextField(
                      controller: _manualIpCtrl,
                      enabled: !running,
                      decoration: InputDecoration(labelText: loc.vconsoleManualIpLabel),
                      onChanged: (v) => _service.manualIp = v,
                    ),
                  ],
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _toggleRun,
                          icon: Icon(running ? Icons.stop_circle : Icons.play_circle_fill),
                          label: Text(running ? loc.vconsoleStop : loc.vconsoleStart),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: running ? Colors.redAccent : kVConsoleAccent,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton.icon(
                        onPressed: _blackout,
                        icon: const Icon(Icons.brightness_1, size: 16),
                        label: Text(loc.vconsoleBlackout),
                        style: OutlinedButton.styleFrom(foregroundColor: Colors.redAccent),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      MiniPill(running
                          ? loc.vconsoleStatusLive(_service.fps.toStringAsFixed(0))
                          : loc.vconsoleStatusStopped),
                      MiniPill(_service.protocol == DmxProtocol.artnet ? 'Art-Net' : 'sACN'),
                      MiniPill(loc.vconsoleUniversePill(_service.universeCount > 1
                          ? '${_service.universe}–${_service.universe + _service.universeCount - 1}'
                          : '${_service.universe}')),
                      if (_service.resolvedTargetLabel != null)
                        MiniPill(loc.vconsoleTargetPill(_service.resolvedTargetLabel!)),
                    ],
                  ),
                  if (_service.lastError != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      loc.vconsoleErrorLabel(_service.lastError!),
                      style: const TextStyle(color: Colors.redAccent, fontSize: 12),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _goToSource,
              icon: const Icon(Icons.arrow_forward_rounded),
              label: Text(loc.vconsoleContinueToSource),
              style: ElevatedButton.styleFrom(
                backgroundColor: kVConsoleAccent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              loc.vconsoleContinueToSourceHint,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white38, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
