// lib/pages/safety/attestation/attestation_editor_page.dart
//
// Attestation de bon montage en 4 étapes :
// Infos → Éléments montés → Contrôles → Signature.
// Un point non conforme (NC) exige une réserve écrite (constat + action)
// avant de pouvoir signer ; l'attestation est alors signée « avec réserve ».

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../../l10n_gen/app_localizations.dart';
import '../ppsps/ppsps_models.dart' show PpspsSignature;
import '../safety_library.dart';
import '../safety_theme.dart';
import '../widgets/signature_pad.dart';
import 'attestation_models.dart';
import 'attestation_pdf.dart';
import 'attestation_storage.dart';
import 'package:mon_app_tech/services/review_prompt_service.dart';

class AttestationEditorPage extends StatefulWidget {
  final AttestationDocument document;
  final SafetyLibrary library;

  const AttestationEditorPage({
    super.key,
    required this.document,
    required this.library,
  });

  @override
  State<AttestationEditorPage> createState() => _AttestationEditorPageState();
}

class _AttestationEditorPageState extends State<AttestationEditorPage> {
  static const int _stepCount = 4;

  late AttestationDocument _doc;
  int _step = 0;
  int _elementIndex = 0;
  Timer? _saveTimer;
  bool _exporting = false;

  @override
  void initState() {
    super.initState();
    _doc = widget.document;
  }

  @override
  void dispose() {
    _saveTimer?.cancel();
    AttestationStorage.save(_doc);
    super.dispose();
  }

  void _update(AttestationDocument doc) {
    setState(() => _doc = doc);
    _saveTimer?.cancel();
    _saveTimer = Timer(const Duration(milliseconds: 600), () {
      AttestationStorage.save(_doc);
    });
  }

