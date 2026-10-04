// lib/pages/safety/safety_page.dart
//
// Hub du module Sécurité : plans de sécurité (PPSPS / PSS) et attestation de
// bon montage. Accès réservé à l'abonnement « safety » (ou Pro), sur le même
// modèle que RiggingPage / NetworkPage.

import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';
import '../../services/subscription_service.dart';
import '../shared/app_grid_tile.dart';
import '../subscription_page.dart';
import 'safety_library.dart';

const Color kSafetyAccent = Color(0xFFF5A524);

class SafetyPage extends StatefulWidget {
  const SafetyPage({super.key});

  @override
  State<SafetyPage> createState() => _SafetyPageState();
}

class _SafetyPageState extends State<SafetyPage> {
  final SafetyLibraryRepository _repo = SafetyLibraryRepository();

  bool _hasAccess = false;
  SafetyLibrary _library = SafetyLibrary.empty;
  bool _fromRemote = false;

  @override
  void initState() {
    super.initState();
    _checkAccess();
    _loadLibrary();
  }

  Future<void> _checkAccess() async {
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.safety);
    if (!mounted) return;
    setState(() => _hasAccess = ok);
  }

  Future<void> _loadLibrary() async {
    final local = await _repo.loadInitialFast();
    if (!mounted) return;
    setState(() => _library = local);

    final remote = await _repo.refreshRemote();
    if (!mounted || remote == null) return;
    setState(() {
      _library = remote;
      _fromRemote = true;
    });
  }

  /// Ouvre l'outil si abonnement Sécurité (ou Pro), sinon le paywall.
  Future<void> _openOrSubscribe(VoidCallback open) async {
    if (!_hasAccess) {
      final ok =
          await SubscriptionService.hasAccess(SubscriptionCategory.safety);
      if (!mounted) return;
      if (!ok) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                const SubscriptionPage(category: SubscriptionCategory.safety),
          ),
        );
        _checkAccess();
        return;
      }
      setState(() => _hasAccess = true);
    }
    open();
  }

  void _comingSoon() {
    final loc = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(loc.safetyComingSoon)),
    );
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
      child: Row(
        children: [
          Expanded(
            child: Divider(
                color: Colors.white.withValues(alpha: 0.10), height: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                color: kSafetyAccent,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Expanded(
            child: Divider(
                color: Colors.white.withValues(alpha: 0.10), height: 1),
          ),
        ],
      ),
    );
  }

  Widget _libraryCard(AppLocalizations loc) {
    final updated = _library.updatedAt;
    final status = [
      if (updated != null)
        loc.safetyLibraryUpdated(MaterialLocalizations.of(context)
            .formatMediumDate(updated.toLocal())),
      if (!_fromRemote) loc.safetyLibraryOffline,
    ].join(' · ');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.menu_book_rounded,
                  size: 18, color: kSafetyAccent),
              const SizedBox(width: 8),
              Text(
                loc.safetyLibraryTitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            loc.safetyLibrarySummary(
              _library.risks.length,
              _library.measures.length,
              _library.controls.length,
            ),
            style: TextStyle(color: Colors.white.withValues(alpha: 0.80)),
          ),
          const SizedBox(height: 4),
          Text(
            status,
            style: TextStyle(
                fontSize: 12, color: Colors.white.withValues(alpha: 0.55)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.safetyPageTitle,
          style:
              const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
              16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom),
          children: [
            _sectionLabel(loc.safetySectionDocuments),
            AppGridView(
              children: [
                AppGridTile(
                  icon: Icons.assignment_rounded,
                  label: loc.safetyPpspsTitle,
                  subtitle: loc.safetyPpspsSubtitle,
                  accentColor: kSafetyAccent,
                  locked: !_hasAccess,
                  onTap: () => _openOrSubscribe(_comingSoon),
                ),
                AppGridTile(
                  icon: Icons.fact_check_rounded,
                  label: loc.safetyAttestationTitle,
                  subtitle: loc.safetyAttestationSubtitle,
                  accentColor: kSafetyAccent,
                  locked: !_hasAccess,
                  onTap: () => _openOrSubscribe(_comingSoon),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _libraryCard(loc),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline_rounded,
                    size: 16, color: Colors.white.withValues(alpha: 0.45)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    loc.safetyDisclaimer,
                    style: TextStyle(
                        fontSize: 12,
                        height: 1.4,
                        color: Colors.white.withValues(alpha: 0.55)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
