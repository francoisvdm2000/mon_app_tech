import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';
import '../../app/ui/widgets.dart';
import '../../services/network/dmx_sender_service.dart';
import '../lumiere/patch/gdtf_reader.dart';

/// Une adresse de départ *avec son univers* — chaque fixture d'un groupe
/// MVR peut être patchée dans un univers différent, contrairement à une
/// simple liste d'adresses qui supposait implicitement un univers unique.
@immutable
class ConsoleTarget {
  final int universe;
  final int startAddress;

  const ConsoleTarget({required this.universe, required this.startAddress});
}

/// Console virtuelle — étape 3/3 : les faders eux-mêmes.
///
/// Reçoit une liste de canaux résolus (noms + offsets, éventuellement avec
/// des presets GDTF) et une ou plusieurs cibles (univers + adresse). Une
/// seule cible = une fixture ; plusieurs cibles = un groupe (même type de
/// machine, contrôlé simultanément — utile pour tester tout un lot depuis
/// un MVR, y compris quand ce lot s'étale sur plusieurs univers).
class VirtualConsoleFadersPage extends StatefulWidget {
  const VirtualConsoleFadersPage({
    super.key,
    required this.title,
    required this.channels,
    required this.targets,
    this.editableAddress = false,
    this.groupInfo,
  });

  final String title;
  final List<GdtfDmxChannelInfo> channels;
  final List<ConsoleTarget> targets;
  final bool editableAddress;
  final String? groupInfo;

  @override
  State<VirtualConsoleFadersPage> createState() =>
      _VirtualConsoleFadersPageState();
}

enum _ValueUnit { raw, percent }

class _VirtualConsoleFadersPageState extends State<VirtualConsoleFadersPage> {
  static const _kAccent = Color(0xFF4CC9F0);

  final DmxSenderService _service = dmxSenderService;
  late List<ConsoleTarget> _targets;
  final TextEditingController _startAddressCtrl = TextEditingController();
  _ValueUnit _unit = _ValueUnit.raw;

  @override
  void initState() {
    super.initState();
    _targets = List<ConsoleTarget>.from(widget.targets);
    if (_targets.isEmpty) {
      _targets = [ConsoleTarget(universe: _service.universe, startAddress: 1)];
    }
    _startAddressCtrl.text = '${_targets.first.startAddress}';
    _service.addListener(_onServiceChanged);
  }

