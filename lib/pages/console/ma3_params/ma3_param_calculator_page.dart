// ignore_for_file: use_build_context_synchronously
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/ui/widgets.dart';
import '../../../l10n_gen/app_localizations.dart';
import '../../about/about_favorites.dart';
import '../../lumiere/patch/gdtf_builder_simple_page.dart' show GdtfFixture;
import '../../shared/result_reveal.dart';
import 'ma3_param_engine.dart';
import 'package:mon_app_tech/app/constants.dart';

const String _kGdtfWorkerUrl =
    'https://showtech-gdtf.francois-vandermeeren.workers.dev';

const _kBg = Color(0xFF0D0D14);
const _kCard = Color(0xFF161622);
const _kOk = Color(0xFF4ADE80);
const _kWarn = Color(0xFFFFB703);
const _kErr = Color(0xFFFF5252);

const _kPrefSystem = 'ma3calc.system';
const _kPrefMargin = 'ma3calc.margin';
const _kPrefList = 'ma3calc.list.v1';

/// Calculateur de paramètres grandMA3 : combien de paramètres consomme le
/// show, et faut-il des processing units (PU) ?
///
/// Deux entrées, un seul résultat :
///  • Depuis un MVR : on lit la scène + les GDTF embarqués, avec un rapport
///    de fiabilité (le calcul ne vaut que ce que valent les GDTF) ;
///  • Depuis une liste : "6 × MAC Aura, 23 × Studio Color…", chaque machine
///    étant cherchée dans GDTF Share (ou importée / saisie à la main).
class Ma3ParamCalculatorPage extends StatefulWidget {
  const Ma3ParamCalculatorPage({
    super.key,
    this.accent = const Color(0xFF4CC9F0),
  });

  /// Couleur de la catégorie d'où l'on vient (Console = bleu, Lumière = ambre).
  final Color accent;

  @override
  State<Ma3ParamCalculatorPage> createState() => _Ma3ParamCalculatorPageState();
}

