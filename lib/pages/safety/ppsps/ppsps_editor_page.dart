// lib/pages/safety/ppsps/ppsps_editor_page.dart
//
// Assistant de rédaction d'un plan de sécurité en 5 étapes :
// Projet → Intervenants → Risques → Secours → Export.
// Chaque modification est enregistrée automatiquement sur l'appareil.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../../l10n_gen/app_localizations.dart';
import '../safety_library.dart';
import '../safety_theme.dart';
import 'ppsps_models.dart';
import 'ppsps_pdf.dart';
import 'ppsps_storage.dart';

class PpspsEditorPage extends StatefulWidget {
  final PpspsDocument document;
  final SafetyLibrary library;

  const PpspsEditorPage({
    super.key,
    required this.document,
    required this.library,
  });

  @override
  State<PpspsEditorPage> createState() => _PpspsEditorPageState();
}

class _PpspsEditorPageState extends State<PpspsEditorPage> {
  static const int _stepCount = 5;

  late PpspsDocument _doc;
  int _step = 0;
  Timer? _saveTimer;
  SafetyPhase? _phaseFilter;
  bool _exporting = false;

  @override
  void initState() {
    super.initState();
    _doc = widget.document;
  }

  @override
  void dispose() {
    _saveTimer?.cancel();
    // Dernière sauvegarde si une modification est encore en attente.
    PpspsStorage.save(_doc);
    super.dispose();
  }

  void _update(PpspsDocument doc) {
    setState(() => _doc = doc);
    _saveTimer?.cancel();
    _saveTimer = Timer(const Duration(milliseconds: 600), () {
      PpspsStorage.save(_doc);
    });
  }

  String get _lang => Localizations.localeOf(context).languageCode;