  /// Modification du contenu contrôlé : une attestation déjà signée perd sa
  /// signature (elle ne correspond plus à ce qui a été attesté).
  void _mutate(AttestationDocument doc) {
    if (_doc.signature != null) {
      doc = doc.copyWith(clearSignature: true, status: AttestationStatus.draft);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context).attestationSignatureCleared)));
    }
    _update(doc);
  }

  String get _lang => Localizations.localeOf(context).languageCode;

  // ── Composants ────────────────────────────────────────────────────────────

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

  InputDecoration _decoration(String label, {bool error = false}) =>
      InputDecoration(
        labelText: label,
        filled: true,
        fillColor: error
            ? kSafetyCritHigh.withValues(alpha: 0.10)
            : Colors.white.withValues(alpha: 0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: error
              ? const BorderSide(color: kSafetyCritHigh)
              : BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: error
              ? const BorderSide(color: kSafetyCritHigh)
              : BorderSide.none,
        ),
      );

  Widget _field({
    required String id,
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
    int maxLines = 1,
    bool error = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        key: ValueKey('$_step-$id'),
        initialValue: value,
        maxLines: maxLines,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: Colors.white),
        decoration: _decoration(label, error: error),
        onChanged: onChanged,
      ),
    );
  }

  // ── Contrôles applicables ─────────────────────────────────────────────────

  List<SafetyControl> _controlsFor(MountedElement e) => [
        for (final f in widget.library.controlFamilies)
          if (e.families.contains(f))
            ...widget.library.controlsFor(_doc.country, family: f),
      ];

  int _answered(MountedElement e) =>
      _controlsFor(e).where((c) => e.checks.containsKey(c.id)).length;

  int get _unansweredTotal => _doc.elements.fold(
      0, (s, e) => s + _controlsFor(e).length - _answered(e));

  int get _missingPhotos {
    var n = 0;
    for (final e in _doc.elements) {
      for (final c in _controlsFor(e)) {
        final check = e.checks[c.id];
        if (c.photoRequired &&
            check != null &&
            check.status != CheckStatus.na &&
            check.photos.isEmpty) {
          n++;
        }
      }
    }
    return n;
  }

  // ── Étape 1 : informations ────────────────────────────────────────────────

  Widget _infoStep(AppLocalizations loc) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          _field(
            id: 'event',
            label: loc.ppspsFieldEventName,
            value: _doc.eventName,
            onChanged: (v) => _update(_doc.copyWith(eventName: v)),
          ),
          _field(
            id: 'venue',
            label: loc.ppspsFieldVenue,
            value: _doc.venue,
            onChanged: (v) => _update(_doc.copyWith(venue: v)),
          ),
          _field(
            id: 'address',
            label: loc.ppspsFieldAddress,
            value: _doc.address,
            onChanged: (v) => _update(_doc.copyWith(address: v)),
          ),
          _field(
            id: 'organizer',
            label: loc.ppspsFieldOrganizer,
            value: _doc.organizer,
            onChanged: (v) => _update(_doc.copyWith(organizer: v)),
          ),
          _field(
            id: 'company',
            label: loc.attestationFieldCompany,
            value: _doc.companyName,
            onChanged: (v) => _update(_doc.copyWith(companyName: v)),
          ),
        ],
      );

  // ── Étape 2 : éléments montés ─────────────────────────────────────────────

  Future<void> _editElement({int? index}) async {
    final loc = AppLocalizations.of(context);
    final initial =
        index == null ? MountedElement.create() : _doc.elements[index];
    final name = TextEditingController(text: initial.name);
    final desc = TextEditingController(text: initial.description);
    String fmt(double? v) =>
        v == null ? '' : (v == v.roundToDouble() ? '${v.round()}' : '$v');
    final applied = TextEditingController(text: fmt(initial.appliedLoadKg));
    final rated = TextEditingController(text: fmt(initial.ratedLoadKg));
    var families = {...initial.families};

    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kSafetySheetBg,
      showDragHandle: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheet) => Padding(
          padding: EdgeInsets.fromLTRB(
              20, 0, 20, 20 + MediaQuery.viewInsetsOf(ctx).bottom +
                MediaQuery.paddingOf(ctx).bottom),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: name,
                  textCapitalization: TextCapitalization.sentences,
                  style: const TextStyle(color: Colors.white),
                  decoration:
                      InputDecoration(labelText: loc.attestationElementName),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: desc,
                  textCapitalization: TextCapitalization.sentences,
                  style: const TextStyle(color: Colors.white),
                  decoration:
                      InputDecoration(labelText: loc.attestationElementDesc),
                ),
                const SizedBox(height: 16),
                Text(loc.attestationElementFamilies,
                    style:
                        TextStyle(color: Colors.white.withValues(alpha: 0.7))),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final f in widget.library.controlFamilies)
                      FilterChip(
                        label: Text(controlFamilyLabel(f, _lang)),
                        selected: families.contains(f),
                        selectedColor: kSafetyAccent.withValues(alpha: 0.25),
                        checkmarkColor: kSafetyAccent,
                        onSelected: (v) => setSheet(() {
                          v ? families.add(f) : families.remove(f);
                        }),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: applied,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            labelText: loc.attestationAppliedLoad),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: rated,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        style: const TextStyle(color: Colors.white),
                        decoration:
                            InputDecoration(labelText: loc.attestationRatedLoad),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
      ),
    );

    if (saved == true && name.text.trim().isNotEmpty) {
      double? parse(String s) =>
          double.tryParse(s.trim().replaceAll(',', '.'));
      final element = initial
          .copyWith(
            name: name.text.trim(),
            description: desc.text.trim(),
            families: families,
          )
          .withLoads(parse(applied.text), parse(rated.text));
      final elements = [..._doc.elements];
      if (index == null) {
        elements.add(element);
      } else {
        elements[index] = element;
      }
      _mutate(_doc.copyWith(elements: elements));
    }
    Future.delayed(const Duration(milliseconds: 500), () {
      for (final c in [name, desc, applied, rated]) {
        c.dispose();
      }
    });
  }

  Future<void> _removeElement(int index) async {
    final loc = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(loc.attestationDeleteElementConfirm),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(loc.ppspsCancel)),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(loc.ppspsDelete,
                  style: const TextStyle(color: kSafetyCritHigh))),
        ],
      ),
    );
    if (ok != true) return;
    final removed = _doc.elements[index];
    for (final c in removed.checks.values) {
      for (final p in c.photos) {
        AttestationPhotos.remove(_doc.id, p);
      }
    }
    final elements = [..._doc.elements]..removeAt(index);
    _elementIndex = 0;
    _mutate(_doc.copyWith(elements: elements));
  }

  Widget _loadGauge(AppLocalizations loc, MountedElement e) {
    final ratio = e.loadRatio;
    if (ratio == null) return const SizedBox.shrink();
    final color = e.overloaded
        ? kSafetyCritHigh
        : (ratio > 0.8 ? kSafetyCritMid : kSafetyCritLow);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.attestationLoadSummary(
              e.appliedLoadKg!.round(),
              e.ratedLoadKg!.round(),
            ),
            style: TextStyle(
                fontSize: 12, color: Colors.white.withValues(alpha: 0.75)),
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: ratio.clamp(0, 1).toDouble(),
              minHeight: 6,
              backgroundColor: Colors.white.withValues(alpha: 0.10),
              color: color,
            ),
          ),
          if (e.overloaded)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(loc.attestationOverload,
                  style:
                      const TextStyle(fontSize: 12, color: kSafetyCritHigh)),
            ),
        ],
      ),
    );
  }

  Widget _elementsStep(AppLocalizations loc) => ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          if (_doc.elements.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(loc.attestationElementsEmpty,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white.withValues(alpha: 0.6))),
            ),
          for (var i = 0; i < _doc.elements.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Material(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => _editElement(index: i),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(14, 10, 4, 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_doc.elements[i].name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                              if (_doc.elements[i].description.isNotEmpty)
                                Text(_doc.elements[i].description,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white
                                            .withValues(alpha: 0.6))),
                              const SizedBox(height: 4),
                              Text(
                                [
                                  for (final f in widget.library.controlFamilies)
                                    if (_doc.elements[i].families.contains(f))
                                      controlFamilyLabel(f, _lang),
                                ].join(' · '),
                                style: const TextStyle(
                                    fontSize: 12, color: kSafetyAccent),
                              ),
                              _loadGauge(loc, _doc.elements[i]),
                            ],
                          ),
                        ),
                        IconButton(
                          tooltip: loc.ppspsDelete,
                          icon: Icon(Icons.delete_outline_rounded,
                              color: Colors.white.withValues(alpha: 0.6)),
                          onPressed: () => _removeElement(i),
                        ),
                      ],
                    ),
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
            onPressed: () => _editElement(),
            icon: const Icon(Icons.add_rounded),
            label: Text(loc.attestationAddElement),
          ),
        ],
      );

  // ── Étape 3 : contrôles ───────────────────────────────────────────────────

  void _setCheck(MountedElement e, String controlId, ControlCheck? check) {
    final checks = {...e.checks};
    if (check == null) {
      checks.remove(controlId);
    } else {
      checks[controlId] = check;
    }
    final elements = [
      for (final x in _doc.elements) x.id == e.id ? x.copyWith(checks: checks) : x
    ];
    _mutate(_doc.copyWith(elements: elements));
  }

  Future<void> _addPhoto(MountedElement e, String controlId) async {
    final loc = AppLocalizations.of(context);
    final fromGallery = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: kSafetySheetBg,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_rounded,
                  color: kSafetyAccent),
              title: Text(loc.attestationTakePhoto,
                  style: const TextStyle(color: Colors.white)),
              onTap: () => Navigator.pop(ctx, false),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_rounded,
                  color: kSafetyAccent),
              title: Text(loc.attestationPickPhoto,
                  style: const TextStyle(color: Colors.white)),
              onTap: () => Navigator.pop(ctx, true),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
    if (fromGallery == null) return;
    String? name;
    try {
      name = await AttestationPhotos.capture(_doc.id, fromGallery: fromGallery);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(loc.attestationPhotoError)));
      return;
    }
    if (name == null || !mounted) return;
    // Relit l'élément courant : il a pu changer pendant la prise de vue.
    final current = _doc.elements.firstWhere((x) => x.id == e.id);
    final check = current.checks[controlId] ??
        const ControlCheck(status: CheckStatus.ok);
    _setCheck(current, controlId, check.copyWith(photos: [...check.photos, name]));
  }

  void _removePhoto(MountedElement e, String controlId, String photo) {
    final check = e.checks[controlId];
    if (check == null) return;
    AttestationPhotos.remove(_doc.id, photo);
    _setCheck(e, controlId,
        check.copyWith(photos: [...check.photos]..remove(photo)));
  }

  Widget _statusButton(String label, bool selected, Color color, VoidCallback onTap) =>
      Padding(
        padding: const EdgeInsets.only(left: 4),
        child: SizedBox(
          height: 34,
          child: TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size(44, 34),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              backgroundColor: selected ? color : Colors.transparent,
              foregroundColor: selected
                  ? const Color(0xFF111317)
                  : Colors.white.withValues(alpha: 0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
                side: selected
                    ? BorderSide.none
                    : BorderSide(color: Colors.white.withValues(alpha: 0.15)),
              ),
            ),
            onPressed: onTap,
            child: Text(label,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
          ),
        ),
      );

  Widget _controlCard(
      AppLocalizations loc, MountedElement e, SafetyControl c) {
    final check = e.checks[c.id];
    final status = check?.status;
    void set(CheckStatus s) {
      if (status == s) {
        _setCheck(e, c.id, null); // second tap : on efface la réponse
      } else {
        _setCheck(e, c.id,
            (check ?? ControlCheck(status: s)).copyWith(status: s));
      }
    }

    final needsPhoto = c.photoRequired &&
        status != null &&
        status != CheckStatus.na &&
        (check?.photos.isEmpty ?? true);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: status == CheckStatus.nc
            ? Border.all(color: kSafetyCritHigh.withValues(alpha: 0.6))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(c.label.forLanguage(_lang),
                    style: const TextStyle(color: Colors.white, height: 1.3)),
              ),
              _statusButton(loc.attestationOk, status == CheckStatus.ok,
                  kSafetyCritLow, () => set(CheckStatus.ok)),
              _statusButton(loc.attestationNc, status == CheckStatus.nc,
                  kSafetyCritHigh, () => set(CheckStatus.nc)),
              _statusButton(loc.attestationNa, status == CheckStatus.na,
                  Colors.white70, () => set(CheckStatus.na)),
            ],
          ),
          if (status == CheckStatus.nc) ...[
            const SizedBox(height: 10),
            TextFormField(
              key: ValueKey('reserve-${e.id}-${c.id}'),
              initialValue: check?.reserve ?? '',
              maxLines: 3,
              minLines: 2,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(color: Colors.white),
              decoration: _decoration(loc.attestationReserveLabel,
                  error: check?.reserve.trim().isEmpty ?? true),
              onChanged: (v) {
                final current = _doc.elements.firstWhere((x) => x.id == e.id);
                final ch = current.checks[c.id];
                if (ch == null) return;
                _setCheck(current, c.id, ch.copyWith(reserve: v));
              },
            ),
          ],
          if (status != null && status != CheckStatus.na) ...[
            const SizedBox(height: 8),
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final p in check?.photos ?? const <String>[])
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _PhotoThumb(
                        docId: _doc.id,
                        name: p,
                        onRemove: () => _removePhoto(e, c.id, p),
                      ),
                    ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => _addPhoto(e, c.id),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: needsPhoto
                                ? kSafetyCritMid
                                : Colors.white.withValues(alpha: 0.2)),
                      ),
                      child: Icon(Icons.add_a_photo_rounded,
                          color: needsPhoto
                              ? kSafetyCritMid
                              : Colors.white.withValues(alpha: 0.6)),
                    ),
                  ),
                ],
              ),
            ),
            if (needsPhoto)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(loc.attestationPhotoRequired,
                    style: const TextStyle(fontSize: 12, color: kSafetyCritMid)),
              ),
          ],
        ],
      ),
    );
  }

  Widget _controlsStep(AppLocalizations loc) {
    if (_doc.elements.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(loc.attestationNoElements,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.6))),
        ),
      );
    }
    if (_elementIndex >= _doc.elements.length) _elementIndex = 0;
    final e = _doc.elements[_elementIndex];
    final controls = _controlsFor(e);

    return Column(
      children: [
        SizedBox(
          height: 52,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 4),
            children: [
              for (var i = 0; i < _doc.elements.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(
                      _answered(_doc.elements[i]) ==
                              _controlsFor(_doc.elements[i]).length
                          ? '${_doc.elements[i].name} ✓'
                          : _doc.elements[i].name,
                    ),
                    selected: i == _elementIndex,
                    selectedColor: kSafetyAccent.withValues(alpha: 0.25),
                    onSelected: (_) => setState(() => _elementIndex = i),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(e.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          '${_answered(e)}/${controls.length}',
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.6)),
                        ),
                      ],
                    ),
                    if (e.description.isNotEmpty)
                      Text(e.description,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withValues(alpha: 0.6))),
                    _loadGauge(loc, e),
                  ],
                ),
              ),
              for (final f in widget.library.controlFamilies)
                if (e.families.contains(f)) ...[
                  _sectionTitle(controlFamilyLabel(f, _lang)),
                  for (final c in controls.where((c) => c.family == f))
                    _controlCard(loc, e, c),
                ],
            ],
          ),
        ),
      ],
    );
  }

  // ── Étape 4 : signature et export ─────────────────────────────────────────

  static const Map<String, String> _kLanguageNames = {
    'fr': 'Français',
    'en': 'English',
    'nl': 'Nederlands',
    'de': 'Deutsch',
    'es': 'Español',
    'pt': 'Português',
  };

  List<String> get _pdfLanguages => _doc.pdfLanguages.isNotEmpty
      ? _doc.pdfLanguages
      : [AttestationPdf.defaultLanguage(_doc.country)];

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

  Future<void> _sign() async {
    final loc = AppLocalizations.of(context);
    if (_doc.missingReserves > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(loc.attestationReservesMissing)));
      return;
    }
    final result = await showSignatureSheet(
      context,
      title: loc.attestationSignTitle,
      initialName: _doc.signerName,
    );
    if (result == null || !mounted) return;
    _update(_doc.copyWith(
      signerName: result.name.isEmpty ? _doc.signerName : result.name,
      signature: PpspsSignature(
        name: result.name,
        pngBase64: base64Encode(result.png),
        signedAt: DateTime.now(),
      ),
      status: AttestationStatus.signed,
    ));
  }

  Future<void> _exportPdf(Rect? shareOrigin) async {
    if (_exporting) return;
    setState(() => _exporting = true);
    try {
      await AttestationStorage.save(_doc);
      final base = _doc.eventName.trim().isEmpty
          ? 'attestation_montage'
          : 'attestation_${_doc.eventName.trim().replaceAll(RegExp(r'[^\w\-]+'), '_')}';
      final langs = _pdfLanguages;
      if (langs.length == 1) {
        final bytes =
            await AttestationPdf.build(_doc, widget.library, language: langs.first);
        await Printing.layoutPdf(
          onLayout: (_) async => bytes,
          name: '${base}_${langs.first.toUpperCase()}.pdf',
        );
        ReviewPromptService.onSuccess();
        return;
      }
      final files = <XFile>[];
      for (final l in langs) {
        final bytes =
            await AttestationPdf.build(_doc, widget.library, language: l);
        files.add(XFile.fromData(bytes,
            name: '${base}_${l.toUpperCase()}.pdf',
            mimeType: 'application/pdf'));
      }
      await Share.shareXFiles(
        files,
        subject: _doc.eventName.trim().isEmpty ? null : _doc.eventName.trim(),
        sharePositionOrigin: shareOrigin,
      );
      ReviewPromptService.onSuccess();
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12, color: Colors.white.withValues(alpha: 0.6))),
            ],
          ),
        ),
      );

  Widget _signatureStep(AppLocalizations loc) {
    final m = MaterialLocalizations.of(context);
    final sig = _doc.signature;
    final warnings = <String>[
      if (_doc.elements.isEmpty) loc.attestationNoElements,
      if (_unansweredTotal > 0) loc.attestationUnanswered(_unansweredTotal),
      if (_doc.missingReserves > 0)
        loc.attestationReservesMissingCount(_doc.missingReserves),
      if (_missingPhotos > 0) loc.attestationPhotosMissing(_missingPhotos),
    ];
    final reserves = [
      for (final e in _doc.elements)
        for (final c in _controlsFor(e))
          if (e.checks[c.id]?.status == CheckStatus.nc)
            (e, c, e.checks[c.id]!),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
        Row(
          children: [
            _statTile('${_doc.elements.length}', loc.attestationStatElements,
                Colors.white),
            const SizedBox(width: 8),
            _statTile('${_doc.ncCount}', loc.attestationStatReserves,
                _doc.ncCount > 0 ? kSafetyCritMid : kSafetyCritLow),
            const SizedBox(width: 8),
            _statTile(
                '${_doc.photoCount}', loc.attestationStatPhotos, Colors.white),
          ],
        ),
        if (warnings.isNotEmpty) ...[
          const SizedBox(height: 12),
          for (final w in warnings)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  const Icon(Icons.error_outline_rounded,
                      size: 16, color: kSafetyCritMid),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Text(w,
                          style: const TextStyle(
                              fontSize: 13, color: kSafetyCritMid))),
                ],
              ),
            ),
        ],
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            _doc.hasReserves
                ? loc.attestationStatementReserve(
                    _doc.signerName.trim().isEmpty ? '…' : _doc.signerName.trim())
                : loc.attestationStatement(
                    _doc.signerName.trim().isEmpty ? '…' : _doc.signerName.trim()),
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85), height: 1.45),
          ),
        ),
        for (final r in reserves)
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kSafetyCritMid.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: kSafetyCritMid.withValues(alpha: 0.4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${loc.attestationReserve} · ${r.$1.name}',
                    style: const TextStyle(
                        color: kSafetyCritMid, fontWeight: FontWeight.w700)),
                const SizedBox(height: 2),
                Text(r.$2.label.forLanguage(_lang),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.6))),
                const SizedBox(height: 4),
                Text(
                    r.$3.reserve.trim().isEmpty
                        ? loc.attestationReserveEmpty
                        : r.$3.reserve.trim(),
                    style: TextStyle(
                        color: r.$3.reserve.trim().isEmpty
                            ? kSafetyCritHigh
                            : Colors.white)),
              ],
            ),
          ),
        _sectionTitle(loc.attestationSignerSection),
        _field(
          id: 'signerName',
          label: loc.ppspsSignName,
          value: _doc.signerName,
          onChanged: (v) => _update(_doc.copyWith(signerName: v)),
        ),
        _field(
          id: 'signerRole',
          label: loc.attestationSignerRole,
          value: _doc.signerRole,
          onChanged: (v) => _update(_doc.copyWith(signerRole: v)),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 110,
                height: 56,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: sig == null
                    ? Icon(Icons.draw_rounded,
                        color: Colors.black.withValues(alpha: 0.3))
                    : Image.memory(base64Decode(sig.pngBase64),
                        fit: BoxFit.contain),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  sig == null
                      ? loc.ppspsNotSigned
                      : loc.ppspsSignedOn(
                          '${m.formatShortDate(sig.signedAt)} ${TimeOfDay.fromDateTime(sig.signedAt).format(context)}'),
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.75)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        FilledButton.icon(
          style: FilledButton.styleFrom(
            backgroundColor:
                _doc.missingReserves > 0 ? Colors.white24 : kSafetyAccent,
            foregroundColor: kSafetyOnAccent,
            minimumSize: const Size.fromHeight(52),
          ),
          onPressed: _sign,
          icon: const Icon(Icons.draw_rounded),
          label: Text(
            sig != null
                ? loc.ppspsSignAgain
                : (_doc.hasReserves
                    ? loc.attestationSignWithReserve
                    : loc.attestationSign),
            style: const TextStyle(fontWeight: FontWeight.w700),
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
        const SizedBox(height: 16),
        Builder(
          builder: (btnCtx) => OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: kSafetyAccent,
              minimumSize: const Size.fromHeight(52),
              side: BorderSide(color: kSafetyAccent.withValues(alpha: 0.6)),
            ),
            onPressed: _exporting
                ? null
                : () {
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

  // ── Structure ─────────────────────────────────────────────────────────────

  List<String> _stepLabels(AppLocalizations loc) => [
        loc.attestationStepInfo,
        loc.attestationStepElements,
        loc.attestationStepControls,
        loc.attestationStepSignature,
      ];

  Widget _body(AppLocalizations loc) {
    switch (_step) {
      case 0:
        return _infoStep(loc);
      case 1:
        return _elementsStep(loc);
      case 2:
        return _controlsStep(loc);
      default:
        return _signatureStep(loc);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final labels = _stepLabels(loc);
    final inControls = _step == 2 && _doc.elements.isNotEmpty;
    final hasNextElement =
        inControls && _elementIndex < _doc.elements.length - 1;

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
                  ? loc.attestationListTitle
                  : _doc.eventName.trim(),
              style: const TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${safetyCountryName(loc, _doc.country)} · ${loc.safetyAttestationTitle}',
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
            Padding(
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
                                  fontWeight: i == _step
                                      ? FontWeight.w700
                                      : FontWeight.w400,
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
            ),
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
                        onPressed: () => setState(() {
                          if (hasNextElement) {
                            _elementIndex++;
                          } else {
                            _step++;
                          }
                        }),
                        child: Text(
                          hasNextElement
                              ? loc.attestationNextElement
                              : '${loc.ppspsNext} : ${labels[_step + 1]}',
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

/// Vignette d'une photo enregistrée, avec suppression par appui long.
class _PhotoThumb extends StatelessWidget {
  final String docId;
  final String name;
  final VoidCallback onRemove;

  const _PhotoThumb({
    required this.docId,
    required this.name,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return FutureBuilder<File>(
      future: AttestationPhotos.file(docId, name),
      builder: (context, snap) {
        final file = snap.data;
        return GestureDetector(
          onLongPress: () async {
            final ok = await showDialog<bool>(
              context: context,
              builder: (ctx) => AlertDialog(
                content: Text(loc.attestationDeletePhotoConfirm),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(ctx, false),
                      child: Text(loc.ppspsCancel)),
                  TextButton(
                      onPressed: () => Navigator.pop(ctx, true),
                      child: Text(loc.ppspsDelete,
                          style: const TextStyle(color: kSafetyCritHigh))),
                ],
              ),
            );
            if (ok == true) onRemove();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 60,
              height: 60,
              color: Colors.white10,
              child: file == null
                  ? null
                  : Image.file(file, fit: BoxFit.cover, cacheWidth: 180),
            ),
          ),
        );
      },
    );
  }
}
