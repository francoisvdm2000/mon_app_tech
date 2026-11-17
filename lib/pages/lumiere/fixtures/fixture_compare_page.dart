// lib/pages/lumiere/fixtures/fixture_compare_page.dart
//
// Comparateur de projecteurs : choisir une machine à remplacer, l'app
// propose des équivalents du catalogue lumière, classés par luminosité puis
// zoom (+ CRI, source, puissance, poids), avec des filtres.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'fixture_compare_engine.dart';
import 'fixture_hybrid_repository.dart';
import 'fixture_models.dart';
import '../../about/about_favorites.dart';

const _kAccent = Color(0xFFFFB703); // ambre lumière
const _kCard = Color(0xFF161622);
const _kGood = Color(0xFF4ADE80);
const _kMid = Color(0xFFFFB703);
const _kBad = Color(0xFFFF6B6B);
const _kBeta = Color(0xFFC084FC); // violet « bêta »

/// Même adresse que « Contact » dans le menu latéral (home_page.dart).
const _kContactEmail = 'showtechtools@openwhite.eu';

class FixtureComparePage extends StatefulWidget {
  const FixtureComparePage({super.key});

  @override
  State<FixtureComparePage> createState() => _FixtureComparePageState();
}

class _FixtureComparePageState extends State<FixtureComparePage> {
  final FixtureHybridRepository _repo = FixtureHybridRepository();
  final TextEditingController _searchCtrl = TextEditingController();

  FixtureCatalog? _catalog;
  bool _loading = true;

  Manufacturer? _refM;
  Product? _ref;
  CompareFilters _filters = CompareFilters.defaults;
  List<CompareResult> _results = const [];

  /// Nombre de machines du catalogue ayant un zoom / une CRI renseignés.
  int _withZoom = 0;
  int _withCri = 0;