class _Ma3ParamCalculatorPageState extends State<Ma3ParamCalculatorPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  // Réglages partagés
  Ma3System _system = Ma3System.light;
  double _margin = 0.10;

  // Onglet MVR
  bool _mvrBusy = false;
  String? _mvrFileName;
  Ma3MvrResult? _mvr;
  String? _mvrError;

  // Onglet liste
  List<Ma3CalcLine> _list = [];
  bool _listBusy = false;

  Color get _accent => widget.accent;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
    _tabs.addListener(() {
      if (!_tabs.indexIsChanging) {
        setState(() {});
      }
    });
    _restore();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  // ── Persistance ────────────────────────────────────────────────────────────

  Future<void> _restore() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final sys = prefs.getString(_kPrefSystem);
      final margin = prefs.getDouble(_kPrefMargin);
      final raw = prefs.getString(_kPrefList);
      final lines = <Ma3CalcLine>[];
      if (raw != null && raw.isNotEmpty) {
        for (final e in (jsonDecode(raw) as List<dynamic>)) {
          final l = Ma3CalcLine.fromJson(e as Map<String, dynamic>);
          if (l != null) {
            lines.add(l);
          }
        }
      }
      if (!mounted) {
        return;
      }
      setState(() {
        _system = Ma3System.values.firstWhere(
          (s) => s.name == sys,
          orElse: () => Ma3System.light,
        );
        if (margin != null) {
          _margin = margin;
        }
        _list = lines;
      });
    } catch (_) {
      // Préférences illisibles : on repart de zéro, sans bloquer l'outil.
    }
  }

  Future<void> _saveSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_kPrefSystem, _system.name);
      await prefs.setDouble(_kPrefMargin, _margin);
    } catch (_) {}
  }

  Future<void> _saveList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _kPrefList,
        jsonEncode(_list.map((l) => l.toJson()).toList()),
      );
    } catch (_) {}
  }

  // ── MVR ────────────────────────────────────────────────────────────────────

  Future<void> _pickMvr() async {
    final loc = AppLocalizations.of(context);
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        withData: true,
      );
    } catch (e) {
      setState(() => _mvrError = loc.ma3CalcPickFailed);
      return;
    }
    if (result == null || result.files.isEmpty) {
      return;
    }

    final file = result.files.first;
    if (!file.name.toLowerCase().endsWith('.mvr')) {
      setState(() => _mvrError = loc.ma3CalcNotMvr(file.name));
      return;
    }
    final bytes = file.bytes;
    if (bytes == null || bytes.isEmpty) {
      setState(() => _mvrError = loc.ma3CalcPickFailed);
      return;
    }

    setState(() {
      _mvrBusy = true;
      _mvrError = null;
    });

    try {
      final parsed = await compute(parseMvrForMa3, bytes);
      if (!mounted) {
        return;
      }
      String? error;
      switch (parsed.error) {
        case Ma3MvrError.unreadable:
          error = loc.ma3CalcMvrUnreadable;
          break;
        case Ma3MvrError.noScene:
          error = loc.ma3CalcMvrNoScene;
          break;
        case Ma3MvrError.noFixtures:
          error = loc.ma3CalcMvrNoFixtures;
          break;
        case null:
          break;
      }
      setState(() {
        _mvrBusy = false;
        _mvrError = error;
        _mvr = error == null ? parsed : null;
        _mvrFileName = error == null ? file.name : null;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _mvrBusy = false;
        _mvrError = loc.ma3CalcMvrUnreadable;
      });
    }
  }

  // ── Liste ──────────────────────────────────────────────────────────────────

  Future<void> _addToList() async {
    final choice = await showModalBottomSheet<_AddChoice>(
      context: context,
      isScrollControlled: true,
      backgroundColor: _kCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _GdtfSearchSheet(accent: _accent),
    );
    if (choice == null || !mounted) {
      return;
    }

    switch (choice.kind) {
      case _AddKind.shareResult:
        await _addFromShare(choice.fixture!);
        break;
      case _AddKind.localFile:
        await _addFromLocalGdtf();
        break;
      case _AddKind.manual:
        await _addManual();
        break;
    }
  }

  Future<void> _addFromShare(GdtfFixture fixture) async {
    final loc = AppLocalizations.of(context);
    setState(() => _listBusy = true);
    try {
      final res = await http
          .get(Uri.parse('$_kGdtfWorkerUrl/download?rid=${fixture.rid}'))
          .timeout(const Duration(seconds: 30));
      if (!mounted) {
        return;
      }
      if (res.statusCode != 200) {
        _snack(loc.ma3CalcDownloadFailed);
        return;
      }
      final label = [fixture.manufacturer, fixture.fixture]
          .where((s) => s.trim().isNotEmpty)
          .join(' ');
      await _addFromGdtfBytes(res.bodyBytes, label, Ma3LineSource.gdtfShare,
          rid: fixture.rid);
    } catch (_) {
      if (mounted) {
        _snack(loc.ma3CalcDownloadFailed);
      }
    } finally {
      if (mounted) {
        setState(() => _listBusy = false);
      }
    }
  }

  Future<void> _addFromLocalGdtf() async {
    final loc = AppLocalizations.of(context);
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        withData: true,
      );
    } catch (_) {
      _snack(loc.ma3CalcPickFailed);
      return;
    }
    if (result == null || result.files.isEmpty) {
      return;
    }
    final file = result.files.first;
    final bytes = file.bytes;
    if (bytes == null || !file.name.toLowerCase().endsWith('.gdtf')) {
      _snack(loc.ma3CalcNotGdtf(file.name));
      return;
    }
    final label = file.name.substring(0, file.name.length - 5);
    await _addFromGdtfBytes(bytes, label, Ma3LineSource.gdtfFile);
  }

  Future<void> _addFromGdtfBytes(
    Uint8List bytes,
    String fallbackLabel,
    Ma3LineSource source, {
    int? rid,
  }) async {
    final loc = AppLocalizations.of(context);
    final analyzer = Ma3GdtfAnalyzer(bytes);
    if (!analyzer.isReadable) {
      _snack(loc.ma3CalcGdtfUnreadable);
      return;
    }
    final mode = await _pickMode(analyzer);
    if (mode == null || !mounted) {
      return;
    }

    final qty = await _askNumber(
      title: loc.ma3CalcHowMany,
      initial: 1,
      min: 1,
    );
    if (qty == null || !mounted) {
      return;
    }

    final line = Ma3CalcLine(
      label: fallbackLabel,
      quantity: qty,
      source: source,
    )..applyAnalysis(
        analyzer.analyze(mode),
        bytes: bytes,
        fallbackLabel: fallbackLabel,
        rid: rid,
        requestedMode: mode,
      );

    setState(() => _list.add(line));
    _saveList();
  }

  // ── Choix du mode ──────────────────────────────────────────────────────────

  /// Demande le mode DMX à utiliser. [current] est coché ; s'il n'y a qu'un
  /// mode, il est pris d'office. Renvoie null si annulé ou aucun mode.
  Future<String?> _pickMode(Ma3GdtfAnalyzer analyzer, {String? current}) async {
    final loc = AppLocalizations.of(context);
    final summaries = analyzer.modeSummaries();
    if (summaries.isEmpty) {
      _snack(loc.ma3CalcGdtfNoMode);
      return null;
    }
    if (summaries.length == 1) {
      return summaries.first.name;
    }
    final cur = (current ?? '').trim().toLowerCase();
    return showDialog<String>(
      context: context,
      builder: (ctx) => SimpleDialog(
        backgroundColor: _kCard,
        title: Text(loc.ma3CalcChooseMode,
            style: const TextStyle(color: Colors.white)),
        children: summaries.map((m) {
          final selected = m.name.trim().toLowerCase() == cur;
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(ctx, m.name),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(m.name,
                          style: TextStyle(
                              color: selected ? _accent : Colors.white,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 2),
                      Text(
                        m.params == null
                            ? loc.ma3CalcModeUnknown
                            : loc.ma3CalcModeSummary(
                                m.params!, m.footprint ?? m.params!),
                        style: TextStyle(
                            color: selected ? _accent : Colors.white60,
                            fontSize: 12.5),
                      ),
                    ],
                  ),
                ),
                if (selected)
                  Icon(Icons.check_circle_rounded, color: _accent, size: 20),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ── Modifier une machine (mode / type) ─────────────────────────────────────

  Future<Uint8List?> _downloadShare(int rid) async {
    final res = await http
        .get(Uri.parse('$_kGdtfWorkerUrl/download?rid=$rid'))
        .timeout(const Duration(seconds: 30));
    if (res.statusCode != 200 || res.bodyBytes.isEmpty) {
      return null;
    }
    return res.bodyBytes;
  }

  /// Exécute [task] derrière un petit indicateur de chargement bloquant.
  Future<T?> _runBusy<T>(Future<T?> Function() task) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
    try {
      return await task();
    } catch (_) {
      return null;
    } finally {
      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    }
  }

  void _afterLineEdit(Ma3CalcLine line, {required bool persist}) {
    setState(() {});
    if (persist) {
      _saveList();
    }
    _snack(AppLocalizations.of(context).ma3CalcLineUpdated(line.label));
  }

  /// Menu "Modifier cette machine" : mode, type de machine, valeur manuelle.
  Future<void> _lineActions(Ma3CalcLine line, {required bool persist}) async {
    final loc = AppLocalizations.of(context);
    final action = await showModalBottomSheet<_LineAction>(
      context: context,
      backgroundColor: _kCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        Widget item(_LineAction a, IconData icon, String title, String sub) {
          return ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _accent.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: _accent, size: 20),
            ),
            title: Text(title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            subtitle: Text(sub,
                style: const TextStyle(color: Colors.white60, fontSize: 12.5)),
            onTap: () => Navigator.pop(ctx, a),
          );
        }

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(loc.ma3CalcEditSheetTitle,
                          style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.6)),
                      const SizedBox(height: 4),
                      Text(
                        line.label,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
                      ),
                      if (line.mode != null && line.mode!.isNotEmpty)
                        Text(line.mode!,
                            style: const TextStyle(
                                color: Colors.white54, fontSize: 12.5)),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                item(_LineAction.mode, Icons.tune_rounded,
                    loc.ma3CalcActionChangeMode, loc.ma3CalcActionChangeModeSub),
                item(_LineAction.type, Icons.swap_horiz_rounded,
                    loc.ma3CalcActionChangeType, loc.ma3CalcActionChangeTypeSub),
                item(_LineAction.manual, Icons.edit_rounded,
                    loc.ma3CalcActionManual, loc.ma3CalcActionManualSub),
              ],
            ),
          ),
        );
      },
    );
    if (action == null || !mounted) {
      return;
    }
    switch (action) {
      case _LineAction.mode:
        await _changeMode(line, persist: persist);
        break;
      case _LineAction.type:
        await _changeType(line, persist: persist);
        break;
      case _LineAction.manual:
        await _editParams(line, persist: persist);
        break;
    }
  }

  Future<void> _changeMode(Ma3CalcLine line, {required bool persist}) async {
    final loc = AppLocalizations.of(context);
    var bytes = line.gdtfBytes;
    if (bytes == null && line.gdtfRid != null) {
      final rid = line.gdtfRid!;
      bytes = await _runBusy(() => _downloadShare(rid));
      if (!mounted) {
        return;
      }
      if (bytes == null) {
        _snack(loc.ma3CalcDownloadFailed);
        return;
      }
    }
    if (bytes == null) {
      // Pas de GDTF connu (manquant dans le MVR, saisie manuelle, fichier
      // importé avant redémarrage) : on passe par le choix de la machine.
      _snack(loc.ma3CalcNeedGdtfFirst);
      await _changeType(line, persist: persist);
      return;
    }
    final analyzer = Ma3GdtfAnalyzer(bytes);
    if (!analyzer.isReadable) {
      _snack(loc.ma3CalcGdtfUnreadable);
      return;
    }
    final mode = await _pickMode(analyzer, current: line.mode);
    if (mode == null || !mounted) {
      return;
    }
    line.applyAnalysis(
      analyzer.analyze(mode),
      bytes: bytes,
      rid: line.gdtfRid,
      requestedMode: mode,
    );
    _afterLineEdit(line, persist: persist);
  }

  Future<void> _changeType(Ma3CalcLine line, {required bool persist}) async {
    final loc = AppLocalizations.of(context);
    final choice = await showModalBottomSheet<_AddChoice>(
      context: context,
      isScrollControlled: true,
      backgroundColor: _kCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _GdtfSearchSheet(
        accent: _accent,
        title: loc.ma3CalcReplaceSheetTitle,
        initialQuery: line.label,
      ),
    );
    if (choice == null || !mounted) {
      return;
    }

    Uint8List? bytes;
    String? fallback;
    int? rid;
    switch (choice.kind) {
      case _AddKind.manual:
        await _editParams(line, persist: persist);
        return;
      case _AddKind.shareResult:
        {
        final f = choice.fixture!;
        rid = f.rid;
        fallback = [f.manufacturer, f.fixture]
            .where((x) => x.trim().isNotEmpty)
            .join(' ');
        bytes = await _runBusy(() => _downloadShare(f.rid));
        if (!mounted) {
          return;
        }
        if (bytes == null) {
          _snack(loc.ma3CalcDownloadFailed);
          return;
        }
        break;
        }
      case _AddKind.localFile:
        {
        FilePickerResult? result;
        try {
          result = await FilePicker.platform.pickFiles(
            type: FileType.any,
            withData: true,
          );
        } catch (_) {
          _snack(loc.ma3CalcPickFailed);
          return;
        }
        if (result == null || result.files.isEmpty || !mounted) {
          return;
        }
        final file = result.files.first;
        if (file.bytes == null || !file.name.toLowerCase().endsWith('.gdtf')) {
          _snack(loc.ma3CalcNotGdtf(file.name));
          return;
        }
        bytes = file.bytes;
        fallback = file.name.substring(0, file.name.length - 5);
        break;
        }
    }

    final data = bytes!;
    final analyzer = Ma3GdtfAnalyzer(data);
    if (!analyzer.isReadable) {
      _snack(loc.ma3CalcGdtfUnreadable);
      return;
    }
    // Le mode d'origine (ex. celui écrit dans le MVR) est pré-coché s'il
    // existe dans le nouveau GDTF.
    final mode = await _pickMode(analyzer, current: line.mode);
    if (mode == null || !mounted) {
      return;
    }
    line.applyAnalysis(
      analyzer.analyze(mode),
      bytes: data,
      fallbackLabel: fallback,
      rid: rid,
      requestedMode: mode,
    );
    _afterLineEdit(line, persist: persist);
  }

  Future<void> _addManual() async {
    final line = await showDialog<Ma3CalcLine>(
      context: context,
      builder: (_) => _ManualEntryDialog(accent: _accent),
    );
    if (line == null || !mounted) {
      return;
    }
    setState(() => _list.add(line));
    _saveList();
  }

  Future<void> _clearList() async {
    final loc = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: _kCard,
        title: Text(loc.ma3CalcClearListTitle,
            style: const TextStyle(color: Colors.white)),
        content: Text(loc.ma3CalcClearListBody,
            style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(loc.ma3CalcCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: _kErr),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(loc.ma3CalcClear),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) {
      return;
    }
    setState(() => _list = []);
    _saveList();
  }

  // ── Édition commune ────────────────────────────────────────────────────────

  Future<void> _editParams(Ma3CalcLine line, {required bool persist}) async {
    final loc = AppLocalizations.of(context);
    final ctrl = TextEditingController(
      text: line.paramsPerUnit?.toString() ?? '',
    );
    final result = await showDialog<_ParamsEdit>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: _kCard,
        title: Text(loc.ma3CalcParamsPerUnitTitle,
            style: const TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(line.label,
                style: const TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            TextField(
              controller: ctrl,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [intFormatter],
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                suffixText: loc.ma3CalcParamsUnit,
                helperText: line.gdtfParams != null
                    ? loc.ma3CalcGdtfValue(line.gdtfParams!)
                    : loc.ma3CalcParamsHelp,
                helperMaxLines: 3,
              ),
            ),
          ],
        ),
        actions: [
          if (line.overrideParams != null && line.gdtfParams != null)
            TextButton(
              onPressed: () =>
                  Navigator.pop(ctx, const _ParamsEdit(reset: true)),
              child: Text(loc.ma3CalcBackToGdtf),
            ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(loc.ma3CalcCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: _accent),
            onPressed: () {
              final v = int.tryParse(ctrl.text.trim());
              Navigator.pop(ctx, _ParamsEdit(value: v));
            },
            child: Text(loc.ma3CalcOk,
                style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
    ctrl.dispose();
    if (result == null || !mounted) {
      return;
    }
    setState(() {
      if (result.reset) {
        line.overrideParams = null;
      } else if (result.value != null && result.value! >= 0) {
        // Même valeur que le GDTF : pas besoin de la marquer "manuelle".
        line.overrideParams =
            result.value == line.gdtfParams ? null : result.value;
      }
    });
    if (persist) {
      _saveList();
    }
  }

  Future<int?> _askNumber({
    required String title,
    required int initial,
    int min = 0,
  }) async {
    final loc = AppLocalizations.of(context);
    final ctrl = TextEditingController(text: '$initial');
    ctrl.selection =
        TextSelection(baseOffset: 0, extentOffset: ctrl.text.length);
    final v = await showDialog<int>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: _kCard,
        title: Text(title, style: const TextStyle(color: Colors.white)),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          keyboardType: TextInputType.number,
          inputFormatters: [intFormatter],
          style: const TextStyle(color: Colors.white, fontSize: 22),
          onSubmitted: (_) =>
              Navigator.pop(ctx, int.tryParse(ctrl.text.trim())),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(loc.ma3CalcCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: _accent),
            onPressed: () => Navigator.pop(ctx, int.tryParse(ctrl.text.trim())),
            child: Text(loc.ma3CalcOk,
                style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
    ctrl.dispose();
    if (v == null || v < min) {
      return null;
    }
    return v;
  }

  void _snack(String text) {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.ma3CalcTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:console_ma3_params', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: TabBar(
          controller: _tabs,
          indicatorColor: _accent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: Colors.white.withValues(alpha: 0.08),
          tabs: [
            Tab(
              icon: const Icon(Icons.view_in_ar_rounded, size: 20),
              text: loc.ma3CalcTabMvr,
            ),
            Tab(
              icon: const Icon(Icons.format_list_numbered_rounded, size: 20),
              text: loc.ma3CalcTabList,
            ),
          ],
        ),
      ),
      floatingActionButton: _tabs.index == 1
          ? FloatingActionButton.extended(
              backgroundColor: _accent,
              foregroundColor: Colors.black,
              onPressed: _listBusy ? null : _addToList,
              icon: _listBusy
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.black),
                    )
                  : const Icon(Icons.add_rounded),
              label: Text(loc.ma3CalcAddFixture,
                  style: const TextStyle(fontWeight: FontWeight.w700)),
            )
          : null,
      body: SafeArea(
        top: false,
        child: TabBarView(
          controller: _tabs,
          children: [
            _buildMvrTab(loc),
            _buildListTab(loc),
          ],
        ),
      ),
    );
  }

  EdgeInsets _pagePadding(BuildContext context, {bool fab = false}) =>
      EdgeInsets.fromLTRB(
        16,
        16,
        16,
        (fab ? 96 : 24) + MediaQuery.paddingOf(context).bottom,
      );

  // ── Onglet MVR ─────────────────────────────────────────────────────────────

  Widget _buildMvrTab(AppLocalizations loc) {
    final mvr = _mvr;
    final lines = mvr?.lines ?? const <Ma3CalcLine>[];

    return ListView(
      padding: _pagePadding(context),
      children: [
        if (mvr == null) ...[
          _EmptyState(
            accent: _accent,
            icon: Icons.view_in_ar_rounded,
            title: loc.ma3CalcMvrEmptyTitle,
            body: loc.ma3CalcMvrEmptyBody,
            buttonLabel: loc.ma3CalcPickMvr,
            busy: _mvrBusy,
            onPressed: _pickMvr,
          ),
          if (_mvrError != null) ...[
            const SizedBox(height: 12),
            ResultBox('❌ $_mvrError'),
          ],
          const SizedBox(height: 16),
          _GdtfDisclaimer(accent: _accent),
        ] else ...[
          _FileChip(
            accent: _accent,
            name: _mvrFileName ?? '',
            busy: _mvrBusy,
            onChange: _pickMvr,
          ),
          if (_mvrError != null) ...[
            const SizedBox(height: 12),
            ResultBox('❌ $_mvrError'),
          ],
          const SizedBox(height: 12),
          _ReliabilityBanner(lines: lines),
          const SizedBox(height: 12),
          _SettingsCard(
            accent: _accent,
            system: _system,
            margin: _margin,
            onSystem: (s) {
              setState(() => _system = s);
              _saveSettings();
            },
            onMargin: (m) {
              setState(() => _margin = m);
              _saveSettings();
            },
          ),
          const SizedBox(height: 12),
          ResultReveal(
            show: lines.isNotEmpty,
            child: _ResultCard(
              accent: _accent,
              lines: lines,
              system: _system,
              margin: _margin,
              sourceLabel: _mvrFileName,
            ),
          ),
          const SizedBox(height: 18),
          _SectionTitle(
            text: loc.ma3CalcFixtureTypes(lines.length),
            trailing:
                loc.ma3CalcMvrCounts(mvr.fixtureCount, mvr.unpatchedCount),
          ),
          const SizedBox(height: 8),
          for (final l in lines) ...[
            _LineCard(
              line: l,
              accent: _accent,
              onTap: () => _lineActions(l, persist: false),
            ),
            const SizedBox(height: 8),
          ],
          if (mvr.multipatchCount > 0) ...[
            const SizedBox(height: 4),
            Text(
              loc.ma3CalcMultipatchNote(mvr.multipatchCount),
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
          const SizedBox(height: 12),
          _GdtfDisclaimer(accent: _accent),
        ],
        const SizedBox(height: 12),
        const _HowItWorks(),
      ],
    );
  }

  // ── Onglet liste ───────────────────────────────────────────────────────────

  Widget _buildListTab(AppLocalizations loc) {
    return ListView(
      padding: _pagePadding(context, fab: true),
      children: [
        if (_list.isEmpty) ...[
          _EmptyState(
            accent: _accent,
            icon: Icons.format_list_numbered_rounded,
            title: loc.ma3CalcListEmptyTitle,
            body: loc.ma3CalcListEmptyBody,
            buttonLabel: loc.ma3CalcAddFixture,
            busy: _listBusy,
            onPressed: _addToList,
          ),
        ] else ...[
          _SettingsCard(
            accent: _accent,
            system: _system,
            margin: _margin,
            onSystem: (s) {
              setState(() => _system = s);
              _saveSettings();
            },
            onMargin: (m) {
              setState(() => _margin = m);
              _saveSettings();
            },
          ),
          const SizedBox(height: 12),
          _ResultCard(
            accent: _accent,
            lines: _list,
            system: _system,
            margin: _margin,
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _SectionTitle(
                  text: loc.ma3CalcFixtureTypes(_list.length),
                ),
              ),
              TextButton.icon(
                onPressed: _clearList,
                icon: const Icon(Icons.delete_sweep_rounded,
                    size: 18, color: Colors.white54),
                label: Text(loc.ma3CalcClear,
                    style: const TextStyle(color: Colors.white54)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          for (var i = 0; i < _list.length; i++) ...[
            Dismissible(
              key: ObjectKey(_list[i]),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: _kErr.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.delete_rounded, color: _kErr),
              ),
              onDismissed: (_) {
                setState(() => _list.removeAt(i));
                _saveList();
              },
              child: _LineCard(
                line: _list[i],
                accent: _accent,
                onTap: () => _lineActions(_list[i], persist: true),
                onQuantity: (q) {
                  setState(() => _list[i].quantity = q);
                  _saveList();
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
          Text(
            loc.ma3CalcSwipeHint,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
        const SizedBox(height: 16),
        _GdtfDisclaimer(accent: _accent),
        const SizedBox(height: 12),
        const _HowItWorks(),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// Textes des contrôles qualité
// ═════════════════════════════════════════════════════════════════════════════

String ma3IssueText(AppLocalizations loc, Ma3Issue i) {
  switch (i.kind) {
    case Ma3IssueKind.gdtfMissing:
      return loc.ma3CalcIssueGdtfMissing;
    case Ma3IssueKind.unreadable:
      return loc.ma3CalcIssueUnreadable;
    case Ma3IssueKind.modeMissing:
      return loc.ma3CalcIssueModeMissing(i.text2 ?? '');
    case Ma3IssueKind.modeNotFound:
      return loc.ma3CalcIssueModeNotFound(i.text ?? '?', i.text2 ?? '');
    case Ma3IssueKind.modeGuessedSingle:
      return loc.ma3CalcIssueModeGuessed;
    case Ma3IssueKind.modePartialMatch:
      return loc.ma3CalcIssueModePartial(i.text ?? '');
    case Ma3IssueKind.noChannels:
      return loc.ma3CalcIssueNoChannels;
    case Ma3IssueKind.channelsWithoutFunction:
      return loc.ma3CalcIssueNoFunction(i.a ?? 0);
    case Ma3IssueKind.overlappingOffsets:
      return loc.ma3CalcIssueOverlap(i.a ?? 0);
    case Ma3IssueKind.offsetGaps:
      return loc.ma3CalcIssueGaps(i.a ?? 0);
    case Ma3IssueKind.modeNameMismatch:
      return loc.ma3CalcIssueNameMismatch(i.a ?? 0, i.b ?? 0);
    case Ma3IssueKind.unknownGeometry:
      return loc.ma3CalcIssueUnknownGeometry(i.a ?? 0);
    case Ma3IssueKind.manualValue:
      return loc.ma3CalcIssueManual;
  }
}

Color _severityColor(Ma3IssueSeverity s) {
  switch (s) {
    case Ma3IssueSeverity.error:
      return _kErr;
    case Ma3IssueSeverity.warning:
      return _kWarn;
    case Ma3IssueSeverity.info:
      return Colors.white54;
  }
}

String _fmt(BuildContext context, int v) =>
    NumberFormat.decimalPattern(Localizations.localeOf(context).toString())
        .format(v);

// ═════════════════════════════════════════════════════════════════════════════
// Widgets
// ═════════════════════════════════════════════════════════════════════════════

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.accent,
    required this.icon,
    required this.title,
    required this.body,
    required this.buttonLabel,
    required this.onPressed,
    this.busy = false,
  });

  final Color accent;
  final IconData icon;
  final String title;
  final String body;
  final String buttonLabel;
  final VoidCallback onPressed;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accent.withValues(alpha: 0.18),
            accent.withValues(alpha: 0.04),
          ],
        ),
        border: Border.all(color: accent.withValues(alpha: 0.25)),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accent.withValues(alpha: 0.18),
            ),
            child: Icon(icon, color: accent, size: 36),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, height: 1.4),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: accent,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: busy ? null : onPressed,
            icon: busy
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.black),
                  )
                : const Icon(Icons.upload_file_rounded),
            label: Text(buttonLabel,
                style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

class _FileChip extends StatelessWidget {
  const _FileChip({
    required this.accent,
    required this.name,
    required this.busy,
    required this.onChange,
  });

  final Color accent;
  final String name;
  final bool busy;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 6, 6, 6),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Row(
        children: [
          Icon(Icons.description_rounded, color: accent, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          TextButton(
            onPressed: busy ? null : onChange,
            child: busy
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(loc.ma3CalcChangeFile, style: TextStyle(color: accent)),
          ),
        ],
      ),
    );
  }
}

class _ReliabilityBanner extends StatelessWidget {
  const _ReliabilityBanner({required this.lines});
  final List<Ma3CalcLine> lines;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final t = Ma3Totals.of(lines);

    final Color color;
    final IconData icon;
    final String title;
    final String body;

    if (t.linesWithErrors > 0) {
      color = _kErr;
      icon = Icons.error_rounded;
      title = loc.ma3CalcReliabilityBadTitle(t.linesWithErrors);
      body = loc.ma3CalcReliabilityBadBody;
    } else if (t.linesWithWarnings > 0) {
      color = _kWarn;
      icon = Icons.warning_amber_rounded;
      title = loc.ma3CalcReliabilityWarnTitle(t.linesWithWarnings);
      body = loc.ma3CalcReliabilityWarnBody;
    } else {
      color = _kOk;
      icon = Icons.verified_rounded;
      title = loc.ma3CalcReliabilityOkTitle;
      body = loc.ma3CalcReliabilityOkBody;
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withValues(alpha: 0.45)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.5)),
                const SizedBox(height: 4),
                Text(body,
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 12.5, height: 1.35)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    required this.accent,
    required this.system,
    required this.margin,
    required this.onSystem,
    required this.onMargin,
  });

  final Color accent;
  final Ma3System system;
  final double margin;
  final ValueChanged<Ma3System> onSystem;
  final ValueChanged<double> onMargin;

  static const _margins = [0.0, 0.10, 0.20];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    Widget chip({
      required String label,
      required bool selected,
      required VoidCallback onTap,
    }) {
      return ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => onTap(),
        showCheckmark: false,
        labelStyle: TextStyle(
          color: selected ? Colors.black : Colors.white70,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
        ),
        selectedColor: accent,
        backgroundColor: Colors.white.withValues(alpha: 0.05),
        side: BorderSide(
          color: selected ? accent : Colors.white.withValues(alpha: 0.12),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      );
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(loc.ma3CalcYourSystem,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: Ma3System.values
                .map((s) => chip(
                      label: s.shortName,
                      selected: s == system,
                      onTap: () => onSystem(s),
                    ))
                .toList(),
          ),
          const SizedBox(height: 14),
          Text(loc.ma3CalcSafetyMargin,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _margins
                .map((m) => chip(
                      label: m == 0
                          ? loc.ma3CalcNoMargin
                          : '+${(m * 100).round()} %',
                      selected: (m - margin).abs() < 0.001,
                      onTap: () => onMargin(m),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({
    required this.accent,
    required this.lines,
    required this.system,
    required this.margin,
    this.sourceLabel,
  });

  final Color accent;
  final List<Ma3CalcLine> lines;
  final Ma3System system;
  final double margin;
  final String? sourceLabel;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final totals = Ma3Totals.of(lines);
    final reco = recommendMa3(
      system: system,
      rawParams: totals.params,
      marginRatio: margin,
    );

    // ── Verdict
    final Color vColor;
    final IconData vIcon;
    final String vTitle;
    String? vSub;

    if (reco.exceedsSessionMax) {
      vColor = _kErr;
      vIcon = Icons.block_rounded;
      vTitle =
          loc.ma3CalcVerdictSessionMax(_fmt(context, kMa3SessionMaxParams));
    } else if (reco.exceedsOnPc) {
      vColor = _kWarn;
      vIcon = Icons.upgrade_rounded;
      vTitle = loc.ma3CalcVerdictOnPcTooSmall(_fmt(context, kMa3OnPcMaxParams));
      vSub = loc.ma3CalcVerdictOnPcTooSmallSub;
    } else if (system == Ma3System.onPc) {
      vColor = _kOk;
      vIcon = Icons.check_circle_rounded;
      vTitle = loc.ma3CalcVerdictOnPcOk;
      vSub = loc.ma3CalcVerdictOnPcOkSub(_fmt(context, kMa3OnPcMaxParams));
    } else if (reco.baseIsEnough) {
      vColor = _kOk;
      vIcon = Icons.celebration_rounded;
      vTitle = loc.ma3CalcVerdictBaseOk(system.displayName);
      vSub = loc.ma3CalcVerdictCapacity(_fmt(context, reco.capacity));
    } else {
      vColor = accent;
      vIcon = Icons.add_box_rounded;
      vTitle = loc.ma3CalcVerdictAddPu(reco.processingUnitsLabel);
      vSub = loc.ma3CalcVerdictCapacity(_fmt(context, reco.capacity));
      if (reco.xlOnlyCount > 0 &&
          reco.xlOnlyCount != reco.processingUnits.length) {
        vSub = '$vSub\n${loc.ma3CalcVerdictXlOnly(reco.xlOnlyCount)}';
      }
    }

    String summaryText() {
      final b = StringBuffer()
        ..writeln('grandMA3 — ${loc.ma3CalcTitle}')
        ..writeln(sourceLabel ?? '')
        ..writeln('${loc.ma3CalcTotalParams}: ${_fmt(context, totals.params)}')
        ..writeln(loc.ma3CalcWithMargin(
            (margin * 100).round(), _fmt(context, reco.neededParams)))
        ..writeln(
            loc.ma3CalcFixturesAndUniverses(totals.fixtures, totals.universes))
        ..writeln('${system.displayName} → $vTitle');
      if (vSub != null) {
        b.writeln(vSub);
      }
      b.writeln();
      for (final l in lines) {
        b.writeln(
            '${l.quantity} × ${l.label}${l.mode != null ? ' (${l.mode})' : ''}'
            ' = ${l.isUnknown ? '?' : _fmt(context, l.totalParams)}');
      }
      b
        ..writeln()
        ..writeln(loc.ma3CalcDisclaimerShort);
      return b.toString().trim();
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 12, 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accent.withValues(alpha: 0.28),
            accent.withValues(alpha: 0.06),
          ],
        ),
        border: Border.all(color: accent.withValues(alpha: 0.4)),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.15),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  loc.ma3CalcTotalParams.toUpperCase(),
                  style: TextStyle(
                    color: accent,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.1,
                    fontSize: 12,
                  ),
                ),
              ),
              IconButton(
                tooltip: loc.ma3CalcCopySummary,
                icon: const Icon(Icons.copy_rounded,
                    color: Colors.white70, size: 20),
                onPressed: () => copyToClipboard(context, summaryText()),
              ),
            ],
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: totals.params.toDouble()),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            builder: (context, v, _) => Text(
              _fmt(context, v.round()),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 44,
                fontWeight: FontWeight.w900,
                height: 1.0,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            loc.ma3CalcFixturesAndUniverses(totals.fixtures, totals.universes),
            style: const TextStyle(color: Colors.white70),
          ),
          if (margin > 0)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                loc.ma3CalcWithMargin(
                    (margin * 100).round(), _fmt(context, reco.neededParams)),
                style: const TextStyle(color: Colors.white54, fontSize: 12.5),
              ),
            ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: reco.usageRatio),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOutCubic,
                builder: (context, v, _) => LinearProgressIndicator(
                  value: v,
                  minHeight: 8,
                  color: vColor,
                  backgroundColor: Colors.white.withValues(alpha: 0.08),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            margin: const EdgeInsets.only(right: 6),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: vColor.withValues(alpha: 0.5)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(vIcon, color: vColor, size: 26),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(vTitle,
                          style: TextStyle(
                              color: vColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 15.5)),
                      if (vSub != null) ...[
                        const SizedBox(height: 4),
                        Text(vSub,
                            style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12.5,
                                height: 1.35)),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (totals.unknownFixtures > 0) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.help_outline_rounded, color: _kErr, size: 16),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    loc.ma3CalcUnknownNotCounted(totals.unknownFixtures),
                    style: const TextStyle(color: _kErr, fontSize: 12.5),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.text, this.trailing});
  final String text;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        if (trailing != null)
          Text(trailing!,
              style: const TextStyle(color: Colors.white54, fontSize: 12)),
      ],
    );
  }
}

