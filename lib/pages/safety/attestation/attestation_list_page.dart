// lib/pages/safety/attestation/attestation_list_page.dart
//
// Liste des attestations de bon montage : création (vierge ou à partir d'un
// plan de sécurité existant), reprise, duplication et suppression.

import 'package:flutter/material.dart';

import '../../../l10n_gen/app_localizations.dart';
import '../ppsps/ppsps_models.dart';
import '../ppsps/ppsps_storage.dart';
import '../safety_library.dart';
import '../safety_theme.dart';
import 'attestation_editor_page.dart';
import 'attestation_models.dart';
import 'attestation_storage.dart';

class AttestationListPage extends StatefulWidget {
  final SafetyLibrary library;

  const AttestationListPage({super.key, required this.library});

  @override
  State<AttestationListPage> createState() => _AttestationListPageState();
}

class _AttestationListPageState extends State<AttestationListPage> {
  List<AttestationDocument> _docs = const [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  Future<void> _reload() async {
    final docs = await AttestationStorage.loadAll();
    if (!mounted) return;
    setState(() {
      _docs = docs;
      _loading = false;
    });
  }

  Future<void> _open(AttestationDocument doc) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            AttestationEditorPage(document: doc, library: widget.library),
      ),
    );
    _reload();
  }

  Future<void> _createNew() async {
    final loc = AppLocalizations.of(context);
    final plans = await PpspsStorage.loadAll();
    if (!mounted) return;

    // Choix : à partir d'un plan de sécurité, ou attestation vierge.
    final choice = await showModalBottomSheet<Object>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kSafetySheetBg,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.sizeOf(ctx).height * 0.8),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            children: [
              Text(loc.attestationNewTitle,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.note_add_rounded, color: kSafetyAccent),
                title: Text(loc.attestationNewBlank,
                    style: const TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(ctx, 'blank'),
              ),
              if (plans.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(loc.attestationNewFromPlan,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.6))),
                for (final p in plans)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading:
                        const Icon(Icons.assignment_rounded, color: kSafetyAccent),
                    title: Text(
                      p.eventName.trim().isEmpty
                          ? loc.ppspsUntitled
                          : p.eventName.trim(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      [safetyCountryName(loc, p.country), p.venue]
                          .where((s) => s.trim().isNotEmpty)
                          .join(' · '),
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.6)),
                    ),
                    onTap: () => Navigator.pop(ctx, p),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
    if (choice == null || !mounted) return;

    AttestationDocument doc;
    if (choice is PpspsDocument) {
      final base = AttestationDocument.create(choice.country);
      doc = AttestationDocument(
        id: base.id,
        createdAt: base.createdAt,
        updatedAt: base.updatedAt,
        country: choice.country,
        ppspsId: choice.id,
        eventName: choice.eventName,
        venue: choice.venue,
        address: choice.address,
        organizer: choice.organizer,
        companyName: choice.companyName,
        signerName: choice.responsibleName,
      );
    } else {
      final country = await _pickCountry();
      if (country == null || !mounted) return;
      doc = AttestationDocument.create(country);
    }
    await AttestationStorage.save(doc);
    if (!mounted) return;
    _open(doc);
  }

  Future<String?> _pickCountry() async {
    final countries = widget.library.availableCountries;
    if (countries.isEmpty) return 'FR';
    if (countries.length == 1) return countries.first.code;
    final loc = AppLocalizations.of(context);
    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: kSafetySheetBg,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Text(loc.ppspsChooseCountry,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
            ),
            for (final c in countries)
              ListTile(
                title: Text(safetyCountryName(loc, c.code, fallback: c.name),
                    style: const TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(ctx, c.code),
              ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Future<void> _duplicate(AttestationDocument doc) async {
    // Copie pour un nouvel événement avec les mêmes éléments, sans les
    // résultats de contrôle, les photos ni la signature.
    final base = AttestationDocument.create(doc.country);
    final copy = AttestationDocument(
      id: base.id,
      createdAt: base.createdAt,
      updatedAt: base.updatedAt,
      country: doc.country,
      eventName: doc.eventName,
      venue: doc.venue,
      address: doc.address,
      organizer: doc.organizer,
      companyName: doc.companyName,
      signerName: doc.signerName,
      signerRole: doc.signerRole,
      elements: [
        for (final e in doc.elements)
          MountedElement(
            id: '${DateTime.now().microsecondsSinceEpoch}${e.id}',
            name: e.name,
            description: e.description,
            families: e.families,
            appliedLoadKg: e.appliedLoadKg,
            ratedLoadKg: e.ratedLoadKg,
          ),
      ],
      pdfLanguages: doc.pdfLanguages,
    );
    await AttestationStorage.save(copy);
    if (!mounted) return;
    _open(copy);
  }

  Future<void> _delete(AttestationDocument doc) async {
    final loc = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(loc.attestationDeleteConfirm),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(loc.ppspsCancel)),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(loc.ppspsDelete,
                style: const TextStyle(color: kSafetyCritHigh)),
          ),
        ],
      ),
    );
    if (ok != true) return;
    await AttestationStorage.delete(doc.id);
    _reload();
  }

  Widget _card(AppLocalizations loc, AttestationDocument doc) {
    final signed = doc.status == AttestationStatus.signed;
    final statusText = signed
        ? (doc.hasReserves ? loc.attestationStatusReserve : loc.attestationStatusSigned)
        : loc.ppspsStatusDraft;
    final statusColor = signed
        ? (doc.hasReserves ? kSafetyCritMid : kSafetyCritLow)
        : kSafetyAccent;
    final subtitle = [
      if (doc.venue.trim().isNotEmpty) doc.venue.trim(),
      loc.attestationElementCount(doc.elements.length),
      if (doc.signature != null)
        MaterialLocalizations.of(context)
            .formatMediumDate(doc.signature!.signedAt),
    ].join(' · ');

    return Material(
      color: Colors.white.withValues(alpha: 0.05),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _open(doc),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 4, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(doc.country,
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white70)),
                  ),
                  const SizedBox(width: 8),
                  Text(statusText.toUpperCase(),
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                          color: statusColor)),
                  const Spacer(),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert_rounded,
                        color: Colors.white.withValues(alpha: 0.6)),
                    onSelected: (v) {
                      if (v == 'duplicate') _duplicate(doc);
                      if (v == 'delete') _delete(doc);
                    },
                    itemBuilder: (_) => [
                      PopupMenuItem(
                          value: 'duplicate', child: Text(loc.ppspsDuplicate)),
                      PopupMenuItem(value: 'delete', child: Text(loc.ppspsDelete)),
                    ],
                  ),
                ],
              ),
              Text(
                doc.eventName.trim().isEmpty
                    ? loc.ppspsUntitled
                    : doc.eventName.trim(),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: TextStyle(
                      fontSize: 13, color: Colors.white.withValues(alpha: 0.6))),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: kSafetyBg,
      appBar: AppBar(
        backgroundColor: kSafetyBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.attestationListTitle,
            style: const TextStyle(fontWeight: FontWeight.w800)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kSafetyAccent,
        foregroundColor: kSafetyOnAccent,
        onPressed: _createNew,
        icon: const Icon(Icons.add_rounded),
        label: Text(loc.attestationNew,
            style: const TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: SafeArea(
        top: false,
        child: _loading
          ? const Center(child: CircularProgressIndicator())
          : _docs.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.fact_check_outlined,
                            size: 56, color: kSafetyAccent),
                        const SizedBox(height: 16),
                        Text(loc.attestationEmptyTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        const SizedBox(height: 8),
                        Text(loc.attestationEmptyBody,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.6))),
                      ],
                    ),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
                  itemCount: _docs.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, i) => _card(loc, _docs[i]),
                ),
      ),
    );
  }
}
