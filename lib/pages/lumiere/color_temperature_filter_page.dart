// Calculateur de filtre couleur (CTO/CTB) ↔ température de couleur (Kelvin).
// Basé sur le décalage "mired" (mired = 1 000 000 / K), la méthode standard
// utilisée par les fabricants (Rosco, Lee, GAM...) pour caractériser les
// filtres de correction colorimétrique.
//
// Le catalogue de filtres (marque + code + nom) vient du même fichier que
// les autres outils filtres de l'app (assets/lumiere/filters.json) : on y
// repère les filtres CTO/CTB/CTS/Straw réels de GamColor, Lee, Permacolor,
// Roscolux et e-colour+, et on leur associe un décalage mired standard
// approximatif d'après leur fraction (1/8, 1/4, 1/2, 3/4, Full, Double...).
//
// 3 sens de calcul :
//  1) Source K + Cible K  → quel filtre appliquer ?
//  2) Source K + filtre   → quelle K obtenue ?
//  3) Cible K + filtre    → quelle K de départ fallait-il ?

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccentCct = Color(0xFFFFB703);

// ─────────────────────────────────────────────────────────────────────────────
// CATALOGUE DE FILTRES (chargé depuis assets/lumiere/filters.json)
// ─────────────────────────────────────────────────────────────────────────────

class _CctFilterEntry {
  const _CctFilterEntry({
    required this.brand,
    required this.code,
    required this.name,
    required this.shift,
  });

  final String brand;
  final String code;
  final String name;
  final double shift; // décalage mired signé (CTO > 0, CTB < 0)
}

bool _wordMatch(String haystack, String word) {
  return RegExp(r'\b' + RegExp.escape(word) + r'\b').hasMatch(haystack);
}

/// Repère les filtres de correction colorimétrique (CTO/CTB/CTS/Straw)
/// parmi tous les filtres du catalogue.
bool _isCctFilterName(String name, String code) {
  final n = name.toLowerCase();
  final c = code.toLowerCase();
  if (_wordMatch(n, 'ctb') || _wordMatch(c, 'ctb')) return true;
  if (_wordMatch(n, 'cto') || _wordMatch(c, 'cto')) return true;
  if (_wordMatch(n, 'cts')) return true;
  if (n.contains('ct blue')) return true;
  if (n.contains('ct orange')) return true;
  if (n.contains('ct straw')) return true;
  if (n.contains('ct eight five')) return true;
  return false;
}

/// Estime le décalage mired standard d'un filtre à partir de son nom
/// (Full/3-4/Half/Third/Quarter/Sixth/Eighth/Double/1.5x/Extra...).
/// Valeurs approximatives — cf. disclaimer affiché dans l'outil.
double _classifyShift(String name) {
  final n = name.toLowerCase();

  final isStraw =
      n.contains('straw') && (n.contains('ct straw') || _wordMatch(n, 'cts'));
  if (isStraw) {
    if (n.contains('full')) return 30;
    if (n.contains('half')) return 15;
    if (n.contains('quarter')) return 8;
    if (n.contains('eighth')) return 8;
    return 20;
  }

  int direction;
  if (n.contains('blue') || _wordMatch(n, 'ctb')) {
    direction = -1;
  } else if (n.contains('eight five')) {
    return 85;
  } else {
    direction = 1;
  }

  double mag;
  if (n.contains('double')) {
    mag = 200;
  } else if (n.contains('1.5')) {
    mag = 165;
  } else if (n.contains('three quarter') || n.contains('3/4')) {
    mag = direction < 0 ? 98 : 129;
  } else if (n.contains('half') || n.contains('1/2')) {
    mag = direction < 0 ? 68 : 81;
  } else if (n.contains('third') || n.contains('1/3')) {
    mag = 49;
  } else if (n.contains('quarter') || n.contains('1/4')) {
    mag = direction < 0 ? 35 : 42;
  } else if (n.contains('sixth') || n.contains('1/6')) {
    mag = 24;
  } else if (n.contains('eighth') || n.contains('1/8')) {
    mag = direction < 0 ? 18 : 21;
  } else if (n.contains('extra') || n.contains('plus')) {
    mag = 165;
  } else {
    mag = direction < 0 ? 131 : 159;
  }
  return direction * mag;
}

