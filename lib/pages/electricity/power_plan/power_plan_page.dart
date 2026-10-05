// lib/pages/electricity/power_plan/power_plan_page.dart
//
// Plan électrique de spectacle : on construit l'arbre de distribution case
// par case (source → tableau de tête → tableaux → équipements), l'app calcule
// les courants par phase, la chute de tension, et sort le synoptique + le
// tableau de charge (PDF / CSV / PNG).

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mon_app_tech/app/utils/png_exporter.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../about/about_favorites.dart';
import 'power_plan_catalog.dart';
import 'power_plan_export.dart';
import 'power_plan_models.dart';
import 'power_plan_sheets.dart';
import 'power_plan_storage.dart';
import 'power_plan_synoptic.dart';
import 'power_plan_widgets.dart';

const Color _kPanelColor = Color(0xFF4CC9F0);

class ElectricityPowerPlanPage extends StatefulWidget {
  const ElectricityPowerPlanPage({super.key});

  @override
  State<ElectricityPowerPlanPage> createState() =>
      _ElectricityPowerPlanPageState();
}

class _ElectricityPowerPlanPageState extends State<ElectricityPowerPlanPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 3, vsync: this);
  List<PpPlan> _plans = [];
  PpPlan? _plan;
  bool _loading = true;
  bool _exporting = false;
  bool _alertsOpen = false;
  PpNode? _clipboard;
  Timer? _saveTimer;

  @override
  void initState() {
    super.initState();
    // Après la première frame : _init lit la langue (Localizations).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _init();
    });
  }

  @override
  void dispose() {
    if (_saveTimer?.isActive ?? false) {
      _saveTimer!.cancel();
      _saveNow();
    }
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _init() async {
    // Le catalogue d'abord : les plans s'y réfèrent pour leurs connecteurs.
    final repo = PpCatalogRepository();
    final lang = Localizations.localeOf(context).languageCode;
    PpCatalog.current = await repo.loadInitialFast(lang: lang);
    final plans = await PowerPlanStorage.loadAll();
    final currentId = await PowerPlanStorage.loadCurrentId();
    if (!mounted) return;
    final loc = AppLocalizations.of(context);
    if (plans.isEmpty) {
      plans.add(PpPlan(id: ppMakeId(), name: loc.ppDefaultPlanName));
    }
    final current = plans.firstWhere((p) => p.id == currentId,
        orElse: () => plans.first);
    setState(() {
      _plans = plans;
      _plan = current;
      _loading = false;
    });

    // Mise à jour silencieuse du catalogue (Google Sheet → GitHub).
    final fresh = await repo.refreshRemote(lang: lang);
    if (fresh != null && mounted) setState(() => PpCatalog.current = fresh);
  }

  // ── Sauvegarde ────────────────────────────────────────────────────────────

  void _touch() {
    setState(() {
      _plan?.updatedAt = DateTime.now();
    });
    _saveTimer?.cancel();
    _saveTimer = Timer(const Duration(milliseconds: 500), _saveNow);
  }

  Future<void> _saveNow() async {
    await PowerPlanStorage.saveAll(_plans);
    final p = _plan;
    if (p != null) await PowerPlanStorage.saveCurrentId(p.id);
  }

  Iterable<String> get _panelNames =>
      _plan?.allPanels.map((p) => p.name) ?? const <String>[];

  void _toast(String msg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(msg),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ));
  }

  Future<bool> _confirm(String title, String body, String action) async {
    final loc = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: kPpCardBg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        content: Text(body, style: const TextStyle(color: Colors.white60)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(loc.commonCancel,
                style: const TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(action,
                style: const TextStyle(color: Color(0xFFFF5252))),
          ),
        ],
      ),
    );
    return ok == true;
  }

  Future<String?> _askName(String title, String initial) async {
    final loc = AppLocalizations.of(context);
    final ctrl = TextEditingController(text: initial);
    final res = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: kPpCardBg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          decoration: ppInputDecoration(loc.ppNameLabel),
          onSubmitted: (v) => Navigator.pop(ctx, v),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(loc.commonCancel,
                style: const TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, ctrl.text),
            child: Text(loc.ppSave, style: const TextStyle(color: kPpAccent)),
          ),
        ],
      ),
    );
    ctrl.dispose();
    final t = res?.trim();
    return (t == null || t.isEmpty) ? null : t;
  }

  // ── Actions sur l'arbre ───────────────────────────────────────────────────

  Future<void> _addSource() async {
    final s = await showPpSourceSheet(context);
    if (s == null || _plan == null) return;
    _plan!.source = s;
    _touch();
  }

  Future<void> _editSource() async {
    final s = _plan?.source;
    if (s == null) return;
    final res = await showPpSourceSheet(context, initial: s);
    if (res != null) _touch();
  }

  Future<void> _deleteSource() async {
    final loc = AppLocalizations.of(context);
    final ok = await _confirm(
        loc.ppDeleteSourceTitle, loc.ppDeleteSourceBody, loc.ppDelete);
    if (!ok) return;
    _plan!.source = null;
    _touch();
  }

  Future<void> _addOutput(List<PpOutput> outputs, bool threePhase,
      {int? capAmps}) async {
    final c = await showPpConnectorPicker(context, threePhase: threePhase);
    if (c == null) return;
    final monoCount = outputs.where((o) => !o.connector.isThreePhase).length;
    final o = PpOutput.fresh(c, phase: PpPhase.values[monoCount % 3]);
    if (capAmps != null && o.breakerA > capAmps) o.breakerA = capAmps;
    outputs.add(o);
    _touch();
  }

  Future<void> _connect(PpOutput o) async {
    final node = await showPpConnectSheet(
      context,
      output: o,
      existingNames: _panelNames,
      clipboard: _clipboard,
    );
    if (node == null) return;
    o.child = node;
    _touch();
  }

  Future<void> _editOutput(
    PpOutput o,
    List<PpOutput> siblings, {
    required bool ownerThree,
    required PpPhase? lockedPhase,
    required bool canDelete,
  }) async {
    final loc = AppLocalizations.of(context);
    final action = await showPpOutputSheet(
      context,
      output: o,
      ownerThreePhase: ownerThree,
      lockedPhase: lockedPhase,
      canDelete: canDelete,
      onChanged: _touch,
    );
    if (action == PpOutputAction.delete) {
      if (o.child != null) {
        final ok = await _confirm(loc.ppDeleteOutputTitle,
            loc.ppDeleteOutputBody(o.child!.name), loc.ppDelete);
        if (!ok) return;
      }
      siblings.remove(o);
      _touch();
    }
  }

  Future<void> _editPanel(PpOutput parent, PpPanel p, bool monoFeed) async {
    final action = await showPpPanelSheet(
      context,
      panel: p,
      monoFeed: monoFeed,
      onChanged: _touch,
    );
    if (action == PpPanelAction.delete) await _disconnect(parent);
  }

  Future<void> _editLoad(PpLoad l, bool threePhase) async {
    final res = await showPpLoadSheet(context, initial: l, threePhase: threePhase);
    if (res != null) _touch();
  }

  Future<void> _disconnect(PpOutput o) async {
    final loc = AppLocalizations.of(context);
    final c = o.child;
    if (c == null) return;
    if (c is PpPanel && c.outputs.any((x) => x.child != null)) {
      final ok = await _confirm(
          loc.ppDeletePanelTitle, loc.ppDeletePanelBody(c.name), loc.ppDelete);
      if (!ok) return;
    }
    o.child = null;
    _touch();
  }

  void _copy(PpNode n) {
    setState(() => _clipboard = n.cloneFresh());
    _toast(AppLocalizations.of(context).ppCopied(n.name));
  }

  void _cyclePhase(PpOutput o) {
    o.phase = PpPhase.values[(o.phase.index + 1) % 3];
    _touch();
  }

  // ── Projets ───────────────────────────────────────────────────────────────

  Future<void> _renamePlan() async {
    final p = _plan;
    if (p == null) return;
    final loc = AppLocalizations.of(context);
    final name = await _askName(loc.ppRenamePlan, p.name);
    if (name == null) return;
    p.name = name;
    _touch();
  }

  Future<void> _openProjects() async {
    final loc = AppLocalizations.of(context);
    final res = await showPpSheet<(String, PpPlan?)>(
      context,
      builder: (ctx) => PpSheetScaffold(
        emoji: '📁',
        title: loc.ppProjectsTitle,
        footer: PpPrimaryButton(
          label: loc.ppNewPlan,
          icon: Icons.add_rounded,
          onPressed: () => Navigator.pop(ctx, ('new', null)),
        ),
        children: [
          for (final p in _plans)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: ppCardDecoration(
                border: p.id == _plan?.id ? kPpAccent : null,
              ),
              child: ListTile(
                onTap: () => Navigator.pop(ctx, ('open', p)),
                leading: const Text('📋', style: TextStyle(fontSize: 24)),
                title: Text(p.name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700)),
                subtitle: Text(
                  loc.ppPlanSummary(
                    p.allPanels.length.toString(),
                    ppFormatKw(p.allLoads.fold<double>(0, (a, l) => a + l.powerW)),
                  ),
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
                trailing: PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.white54),
                  onSelected: (v) => Navigator.pop(ctx, (v, p)),
                  itemBuilder: (_) => [
                    PopupMenuItem(value: 'rename', child: Text(loc.ppRename)),
                    PopupMenuItem(
                        value: 'duplicate', child: Text(loc.ppDuplicate)),
                    PopupMenuItem(value: 'delete', child: Text(loc.ppDelete)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
    if (res == null || !mounted) return;
    final (action, plan) = res;
    switch (action) {
      case 'new':
        {
          final name = await _askName(loc.ppNewPlan,
              ppUniqueName(loc.ppDefaultPlanName, _plans.map((p) => p.name)));
          if (name == null) return;
          final p = PpPlan(id: ppMakeId(), name: name);
          _plans.insert(0, p);
          _plan = p;
          _touch();
        }
      case 'open':
        if (plan == null) return;
        setState(() => _plan = plan);
        await PowerPlanStorage.saveCurrentId(plan.id);
      case 'rename':
        {
          if (plan == null) return;
          final name = await _askName(loc.ppRenamePlan, plan.name);
          if (name == null) return;
          plan.name = name;
          _touch();
        }
      case 'duplicate':
        {
          if (plan == null) return;
          final copy = PpPlan.fromJson({
            ...plan.toJson(),
            'id': ppMakeId(),
            'name': ppUniqueName(plan.name, _plans.map((p) => p.name)),
          });
          _plans.insert(0, copy);
          _plan = copy;
          _touch();
        }
      case 'delete':
        {
          if (plan == null) return;
          final ok = await _confirm(loc.ppDeletePlanTitle,
              loc.ppDeletePlanBody(plan.name), loc.ppDelete);
          if (!ok) return;
          _plans.remove(plan);
          if (_plans.isEmpty) {
            _plans.add(PpPlan(id: ppMakeId(), name: loc.ppDefaultPlanName));
          }
          if (_plan == plan) _plan = _plans.first;
          _touch();
        }
    }
  }

  // ── Exports ───────────────────────────────────────────────────────────────

  String get _fileBase {
    final n = (_plan?.name ?? '').trim();
    final safe = n.replaceAll(RegExp(r'[^\w\-]+'), '_');
    return safe.isEmpty ? 'power_plan' : safe;
  }

  Rect? _shareOrigin() {
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return null;
    return box.localToGlobal(Offset.zero) & box.size;
  }

  PpSynLayout _layout(PpPlan plan, PpCalc calc, AppLocalizations loc) {
    final s = plan.source;
    return PpSynLayout.build(
      plan,
      calc,
      categoryName: (c) => ppCategoryName(loc, c),
      sourceDetail: s == null ? '' : ppSourceDetail(loc, s),
      subtitle: '${loc.ppSynopticSubtitle} · '
          '${ppFormatKw(calc.sourceCurrents.watts)} kW',
    );
  }

  Future<void> _openExport() async {
    final loc = AppLocalizations.of(context);
    final choice = await showPpSheet<String>(
      context,
      builder: (ctx) => PpSheetScaffold(
        emoji: '📤',
        title: loc.ppExportTitle,
        children: [
          _exportTile(ctx, 'pdf', Icons.picture_as_pdf_rounded,
              loc.ppExportPdf, loc.ppExportPdfSubtitle),
          _exportTile(ctx, 'csv', Icons.table_chart_rounded, loc.ppExportCsv,
              loc.ppExportCsvSubtitle),
          _exportTile(ctx, 'png', Icons.image_rounded, loc.ppExportPng,
              loc.ppExportPngSubtitle),
        ],
      ),
    );
    if (choice == null || !mounted) return;
    await _export(choice);
  }

  Widget _exportTile(BuildContext ctx, String key, IconData icon, String title,
      String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: ppCardDecoration(),
      child: ListTile(
        onTap: () => Navigator.pop(ctx, key),
        leading: Icon(icon, color: kPpAccent, size: 28),
        title: Text(title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700)),
        subtitle: Text(subtitle,
            style: const TextStyle(color: Colors.white54, fontSize: 12)),
      ),
    );
  }

  Future<void> _export(String kind) async {
    final plan = _plan;
    if (plan == null || _exporting) return;
    final loc = AppLocalizations.of(context);
    if (plan.source == null) {
      _toast(loc.ppAlertNoSource);
      return;
    }
    setState(() => _exporting = true);
    try {
      final calc = PpCalc.run(plan);
      switch (kind) {
        case 'pdf':
          final png = await ppRenderSynopticPng(_layout(plan, calc, loc));
          final bytes = await PowerPlanPdf.build(
            plan: plan,
            calc: calc,
            loc: loc,
            synopticPng: png,
            localeName: loc.localeName,
          );
          await Printing.layoutPdf(
            onLayout: (_) async => bytes,
            name: '$_fileBase.pdf',
          );
        case 'csv':
          final bytes = ppBuildCsv(plan, calc, loc);
          await Share.shareXFiles(
            [XFile.fromData(bytes, name: '$_fileBase.csv', mimeType: 'text/csv')],
            sharePositionOrigin: _shareOrigin(),
          );
        case 'png':
          final png = await ppRenderSynopticPng(_layout(plan, calc, loc));
          if (!mounted) return;
          await exportPngBytes(context, png, '${_fileBase}_diagram.png');
      }
    } catch (_) {
      if (mounted) _toast(loc.ppExportError);
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final plan = _plan;
    final calc = plan == null ? null : PpCalc.run(plan);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.ppPageTitle),
        actions: [
          const AboutPinButton(
              pageId: 'tool:electricity_power_plan', sectionId: 'main'),
          IconButton(
            tooltip: loc.ppProjectsTitle,
            icon: const Icon(Icons.folder_open_rounded),
            onPressed: _loading ? null : _openProjects,
          ),
          IconButton(
            tooltip: loc.ppExportTitle,
            icon: _exporting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: kPpAccent),
                  )
                : const Icon(Icons.ios_share_rounded),
            onPressed: _loading || _exporting ? null : _openExport,
          ),
        ],
        bottom: TabBar(
          controller: _tabs,
          indicatorColor: kPpAccent,
          labelColor: kPpAccent,
          unselectedLabelColor: Colors.white54,
          labelStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
          tabs: [
            Tab(text: loc.ppTabPlan),
            Tab(text: loc.ppTabSynoptic),
            Tab(text: loc.ppTabLoadTable),
          ],
        ),
      ),
      body: _loading || plan == null || calc == null
          ? const Center(child: CircularProgressIndicator(color: kPpAccent))
          : SafeArea(
              top: false,
              child: TabBarView(
                controller: _tabs,
                children: [
                  _planTab(plan, calc, loc),
                  _synopticTab(plan, calc, loc),
                  _tableTab(plan, calc, loc),
                ],
              ),
            ),
    );
  }

  // ═══ Onglet « Plan » ══════════════════════════════════════════════════════

  Widget _planTab(PpPlan plan, PpCalc calc, AppLocalizations loc) {
    final s = plan.source;
    return ListView(
      padding: EdgeInsets.fromLTRB(
          16, 14, 16, 40 + MediaQuery.paddingOf(context).bottom),
      children: [
        _planHeader(plan, loc),
        const SizedBox(height: 12),
        if (s == null)
          PpDashedAddButton(
            big: true,
            label: loc.ppStartTitle,
            subtitle: loc.ppStartSubtitle,
            onTap: _addSource,
          )
        else ...[
          _summaryCard(plan, calc, loc),
          const SizedBox(height: 16),
          _sourceCard(s, calc, loc),
          _outputsGroup(
            s.outputs,
            calc: calc,
            ownerThree: s.isThreePhase,
            feed: s.isThreePhase ? null : PpPhase.l1,
            isSource: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () => _addOutput(s.outputs, s.isThreePhase,
                    capAmps: s.capacityAmps.floor()),
                icon: const Icon(Icons.add_rounded, size: 18),
                label: Text(loc.ppAddSourceOutput),
                style: TextButton.styleFrom(foregroundColor: Colors.white54),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _planHeader(PpPlan plan, AppLocalizations loc) {
    return InkWell(
      onTap: _renamePlan,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            const Text('📋', style: TextStyle(fontSize: 22)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                plan.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const Icon(Icons.edit_rounded, color: Colors.white38, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard(PpPlan plan, PpCalc calc, AppLocalizations loc) {
    final s = plan.source!;
    final total = calc.sourceCurrents;
    final ratio = calc.sourceLoadRatio;
    final errors = calc.errorCount;
    final warnings = calc.warningCount;
    final infos = calc.alerts.length - errors - warnings;
    final allGood = errors == 0 && warnings == 0;
    final recoKva = calc.recommendedGeneratorKva;
    final cats = calc.categoryWatts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    Widget stat(String emoji, String value, String label, {Color? color}) =>
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 4),
                FittedBox(
                  child: Text(
                    value,
                    style: TextStyle(
                      color: color ?? Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white54, fontSize: 10.5),
                ),
              ],
            ),
          ),
        );

    final statusColor = errors > 0
        ? const Color(0xFFFF5252)
        : warnings > 0
            ? const Color(0xFFFFAB40)
            : const Color(0xFF69F0AE);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: ppCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              stat('⚡', '${ppFormatKw(total.watts)} kW', loc.ppKpiPower),
              const SizedBox(width: 6),
              stat('🔥', '${ppFormatAmps(total.max)} A', loc.ppKpiMaxPhase),
              const SizedBox(width: 6),
              stat('🔋', '${(ratio * 100).round()} %', loc.ppKpiSourceUse,
                  color: ppRatioColor(ratio)),
              const SizedBox(width: 6),
              stat('📉', '${calc.worstDrop.toStringAsFixed(1)} %',
                  loc.ppKpiWorstDrop,
                  color: calc.worstDrop > kPpMaxDropPercent
                      ? const Color(0xFFFFAB40)
                      : null),
            ],
          ),
          if (s.kind == PpSourceKind.generator && recoKva != null) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: (recoKva > s.kva
                        ? const Color(0xFFFFAB40)
                        : const Color(0xFF69F0AE))
                    .withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                recoKva > s.kva
                    ? loc.ppGeneratorTooSmall(recoKva.toString())
                    : loc.ppGeneratorOk(recoKva.toString()),
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ],
          const SizedBox(height: 10),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: calc.alerts.isEmpty
                ? null
                : () => setState(() => _alertsOpen = !_alertsOpen),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: statusColor.withValues(alpha: 0.4)),
              ),
              child: Row(
                children: [
                  Text(allGood ? '✅' : '⚠️',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      allGood
                          ? (infos > 0
                              ? loc.ppAllGoodWithTips(infos.toString())
                              : loc.ppAllGood)
                          : loc.ppAlertsCount(
                              errors.toString(), warnings.toString()),
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 13.5,
                      ),
                    ),
                  ),
                  if (calc.alerts.isNotEmpty)
                    Icon(
                      _alertsOpen
                          ? Icons.expand_less_rounded
                          : Icons.expand_more_rounded,
                      color: statusColor,
                    ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            child: !_alertsOpen || calc.alerts.isEmpty
                ? const SizedBox(width: double.infinity)
                : Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      children: [
                        for (final a in calc.alerts)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  margin:
                                      const EdgeInsets.only(top: 5, right: 10),
                                  decoration: BoxDecoration(
                                    color: ppLevelColor(a.level),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Expanded(
                                  child: Text.rich(
                                    TextSpan(children: [
                                      if (a.where.isNotEmpty)
                                        TextSpan(
                                          text: '${a.where}\n',
                                          style: const TextStyle(
                                              color: Colors.white54,
                                              fontSize: 11.5),
                                        ),
                                      TextSpan(text: ppAlertText(loc, a)),
                                    ]),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
          ),
          if (cats.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final e in cats)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(e.key.colorValue).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${e.key.emoji} ${ppFormatKw(e.value)} kW',
                      style: TextStyle(
                        color: Color(e.key.colorValue),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _sourceCard(PpSource s, PpCalc calc, AppLocalizations loc) {
    final level = calc.worstLevelFor('source');
    final emoji = switch (s.kind) {
      PpSourceKind.generator => '⛽',
      PpSourceKind.mains => '🏢',
      PpSourceKind.outlet => '🔌',
    };
    return InkWell(
      onTap: _editSource,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              kPpAccent.withValues(alpha: 0.22),
              const Color(0xFF15151F),
            ],
          ),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: level == PpAlertLevel.error || level == PpAlertLevel.warning
                ? ppLevelColor(level)
                : kPpAccent.withValues(alpha: 0.6),
            width: 1.4,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kPpAccent.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(emoji, style: const TextStyle(fontSize: 24)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        ppSourceDetail(loc, s),
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 12.5),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.white54),
                  onSelected: (v) {
                    switch (v) {
                      case 'edit':
                        _editSource();
                      case 'add':
                        _addOutput(s.outputs, s.isThreePhase,
                            capAmps: s.capacityAmps.floor());
                      case 'delete':
                        _deleteSource();
                    }
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(value: 'edit', child: Text(loc.ppEdit)),
                    PopupMenuItem(
                        value: 'add', child: Text(loc.ppAddSourceOutput)),
                    PopupMenuItem(value: 'delete', child: Text(loc.ppDelete)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            PpPhaseBars(
              currents: calc.sourceCurrents,
              limit: s.capacityAmps,
              threePhase: s.isThreePhase,
            ),
          ],
        ),
      ),
    );
  }

  Widget _outputsGroup(
    List<PpOutput> outputs, {
    required PpCalc calc,
    required bool ownerThree,
    required PpPhase? feed,
    bool isSource = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
              color: Colors.white.withValues(alpha: 0.12), width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final o in outputs)
            _outputBranch(
              o,
              outputs,
              calc: calc,
              ownerThree: ownerThree,
              feed: feed,
              canDelete: !isSource || outputs.length > 1,
            ),
        ],
      ),
    );
  }

  Widget _outputBranch(
    PpOutput o,
    List<PpOutput> siblings, {
    required PpCalc calc,
    required bool ownerThree,
    required PpPhase? feed,
    required bool canDelete,
  }) {
    final loc = AppLocalizations.of(context);
    final child = o.child;
    final phase = calc.outputPhase[o.id];
    final cur = calc.outputCurrents[o.id] ?? PpCurrents();

    final strip = _cableStrip(o, calc,
        onTap: () => _editOutput(o, siblings,
            ownerThree: ownerThree, lockedPhase: feed, canDelete: canDelete),
        onPhaseTap: feed == null ? () => _cyclePhase(o) : null);

    final Widget body;
    if (child == null) {
      body = PpDashedAddButton(
        label: loc.ppConnectHere,
        onTap: () => _connect(o),
      );
    } else if (child is PpLoad) {
      body = _loadCard(o, child, cur, phase, loc);
    } else {
      final p = child as PpPanel;
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _panelCard(o, p, calc, phase, loc),
          if (!p.collapsed) ...[
            _outputsGroup(
              p.outputs,
              calc: calc,
              ownerThree: p.isThreePhase && phase == null,
              feed: phase,
            ),
            if (p.outputs.isEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 8),
                child: PpDashedAddButton(
                  label: loc.ppAddOutput,
                  onTap: () => _addOutput(p.outputs, p.isThreePhase && phase == null),
                ),
              ),
          ],
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [strip, const SizedBox(height: 6), body],
      ),
    );
  }

  Widget _cableStrip(PpOutput o, PpCalc calc,
      {required VoidCallback onTap, VoidCallback? onPhaseTap}) {
    final phase = calc.outputPhase[o.id];
    final drop = calc.outputDrop[o.id] ?? 0;
    final idx = calc.outputIndex[o.id] ?? 1;
    final level = calc.worstLevelFor(o.id);
    final dropColor = drop > kPpMaxDropPercent
        ? const Color(0xFFFFAB40)
        : Colors.white38;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            PpConnectorChip(o.connector, dense: true),
            const SizedBox(width: 6),
            Expanded(
              child: Wrap(
                spacing: 6,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    '#$idx · ${o.connector.breakerLabel(o.breakerA)}${o.rcd ? ' · 30 mA' : ''}',
                    style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700),
                  ),
                  if (phase != null && !o.connector.isThreePhase)
                    PpPhaseBadge(phase,
                        locked: onPhaseTap == null, onTap: onPhaseTap),
                  if (o.child != null)
                    Text(
                      '〰 ${ppFormatLength(o.cableLength)} m · '
                      '${o.connector.cableName(o.cableSection)}',
                      style: const TextStyle(
                          color: Colors.white38, fontSize: 11.5),
                    ),
                  if (o.child != null)
                    Text(
                      'ΔU ${drop.toStringAsFixed(1)} %',
                      style: TextStyle(
                          color: dropColor,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700),
                    ),
                ],
              ),
            ),
            if (level == PpAlertLevel.error || level == PpAlertLevel.warning)
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Icon(Icons.warning_amber_rounded,
                    size: 18, color: ppLevelColor(level)),
              ),
            const Icon(Icons.tune_rounded, size: 16, color: Colors.white24),
          ],
        ),
      ),
    );
  }

  Widget _panelCard(PpOutput parent, PpPanel p, PpCalc calc, PpPhase? phase,
      AppLocalizations loc) {
    final pc = calc.panelCurrents[p.id] ?? PpCurrents();
    final level = calc.worstLevelFor(p.id);
    final monoFeed = phase != null;
    final used = p.outputs.where((o) => o.child != null).length;

    return InkWell(
      onTap: () => _editPanel(parent, p, monoFeed),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 4, 12),
        decoration: ppCardDecoration(
          accent: _kPanelColor,
          border: level == PpAlertLevel.error ? ppLevelColor(level) : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _kPanelColor.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('🗄️', style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${p.mainBreakerA} A · '
                        '${loc.ppOutputsUsed(used.toString(), p.outputs.length.toString())}',
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${ppFormatKw(pc.watts)} kW',
                  style: const TextStyle(
                    color: _kPanelColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.white54),
                  onSelected: (v) {
                    switch (v) {
                      case 'edit':
                        _editPanel(parent, p, monoFeed);
                      case 'add':
                        _addOutput(p.outputs, p.isThreePhase && !monoFeed);
                      case 'copy':
                        _copy(p);
                      case 'fold':
                        p.collapsed = !p.collapsed;
                        _touch();
                      case 'remove':
                        _disconnect(parent);
                    }
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(value: 'edit', child: Text(loc.ppEdit)),
                    PopupMenuItem(value: 'add', child: Text(loc.ppAddOutput)),
                    PopupMenuItem(value: 'copy', child: Text(loc.ppCopy)),
                    PopupMenuItem(
                      value: 'fold',
                      child: Text(p.collapsed ? loc.ppExpand : loc.ppCollapse),
                    ),
                    PopupMenuItem(value: 'remove', child: Text(loc.ppUnplug)),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: PpPhaseBars(
                currents: pc,
                limit: p.mainBreakerA.toDouble(),
                threePhase: !monoFeed && p.isThreePhase,
                monoPhase: phase,
              ),
            ),
            if (p.collapsed)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: GestureDetector(
                  onTap: () {
                    p.collapsed = false;
                    _touch();
                  },
                  child: Text(
                    loc.ppCollapsedHint(p.outputs.length.toString()),
                    style: const TextStyle(
                        color: _kPanelColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _loadCard(PpOutput parent, PpLoad l, PpCurrents cur, PpPhase? phase,
      AppLocalizations loc) {
    final color = Color(l.category.colorValue);
    final amps = phase == null ? cur.max : cur.of(phase);
    return InkWell(
      onTap: () => _editLoad(l, phase == null),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
        decoration: ppCardDecoration(accent: color),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.16),
                shape: BoxShape.circle,
              ),
              child: Text(l.category.emoji, style: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${ppCategoryName(loc, l.category)} · cos φ ${l.cosPhi.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white54, fontSize: 11.5),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${ppFormatKw(l.powerW)} kW',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
                Text(
                  phase == null
                      ? '${ppFormatAmps(amps)} A × 3'
                      : '${ppFormatAmps(amps)} A',
                  style: const TextStyle(color: Colors.white54, fontSize: 11.5),
                ),
              ],
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.white54),
              onSelected: (v) {
                switch (v) {
                  case 'edit':
                    _editLoad(l, phase == null);
                  case 'copy':
                    _copy(l);
                  case 'remove':
                    _disconnect(parent);
                }
              },
              itemBuilder: (_) => [
                PopupMenuItem(value: 'edit', child: Text(loc.ppEdit)),
                PopupMenuItem(value: 'copy', child: Text(loc.ppCopy)),
                PopupMenuItem(value: 'remove', child: Text(loc.ppUnplug)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ═══ Onglet « Synoptique » ════════════════════════════════════════════════

  Widget _synopticTab(PpPlan plan, PpCalc calc, AppLocalizations loc) {
    if (plan.source == null) return _emptyTab(loc);
    final layout = _layout(plan, calc, loc);
    return Stack(
      children: [
        Positioned.fill(child: PpSynopticView(layout: layout)),
        Positioned(
          left: 16,
          top: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(loc.ppSynopticHint,
                style: const TextStyle(color: Colors.white60, fontSize: 11.5)),
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: FloatingActionButton.extended(
            heroTag: 'pp_syn_export',
            onPressed: _exporting ? null : () => _export('pdf'),
            backgroundColor: kPpAccent,
            foregroundColor: Colors.black,
            icon: const Icon(Icons.picture_as_pdf_rounded),
            label: Text(loc.ppExportPdf,
                style: const TextStyle(fontWeight: FontWeight.w800)),
          ),
        ),
      ],
    );
  }

  Widget _emptyTab(AppLocalizations loc) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🔌', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 12),
            Text(
              loc.ppEmptyTab,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white60, fontSize: 15),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () => _tabs.animateTo(0),
              style: OutlinedButton.styleFrom(
                foregroundColor: kPpAccent,
                side: const BorderSide(color: kPpAccent),
              ),
              child: Text(loc.ppGoToPlan),
            ),
          ],
        ),
      ),
    );
  }

  // ═══ Onglet « Tableau de charge » ═════════════════════════════════════════

  Widget _tableTab(PpPlan plan, PpCalc calc, AppLocalizations loc) {
    if (plan.source == null) return _emptyTab(loc);
    final blocks = ppLoadBlocks(plan, calc, loc);
    return ListView(
      padding: EdgeInsets.fromLTRB(
          16, 14, 16, 40 + MediaQuery.paddingOf(context).bottom),
      children: [
        for (final b in blocks) ...[
          _blockCard(b, calc, loc),
          const SizedBox(height: 14),
        ],
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _exporting ? null : () => _export('csv'),
                icon: const Icon(Icons.table_chart_rounded),
                label: Text(loc.ppExportCsv),
                style: OutlinedButton.styleFrom(
                  foregroundColor: kPpAccent,
                  side: BorderSide(color: kPpAccent.withValues(alpha: 0.6)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: PpPrimaryButton(
                label: loc.ppExportPdf,
                icon: Icons.picture_as_pdf_rounded,
                onPressed: _exporting ? null : () => _export('pdf'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(loc.ppDisclaimer,
            style: const TextStyle(color: Colors.white30, fontSize: 11)),
      ],
    );
  }

  Widget _blockCard(PpLoadBlock b, PpCalc calc, AppLocalizations loc) {
    const head = TextStyle(
        color: Colors.white54, fontSize: 11, fontWeight: FontWeight.w800);
    const cell = TextStyle(color: Colors.white, fontSize: 12.5);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: ppCardDecoration(accent: _kPanelColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  b.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                '${ppFormatKw(b.currents.watts)} kW',
                style: const TextStyle(
                    color: _kPanelColor, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(b.detail,
              style: const TextStyle(color: Colors.white54, fontSize: 12)),
          const SizedBox(height: 6),
          PpPhaseBars(
            currents: b.currents,
            limit: b.limitA,
            threePhase: b.threePhase,
            monoPhase: b.threePhase ? null : PpPhase.l1,
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 32,
              dataRowMinHeight: 30,
              dataRowMaxHeight: 40,
              horizontalMargin: 4,
              columnSpacing: 16,
              headingTextStyle: head,
              dataTextStyle: cell,
              columns: [
                DataColumn(label: Text(loc.ppColOutput)),
                DataColumn(label: Text(loc.ppColBreaker)),
                DataColumn(label: Text(loc.ppColPhase)),
                DataColumn(label: Text(loc.ppColCable)),
                DataColumn(label: Text(loc.ppColConnected)),
                DataColumn(label: Text(loc.ppColPower), numeric: true),
                DataColumn(label: Text(loc.ppColCurrent), numeric: true),
                DataColumn(label: Text(loc.ppColDrop), numeric: true),
              ],
              rows: [
                for (final r in b.rows)
                  DataRow(
                    color: WidgetStatePropertyAll(
                      switch (calc.worstLevelFor(r.output.id)) {
                        PpAlertLevel.error =>
                          const Color(0xFFFF5252).withValues(alpha: 0.10),
                        PpAlertLevel.warning =>
                          const Color(0xFFFFAB40).withValues(alpha: 0.08),
                        _ => Colors.transparent,
                      },
                    ),
                    cells: [
                      DataCell(Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${r.index} ',
                              style: const TextStyle(color: Colors.white38)),
                          PpConnectorChip(r.output.connector, dense: true),
                        ],
                      )),
                      DataCell(Text(ppRowBreaker(r))),
                      DataCell(Text(ppRowPhase(r))),
                      DataCell(Text(ppRowCable(r))),
                      DataCell(Text(
                        ppRowConnected(r),
                        style: TextStyle(
                          color: r.output.child == null
                              ? Colors.white30
                              : Colors.white,
                        ),
                      )),
                      DataCell(Text(r.output.child == null
                          ? ''
                          : ppFormatKw(r.currents.watts))),
                      DataCell(Text(
                          r.output.child == null ? '' : ppRowCurrent(r))),
                      DataCell(Text(
                        r.output.child == null
                            ? ''
                            : r.dropPercent.toStringAsFixed(1),
                        style: TextStyle(
                          color: r.dropPercent > kPpMaxDropPercent
                              ? const Color(0xFFFFAB40)
                              : Colors.white,
                        ),
                      )),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