  @override
  void initState() {
    super.initState();
    _boot();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _boot() async {
    try {
      final initial = await _repo.loadInitialFast();
      if (!mounted) return;
      setState(() {
        _setCatalog(initial);
        _loading = false;
      });
      final remote = await _repo.refreshRemote();
      if (!mounted) return;
      if (remote != null) setState(() => _setCatalog(remote));
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  void _setCatalog(FixtureCatalog c) {
    _catalog = c;
    var z = 0, k = 0;
    for (final m in c.manufacturers) {
      for (final p in m.products) {
        if (zoomRangeOf(p) != null) z++;
        if (p.cri != null) k++;
      }
    }
    _withZoom = z;
    _withCri = k;
    _recompute();
  }

  void _recompute() {
    final c = _catalog, m = _refM, p = _ref;
    if (c == null || m == null || p == null) {
      _results = const [];
      return;
    }
    _results = findEquivalents(
        catalog: c, refManufacturer: m, ref: p, filters: _filters);
  }

  int _countFor(CompareFilters f) {
    final c = _catalog, m = _refM, p = _ref;
    if (c == null || m == null || p == null) return 0;
    return findEquivalents(
            catalog: c, refManufacturer: m, ref: p, filters: f, limit: 999)
        .length;
  }

  // ── Recherche de la machine de référence ─────────────────────────────

  List<(Manufacturer, Product)> _search(String query) {
    final tokens = query
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((t) => t.isNotEmpty)
        .toList();
    if (tokens.isEmpty || _catalog == null) return const [];
    final out = <(Manufacturer, Product)>[];
    final seen = <String>{};
    for (final m in _catalog!.manufacturers) {
      for (final p in m.products) {
        final hay = '${m.name} ${p.name} ${p.type}'.toLowerCase();
        if (!tokens.every(hay.contains)) continue;
        if (!seen.add('${m.name}|${p.name}'.toLowerCase())) continue;
        out.add((m, p));
      }
    }
    out.sort((a, b) => '${a.$1.name} ${a.$2.name}'
        .toLowerCase()
        .compareTo('${b.$1.name} ${b.$2.name}'.toLowerCase()));
    return out;
  }

  void _pick(Manufacturer m, Product p) {
    FocusScope.of(context).unfocus();
    setState(() {
      _refM = m;
      _ref = p;
      _searchCtrl.clear();
      _recompute();
    });
  }

  void _clearRef() {
    setState(() {
      _refM = null;
      _ref = null;
      _results = const [];
    });
  }

  // ── Mise en forme ────────────────────────────────────────────────────

  static String _fmtInt(int v) {
    final s = v.toString();
    final b = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) b.write(' ');
      b.write(s[i]);
    }
    return b.toString();
  }

  static String _fmtNum(double v) =>
      v % 1 == 0 ? v.toStringAsFixed(0) : v.toStringAsFixed(1);

  static String? _fmtZoom(Product p) {
    final z = zoomRangeOf(p);
    if (z == null) return null;
    if (z.$1 == z.$2) return '${_fmtNum(z.$1)}°';
    return '${_fmtNum(z.$1)}–${_fmtNum(z.$2)}°';
  }

  static String? _fmtDmx(Product p) {
    final counts = <int>{
      for (final m in p.modes)
        if (m.dmxChannels > 0) m.dmxChannels,
      if (p.dmxChannels != null && p.dmxChannels! > 0) p.dmxChannels!,
    }.toList()
      ..sort();
    if (counts.isEmpty) return null;
    if (counts.length == 1) return '${counts.first} ch';
    return '${counts.first}–${counts.last} ch';
  }

  static Color _scoreColor(double? s) {
    if (s == null) return Colors.white38;
    switch (matchLevelOf(s)) {
      case MatchLevel.equivalent:
        return _kGood;
      case MatchLevel.close:
        return _kMid;
      case MatchLevel.far:
        return _kBad;
    }
  }

  static String _levelLabel(AppLocalizations loc, double s) {
    switch (matchLevelOf(s)) {
      case MatchLevel.equivalent:
        return loc.fxCmpLevelEquivalent;
      case MatchLevel.close:
        return loc.fxCmpLevelClose;
      case MatchLevel.far:
        return loc.fxCmpLevelFar;
    }
  }

  static String familyLabel(AppLocalizations loc, FixtureFamily f) {
    switch (f) {
      case FixtureFamily.spotProfile:
        return loc.fxCmpFamSpotProfile;
      case FixtureFamily.beam:
        return loc.fxCmpFamBeam;
      case FixtureFamily.hybrid:
        return loc.fxCmpFamHybrid;
      case FixtureFamily.wash:
        return loc.fxCmpFamWash;
      case FixtureFamily.movingHead:
        return loc.fxCmpFamMovingHead;
      case FixtureFamily.par:
        return loc.fxCmpFamPar;
      case FixtureFamily.fresnelPc:
        return loc.fxCmpFamFresnelPc;
      case FixtureFamily.bar:
        return loc.fxCmpFamBar;
      case FixtureFamily.strobe:
        return loc.fxCmpFamStrobe;
      case FixtureFamily.followspot:
        return loc.fxCmpFamFollowspot;
      case FixtureFamily.softPanel:
        return loc.fxCmpFamSoftPanel;
      case FixtureFamily.cyclo:
        return loc.fxCmpFamCyclo;
      case FixtureFamily.effect:
        return loc.fxCmpFamEffect;
      case FixtureFamily.laser:
        return loc.fxCmpFamLaser;
      case FixtureFamily.atmospheric:
        return loc.fxCmpFamAtmospheric;
      case FixtureFamily.other:
        return loc.fxCmpFamOther;
    }
  }

  static IconData familyIcon(FixtureFamily f) {
    switch (f) {
      case FixtureFamily.spotProfile:
        return Icons.highlight_rounded;
      case FixtureFamily.beam:
        return Icons.flare_rounded;
      case FixtureFamily.hybrid:
        return Icons.auto_awesome_rounded;
      case FixtureFamily.wash:
        return Icons.wb_iridescent_rounded;
      case FixtureFamily.movingHead:
        return Icons.threesixty_rounded;
      case FixtureFamily.par:
        return Icons.lightbulb_outline_rounded;
      case FixtureFamily.fresnelPc:
        return Icons.light_mode_rounded;
      case FixtureFamily.bar:
        return Icons.view_week_rounded;
      case FixtureFamily.strobe:
        return Icons.flash_on_rounded;
      case FixtureFamily.followspot:
        return Icons.my_location_rounded;
      case FixtureFamily.softPanel:
        return Icons.crop_square_rounded;
      case FixtureFamily.cyclo:
        return Icons.gradient_rounded;
      case FixtureFamily.effect:
        return Icons.blur_on_rounded;
      case FixtureFamily.laser:
        return Icons.linear_scale_rounded;
      case FixtureFamily.atmospheric:
        return Icons.cloud_rounded;
      case FixtureFamily.other:
        return Icons.category_rounded;
    }
  }

  static String sourceLabel(AppLocalizations loc, SourceKind k) {
    switch (k) {
      case SourceKind.whiteLed:
        return loc.fxCmpSrcWhiteLed;
      case SourceKind.colorLed:
        return loc.fxCmpSrcColorLed;
      case SourceKind.discharge:
        return loc.fxCmpSrcDischarge;
      case SourceKind.laserPhosphor:
        return loc.fxCmpSrcLaser;
      case SourceKind.halogen:
        return loc.fxCmpSrcHalogen;
      case SourceKind.other:
        return loc.fxCmpSrcOther;
    }
  }

  // ── Construction ─────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final active = _filters.activeCount;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(loc.fxCmpTitle, overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: _kBeta,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(loc.fxCmpBetaPill,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: 0.5)),
            ),
          ],
        ),
        actions: [
          const AboutPinButton(
              pageId: 'tool:lumiere_fixture_compare', sectionId: 'main'),
          if (_ref != null)
            IconButton(
              tooltip: loc.fxCmpFilters,
              onPressed: _openFilters,
              icon: Badge(
                isLabelVisible: active > 0,
                backgroundColor: _kAccent,
                textColor: Colors.black,
                label: Text('$active'),
                child: const Icon(Icons.tune_rounded),
              ),
            ),
        ],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: _loading
            ? const Center(child: CircularProgressIndicator(color: _kAccent))
            : ListView(
                padding: EdgeInsets.fromLTRB(
                    16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom),
                children: [
                  _betaBanner(loc),
                  const SizedBox(height: 14),
                  ...(_ref == null
                      ? _buildPickStep(loc)
                      : _buildResultsStep(loc)),
                ],
              ),
      ),
    );
  }

  List<Widget> _buildPickStep(AppLocalizations loc) {
    final query = _searchCtrl.text.trim();
    final hits = _search(query);
    return [
      Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              _kAccent.withValues(alpha: 0.22),
              const Color(0xFF22D3EE).withValues(alpha: 0.10),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: _kAccent.withValues(alpha: 0.35)),
        ),
        child: Row(
          children: [
            const Text('🔦', style: TextStyle(fontSize: 34)),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                loc.fxCmpPickHint,
                style: const TextStyle(fontSize: 14.5, height: 1.35),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 18),
      Text(loc.fxCmpRefTitle,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
      const SizedBox(height: 8),
      TextField(
        controller: _searchCtrl,
        autofocus: false,
        onChanged: (_) => setState(() {}),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: loc.fxCmpSearchHint,
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: query.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear_rounded),
                  onPressed: () => setState(_searchCtrl.clear),
                )
              : null,
          filled: true,
          fillColor: _kCard,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      const SizedBox(height: 10),
      if (query.isNotEmpty && hits.isEmpty)
        Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Text(loc.fxCmpNoSearchResults,
                style: const TextStyle(color: Colors.white54)),
          ),
        ),
      for (final h in hits.take(60))
        Card(
          color: _kCard,
          margin: const EdgeInsets.only(bottom: 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: ListTile(
            leading: Icon(familyIcon(familyOf(h.$2)), color: _kAccent),
            title: Text(h.$2.name,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text('${h.$1.name} · ${h.$2.type}',
                style: const TextStyle(color: Colors.white60)),
            trailing: h.$2.luminousFluxLumen != null &&
                    h.$2.luminousFluxLumen! > 0
                ? Text('${_fmtInt(h.$2.luminousFluxLumen!)} lm',
                    style: const TextStyle(color: Colors.white70))
                : null,
            onTap: () => _pick(h.$1, h.$2),
          ),
        ),
    ];
  }

  List<Widget> _buildResultsStep(AppLocalizations loc) {
    final ref = _ref!;
    final refCrit = availableCriteria(ref);
    final refWeak = !refCrit.contains(CompareCriterion.lumen) &&
        !refCrit.contains(CompareCriterion.zoom);
    final dataPartial = _withZoom == 0 || _withCri == 0;

    return [
      _refCard(loc),
      if (refWeak) ...[
        const SizedBox(height: 12),
        _notice(loc.fxCmpRefNoData, Icons.warning_amber_rounded, _kBad),
      ],
      const SizedBox(height: 14),
      _filterSummary(loc),
      if (dataPartial) ...[
        const SizedBox(height: 10),
        _notice(loc.fxCmpDataNotice, Icons.info_outline_rounded,
            Colors.white54),
      ],
      const SizedBox(height: 16),
      Text(
        loc.fxCmpResultsCount(_results.length),
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
      ),
      const SizedBox(height: 10),
      if (_results.isEmpty)
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _kCard,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              const Text('🤷', style: TextStyle(fontSize: 36)),
              const SizedBox(height: 8),
              Text(loc.fxCmpNoResults,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70)),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _openFilters,
                icon: const Icon(Icons.tune_rounded),
                label: Text(loc.fxCmpFilters),
              ),
            ],
          ),
        ),
      for (var i = 0; i < _results.length; i++)
        _FadeSlideIn(
          key: ValueKey(
              '${_results[i].manufacturer.name}|${_results[i].product.name}|${_filters.hashCode}'),
          index: i,
          child: _resultCard(loc, _results[i]),
        ),
      const SizedBox(height: 18),
      Text(
        loc.fxCmpDisclaimer,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white38, fontSize: 12),
      ),
    ];
  }

  /// Ouvre l'app mail vers le contact de l'app, avec la machine de
  /// référence (et le résultat signalé, le cas échéant) déjà renseignés.
  Future<void> _sendFeedback({CompareResult? result}) async {
    final loc = AppLocalizations.of(context);
    final lines = <String>[
      if (_ref != null) loc.fxCmpFeedbackRef('${_refM!.name} ${_ref!.name}'),
      if (result != null)
        loc.fxCmpFeedbackCandidate(
          '${result.manufacturer.name} ${result.product.name}',
          result.score == null ? '—' : '${(result.score! * 100).round()}',
        ),
      '',
      loc.fxCmpFeedbackComment,
      '',
    ];
    String enc(String v) => Uri.encodeComponent(v);
    // Encodage manuel : `queryParameters` remplace les espaces par « + »,
    // que certaines apps mail affichent tels quels.
    final uri = Uri.parse('mailto:$_kContactEmail'
        '?subject=${enc(loc.fxCmpFeedbackSubject)}'
        '&body=${enc(lines.join('\n'))}');
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.homeErrorOpenEmail)),
      );
    }
  }

  /// Annonce « bêta » affichée en haut de la page.
  Widget _betaBanner(AppLocalizations loc) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            _kBeta.withValues(alpha: 0.20),
            _kBeta.withValues(alpha: 0.06),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: _kBeta.withValues(alpha: 0.45)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(loc.fxCmpBetaTitle,
              style: const TextStyle(
                  fontWeight: FontWeight.w800, fontSize: 14.5, color: _kBeta)),
          const SizedBox(height: 4),
          Text(loc.fxCmpBetaBody,
              style: const TextStyle(
                  fontSize: 12.5, color: Colors.white70, height: 1.35)),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: _kBeta,
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
              onPressed: () => _sendFeedback(),
              icon: const Icon(Icons.mail_outline_rounded, size: 18),
              label: Text(loc.fxCmpFeedback,
                  style: const TextStyle(fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _notice(String text, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text,
                style: const TextStyle(
                    fontSize: 12.5, color: Colors.white70, height: 1.3)),
          ),
        ],
      ),
    );
  }

  List<Widget> _statChips(Product p, {double? lumenDelta}) {
    final out = <Widget>[];
    final lm = p.luminousFluxLumen;
    if (lm != null && lm > 0) {
      var t = '${_fmtInt(lm)} lm';
      Color? c;
      if (lumenDelta != null) {
        final r = lumenDelta.round();
        t += ' (${r > 0 ? '+' : ''}$r %)';
        c = r.abs() <= 10 ? _kGood : (r.abs() <= 30 ? _kMid : _kBad);
      }
      out.add(_chip(Icons.wb_sunny_rounded, t, color: c));
    }
    final z = _fmtZoom(p);
    if (z != null) out.add(_chip(Icons.zoom_out_map_rounded, z));
    if (p.cri != null) out.add(_chip(Icons.palette_rounded, 'CRI ${p.cri}'));
    if (p.lightSource != null) {
      out.add(_chip(Icons.emoji_objects_rounded, p.lightSource!));
    }
    final w = p.powerWatt;
    if (w != null && w > 0) out.add(_chip(Icons.bolt_rounded, '$w W'));
    final kg = p.weightKilogram;
    if (kg != null && kg > 0) {
      out.add(_chip(Icons.fitness_center_rounded, '${_fmtNum(kg)} kg'));
    }
    return out;
  }

  Widget _chip(IconData icon, String text, {Color? color}) {
    final c = color ?? Colors.white70;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: c),
          const SizedBox(width: 4),
          Text(text,
              style: TextStyle(
                  fontSize: 12, color: c, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _pill(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text,
          style: TextStyle(
              fontSize: 11, color: color, fontWeight: FontWeight.w700)),
    );
  }

  Widget _refCard(AppLocalizations loc) {
    final ref = _ref!;
    final fam = familyOf(ref);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [_kAccent.withValues(alpha: 0.20), _kCard],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: _kAccent.withValues(alpha: 0.40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(loc.fxCmpRefTitle.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 11,
                      letterSpacing: 1.1,
                      color: _kAccent,
                      fontWeight: FontWeight.w800)),
              const Spacer(),
              TextButton.icon(
                onPressed: _clearRef,
                icon: const Icon(Icons.swap_horiz_rounded, size: 18),
                label: Text(loc.fxCmpChange),
                style: TextButton.styleFrom(foregroundColor: _kAccent),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: _kAccent.withValues(alpha: 0.18),
                child: Icon(familyIcon(fam), color: _kAccent),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_refM!.name,
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 13)),
                    Text(ref.name,
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 4),
                    _pill(familyLabel(loc, fam), _kAccent),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(spacing: 6, runSpacing: 6, children: _statChips(ref)),
        ],
      ),
    );
  }

  Widget _filterSummary(AppLocalizations loc) {
    final f = _filters;
    final labels = <String>[
      switch (f.scope) {
        FamilyScope.same => loc.fxCmpScopeSame,
        FamilyScope.close => loc.fxCmpScopeClose,
        FamilyScope.all => loc.fxCmpScopeAll,
      },
      if (f.lumenTolerancePct != null) '±${f.lumenTolerancePct} % lm',
      if (f.mustCoverZoom) loc.fxCmpMustCoverZoomShort,
      for (final s in f.sources) sourceLabel(loc, s),
      if (f.minCri != null) 'CRI ≥ ${f.minCri}',
      if (f.otherBrandsOnly) loc.fxCmpOtherBrands,
      if (f.lighterOrEqual) loc.fxCmpLighter,
      if (f.lowerPowerOrEqual) loc.fxCmpLowerPower,
      if (!f.includeIncomplete) loc.fxCmpCompleteOnly,
    ];
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ActionChip(
          avatar: const Icon(Icons.tune_rounded, size: 16, color: Colors.black),
          label: Text(loc.fxCmpFilters,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700)),
          backgroundColor: _kAccent,
          side: BorderSide.none,
          onPressed: _openFilters,
        ),
        for (final l in labels)
          Chip(
            label: Text(l, style: const TextStyle(fontSize: 12)),
            backgroundColor: _kCard,
            side: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
            visualDensity: VisualDensity.compact,
          ),
      ],
    );
  }

  Widget _scoreRing(double? score, {double size = 52}) {
    final c = _scoreColor(score);
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: score ?? 0),
              duration: const Duration(milliseconds: 650),
              curve: Curves.easeOutCubic,
              builder: (_, v, __) => CircularProgressIndicator(
                value: v,
                strokeWidth: size / 10,
                color: c,
                backgroundColor: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),
          Text(
            score == null ? '—' : '${(score * 100).round()}',
            style: TextStyle(
                fontSize: size * 0.32,
                fontWeight: FontWeight.w800,
                color: c),
          ),
        ],
      ),
    );
  }

  Widget _resultCard(AppLocalizations loc, CompareResult r) {
    final s = r.score;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: _kCard,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => _openDetail(loc, r),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _scoreRing(s),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(r.manufacturer.name,
                          style: const TextStyle(
                              color: Colors.white60, fontSize: 12.5)),
                      Text(r.product.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: [
                          if (s != null)
                            _pill(_levelLabel(loc, s), _scoreColor(s)),
                          if (r.family != familyOf(_ref!))
                            _pill(familyLabel(loc, r.family), Colors.white70),
                          if (r.coversZoom == true)
                            _pill(loc.fxCmpZoomCovers, _kGood),
                          if (r.coversZoom == false)
                            _pill(loc.fxCmpZoomPartial, _kMid),
                          if (r.incomplete)
                            _pill(loc.fxCmpIncomplete, Colors.white54),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children:
                            _statChips(r.product, lumenDelta: r.lumenDeltaPct),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: Colors.white38),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Détail : comparaison côte à côte ─────────────────────────────────

  void _openDetail(AppLocalizations loc, CompareResult r) {
    final ref = _ref!;
    final p = r.product;

    String na(String? v) => v ?? loc.catalogNotProvided;
    String? lm(Product x) =>
        (x.luminousFluxLumen ?? 0) > 0 ? '${_fmtInt(x.luminousFluxLumen!)} lm' : null;
    String? w(Product x) => (x.powerWatt ?? 0) > 0 ? '${x.powerWatt} W' : null;
    String? kg(Product x) => (x.weightKilogram ?? 0) > 0
        ? '${_fmtNum(x.weightKilogram!)} kg'
        : null;

    final rows = <(String, String, String, CompareCriterion?)>[
      (
        loc.fxCmpCritFamily,
        familyLabel(loc, familyOf(ref)),
        familyLabel(loc, r.family),
        null
      ),
      (loc.fxCmpCritLumen, na(lm(ref)), na(lm(p)), CompareCriterion.lumen),
      (loc.fxCmpCritZoom, na(_fmtZoom(ref)), na(_fmtZoom(p)),
          CompareCriterion.zoom),
      (loc.fxCmpCritCri, na(ref.cri?.toString()), na(p.cri?.toString()),
          CompareCriterion.cri),
      (loc.fxCmpCritSource, na(ref.lightSource), na(p.lightSource),
          CompareCriterion.source),
      (loc.fxCmpCritPower, na(w(ref)), na(w(p)), CompareCriterion.power),
      (loc.fxCmpCritWeight, na(kg(ref)), na(kg(p)), CompareCriterion.weight),
      (loc.fxCmpCritDmx, na(_fmtDmx(ref)), na(_fmtDmx(p)), null),
    ];

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: _kCard,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) {
        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(ctx).height * 0.88),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      _scoreRing(r.score, size: 64),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(loc.fxCmpCompareTitle,
                                style: const TextStyle(
                                    color: Colors.white60, fontSize: 13)),
                            Text(
                              r.score == null
                                  ? loc.fxCmpIncomplete
                                  : _levelLabel(loc, r.score!),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: _scoreColor(r.score)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1.1),
                      1: FlexColumnWidth(1.4),
                      2: FlexColumnWidth(1.4),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: [
                          const SizedBox.shrink(),
                          _colHead('${_refM!.name}\n${ref.name}', _kAccent),
                          _colHead('${r.manufacturer.name}\n${p.name}',
                              _scoreColor(r.score)),
                        ],
                      ),
                      for (final row in rows)
                        TableRow(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: Colors.white.withValues(alpha: 0.06)),
                            ),
                          ),
                          children: [
                            _cell(row.$1, color: Colors.white60),
                            _cell(row.$2, bold: true),
                            _cell(
                              row.$3,
                              bold: true,
                              color: row.$4 == null ||
                                      r.parts[row.$4] == null
                                  ? null
                                  : _scoreColor(r.parts[row.$4]),
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.menu_book_rounded),
                          label: Text(ref.name, overflow: TextOverflow.ellipsis),
                          onPressed: ref.manualUrl == null
                              ? null
                              : () => launchUrl(Uri.parse(ref.manualUrl!)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                              backgroundColor: _kAccent,
                              foregroundColor: Colors.black),
                          icon: const Icon(Icons.menu_book_rounded),
                          label: Text(p.name, overflow: TextOverflow.ellipsis),
                          onPressed: p.manualUrl == null
                              ? null
                              : () => launchUrl(Uri.parse(p.manualUrl!)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  TextButton.icon(
                    style: TextButton.styleFrom(foregroundColor: _kBeta),
                    onPressed: () => _sendFeedback(result: r),
                    icon: const Icon(Icons.flag_outlined, size: 18),
                    label: Text(loc.fxCmpReportResult),
                  ),
                  Text(
                    loc.fxCmpDisclaimer,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: Colors.white38, fontSize: 11.5),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _colHead(String text, Color color) => Padding(
        padding: const EdgeInsets.fromLTRB(6, 0, 6, 10),
        child: Text(text,
            style: TextStyle(
                color: color, fontWeight: FontWeight.w800, fontSize: 13)),
      );

  Widget _cell(String text, {bool bold = false, Color? color}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: color ?? Colors.white,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      );

  // ── Filtres ──────────────────────────────────────────────────────────

  Future<void> _openFilters() async {
    final ref = _ref;
    if (ref == null) return;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: _kCard,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) => _FiltersSheet(
        initial: _filters,
        refCriteria: availableCriteria(ref),
        countFor: _countFor,
        onChanged: (f) => setState(() {
          _filters = f;
          _recompute();
        }),
      ),
    );
  }
}