Future<List<_CctFilterEntry>> _loadCctFilters() async {
  final raw = await rootBundle.loadString('assets/lumiere/filters.json');
  final decoded = jsonDecode(raw) as List<dynamic>;

  final result = <_CctFilterEntry>[];
  for (final item in decoded) {
    final map = item as Map<String, dynamic>;
    final name = (map['name'] as String? ?? '').trim();
    final code = (map['code'] as String? ?? '').trim();
    final brand = (map['brand'] as String? ?? '').trim();
    if (name.isEmpty || code.isEmpty || brand.isEmpty) continue;
    if (!_isCctFilterName(name, code)) continue;
    result.add(_CctFilterEntry(
      brand: brand,
      code: code,
      name: name,
      shift: _classifyShift(name),
    ));
  }

  result.sort((a, b) {
    final bc = a.brand.compareTo(b.brand);
    if (bc != 0) return bc;
    return a.code.compareTo(b.code);
  });
  return result;
}

/// Description qualitative basée sur l'intensité du décalage, pas sur le
/// filtre précis — permet de rester localisé sans devoir traduire chaque
/// référence produit individuellement.
String _shiftDescription(AppLocalizations loc, double shift) {
  final mag = shift.abs();
  if (shift < 0) {
    if (mag <= 20) return loc.cctDescEighthCtb;
    if (mag <= 40) return loc.cctDescQuarterCtb;
    if (mag <= 75) return loc.cctDescHalfCtb;
    if (mag <= 110) return loc.cctDescThreeQuarterCtb;
    return loc.cctDescFullCtb;
  } else {
    if (mag <= 25) return loc.cctDescEighthCto;
    if (mag <= 50) return loc.cctDescQuarterCto;
    if (mag <= 90) return loc.cctDescHalfCto;
    if (mag <= 140) return loc.cctDescThreeQuarterCto;
    return loc.cctDescFullCto;
  }
}

double _mired(double kelvin) => 1000000.0 / kelvin;
double _kelvinFromMired(double mired) => 1000000.0 / mired;

enum _CctMode { findFilter, sourcePlusFilter, targetPlusFilter }

String _modeLabel(AppLocalizations loc, _CctMode m) {
  switch (m) {
    case _CctMode.findFilter:
      return loc.cctModeFindFilter;
    case _CctMode.sourcePlusFilter:
      return loc.cctModeSourcePlusFilter;
    case _CctMode.targetPlusFilter:
      return loc.cctModeTargetPlusFilter;
  }
}

IconData _modeIcon(_CctMode m) {
  switch (m) {
    case _CctMode.findFilter:
      return Icons.search;
    case _CctMode.sourcePlusFilter:
      return Icons.arrow_forward;
    case _CctMode.targetPlusFilter:
      return Icons.arrow_back;
  }
}

class ColorTemperatureFilterPage extends StatefulWidget {
  const ColorTemperatureFilterPage({super.key});

  @override
  State<ColorTemperatureFilterPage> createState() =>
      _ColorTemperatureFilterPageState();
}

