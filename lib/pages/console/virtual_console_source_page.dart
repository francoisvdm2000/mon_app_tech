// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../app/ui/widgets.dart';
import '../../l10n_gen/app_localizations.dart';
import '../../services/network/dmx_sender_service.dart';
import '../../services/network/network_target_config.dart';
import '../lumiere/patch/gdtf_builder_simple_page.dart' show GdtfFixture;
import '../lumiere/patch/gdtf_reader.dart';
import '../lumiere/patch/patch_models.dart';
import '../lumiere/patch/patch_store.dart';
import 'virtual_console_faders_page.dart';
import 'package:mon_app_tech/app/constants.dart';

const String _kGdtfWorkerUrl =
    'https://showtech-gdtf.francois-vandermeeren.workers.dev';

/// Console virtuelle — étape 2/3 : choix de la source à piloter.
///
/// Trois façons d'arriver à une liste de canaux : de simples faders
/// numérotés, une fixture GDTF (recherche GDTF Share ou import local),
/// ou une machine déjà patchée (import MVR) — y compris en groupe, pour
/// piloter en une fois toutes les machines d'un même type.
class VirtualConsoleSourcePage extends StatefulWidget {
  const VirtualConsoleSourcePage({super.key});

  @override
  State<VirtualConsoleSourcePage> createState() => _VirtualConsoleSourcePageState();
}

