// lib/pages/safety/ppsps/ppsps_list_page.dart
//
// Liste des plans de sécurité enregistrés sur l'appareil : création,
// reprise d'un brouillon, duplication et suppression.

import 'package:flutter/material.dart';

import '../../../l10n_gen/app_localizations.dart';
import '../safety_library.dart';
import '../safety_theme.dart';
import 'ppsps_editor_page.dart';
import 'ppsps_models.dart';
import 'ppsps_storage.dart';

class PpspsListPage extends StatefulWidget {
  final SafetyLibrary library;

  const PpspsListPage({super.key, required this.library});

  @override
  State<PpspsListPage> createState() => _PpspsListPageState();
}

class _PpspsListPageState extends State<PpspsListPage> {
  List<PpspsDocument> _docs = const [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  Future<void> _reload() async {
    final docs = await PpspsStorage.loadAll();
    if (!mounted) return;
    setState(() {
      _docs = docs;
      _loading = false;
    });
  }

  Future<void> _open(PpspsDocument doc) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PpspsEditorPage(document: doc, library: widget.library),
      ),
    );
    _reload();
  }

  Future<void> _createNew() async {
    final countries = widget.library.availableCountries;
    String? country;
    if (countries.length == 1) {
      country = countries.first.code;
    } else if (countries.length > 1) {
      country = await _pickCountry(countries);
    } else {
      country = 'FR';
    }
    if (country == null || !mounted) return;
    final doc = PpspsDocument.create(country);
    await PpspsStorage.save(doc);
    if (!mounted) return;
    _open(doc);
  }

  Future<String?> _pickCountry(List<SafetyCountry> countries) {
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
              child: Text(
                loc.ppspsChooseCountry,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            for (final c in countries)
              ListTile(
                leading: _CountryBadge(code: c.code),
                title: Text(
                  safetyCountryName(loc, c.code, fallback: c.name),
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  c.document,
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
                ),
                onTap: () => Navigator.pop(ctx, c.code),
              ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Future<void> _duplicate(PpspsDocument doc) async {
    final copy = doc.duplicate();
    await PpspsStorage.save(copy);
    if (!mounted) return;
    _open(copy);
  }

  Future<void> _delete(PpspsDocument doc) async {
    final loc = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(loc.ppspsDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(loc.ppspsCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              loc.ppspsDelete,
              style: const TextStyle(color: Color(0xFFFF6B6B)),
            ),
          ),
        ],
      ),
    );
    if (ok != true) return;
    await PpspsStorage.delete(doc.id);
    _reload();
  }

  String _dateLabel(BuildContext context, PpspsDocument doc) {
    final m = MaterialLocalizations.of(context);
    final start = doc.phases[SafetyPhase.exploitation]?.start ??
        doc.phases[SafetyPhase.montage]?.start;
    return start == null ? '' : m.formatMediumDate(start);
  }

  Widget _card(AppLocalizations loc, PpspsDocument doc) {
    final finalized = doc.status == PpspsStatus.finalized;
    final subtitle = [
      if (doc.venue.trim().isNotEmpty) doc.venue.trim(),
      _dateLabel(context, doc),
    ].where((s) => s.isNotEmpty).join(' · ');

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
                  _CountryBadge(code: doc.country),
                  const SizedBox(width: 8),
                  Text(
                    (finalized ? loc.ppspsStatusFinal : loc.ppspsStatusDraft)
                        .toUpperCase(),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                      color: finalized
                          ? const Color(0xFF5BC48A)
                          : kSafetyAccent,
                    ),
                  ),
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
              if (subtitle.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 13, color: Colors.white.withValues(alpha: 0.6)),
                ),
              ],
              if (!finalized) ...[
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: LinearProgressIndicator(
                            value: doc.completedSteps / 4,
                            minHeight: 6,
                            backgroundColor:
                                Colors.white.withValues(alpha: 0.10),
                            color: kSafetyAccent,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        loc.ppspsStepProgress(doc.completedSteps, 4),
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.7)),
                      ),
                    ],
                  ),
                ),
              ],
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
        title: Text(loc.ppspsListTitle,
            style: const TextStyle(fontWeight: FontWeight.w800)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kSafetyAccent,
        foregroundColor: kSafetyOnAccent,
        onPressed: _createNew,
        icon: const Icon(Icons.add_rounded),
        label: Text(loc.ppspsNew,
            style: const TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _docs.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.assignment_outlined,
                            size: 56, color: kSafetyAccent),
                        const SizedBox(height: 16),
                        Text(
                          loc.ppspsEmptyTitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          loc.ppspsEmptyBody,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.6)),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                      16, 12, 16, 96 + MediaQuery.paddingOf(context).bottom),
                  itemCount: _docs.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, i) => _card(loc, _docs[i]),
                ),
    );
  }
}

class _CountryBadge extends StatelessWidget {
  final String code;
  const _CountryBadge({required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        code,
        style: const TextStyle(
            fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white70),
      ),
    );
  }
}