class _ColorTemperatureFilterPageState
    extends State<ColorTemperatureFilterPage> {
  bool _isLoading = true;
  List<_CctFilterEntry> _allFilters = [];
  List<String> _brands = [];

  _CctMode _mode = _CctMode.findFilter;
  String? _selectedBrand; // null = toutes les marques
  _CctFilterEntry? _selectedFilter;

  final _sourceCtrl = TextEditingController(text: '3200');
  final _targetCtrl = TextEditingController(text: '5600');

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final entries = await _loadCctFilters();
      final brands = entries.map((e) => e.brand).toSet().toList()..sort();
      if (!mounted) return;
      setState(() {
        _allFilters = entries;
        _brands = brands;
        _selectedFilter = entries.isNotEmpty ? entries.first : null;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _sourceCtrl.dispose();
    _targetCtrl.dispose();
    super.dispose();
  }

  double? _parseK(TextEditingController ctrl) {
    final raw = ctrl.text.replaceAll(',', '.').trim();
    if (raw.isEmpty) return null;
    final v = double.tryParse(raw);
    if (v == null || v <= 0) return null;
    return v;
  }

  List<_CctFilterEntry> get _visibleFilters {
    if (_selectedBrand == null) return _allFilters;
    return _allFilters.where((f) => f.brand == _selectedBrand).toList();
  }

  void _refreshSelectedFilter() {
    final visible = _visibleFilters;
    if (visible.isEmpty) {
      _selectedFilter = null;
    } else if (_selectedFilter == null || !visible.contains(_selectedFilter)) {
      _selectedFilter = visible.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(loc.cctFilterTitle)),
        body:
            const Center(child: CircularProgressIndicator(color: _kAccentCct)),
      );
    }

    final visible = _visibleFilters;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.cctFilterTitle),
        actions: const [
          AboutPinButton(pageId: 'tool:lumiere_cct_filter', sectionId: 'main'),
          SizedBox(width: 4),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 16, 16, 32 + MediaQuery.of(context).padding.bottom),
        children: [
          _IntroCard(loc: loc),
          const SizedBox(height: 12),
          _ModeSelectorCard(
            loc: loc,
            mode: _mode,
            onChanged: (m) => setState(() => _mode = m),
          ),
          const SizedBox(height: 12),
          _BuildCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_mode == _CctMode.findFilter ||
                    _mode == _CctMode.sourcePlusFilter) ...[
                  _KelvinField(
                    label: loc.cctFieldSourceK,
                    controller: _sourceCtrl,
                    onChanged: () => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                ],
                if (_mode == _CctMode.findFilter ||
                    _mode == _CctMode.targetPlusFilter) ...[
                  _KelvinField(
                    label: _mode == _CctMode.findFilter
                        ? loc.cctFieldTargetK
                        : loc.cctFieldTargetKFinal,
                    controller: _targetCtrl,
                    onChanged: () => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                ],

                // Marque de filtre (toujours proposée, restreint la
                // recherche pour le mode 1 et le choix pour les modes 2/3).
                _BrandDropdown(
                  loc: loc,
                  brands: _brands,
                  value: _selectedBrand,
                  onChanged: (b) => setState(() {
                    _selectedBrand = b;
                    _refreshSelectedFilter();
                  }),
                ),

                if (_mode == _CctMode.sourcePlusFilter ||
                    _mode == _CctMode.targetPlusFilter) ...[
                  const SizedBox(height: 12),
                  _FilterDropdown(
                    filters: visible,
                    value: visible.contains(_selectedFilter)
                        ? _selectedFilter
                        : (visible.isNotEmpty ? visible.first : null),
                    onChanged: (f) => setState(() => _selectedFilter = f),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 12),
          _buildResult(loc, visible),
        ],
      ),
    );
  }

  Widget _buildResult(AppLocalizations loc, List<_CctFilterEntry> visible) {
    switch (_mode) {
      case _CctMode.findFilter:
        return _FindFilterResult(
          loc: loc,
          sourceK: _parseK(_sourceCtrl),
          targetK: _parseK(_targetCtrl),
          candidates: visible,
        );
      case _CctMode.sourcePlusFilter:
        if (_selectedFilter == null) {
          return _placeholder(loc.cctFindFilterPlaceholder);
        }
        return _SourcePlusFilterResult(
          loc: loc,
          sourceK: _parseK(_sourceCtrl),
          filter: _selectedFilter!,
        );
      case _CctMode.targetPlusFilter:
        if (_selectedFilter == null) {
          return _placeholder(loc.cctFindFilterPlaceholder);
        }
        return _TargetPlusFilterResult(
          loc: loc,
          targetK: _parseK(_targetCtrl),
          filter: _selectedFilter!,
        );
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// UI COMMUNE
// ─────────────────────────────────────────────────────────────────────────────

class _BuildCard extends StatelessWidget {
  const _BuildCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: child,
    );
  }
}

class _IntroCard extends StatelessWidget {
  const _IntroCard({required this.loc});
  final AppLocalizations loc;