/// Apparition en cascade (fondu + léger glissement) des cartes de résultat.
class _FadeSlideIn extends StatelessWidget {
  const _FadeSlideIn({super.key, required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final delay = (index < 12 ? index : 12) * 45;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 260 + delay),
      curve: Curves.easeOutCubic,
      builder: (_, v, c) => Opacity(
        opacity: v,
        child: Transform.translate(offset: Offset(0, 14 * (1 - v)), child: c),
      ),
      child: child,
    );
  }
}

class _FiltersSheet extends StatefulWidget {
  const _FiltersSheet({
    required this.initial,
    required this.refCriteria,
    required this.countFor,
    required this.onChanged,
  });

  final CompareFilters initial;
  final Set<CompareCriterion> refCriteria;
  final int Function(CompareFilters) countFor;
  final ValueChanged<CompareFilters> onChanged;

  @override
  State<_FiltersSheet> createState() => _FiltersSheetState();
}

class _FiltersSheetState extends State<_FiltersSheet> {
  late CompareFilters _f = widget.initial;

  void _set(CompareFilters f) {
    setState(() => _f = f);
    widget.onChanged(f);
  }

  Widget _section(String title) => Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 8),
        child: Text(title.toUpperCase(),
            style: const TextStyle(
                fontSize: 11.5,
                letterSpacing: 1.1,
                color: _kAccent,
                fontWeight: FontWeight.w800)),
      );

  Widget _label(String t, {String? hint}) => Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t, style: const TextStyle(fontWeight: FontWeight.w600)),
            if (hint != null)
              Text(hint,
                  style: const TextStyle(color: Colors.white38, fontSize: 12)),
          ],
        ),
      );

  Widget _choice<T>(List<(T, String)> options, T value, ValueChanged<T> on) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        for (final o in options)
          ChoiceChip(
            label: Text(o.$2),
            selected: o.$1 == value,
            selectedColor: _kAccent.withValues(alpha: 0.28),
            onSelected: (_) => on(o.$1),
          ),
      ],
    );
  }

  Widget _switch(String title, bool value, ValueChanged<bool> on,
      {String? subtitle}) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Text(title),
      subtitle: subtitle == null
          ? null
          : Text(subtitle,
              style: const TextStyle(color: Colors.white38, fontSize: 12)),
      value: value,
      activeThumbColor: _kAccent,
      onChanged: on,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final noData = loc.fxCmpRefMissingValue;
    final count = widget.countFor(_f);

    return SafeArea(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 8, 0),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.tune_rounded, color: _kAccent),
                      const SizedBox(width: 8),
                      Text(loc.fxCmpFilters,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800)),
                      const Spacer(),
                      TextButton(
                        onPressed: () => _set(CompareFilters.defaults),
                        child: Text(loc.fxCmpResetFilters),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 8),
                children: [
                  _section(loc.fxCmpCriteriaSection),
                  _label(loc.fxCmpFamily),
                  _choice<FamilyScope>([
                    (FamilyScope.same, loc.fxCmpScopeSame),
                    (FamilyScope.close, loc.fxCmpScopeClose),
                    (FamilyScope.all, loc.fxCmpScopeAll),
                  ], _f.scope, (v) => _set(_f.copyWith(scope: v))),
                  _label(loc.fxCmpLumenTolerance,
                      hint: widget.refCriteria.contains(CompareCriterion.lumen)
                          ? null
                          : noData),
                  _choice<int?>([
                    (null, loc.fxCmpAny),
                    (10, '±10 %'),
                    (20, '±20 %'),
                    (30, '±30 %'),
                    (50, '±50 %'),
                  ], _f.lumenTolerancePct,
                      (v) => _set(_f.copyWith(lumenTolerancePct: () => v))),
                  _label(loc.fxCmpCritZoom,
                      hint: widget.refCriteria.contains(CompareCriterion.zoom)
                          ? null
                          : noData),
                  _switch(loc.fxCmpMustCoverZoom, _f.mustCoverZoom,
                      (v) => _set(_f.copyWith(mustCoverZoom: v))),
                  _label(loc.fxCmpSource),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final k in SourceKind.values)
                        FilterChip(
                          label: Text(
                              _FixtureComparePageState.sourceLabel(loc, k)),
                          selected: _f.sources.contains(k),
                          selectedColor: _kAccent.withValues(alpha: 0.28),
                          onSelected: (on) {
                            final s = {..._f.sources};
                            on ? s.add(k) : s.remove(k);
                            _set(_f.copyWith(sources: s));
                          },
                        ),
                    ],
                  ),
                  _label(loc.fxCmpMinCri),
                  _choice<int?>([
                    (null, loc.fxCmpAny),
                    (80, '80+'),
                    (90, '90+'),
                    (95, '95+'),
                  ], _f.minCri, (v) => _set(_f.copyWith(minCri: () => v))),
                  _section(loc.fxCmpConstraintsSection),
                  _switch(loc.fxCmpSameMotion, _f.sameMotion,
                      (v) => _set(_f.copyWith(sameMotion: v))),
                  _switch(loc.fxCmpOtherBrands, _f.otherBrandsOnly,
                      (v) => _set(_f.copyWith(otherBrandsOnly: v))),
                  _switch(loc.fxCmpLighter, _f.lighterOrEqual,
                      (v) => _set(_f.copyWith(lighterOrEqual: v))),
                  _switch(loc.fxCmpLowerPower, _f.lowerPowerOrEqual,
                      (v) => _set(_f.copyWith(lowerPowerOrEqual: v))),
                  _switch(loc.fxCmpIncludeIncomplete, _f.includeIncomplete,
                      (v) => _set(_f.copyWith(includeIncomplete: v)),
                      subtitle: loc.fxCmpIncludeIncompleteHint),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 6, 18, 12),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: _kAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(loc.fxCmpShowResults(count),
                      style: const TextStyle(fontWeight: FontWeight.w800)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