class _LineCard extends StatelessWidget {
  const _LineCard({
    required this.line,
    required this.accent,
    required this.onTap,
    this.onQuantity,
  });

  final Ma3CalcLine line;
  final Color accent;
  final VoidCallback onTap;

  /// Non null = quantité modifiable (onglet liste).
  final ValueChanged<int>? onQuantity;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final sev = line.severity;
    final hasProblem = sev != Ma3IssueSeverity.info;
    final statusColor = hasProblem ? _severityColor(sev) : _kOk;
    final statusIcon = sev == Ma3IssueSeverity.error
        ? Icons.error_rounded
        : sev == Ma3IssueSeverity.warning
            ? Icons.warning_amber_rounded
            : Icons.check_circle_rounded;

    final per = line.paramsPerUnit;

    return Material(
      color: _kCard,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: hasProblem
                  ? statusColor.withValues(alpha: 0.35)
                  : Colors.white.withValues(alpha: 0.07),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(statusIcon, color: statusColor, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          line.label,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.5,
                          ),
                        ),
                        if (line.mode != null && line.mode!.isNotEmpty)
                          Text(
                            line.mode!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white54, fontSize: 12.5),
                          ),
                        const SizedBox(height: 4),
                        Text(
                          per == null
                              ? loc.ma3CalcUnknownParams
                              : loc.ma3CalcPerUnit(per),
                          style: TextStyle(
                            color: per == null ? _kErr : accent,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        per == null ? '?' : _fmt(context, line.totalParams),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (onQuantity == null) ...[
                        Text(
                          '× ${line.quantity}',
                          style: const TextStyle(
                              color: Colors.white54, fontSize: 12.5),
                        ),
                        const SizedBox(height: 4),
                        Icon(Icons.tune_rounded,
                            size: 16,
                            color: Colors.white.withValues(alpha: 0.3)),
                      ],
                    ],
                  ),
                ],
              ),
              if (onQuantity != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(width: 30),
                    _QtyStepper(
                      value: line.quantity,
                      accent: accent,
                      onChanged: onQuantity!,
                    ),
                    const Spacer(),
                    Icon(Icons.edit_rounded,
                        size: 16, color: Colors.white.withValues(alpha: 0.3)),
                  ],
                ),
              ],
              for (final issue in line.visibleIssues) ...[
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: _severityColor(issue.severity),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        ma3IssueText(loc, issue),
                        style: TextStyle(
                          color: _severityColor(issue.severity)
                              .withValues(alpha: 0.9),
                          fontSize: 12,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              if (line.isUnknown) ...[
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    loc.ma3CalcTapToFix,
                    style: TextStyle(
                        color: accent,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _QtyStepper extends StatelessWidget {
  const _QtyStepper({
    required this.value,
    required this.accent,
    required this.onChanged,
  });

  final int value;
  final Color accent;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    Widget btn(IconData icon, VoidCallback? onTap) => InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onTap == null
              ? null
              : () {
                  HapticFeedback.selectionClick();
                  onTap();
                },
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Icon(icon,
                size: 18, color: onTap == null ? Colors.white24 : accent),
          ),
        );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          btn(Icons.remove_rounded,
              value > 1 ? () => onChanged(value - 1) : null),
          GestureDetector(
            onTap: () async {
              final ctrl = TextEditingController(text: '$value');
              final v = await showDialog<int>(
                context: context,
                builder: (ctx) => AlertDialog(
                  backgroundColor: _kCard,
                  content: TextField(
                    controller: ctrl,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [intFormatter],
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                    onSubmitted: (_) =>
                        Navigator.pop(ctx, int.tryParse(ctrl.text.trim())),
                  ),
                  actions: [
                    FilledButton(
                      style: FilledButton.styleFrom(backgroundColor: accent),
                      onPressed: () =>
                          Navigator.pop(ctx, int.tryParse(ctrl.text.trim())),
                      child: Text(AppLocalizations.of(context).ma3CalcOk,
                          style: const TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              );
              ctrl.dispose();
              if (v != null && v >= 1) {
                onChanged(v);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '$value',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          btn(Icons.add_rounded, () => onChanged(value + 1)),
        ],
      ),
    );
  }
}

class _GdtfDisclaimer extends StatelessWidget {
  const _GdtfDisclaimer({required this.accent});
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline_rounded,
              color: Colors.white54, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              loc.ma3CalcDisclaimer,
              style: const TextStyle(
                  color: Colors.white60, fontSize: 12, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _HowItWorks extends StatelessWidget {
  const _HowItWorks();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    String f(int v) => _fmt(context, v);
    final hw = [
      for (final s in Ma3System.values)
        if (s != Ma3System.onPc) '${s.displayName} : ${f(s.params)}',
      for (final pu in Ma3ProcessingUnit.values)
        'grandMA3 processing unit ${pu.name.toUpperCase()} : +${f(pu.params)}',
      'onPC : max ${f(kMa3OnPcMaxParams)}',
      loc.ma3CalcHowSessionMax(f(kMa3SessionMaxParams)),
    ].join('\n');

    return ExpandSectionCard(
      accentColor: kSectionConsole,
      title: loc.ma3CalcHowTitle,
      icon: Icons.school_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(loc.ma3CalcHowBody,
              style: const TextStyle(
                  color: Colors.white70, fontSize: 13, height: 1.45)),
          const SizedBox(height: 12),
          Text(loc.ma3CalcHowHardware,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(hw,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12.5,
                  height: 1.5,
                  fontFamily: 'monospace')),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// Ajout d'une machine (feuille de recherche GDTF Share)
// ═════════════════════════════════════════════════════════════════════════════

enum _AddKind { shareResult, localFile, manual }

enum _LineAction { mode, type, manual }

class _AddChoice {
  const _AddChoice(this.kind, [this.fixture]);
  final _AddKind kind;
  final GdtfFixture? fixture;
}

class _ParamsEdit {
  const _ParamsEdit({this.value, this.reset = false});
  final int? value;
  final bool reset;
}

class _GdtfSearchSheet extends StatefulWidget {
  const _GdtfSearchSheet({
    required this.accent,
    this.title,
    this.initialQuery,
  });
  final Color accent;

  /// Titre personnalisé (ex. "Choisir la machine" quand on remplace).
  final String? title;

  /// Recherche pré-remplie et lancée à l'ouverture.
  final String? initialQuery;

  @override
  State<_GdtfSearchSheet> createState() => _GdtfSearchSheetState();
}

class _GdtfSearchSheetState extends State<_GdtfSearchSheet> {
  final _ctrl = TextEditingController();
  bool _busy = false;
  String? _error;
  List<GdtfFixture> _results = const [];
  bool _searched = false;

  @override
  void initState() {
    super.initState();
    final q = (widget.initialQuery ?? '').trim();
    if (q.isNotEmpty) {
      _ctrl.text = q;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _search();
        }
      });
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _search() async {
    final loc = AppLocalizations.of(context);
    final q = _ctrl.text.trim();
    if (q.isEmpty) {
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final res = await http
          .get(Uri.parse('$_kGdtfWorkerUrl/search?q=${Uri.encodeComponent(q)}'))
          .timeout(const Duration(seconds: 20));
      if (!mounted) {
        return;
      }
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as Map<String, dynamic>;
        setState(() {
          _searched = true;
          _results = ((data['results'] as List<dynamic>?) ?? [])
              .map((e) => GdtfFixture.fromJson(e as Map<String, dynamic>))
              .toList();
        });
      } else {
        setState(() => _error = loc.ma3CalcSearchFailed);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = loc.ma3CalcSearchFailed);
      }
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final accent = widget.accent;
    final media = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: media.viewInsets.bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: media.size.height * 0.85),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 16 + media.padding.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(widget.title ?? loc.ma3CalcAddSheetTitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text(loc.ma3CalcAddSheetSubtitle,
                  style:
                      const TextStyle(color: Colors.white60, fontSize: 12.5)),
              const SizedBox(height: 12),
              TextField(
                controller: _ctrl,
                autofocus: widget.initialQuery == null,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => _search(),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: loc.ma3CalcSearchHint,
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: _busy
                      ? const Padding(
                          padding: EdgeInsets.all(12),
                          child: SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : IconButton(
                          icon:
                              Icon(Icons.arrow_forward_rounded, color: accent),
                          onPressed: _search,
                        ),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: 8),
                Text(_error!, style: const TextStyle(color: _kErr)),
              ],
              const SizedBox(height: 8),
              Flexible(
                child: _results.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          _searched ? loc.ma3CalcNoResult : '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white54),
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: _results.length,
                        separatorBuilder: (_, __) => Divider(
                            height: 1,
                            color: Colors.white.withValues(alpha: 0.06)),
                        itemBuilder: (_, i) {
                          final r = _results[i];
                          return ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            leading: CircleAvatar(
                              backgroundColor: accent.withValues(alpha: 0.15),
                              child: Icon(Icons.lightbulb_rounded,
                                  color: accent, size: 20),
                            ),
                            title: Text(r.fixture,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            subtitle: Text(
                              [r.manufacturer, r.revision]
                                  .where((s) => s.trim().isNotEmpty)
                                  .join(' · '),
                              style: const TextStyle(color: Colors.white54),
                            ),
                            trailing:
                                Icon(Icons.add_circle_rounded, color: accent),
                            onTap: () => Navigator.pop(
                              context,
                              _AddChoice(_AddKind.shareResult, r),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(
                            color: Colors.white.withValues(alpha: 0.15)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () => Navigator.pop(
                          context, const _AddChoice(_AddKind.localFile)),
                      icon: const Icon(Icons.folder_open_rounded, size: 18),
                      label: Text(loc.ma3CalcImportGdtf),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(
                            color: Colors.white.withValues(alpha: 0.15)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () => Navigator.pop(
                          context, const _AddChoice(_AddKind.manual)),
                      icon: const Icon(Icons.edit_note_rounded, size: 18),
                      label: Text(loc.ma3CalcManualEntry),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ManualEntryDialog extends StatefulWidget {
  const _ManualEntryDialog({required this.accent});
  final Color accent;

  @override
  State<_ManualEntryDialog> createState() => _ManualEntryDialogState();
}

class _ManualEntryDialogState extends State<_ManualEntryDialog> {
  final _name = TextEditingController();
  final _params = TextEditingController();
  final _qty = TextEditingController(text: '1');

  @override
  void dispose() {
    _name.dispose();
    _params.dispose();
    _qty.dispose();
    super.dispose();
  }

  bool get _valid =>
      _name.text.trim().isNotEmpty &&
      (int.tryParse(_params.text.trim()) ?? 0) > 0 &&
      (int.tryParse(_qty.text.trim()) ?? 0) > 0;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    InputDecoration deco(String label, {String? suffix}) => InputDecoration(
          labelText: label,
          suffixText: suffix,
        );

    return AlertDialog(
      backgroundColor: _kCard,
      title: Text(loc.ma3CalcManualEntry,
          style: const TextStyle(color: Colors.white)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _name,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            style: const TextStyle(color: Colors.white),
            decoration: deco(loc.ma3CalcManualName),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _params,
            keyboardType: TextInputType.number,
            inputFormatters: [intFormatter],
            style: const TextStyle(color: Colors.white),
            decoration: deco(loc.ma3CalcParamsPerUnitTitle,
                suffix: loc.ma3CalcParamsUnit),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _qty,
            keyboardType: TextInputType.number,
            inputFormatters: [intFormatter],
            style: const TextStyle(color: Colors.white),
            decoration: deco(loc.ma3CalcHowMany),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 10),
          Text(loc.ma3CalcParamsHelp,
              style: const TextStyle(color: Colors.white54, fontSize: 12)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(loc.ma3CalcCancel),
        ),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: widget.accent),
          onPressed: !_valid
              ? null
              : () => Navigator.pop(
                    context,
                    Ma3CalcLine(
                      label: _name.text.trim(),
                      quantity: int.parse(_qty.text.trim()),
                      source: Ma3LineSource.manual,
                      overrideParams: int.parse(_params.text.trim()),
                    ),
                  ),
          child:
              Text(loc.ma3CalcOk, style: const TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