  @override
  Widget build(BuildContext context) {
    return _BuildCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.thermostat, color: _kAccentCct, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              loc.cctFilterIntro,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.75), height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeSelectorCard extends StatelessWidget {
  const _ModeSelectorCard({
    required this.loc,
    required this.mode,
    required this.onChanged,
  });
  final AppLocalizations loc;
  final _CctMode mode;
  final ValueChanged<_CctMode> onChanged;

  @override
  Widget build(BuildContext context) {
    return _BuildCard(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: _CctMode.values.map((m) {
          final selected = m == mode;
          return ChoiceChip(
            label: Text(_modeLabel(loc, m)),
            avatar: Icon(_modeIcon(m),
                size: 16, color: selected ? Colors.black : Colors.white70),
            selected: selected,
            onSelected: (_) => onChanged(m),
            selectedColor: _kAccentCct,
            backgroundColor: Colors.white.withValues(alpha: 0.06),
            labelStyle: TextStyle(
              color: selected ? Colors.black : Colors.white70,
              fontWeight: FontWeight.w700,
              fontSize: 12.5,
            ),
            side: BorderSide(
              color:
                  selected ? _kAccentCct : Colors.white.withValues(alpha: 0.12),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _KelvinField extends StatelessWidget {
  const _KelvinField({
    required this.label,
    required this.controller,
    required this.onChanged,
  });
  final String label;
  final TextEditingController controller;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: (_) => onChanged(),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixText: 'K',
        prefixIcon: const Icon(Icons.wb_incandescent_outlined),
      ),
    );
  }
}

class _BrandDropdown extends StatelessWidget {
  const _BrandDropdown({
    required this.loc,
    required this.brands,
    required this.value,
    required this.onChanged,
  });
  final AppLocalizations loc;
  final List<String> brands;
  final String? value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String?>(
      initialValue: value,
      isExpanded: true,
      dropdownColor: Theme.of(context).cardColor,
      decoration: InputDecoration(
        labelText: loc.cctBrandLabel,
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.business_outlined),
      ),
      items: [
        DropdownMenuItem<String?>(
          value: null,
          child: Text(loc.cctAllBrands,
              style: const TextStyle(color: Colors.white)),
        ),
        ...brands.map((b) => DropdownMenuItem<String?>(
              value: b,
              child: Text(b, style: const TextStyle(color: Colors.white)),
            )),
      ],
      onChanged: onChanged,
    );
  }
}

class _FilterDropdown extends StatelessWidget {
  const _FilterDropdown({
    required this.filters,
    required this.value,
    required this.onChanged,
  });
  final List<_CctFilterEntry> filters;
  final _CctFilterEntry? value;
  final ValueChanged<_CctFilterEntry> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<_CctFilterEntry>(
      initialValue: value,
      isExpanded: true,
      dropdownColor: Theme.of(context).cardColor,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.filter_alt_outlined),
      ),
      items: filters
          .map((f) => DropdownMenuItem(
                value: f,
                child: Text(
                  '${f.brand} ${f.code} — ${f.name}  (${f.shift > 0 ? '+' : ''}${f.shift.toStringAsFixed(0)} mired)',
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
    );
  }
}

class _ResultRow extends StatelessWidget {
  const _ResultRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    const color = _kAccentCct;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.70),
                fontWeight: FontWeight.w600,
                fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            softWrap: true,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _placeholder(String text) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF161622),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
    ),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.white.withValues(alpha: 0.40),
          fontSize: 12.5,
          fontStyle: FontStyle.italic),
    ),
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// MODE 1 — Source K + Cible K → filtre
// ─────────────────────────────────────────────────────────────────────────────

class _FindFilterResult extends StatelessWidget {
  const _FindFilterResult({
    required this.loc,
    required this.sourceK,
    required this.targetK,
    required this.candidates,
  });
  final AppLocalizations loc;
  final double? sourceK;
  final double? targetK;
  final List<_CctFilterEntry> candidates;