  void _onServiceChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _service.removeListener(_onServiceChanged);
    _startAddressCtrl.dispose();
    super.dispose();
  }

  void _setStartAddress(int v) {
    // Adresse éditable = toujours une fixture isolée (faders simples / GDTF
    // seul) : on garde son univers courant, seule l'adresse change.
    setState(() => _targets = [
          ConsoleTarget(universe: _targets.first.universe, startAddress: v),
        ]);
  }

  void _setChannelForAll(int offset, int value) {
    for (final target in _targets) {
      final absolute = target.startAddress - 1 + offset;
      if (absolute >= 1 && absolute <= 512) {
        _service.setChannel(target.universe, absolute, value);
      }
    }
    setState(() {});
  }

  int _valueForOffset(int offset) {
    if (_targets.isEmpty) return 0;
    final first = _targets.first;
    final absolute = first.startAddress - 1 + offset;
    return _service.getChannel(first.universe, absolute);
  }

  void _allTo(int value) {
    for (final ch in widget.channels) {
      _setChannelForAll(ch.coarseOffset, value);
    }
  }

  // ── Home : dimmer 100%, pan/tilt centrés, shutter ouvert ────────────────
  //
  // Reconnaissance par le libellé du canal (issu du GDTF) — fonctionne
  // aussi bien pour une fixture GDTF que pour une machine patchée (MVR),
  // les deux passant par cette même page.

  static bool _isDimmerLabel(String l) =>
      l.contains('dimmer') || l.contains('intensity');

  static bool _isPanLabel(String l) =>
      !l.contains('fine') && (l == 'pan' || l.startsWith('pan '));

  static bool _isTiltLabel(String l) =>
      !l.contains('fine') && (l == 'tilt' || l.startsWith('tilt '));

  static bool _isShutterLabel(String l) => l.contains('shutter');

  bool get _hasHomeableChannels => widget.channels.any((ch) {
        final l = ch.label.toLowerCase().trim();
        return _isDimmerLabel(l) ||
            _isPanLabel(l) ||
            _isTiltLabel(l) ||
            _isShutterLabel(l);
      });

  /// Valeur DMX "ouvert" d'un canal shutter : on cherche un preset GDTF
  /// dont le nom contient "open" (Open, Shutter Open, Open (No Strobe)…),
  /// sinon on retombe sur 255 (convention la plus courante).
  int _shutterOpenValue(GdtfDmxChannelInfo ch) {
    for (final p in ch.presets) {
      if (p.name.toLowerCase().contains('open')) return p.dmxValue;
    }
    return 255;
  }

  void _goHome() {
    // On repart de 0 sur tous les canaux avant d'appliquer les valeurs
    // home : sinon un canal non reconnu (couleur, gobo, zoom...) resterait
    // à sa valeur précédente au lieu d'être remis à un état neutre.
    _allTo(0);
    for (final ch in widget.channels) {
      final l = ch.label.toLowerCase().trim();
      if (_isDimmerLabel(l)) {
        _setChannelForAll(ch.coarseOffset, 255);
      } else if (_isPanLabel(l) || _isTiltLabel(l)) {
        _setChannelForAll(ch.coarseOffset, 127);
      } else if (_isShutterLabel(l)) {
        _setChannelForAll(ch.coarseOffset, _shutterOpenValue(ch));
      }
    }
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
        SnackBar(
            content: Text(AppLocalizations.of(context).vconsoleStartFailed(e))),
      );
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final running = _service.isRunning;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.isEmpty
            ? loc.vconsoleFixtureFallbackTitle
            : widget.title),
        actions: [
          IconButton(
            tooltip: loc.vconsoleBlackout,
            onPressed: () => _allTo(0),
            icon: const Icon(Icons.brightness_1),
          ),
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            _statusBar(loc, running),
            const SizedBox(height: 12),
            if (widget.editableAddress) ...[
              Row(
                children: [
                  Text(loc.vconsoleStartAddressLabel,
                      style: const TextStyle(color: Colors.white70)),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 90,
                    child: TextField(
                      controller: _startAddressCtrl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [intFormatter],
                      decoration: const InputDecoration(isDense: true),
                      onSubmitted: (v) {
                        final n = int.tryParse(v);
                        if (n != null && n >= 1 && n <= 512) {
                          _setStartAddress(n);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      loc.vconsoleUniverseArrow(_targets.first.universe),
                      style:
                          const TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
            if (widget.groupInfo != null) ...[
              MiniPill(widget.groupInfo!),
              const SizedBox(height: 12),
            ],
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _allTo(0),
                    child: Text(loc.vconsoleAllZero),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _allTo(255),
                    child: Text(loc.vconsoleAllFull),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_hasHomeableChannels)
                  Tooltip(
                    message: loc.vconsoleHomeTooltip,
                    child: OutlinedButton.icon(
                      onPressed: _goHome,
                      icon: const Icon(Icons.home_rounded, size: 18),
                      label: Text(loc.vconsoleHomeButton),
                    ),
                  )
                else
                  const SizedBox.shrink(),
                SegmentedButton<_ValueUnit>(
                  segments: [
                    ButtonSegment(
                      value: _ValueUnit.raw,
                      label: Text(loc.vconsoleUnit8Bit),
                    ),
                    ButtonSegment(
                      value: _ValueUnit.percent,
                      label: Text(loc.vconsoleUnitPercent),
                    ),
                  ],
                  selected: {_unit},
                  showSelectedIcon: false,
                  onSelectionChanged: (s) => setState(() => _unit = s.first),
                ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 290,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.channels.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, i) {
                  final info = widget.channels[i];
                  return _FaderColumn(
                    label: info.label,
                    value: _valueForOffset(info.coarseOffset),
                    accent: _kAccent,
                    presets: info.presets,
                    unit: _unit,
                    onChanged: (v) => _setChannelForAll(info.coarseOffset, v),
                    onPresetSelected: (v) =>
                        _setChannelForAll(info.coarseOffset, v),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusBar(AppLocalizations loc, bool running) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        OutlinedButton.icon(
          onPressed: _toggleRun,
          icon: Icon(
            running ? Icons.stop_circle : Icons.play_circle_fill,
            color: running ? Colors.redAccent : _kAccent,
            size: 18,
          ),
          label: Text(running ? loc.vconsoleStop : loc.vconsoleStart),
          style: OutlinedButton.styleFrom(
            foregroundColor: running ? Colors.redAccent : _kAccent,
          ),
        ),
        MiniPill(running
            ? loc.vconsoleStatusLive(_service.fps.toStringAsFixed(0))
            : loc.vconsoleStatusStopped),
        MiniPill(_service.protocol == DmxProtocol.artnet ? 'Art-Net' : 'sACN'),
        MiniPill(loc.vconsoleUniversePill(_universeRangeLabel)),
      ],
    );
  }

  /// Univers couverts par cette session de faders (déduits des cibles, pas
  /// de la config globale) : "3" pour une fixture isolée, "3–5" pour un
  /// groupe MVR qui s'étale sur plusieurs univers.
  String get _universeRangeLabel {
    final universes = _targets.map((t) => t.universe).toSet().toList()..sort();
    if (universes.isEmpty) return '${_service.universe}';
    if (universes.length == 1) return '${universes.first}';
    return '${universes.first}–${universes.last}';
  }
}

class _FaderColumn extends StatelessWidget {
  final String label;
  final int value;
  final Color accent;
  final List<GdtfChannelPreset> presets;
  final _ValueUnit unit;
  final ValueChanged<int> onChanged;
  final ValueChanged<int> onPresetSelected;

  const _FaderColumn({
    required this.label,
    required this.value,
    required this.accent,
    required this.presets,
    required this.unit,
    required this.onChanged,
    required this.onPresetSelected,
  });

  String get _displayValue {
    if (unit == _ValueUnit.percent) {
      return '${(value / 255 * 100).round()}%';
    }
    return '$value';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        children: [
          // Hauteur fixe (2 lignes) quelle que soit la longueur du libellé :
          // sinon un nom court sur 1 ligne laisse plus de place au slider
          // qu'un nom long sur 2 lignes, et les faders n'ont plus la même
          // taille visuelle d'une colonne à l'autre.
          SizedBox(
            height: 28,
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: RotatedBox(
              quarterTurns: 3,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: accent,
                  thumbColor: accent,
                  inactiveTrackColor: Colors.white12,
                  overlayColor: accent.withValues(alpha: 0.2),
                ),
                child: Slider(
                  value: value.toDouble(),
                  min: 0,
                  max: 255,
                  onChanged: (v) => onChanged(v.round()),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _displayValue,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          // Slot toujours réservé (même sans preset) pour que le slider ait
          // exactement la même longueur sur toutes les colonnes.
          SizedBox(
            width: 28,
            height: 28,
            child: presets.isEmpty
                ? null
                : IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 16,
                    tooltip:
                        AppLocalizations.of(context).vconsolePresetsTooltip,
                    icon: Icon(Icons.bookmark_outline,
                        color: accent.withValues(alpha: 0.85)),
                    onPressed: () => _showPresetMenu(context),
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPresetMenu(BuildContext context) async {
    final loc = AppLocalizations.of(context);
    final selected = await showModalBottomSheet<int>(
      context: context,
      backgroundColor: const Color(0xFF161622),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 6),
                child: Text(
                  loc.vconsolePresetsTitleFor(label),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: presets.length,
                  itemBuilder: (ctx, i) {
                    final p = presets[i];
                    return ListTile(
                      title: Text(p.name,
                          style: const TextStyle(color: Colors.white)),
                      trailing: Text('${p.dmxValue}',
                          style: const TextStyle(color: Colors.white38)),
                      onTap: () => Navigator.pop(ctx, p.dmxValue),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
    if (selected != null) onPresetSelected(selected);
  }
}