  // ── Petits composants ─────────────────────────────────────────────────────

  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
            color: kSafetyAccent,
          ),
        ),
      );

  Widget _field({
    String? id,
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        // La clé change avec l'étape : la valeur initiale est relue à chaque
        // affichage de l'étape, sans contrôleur à maintenir.
        key: ValueKey('$_step-${id ?? label}'),
        initialValue: value,
        keyboardType: keyboardType,
        maxLines: maxLines,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }

  // ── Étape 1 : projet ──────────────────────────────────────────────────────

  String _phaseLabel(AppLocalizations loc, SafetyPhase p) {
    switch (p) {
      case SafetyPhase.montage:
        return loc.ppspsPhaseMontage;
      case SafetyPhase.exploitation:
        return loc.ppspsPhaseExploitation;
      case SafetyPhase.demontage:
        return loc.ppspsPhaseDemontage;
    }
  }

  Future<void> _pickPhaseDates(SafetyPhase phase) async {
    final current = _doc.phases[phase];
    final now = DateTime.now();
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 3),
      initialDateRange: current?.start == null
          ? null
          : DateTimeRange(
              start: current!.start!,
              end: current.end ?? current.start!,
            ),
    );
    if (range == null) return;
    _update(_doc.copyWith(phases: {
      ..._doc.phases,
      phase: PpspsPhaseDates(start: range.start, end: range.end),
    }));
  }

  void _clearPhase(SafetyPhase phase) {
    final phases = {..._doc.phases}..remove(phase);
    _update(_doc.copyWith(phases: phases));
  }

  String _rangeLabel(PpspsPhaseDates? d) {
    if (d?.start == null) return '';
    final m = MaterialLocalizations.of(context);
    final start = m.formatShortDate(d!.start!);
    if (d.end == null || DateUtils.isSameDay(d.start, d.end)) return start;
    return '$start – ${m.formatShortDate(d.end!)}';
  }

  Widget _projectStep(AppLocalizations loc) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        _field(
          label: loc.ppspsFieldEventName,
          value: _doc.eventName,
          onChanged: (v) => _update(_doc.copyWith(eventName: v)),
        ),
        _field(
          label: loc.ppspsFieldVenue,
          value: _doc.venue,
          onChanged: (v) => _update(_doc.copyWith(venue: v)),
        ),
        _field(
          label: loc.ppspsFieldAddress,
          value: _doc.address,
          onChanged: (v) => _update(_doc.copyWith(address: v)),
        ),
        _field(
          label: loc.ppspsFieldOrganizer,
          value: _doc.organizer,
          onChanged: (v) => _update(_doc.copyWith(organizer: v)),
        ),
        _field(
          label: loc.ppspsFieldCoordinator,
          value: _doc.coordinator,
          onChanged: (v) => _update(_doc.copyWith(coordinator: v)),
        ),
        _sectionTitle(loc.ppspsSectionPhases),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              for (final p in SafetyPhase.values)
                ListTile(
                  title: Text(_phaseLabel(loc, p),
                      style: const TextStyle(color: Colors.white)),
                  subtitle: Text(
                    _doc.phases[p]?.isSet == true
                        ? _rangeLabel(_doc.phases[p])
                        : loc.ppspsPhaseNotSet,
                    style:
                        TextStyle(color: Colors.white.withValues(alpha: 0.6)),
                  ),
                  trailing: _doc.phases[p]?.isSet == true
                      ? IconButton(
                          tooltip: loc.ppspsDelete,
                          icon: Icon(Icons.close_rounded,
                              color: Colors.white.withValues(alpha: 0.6)),
                          onPressed: () => _clearPhase(p),
                        )
                      : const Icon(Icons.calendar_month_rounded,
                          color: kSafetyAccent),
                  onTap: () => _pickPhaseDates(p),
                ),
            ],
          ),
        ),
        _sectionTitle(loc.ppspsSectionCompany),
        _field(
          label: loc.ppspsFieldCompanyName,
          value: _doc.companyName,
          onChanged: (v) => _update(_doc.copyWith(companyName: v)),
        ),
        _field(
          id: 'companyAddress',
          label: loc.ppspsFieldAddress,
          value: _doc.companyAddress,
          onChanged: (v) => _update(_doc.copyWith(companyAddress: v)),
        ),
        _field(
          label: loc.ppspsFieldCompanyActivity,
          value: _doc.companyActivity,
          onChanged: (v) => _update(_doc.copyWith(companyActivity: v)),
        ),
        _field(
          label: loc.ppspsFieldResponsible,
          value: _doc.responsibleName,
          onChanged: (v) => _update(_doc.copyWith(responsibleName: v)),
        ),
        _field(
          label: loc.ppspsFieldPhone,
          value: _doc.responsiblePhone,
          keyboardType: TextInputType.phone,
          onChanged: (v) => _update(_doc.copyWith(responsiblePhone: v)),
        ),
      ],
    );
  }

  // ── Étape 2 : intervenants ────────────────────────────────────────────────

  Future<void> _editWorker({int? index}) async {
    final loc = AppLocalizations.of(context);
    final initial = index == null ? const PpspsWorker() : _doc.workers[index];
    final company = TextEditingController(text: initial.company);
    final trade = TextEditingController(text: initial.trade);
    final contact = TextEditingController(text: initial.contact);
    final phone = TextEditingController(text: initial.phone);
    final headcount = TextEditingController(
        text: initial.headcount > 0 ? '${initial.headcount}' : '');

    Widget input(TextEditingController c, String label,
            {TextInputType? type}) =>
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextField(
            controller: c,
            keyboardType: type,
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(labelText: label),
          ),
        );

    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kSafetySheetBg,
      showDragHandle: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
            20, 0, 20, 20 + MediaQuery.viewInsetsOf(ctx).bottom),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              input(company, loc.ppspsFieldCompany),
              input(trade, loc.ppspsFieldTrade),
              input(contact, loc.ppspsFieldContact),
              input(phone, loc.ppspsFieldPhone, type: TextInputType.phone),
              input(headcount, loc.ppspsFieldHeadcount,
                  type: TextInputType.number),
              const SizedBox(height: 8),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: kSafetyAccent,
                  foregroundColor: kSafetyOnAccent,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(loc.ppspsSave),
              ),
            ],
          ),
        ),
      ),
    );

    if (saved == true && company.text.trim().isNotEmpty) {
      final worker = PpspsWorker(
        company: company.text.trim(),
        trade: trade.text.trim(),
        contact: contact.text.trim(),
        phone: phone.text.trim(),
        headcount: int.tryParse(headcount.text.trim()) ?? 0,
      );
      final workers = [..._doc.workers];
      if (index == null) {
        workers.add(worker);
      } else {
        workers[index] = worker;
      }
      _update(_doc.copyWith(workers: workers));
    }
    for (final c in [company, trade, contact, phone, headcount]) {
      c.dispose();
    }
  }

  void _removeWorker(int index) {
    final workers = [..._doc.workers]..removeAt(index);
    _update(_doc.copyWith(workers: workers));
  }

  Widget _workersStep(AppLocalizations loc) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        if (_doc.workers.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              loc.ppspsWorkersEmpty,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
            ),
          ),
        for (var i = 0; i < _doc.workers.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Material(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onTap: () => _editWorker(index: i),
                title: Text(_doc.workers[i].company,
                    style: const TextStyle(color: Colors.white)),
                subtitle: Text(
                  [
                    _doc.workers[i].trade,
                    _doc.workers[i].contact,
                    if (_doc.workers[i].headcount > 0)
                      '${_doc.workers[i].headcount}',
                  ].where((s) => s.trim().isNotEmpty).join(' · '),
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
                ),
                trailing: IconButton(
                  tooltip: loc.ppspsDelete,
                  icon: Icon(Icons.delete_outline_rounded,
                      color: Colors.white.withValues(alpha: 0.6)),
                  onPressed: () => _removeWorker(i),
                ),
              ),
            ),
          ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            foregroundColor: kSafetyAccent,
            minimumSize: const Size.fromHeight(48),
            side: BorderSide(color: kSafetyAccent.withValues(alpha: 0.5)),
          ),
          onPressed: () => _editWorker(),
          icon: const Icon(Icons.add_rounded),
          label: Text(loc.ppspsAddWorker),
        ),
        if (_doc.totalHeadcount > 0) ...[
          const SizedBox(height: 16),
          Text(
            loc.ppspsWorkersTotal(_doc.totalHeadcount),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.75)),
          ),
        ],
      ],
    );
  }

  // ── Étape 3 : risques ─────────────────────────────────────────────────────

  IconData _categoryIcon(String name) {
    switch (name) {
      case 'height':
        return Icons.height_rounded;
      case 'anchor':
        return Icons.anchor_rounded;
      case 'bolt':
        return Icons.bolt_rounded;
      case 'inventory_2':
        return Icons.inventory_2_rounded;
      case 'local_shipping':
        return Icons.local_shipping_rounded;
      case 'groups':
        return Icons.groups_rounded;
      case 'nightlight':
        return Icons.nightlight_round;
      case 'thunderstorm':
        return Icons.thunderstorm_rounded;
      case 'flare':
        return Icons.flare_rounded;
      case 'local_fire_department':
        return Icons.local_fire_department_rounded;
      case 'diversity_3':
        return Icons.diversity_3_rounded;
    }
    return Icons.warning_amber_rounded;
  }

  void _toggleRisk(SafetyRisk risk, bool selected) {
    final risks = {..._doc.risks};
    if (selected) {
      // Les mesures marquées « obligatoire » sont cochées d'office.
      final mandatory = widget.library
          .measuresFor(risk.id, _doc.country)
          .where((m) => m.mandatory)
          .map((m) => m.id)
          .toSet();
      risks[risk.id] = PpspsRiskSelection(measureIds: mandatory);
    } else {
      risks.remove(risk.id);
    }
    _update(_doc.copyWith(risks: risks));
  }

  String _measureTypeLabel(AppLocalizations loc, SafetyMeasureType t) {
    switch (t) {
      case SafetyMeasureType.collective:
        return loc.ppspsMeasureCollective;
      case SafetyMeasureType.individuelle:
        return loc.ppspsMeasureIndividual;
      case SafetyMeasureType.organisationnelle:
        return loc.ppspsMeasureOrganisational;
    }
  }

  Future<void> _editMeasures(SafetyRisk risk) async {
    final loc = AppLocalizations.of(context);
    final measures = widget.library.measuresFor(risk.id, _doc.country);
    final customCtrl = TextEditingController();

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kSafetySheetBg,
      showDragHandle: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheet) {
          final sel = _doc.risks[risk.id] ?? const PpspsRiskSelection();

          void apply(PpspsRiskSelection s) {
            _update(_doc.copyWith(risks: {..._doc.risks, risk.id: s}));
            setSheet(() {});
          }

          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(ctx).bottom),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(ctx).height * 0.85),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                children: [
                  Text(
                    risk.label.forLanguage(_lang),
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    loc.ppspsMeasuresTitle,
                    style:
                        TextStyle(color: Colors.white.withValues(alpha: 0.6)),
                  ),
                  const SizedBox(height: 8),
                  for (final m in measures)
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      activeColor: kSafetyAccent,
                      checkColor: kSafetyOnAccent,
                      value: sel.measureIds.contains(m.id),
                      title: Text(m.label.forLanguage(_lang),
                          style: const TextStyle(color: Colors.white)),
                      subtitle: Text(
                        _measureTypeLabel(loc, m.type),
                        style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.55)),
                      ),
                      onChanged: (v) {
                        final ids = {...sel.measureIds};
                        if (v == true) {
                          ids.add(m.id);
                        } else {
                          ids.remove(m.id);
                        }
                        apply(sel.copyWith(measureIds: ids));
                      },
                    ),
                  for (var i = 0; i < sel.customMeasures.length; i++)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.edit_note_rounded,
                          color: kSafetyAccent),
                      title: Text(sel.customMeasures[i],
                          style: const TextStyle(color: Colors.white)),
                      trailing: IconButton(
                        tooltip: loc.ppspsDelete,
                        icon: Icon(Icons.close_rounded,
                            color: Colors.white.withValues(alpha: 0.6)),
                        onPressed: () {
                          final custom = [...sel.customMeasures]..removeAt(i);
                          apply(sel.copyWith(customMeasures: custom));
                        },
                      ),
                    ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: customCtrl,
                          textCapitalization: TextCapitalization.sentences,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: loc.ppspsCustomMeasureHint),
                        ),
                      ),
                      IconButton(
                        tooltip: loc.ppspsAddCustomMeasure,
                        icon: const Icon(Icons.add_circle_rounded,
                            color: kSafetyAccent),
                        onPressed: () {
                          final text = customCtrl.text.trim();
                          if (text.isEmpty) return;
                          customCtrl.clear();
                          apply(sel.copyWith(
                              customMeasures: [...sel.customMeasures, text]));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    customCtrl.dispose();
  }

  Widget _criticalityBadge(int c) {
    final color = safetyCriticalityColor(c);
    return Container(
      constraints: const BoxConstraints(minWidth: 30),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$c',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color, fontWeight: FontWeight.w700, fontSize: 13),
      ),
    );
  }

  Widget _risksStep(AppLocalizations loc) {
    final lib = widget.library;
    final allRisks = lib.risksFor(_doc.country);
    final visible = _phaseFilter == null
        ? allRisks
        : allRisks.where((r) => r.phases.contains(_phaseFilter)).toList();

    Widget chip(String label, SafetyPhase? phase) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            label: Text(label),
            selected: _phaseFilter == phase,
            selectedColor: kSafetyAccent.withValues(alpha: 0.25),
            onSelected: (_) => setState(() => _phaseFilter = phase),
          ),
        );

    return Column(
      children: [
        SizedBox(
          height: 52,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 4),
            children: [
              chip(loc.ppspsPhaseFilterAll, null),
              for (final p in SafetyPhase.values) chip(_phaseLabel(loc, p), p),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            children: [
              for (final cat in lib.categories)
                if (visible.any((r) => r.categoryId == cat.id))
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          leading: Icon(_categoryIcon(cat.icon),
                              color: kSafetyAccent),
                          title: Text(cat.label.forLanguage(_lang),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          subtitle: Text(
                            '${visible.where((r) => r.categoryId == cat.id && _doc.risks.containsKey(r.id)).length}'
                            '/${visible.where((r) => r.categoryId == cat.id).length}',
                            style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.55)),
                          ),
                          children: [
                            for (final r in visible
                                .where((r) => r.categoryId == cat.id))
                              ListTile(
                                leading: Checkbox(
                                  activeColor: kSafetyAccent,
                                  checkColor: kSafetyOnAccent,
                                  value: _doc.risks.containsKey(r.id),
                                  onChanged: (v) => _toggleRisk(r, v == true),
                                ),
                                title: Text(r.label.forLanguage(_lang),
                                    style:
                                        const TextStyle(color: Colors.white)),
                                subtitle: _doc.risks.containsKey(r.id)
                                    ? Text(
                                        loc.ppspsMeasureCount(
                                            _doc.risks[r.id]!.measureCount),
                                        style: TextStyle(
                                            color: Colors.white
                                                .withValues(alpha: 0.55)),
                                      )
                                    : null,
                                trailing: _criticalityBadge(r.criticality),
                                onTap: () {
                                  if (!_doc.risks.containsKey(r.id)) {
                                    _toggleRisk(r, true);
                                  }
                                  _editMeasures(r);
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.white.withValues(alpha: 0.08))),
          ),
          child: Text(
            loc.ppspsRisksSummary(_doc.risks.length, _doc.measureCount),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  // ── Étape 4 : secours ─────────────────────────────────────────────────────

  Widget _emergencyStep(AppLocalizations loc) {
    final e = _doc.emergency;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      children: [
        _sectionTitle(loc.ppspsSectionNumbers),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              for (final n in emergencyNumbersFor(_doc.country))
                ListTile(
                  dense: true,
                  leading: const Icon(Icons.phone_in_talk_rounded,
                      color: kSafetyCritHigh),
                  title: Text(n.labelFor(_lang),
                      style: const TextStyle(color: Colors.white)),
                  trailing: Text(
                    n.number,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                ),
            ],
          ),
        ),
        _sectionTitle(loc.ppspsSectionHospital),
        _field(
          label: loc.ppspsFieldHospitalName,
          value: e.hospitalName,
          onChanged: (v) => _update(
              _doc.copyWith(emergency: _doc.emergency.copyWith(hospitalName: v))),
        ),
        _field(
          label: loc.ppspsFieldAddress,
          value: e.hospitalAddress,
          onChanged: (v) => _update(_doc.copyWith(
              emergency: _doc.emergency.copyWith(hospitalAddress: v))),
        ),
        _field(
          label: loc.ppspsFieldPhone,
          value: e.hospitalPhone,
          keyboardType: TextInputType.phone,
          onChanged: (v) => _update(_doc.copyWith(
              emergency: _doc.emergency.copyWith(hospitalPhone: v))),
        ),
        _sectionTitle(loc.ppspsSectionOnSite),
        _field(
          label: loc.ppspsFieldFirstAiders,
          value: e.firstAiders,
          maxLines: 2,
          onChanged: (v) => _update(
              _doc.copyWith(emergency: _doc.emergency.copyWith(firstAiders: v))),
        ),
        _field(
          label: loc.ppspsFieldAssemblyPoint,
          value: e.assemblyPoint,
          onChanged: (v) => _update(_doc.copyWith(
              emergency: _doc.emergency.copyWith(assemblyPoint: v))),
        ),
        _field(
          label: loc.ppspsFieldEquipment,
          value: e.equipment,
          maxLines: 2,
          onChanged: (v) => _update(
              _doc.copyWith(emergency: _doc.emergency.copyWith(equipment: v))),
        ),
      ],
    );
  }

  // ── Étape 5 : export ──────────────────────────────────────────────────────

  /// Noms des langues de document, chacun dans sa propre langue.
  static const Map<String, String> _kLanguageNames = {
    'fr': 'Français',
    'en': 'English',
    'nl': 'Nederlands',
    'de': 'Deutsch',
    'es': 'Español',
    'pt': 'Português',
  };

  /// Langues cochées pour l'export (par défaut : la langue du pays).
  List<String> get _pdfLanguages => _doc.pdfLanguages.isNotEmpty
      ? _doc.pdfLanguages
      : [PpspsPdf.defaultLanguage(_doc.country)];

  void _togglePdfLanguage(String code, bool selected) {
    final langs = {..._pdfLanguages};
    if (selected) {
      langs.add(code);
    } else if (langs.length > 1) {
      langs.remove(code);
    }
    _update(_doc.copyWith(pdfLanguages: [
      for (final l in kSafetyLanguages)
        if (langs.contains(l)) l,
    ]));
  }

  /// Une langue : aperçu d'impression. Plusieurs langues : un PDF par langue,
  /// partagés ensemble (mail, Fichiers, AirDrop…).
  Future<void> _exportPdf(Rect? shareOrigin) async {
    if (_exporting) return;
    setState(() => _exporting = true);
    try {
      await PpspsStorage.save(_doc);
      final base = _doc.eventName.trim().isEmpty
          ? 'plan_securite'
          : _doc.eventName.trim().replaceAll(RegExp(r'[^\w\-]+'), '_');
      final langs = _pdfLanguages;

      if (langs.length == 1) {
        final bytes = await PpspsPdf.build(_doc, widget.library,
            language: langs.first);
        await Printing.layoutPdf(
          onLayout: (_) async => bytes,
          name: '${base}_${langs.first.toUpperCase()}.pdf',
        );
        return;
      }

      final files = <XFile>[];
      for (final l in langs) {
        final bytes =
            await PpspsPdf.build(_doc, widget.library, language: l);
        final name = '${base}_${l.toUpperCase()}.pdf';
        files.add(XFile.fromData(bytes, name: name, mimeType: 'application/pdf'));
      }
      await Share.shareXFiles(
        files,
        subject: _doc.eventName.trim().isEmpty ? null : _doc.eventName.trim(),
        sharePositionOrigin: shareOrigin,
      );
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }

  Widget _statTile(String value, String label, Color color) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(value,
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w700, color: color)),
              const SizedBox(height: 2),
              Text(label,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.6))),
            ],
          ),
        ),
      );

  Widget _exportStep(AppLocalizations loc) {
    final selected = widget.library.risks
        .where((r) => _doc.risks.containsKey(r.id))
        .toList();
    final high = selected.where((r) => r.criticality >= 12).length;
    final mid = selected
        .where((r) => r.criticality >= 6 && r.criticality < 12)
        .length;
    final low = selected.length - high - mid;

    final missing = <String>[
      if (!_doc.projectDone) loc.ppspsStepProject,
      if (!_doc.workersDone) loc.ppspsStepWorkers,
      if (!_doc.risksDone) loc.ppspsStepRisks,
      if (!_doc.emergencyDone) loc.ppspsStepEmergency,
    ];
    final finalized = _doc.status == PpspsStatus.finalized;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
        Row(
          children: [
            _statTile('$high', loc.ppspsCritical, kSafetyCritHigh),
            const SizedBox(width: 8),
            _statTile('$mid', loc.ppspsMedium, kSafetyCritMid),
            const SizedBox(width: 8),
            _statTile('$low', loc.ppspsLow, kSafetyCritLow),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: (missing.isEmpty ? kSafetyCritLow : kSafetyCritMid)
                .withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                missing.isEmpty
                    ? Icons.check_circle_rounded
                    : Icons.error_outline_rounded,
                color: missing.isEmpty ? kSafetyCritLow : kSafetyCritMid,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  missing.isEmpty
                      ? loc.ppspsExportReady
                      : '${loc.ppspsExportMissing} : ${missing.join(', ')}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        _sectionTitle(loc.ppspsExportLanguages),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final l in kSafetyLanguages)
              FilterChip(
                label: Text(_kLanguageNames[l] ?? l),
                selected: _pdfLanguages.contains(l),
                selectedColor: kSafetyAccent.withValues(alpha: 0.25),
                checkmarkColor: kSafetyAccent,
                onSelected: (v) => _togglePdfLanguage(l, v),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          loc.ppspsExportLanguagesHint,
          style: TextStyle(
              fontSize: 12, color: Colors.white.withValues(alpha: 0.55)),
        ),
        const SizedBox(height: 20),
        Builder(
          builder: (btnCtx) => FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: kSafetyAccent,
              foregroundColor: kSafetyOnAccent,
              minimumSize: const Size.fromHeight(54),
            ),
            onPressed: _exporting
                ? null
                : () {
                    // Position du bouton : nécessaire sur iPad pour ancrer
                    // la feuille de partage.
                    final box = btnCtx.findRenderObject() as RenderBox?;
                    final origin = box == null
                        ? null
                        : box.localToGlobal(Offset.zero) & box.size;
                    _exportPdf(origin);
                  },
            icon: _exporting
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.picture_as_pdf_rounded),
            label: Text(
              _pdfLanguages.length > 1
                  ? loc.ppspsExportPdfMulti(_pdfLanguages.length)
                  : loc.ppspsExportPdf,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SwitchListTile(
          activeThumbColor: kSafetyAccent,
          contentPadding: EdgeInsets.zero,
          title: Text(loc.ppspsMarkFinal,
              style: const TextStyle(color: Colors.white)),
          value: finalized,
          onChanged: (v) => _update(_doc.copyWith(
              status: v ? PpspsStatus.finalized : PpspsStatus.draft)),
        ),
        const SizedBox(height: 12),
        Text(
          loc.safetyDisclaimer,
          style: TextStyle(
              fontSize: 12,
              height: 1.4,
              color: Colors.white.withValues(alpha: 0.55)),
        ),
      ],
    );
  }

  // ── Structure de la page ──────────────────────────────────────────────────

  List<String> _stepLabels(AppLocalizations loc) => [
        loc.ppspsStepProject,
        loc.ppspsStepWorkers,
        loc.ppspsStepRisks,
        loc.ppspsStepEmergency,
        loc.ppspsStepExport,
      ];

  Widget _stepper(AppLocalizations loc) {
    final labels = _stepLabels(loc);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: Column(
        children: [
          Row(
            children: [
              for (var i = 0; i < _stepCount; i++) ...[
                if (i > 0) const SizedBox(width: 6),
                Expanded(
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: i <= _step
                          ? kSafetyAccent
                          : Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              for (var i = 0; i < _stepCount; i++)
                Expanded(
                  child: InkWell(
                    onTap: () => setState(() => _step = i),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        labels[i],
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight:
                              i == _step ? FontWeight.w700 : FontWeight.w400,
                          color: i == _step
                              ? kSafetyAccent
                              : Colors.white.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _body(AppLocalizations loc) {
    switch (_step) {
      case 0:
        return _projectStep(loc);
      case 1:
        return _workersStep(loc);
      case 2:
        return _risksStep(loc);
      case 3:
        return _emergencyStep(loc);
      default:
        return _exportStep(loc);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    String? country;
    for (final c in widget.library.countries) {
      if (c.code == _doc.country) country = c.document;
    }

    return Scaffold(
      backgroundColor: kSafetyBg,
      appBar: AppBar(
        backgroundColor: kSafetyBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _doc.eventName.trim().isEmpty
                  ? loc.ppspsUntitled
                  : _doc.eventName.trim(),
              style: const TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            if (country != null)
              Text(
                '${safetyCountryName(loc, _doc.country)} · $country',
                style: TextStyle(
                    fontSize: 12, color: Colors.white.withValues(alpha: 0.6)),
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            _stepper(loc),
            Expanded(child: _body(loc)),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Row(
                children: [
                  if (_step > 0)
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(50),
                          side: BorderSide(
                              color: Colors.white.withValues(alpha: 0.2)),
                        ),
                        onPressed: () => setState(() => _step--),
                        child: Text(loc.ppspsPrevious),
                      ),
                    ),
                  if (_step > 0 && _step < _stepCount - 1)
                    const SizedBox(width: 10),
                  if (_step < _stepCount - 1)
                    Expanded(
                      flex: 2,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: kSafetyAccent,
                          foregroundColor: kSafetyOnAccent,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () => setState(() => _step++),
                        child: Text(
                          '${loc.ppspsNext} : ${_stepLabels(loc)[_step + 1]}',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