  @override
  Widget build(BuildContext context) {
    if (sourceK == null || targetK == null) {
      return _placeholder(loc.cctFindFilterPlaceholder);
    }
    if (candidates.isEmpty) {
      return _placeholder(loc.cctFindFilterPlaceholder);
    }

    final miredSource = _mired(sourceK!);
    final miredTarget = _mired(targetK!);
    final requiredShift = miredTarget - miredSource;

    final sorted = [...candidates]..sort((a, b) => (a.shift - requiredShift)
        .abs()
        .compareTo((b.shift - requiredShift).abs()));
    final best = sorted.first;
    final bestResultK = _kelvinFromMired(miredSource + best.shift);

    return _BuildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.cctRequiredShiftLabel,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.55), fontSize: 12.5),
          ),
          const SizedBox(height: 8),
          _ResultRow(
            label: loc.cctMiredShiftLabel,
            value:
                '${requiredShift > 0 ? '+' : ''}${requiredShift.toStringAsFixed(0)}',
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF00C853).withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: const Color(0xFF00C853).withValues(alpha: 0.35)),
            ),
            child: Row(
              children: [
                const Icon(Icons.emoji_events,
                    color: Color(0xFF00C853), size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    loc.cctBestChoice(
                        '${best.brand} ${best.code} — ${best.name}',
                        bestResultK.round()),
                    style: const TextStyle(
                        color: Color(0xFF00C853),
                        fontWeight: FontWeight.w800,
                        fontSize: 13.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(
            loc.cctOtherFiltersNearby,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.55), fontSize: 12.5),
          ),
          const SizedBox(height: 8),
          ...sorted.skip(1).take(4).map((f) {
            final resultK = _kelvinFromMired(miredSource + f.shift);
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.25),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${f.brand} ${f.code} — ${f.name}',
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.80),
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    loc.cctApproxKelvin(resultK.round()),
                    style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.55),
                        fontFamily: 'monospace',
                        fontSize: 12.5),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 4),
          Text(
            loc.cctDisclaimer,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.35), fontSize: 11.5),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// MODE 2 — Source K + filtre → K résultat
// ─────────────────────────────────────────────────────────────────────────────

class _SourcePlusFilterResult extends StatelessWidget {
  const _SourcePlusFilterResult(
      {required this.loc, required this.sourceK, required this.filter});
  final AppLocalizations loc;
  final double? sourceK;
  final _CctFilterEntry filter;

  @override
  Widget build(BuildContext context) {
    if (sourceK == null) {
      return _placeholder(loc.cctSourcePlaceholder);
    }
    final resultMired = _mired(sourceK!) + filter.shift;
    if (resultMired <= 0) {
      return _placeholder(loc.cctOutOfRange);
    }
    final resultK = _kelvinFromMired(resultMired);

    return _BuildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ResultRow(
              label: loc.cctResultObtainedTemp, value: '${resultK.round()} K'),
          _ResultRow(
              label: loc.cctResultAppliedFilter,
              value: '${filter.brand} ${filter.code} — ${filter.name} '
                  '(${filter.shift > 0 ? '+' : ''}${filter.shift.toStringAsFixed(0)} mired)'),
          Text(
            _shiftDescription(loc, filter.shift),
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.50), fontSize: 12.5),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// MODE 3 — Cible K + filtre → K de départ nécessaire
// ─────────────────────────────────────────────────────────────────────────────

class _TargetPlusFilterResult extends StatelessWidget {
  const _TargetPlusFilterResult(
      {required this.loc, required this.targetK, required this.filter});
  final AppLocalizations loc;
  final double? targetK;
  final _CctFilterEntry filter;

  @override
  Widget build(BuildContext context) {
    if (targetK == null) {
      return _placeholder(loc.cctTargetPlaceholder);
    }
    final sourceMired = _mired(targetK!) - filter.shift;
    if (sourceMired <= 0) {
      return _placeholder(loc.cctOutOfRange);
    }
    final sourceK = _kelvinFromMired(sourceMired);

    return _BuildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ResultRow(
              label: loc.cctResultRequiredSource,
              value: '${sourceK.round()} K'),
          _ResultRow(
              label: loc.cctResultFilterToApply,
              value: '${filter.brand} ${filter.code} — ${filter.name} '
                  '(${filter.shift > 0 ? '+' : ''}${filter.shift.toStringAsFixed(0)} mired)'),
          Text(
            _shiftDescription(loc, filter.shift),
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.50), fontSize: 12.5),
          ),
        ],
      ),
    );
  }
}