class _VirtualConsoleSourcePageState extends State<VirtualConsoleSourcePage>
    with SingleTickerProviderStateMixin {
  static const _kAccent = Color(0xFF4CC9F0);

  final GdtfReader _gdtfReader = GdtfReader();
  late final TabController _tabController;

  // ── Faders simples ──
  int _simpleChannelCount = 16;

  // ── GDTF Share / import local ──
  final TextEditingController _searchCtrl = TextEditingController();
  bool _isBusy = false;
  String _gdtfError = '';
  List<GdtfFixture> _searchResults = const [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchCtrl.dispose();
    super.dispose();
  }

  List<GdtfDmxChannelInfo> _fallbackChannels(int count) {
    final n = count < 1 ? 1 : count;
    final loc = AppLocalizations.of(context);
    return List.generate(
      n,
      (i) => GdtfDmxChannelInfo(
        label: loc.vconsoleChannelShortLabel(i + 1),
        offsets: [i + 1],
      ),
    );
  }

  void _openFaders({
    required String title,
    required List<GdtfDmxChannelInfo> channels,
    required List<ConsoleTarget> targets,
    bool editableAddress = false,
    String? groupInfo,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => VirtualConsoleFadersPage(
          title: title,
          channels: channels,
          targets: targets,
          editableAddress: editableAddress,
          groupInfo: groupInfo,
        ),
      ),
    );
  }

  // ── Faders simples ──────────────────────────────────────────────────────

  void _openSimpleFaders() {
    // Fixture isolée : on repart toujours sur un seul univers (au cas où la
    // config globale garderait la plage d'un précédent groupe MVR).
    if (!dmxSenderService.isRunning) {
      networkTargetConfig.setUniverseRange(networkTargetConfig.startUniverse, 1);
    }
    _openFaders(
      title: AppLocalizations.of(context).vconsoleTabFaders,
      channels: _fallbackChannels(_simpleChannelCount),
      targets: [
        ConsoleTarget(universe: networkTargetConfig.startUniverse, startAddress: 1),
      ],
    );
  }

  // ── Recherche GDTF Share ────────────────────────────────────────────────

  Future<void> _searchGdtf() async {
    final q = _searchCtrl.text.trim();
    if (q.isEmpty) return;
    setState(() {
      _isBusy = true;
      _gdtfError = '';
      _searchResults = const [];
    });
    try {
      final response = await http
          .get(Uri.parse('$_kGdtfWorkerUrl/search?q=${Uri.encodeComponent(q)}'))
          .timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        setState(() {
          _searchResults = ((data['results'] as List<dynamic>?) ?? [])
              .map((e) => GdtfFixture.fromJson(e as Map<String, dynamic>))
              .toList();
        });
      } else {
        if (!mounted) return;
        setState(() => _gdtfError =
            AppLocalizations.of(context).vconsoleSearchError(response.statusCode));
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _gdtfError = AppLocalizations.of(context).vconsoleNetworkError(e));
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  /// Télécharge d'abord le .gdtf, puis découvre les VRAIS modes dans le
  /// fichier (comme pour l'import local) — le champ `modes` renvoyé par
  /// l'API de recherche est souvent vide ou peu fiable, s'y fier faisait
  /// que rien ne se passait au tap sur un résultat.
  Future<void> _pickSearchResult(GdtfFixture fixture) async {
    setState(() => _isBusy = true);
    try {
      final response = await http
          .get(Uri.parse('$_kGdtfWorkerUrl/download?rid=${fixture.rid}'))
          .timeout(const Duration(seconds: 30));
      if (response.statusCode != 200) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context).vconsoleDownloadFailed(response.statusCode),
            ),
          ),
        );
        return;
      }
      final bytes = response.bodyBytes;
      if (!mounted) return;
      await _pickModeAndOpen(
        bytes: bytes,
        label: '${fixture.manufacturer} ${fixture.fixture}',
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).vconsoleErrorLabel(e))),
      );
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  Future<void> _importLocalGdtf() async {
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['gdtf'],
        withData: true,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).vconsolePickFailed(e))),
      );
      return;
    }
    if (result == null || result.files.isEmpty) return;

    final file = result.files.first;
    final bytes = file.bytes;
    if (bytes == null) return;

    await _pickModeAndOpen(bytes: bytes, label: file.name);
  }

  /// Découvre les modes réels d'un .gdtf déjà téléchargé/importé, demande
  /// à l'utilisateur de choisir s'il y en a plusieurs, parse les canaux
  /// nommés du mode choisi, puis ouvre directement la console de faders.
  Future<void> _pickModeAndOpen({
    required Uint8List bytes,
    required String label,
  }) async {
    final modeNames = _gdtfReader.modeNames(bytes);
    if (modeNames.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).vconsoleNoModeFound)),
      );
      return;
    }

    String? chosenMode = modeNames.length == 1 ? modeNames.first : null;
    if (chosenMode == null) {
      if (!mounted) return;
      final loc = AppLocalizations.of(context);
      chosenMode = await showDialog<String>(
        context: context,
        builder: (ctx) => SimpleDialog(
          backgroundColor: const Color(0xFF161622),
          title: Text(
            loc.vconsoleModeDialogTitleGeneric,
            style: const TextStyle(color: Colors.white),
          ),
          children: modeNames
              .map((n) => SimpleDialogOption(
                    onPressed: () => Navigator.pop(ctx, n),
                    child: Text(n, style: const TextStyle(color: Colors.white70)),
                  ))
              .toList(),
        ),
      );
    }
    if (chosenMode == null) return;
    if (!mounted) return;

    final parsed = _gdtfReader.channelsForMode(gdtfBytes: bytes, modeName: chosenMode);
    final footprint =
        _gdtfReader.footprintForMode(gdtfBytes: bytes, modeName: chosenMode) ?? 1;

    // Fixture isolée : un seul univers, même logique que les faders simples.
    if (!dmxSenderService.isRunning) {
      networkTargetConfig.setUniverseRange(networkTargetConfig.startUniverse, 1);
    }

    _openFaders(
      title: '$label — $chosenMode',
      channels: parsed ?? _fallbackChannels(footprint),
      targets: [
        ConsoleTarget(universe: networkTargetConfig.startUniverse, startAddress: 1),
      ],
      editableAddress: true,
    );
  }

  // ── Mon Patch (MVR) ─────────────────────────────────────────────────────

  List<_PatchGroup> _buildGroups(List<PatchEntry> entries) {
    final map = <String, List<PatchEntry>>{};
    for (final e in entries) {
      map.putIfAbsent(e.groupKey, () => []).add(e);
    }
    final groups = map.entries
        .map((kv) => _PatchGroup(key: kv.key, entries: kv.value))
        .toList();
    groups.sort((a, b) => a.entries.first.fixtureName
        .compareTo(b.entries.first.fixtureName));
    return groups;
  }

  List<GdtfDmxChannelInfo> _resolveGroupChannels(_PatchGroup group) {
    final first = group.entries.first;
    final bytes = patchStore.gdtfBytesFor(first);
    if (bytes != null) {
      final parsed =
          _gdtfReader.channelsForMode(gdtfBytes: bytes, modeName: first.dmxModeName);
      if (parsed != null) return parsed;
    }
    return _fallbackChannels(first.channelCount);
  }

  void _openGroup(_PatchGroup group, {PatchEntry? onlyEntry}) {
    final loc = AppLocalizations.of(context);
    // Toutes les machines du groupe, quel que soit leur univers : on ne
    // laisse plus de côté les fixtures patchées sur un autre univers que le
    // "dominant" — un groupe MVR qui s'étale sur plusieurs univers est
    // désormais piloté en entier.
    final targetEntries = onlyEntry != null ? [onlyEntry] : group.entries;
    if (targetEntries.isEmpty) return;

    final channels = _resolveGroupChannels(group);
    final universesUsed = targetEntries.map((e) => e.universe).toSet().toList()..sort();
    final startUniverse = universesUsed.first;
    final universeCount = universesUsed.last - universesUsed.first + 1;

    if (!dmxSenderService.isRunning) {
      networkTargetConfig.setUniverseRange(startUniverse, universeCount);
    }

    final universeLabel = universesUsed.length == 1
        ? '${universesUsed.first}'
        : '${universesUsed.first}–${universesUsed.last}';

    _openFaders(
      title: '${group.entries.first.fixtureName} — ${group.entries.first.dmxModeName}',
      channels: channels,
      targets: targetEntries
          .map((e) => ConsoleTarget(universe: e.universe, startAddress: e.startAddress))
          .toList(),
      editableAddress: false,
      groupInfo: loc.vconsoleGroupInfo(targetEntries.length, universeLabel),
    );
  }

  // ── UI ───────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.vconsoleSourceStepTitle),
        bottom: TabBar(
          controller: _tabController,
          labelColor: _kAccent,
          unselectedLabelColor: Colors.white54,
          indicatorColor: _kAccent,
          tabs: [
            Tab(text: loc.vconsoleTabFaders),
            Tab(text: loc.vconsoleTabGdtf),
            Tab(text: loc.vconsoleTabPatch),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _simpleFadersTab(loc),
          _gdtfTab(loc),
          _patchTab(loc),
        ],
      ),
    );
  }

  Widget _simpleFadersTab(AppLocalizations loc) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        SectionCard(
          accentColor: kSectionConsole,
          title: loc.vconsoleTabFaders,
          icon: Icons.tune,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(loc.vconsoleChannelCountLabel,
                      style: const TextStyle(color: Colors.white70)),
                  const Spacer(),
                  IconButton(
                    onPressed: () => setState(
                        () => _simpleChannelCount = (_simpleChannelCount - 1).clamp(1, 512)),
                    icon: const Icon(Icons.remove_circle_outline, color: Colors.white70),
                  ),
                  Text('$_simpleChannelCount',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  IconButton(
                    onPressed: () => setState(
                        () => _simpleChannelCount = (_simpleChannelCount + 1).clamp(1, 512)),
                    icon: const Icon(Icons.add_circle_outline, color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: _openSimpleFaders,
                icon: const Icon(Icons.tune),
                label: Text(loc.vconsoleOpenFaders),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _kAccent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _gdtfTab(AppLocalizations loc) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        SectionCard(
          accentColor: kSectionConsole,
          title: loc.vconsoleSearchTitle,
          icon: Icons.cloud_download_outlined,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchCtrl,
                      decoration: InputDecoration(hintText: loc.vconsoleSearchHint),
                      onSubmitted: (_) => _searchGdtf(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _isBusy ? null : _searchGdtf,
                    child: _isBusy
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.search),
                  ),
                ],
              ),
              if (_gdtfError.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(_gdtfError, style: const TextStyle(color: Colors.redAccent)),
              ],
              if (_searchResults.isNotEmpty) ...[
                const SizedBox(height: 12),
                ..._searchResults.take(15).map((f) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('${f.manufacturer} ${f.fixture}',
                          style: const TextStyle(color: Colors.white)),
                      subtitle: Text(
                          loc.vconsoleSearchResultSubtitle(f.modes.length, f.filesizeLabel),
                          style: const TextStyle(color: Colors.white54)),
                      trailing: _isBusy
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.play_circle_outline, color: Colors.white70),
                      onTap: _isBusy ? null : () => _pickSearchResult(f),
                    )),
              ],
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: _isBusy ? null : _importLocalGdtf,
                icon: const Icon(Icons.folder_open),
                label: Text(loc.vconsoleImportLocal),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            loc.vconsoleChooseFixtureHint,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white38),
          ),
        ),
      ],
    );
  }

  Widget _patchTab(AppLocalizations loc) {
    return AnimatedBuilder(
      animation: patchStore,
      builder: (context, _) {
        final groups = _buildGroups(patchStore.entries);
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            SectionCard(
              accentColor: kSectionConsole,
              title: loc.vconsolePatchSectionTitle,
              icon: Icons.grid_view,
              child: groups.isEmpty
                  ? Text(loc.vconsolePatchEmpty, style: const TextStyle(color: Colors.white70))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: groups.map((g) => _groupTile(loc, g)).toList(),
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _groupTile(AppLocalizations loc, _PatchGroup group) {
    final first = group.entries.first;
    final universes = group.universes;
    final subtitle = group.entries.length == 1
        ? loc.vconsolePatchEntrySubtitle(
            first.universe, first.startAddress, first.endAddress, first.channelCount)
        : loc.vconsoleGroupSubtitle(group.entries.length, universes.join(', '));

    if (group.entries.length == 1) {
      return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(first.fixtureName, style: const TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white54)),
        trailing: const Icon(Icons.play_circle_outline, color: Colors.white70),
        onTap: () => _openGroup(group),
      );
    }

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: Text(first.fixtureName, style: const TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white54)),
        trailing: IconButton(
          tooltip: loc.vconsoleControlGroupTooltip,
          icon: const Icon(Icons.play_circle_fill, color: Colors.white70),
          onPressed: () => _openGroup(group),
        ),
        children: group.entries
            .map((e) => ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.only(left: 16),
                  title: Text(
                    loc.vconsolePatchEntrySubtitle(
                        e.universe, e.startAddress, e.endAddress, e.channelCount),
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                  trailing: const Icon(Icons.play_arrow, color: Colors.white38, size: 18),
                  onTap: () => _openGroup(group, onlyEntry: e),
                ))
            .toList(),
      ),
    );
  }
}

class _PatchGroup {
  final String key;
  final List<PatchEntry> entries;

  _PatchGroup({required this.key, required this.entries});

  List<int> get universes => entries.map((e) => e.universe).toSet().toList()..sort();
}
