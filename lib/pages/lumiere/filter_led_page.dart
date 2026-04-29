// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ENTRY POINT
// ─────────────────────────────────────────────────────────────────────────────

class FilterLedPage extends StatefulWidget {
  const FilterLedPage({super.key});

  @override
  State<FilterLedPage> createState() => _FilterLedPageState();
}

class _FilterLedPageState extends State<FilterLedPage>
    with SingleTickerProviderStateMixin {
  // ── data ──
  bool _isLoading = true;
  List<FilterEntry> _allFilters = [];
  List<String> _brands = [];

  // ── selections ──
  final TextEditingController _searchController = TextEditingController();
  String _search = '';
  String? _selectedBrand;
  FilterEntry? _selectedFilter;
  LedEngine _selectedEngine = LedEngine.rgbw;
  ColorTemperature _selectedSource = ColorTemperature.tungsten3200;

  // ── calibration ──
  // offset per channel key → value in % (-50 to +50)
  Map<String, double> _calibrationOffset = {};
  bool _calibrationMode = false;

  // ── saved profiles ──
  List<FixtureProfile> _profiles = [];
  FixtureProfile? _activeProfile;

  // ── display ──
  bool _showPercent = true;
  late final TabController _tabController;

  static const String _kProfilesKey = 'filter_led_fixture_profiles_v2';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFilters();
    _loadProfiles();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  // ─── loaders ─────────────────────────────────────────────────────────────

  Future<void> _loadFilters() async {
    try {
      final String raw =
          await rootBundle.loadString('assets/lumiere/filters.json');
      final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;

      final entries = decoded
          .map((e) => FilterEntry.fromJson(e as Map<String, dynamic>))
          .toList()
        ..sort((a, b) {
          final bc = a.brand.compareTo(b.brand);
          if (bc != 0) return bc;
          return _naturalCompare(a.code, b.code);
        });

      final brands = entries.map((e) => e.brand).toSet().toList()..sort();

      setState(() {
        _allFilters = entries;
        _brands = brands;
        _selectedBrand = brands.isNotEmpty ? brands.first : null;
        _selectedFilter =
            _visibleFilters.isNotEmpty ? _visibleFilters.first : null;
        _isLoading = false;
      });
    } catch (_) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadProfiles() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kProfilesKey);
    if (raw == null) return;
    try {
      final list = (jsonDecode(raw) as List<dynamic>)
          .map((e) => FixtureProfile.fromJson(e as Map<String, dynamic>))
          .toList();
      setState(() => _profiles = list);
    } catch (_) {}
  }

  Future<void> _saveProfiles() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _kProfilesKey,
      jsonEncode(_profiles.map((p) => p.toJson()).toList()),
    );
  }

  // ─── helpers ─────────────────────────────────────────────────────────────

  static int _naturalCompare(String a, String b) {
    final re = RegExp(r'(\d+)|(\D+)');
    final ap = re.allMatches(a).map((m) => m.group(0) ?? '').toList();
    final bp = re.allMatches(b).map((m) => m.group(0) ?? '').toList();
    final len = math.min(ap.length, bp.length);
    for (var i = 0; i < len; i++) {
      final na = int.tryParse(ap[i]);
      final nb = int.tryParse(bp[i]);
      if (na != null && nb != null) {
        if (na != nb) return na.compareTo(nb);
      } else {
        final c = ap[i].compareTo(bp[i]);
        if (c != 0) return c;
      }
    }
    return ap.length.compareTo(bp.length);
  }

  List<FilterEntry> get _visibleFilters {
    final brand = _selectedBrand ?? '';
    final q = _search.trim().toLowerCase();
    return _allFilters.where((item) {
      if (item.brand != brand) return false;
      if (q.isEmpty) return true;
      return '${item.code} ${item.name}'.toLowerCase().contains(q);
    }).toList();
  }

  void _refreshSelectedFilter() {
    final visible = _visibleFilters;
    if (visible.isEmpty) {
      _selectedFilter = null;
    } else if (_selectedFilter == null || !visible.contains(_selectedFilter)) {
      _selectedFilter = visible.first;
    }
  }

  LedResult? get _currentResult {
    final f = _selectedFilter;
    if (f == null) return null;
    return FilterLedAlgorithm.convert(
      filter: f,
      engine: _selectedEngine,
      source: _selectedSource,
      offsets: _calibrationOffset,
    );
  }

  // ─── profile management ──────────────────────────────────────────────────

  void _applyProfile(FixtureProfile p) {
    setState(() {
      _activeProfile = p;
      _selectedEngine = p.engine;
      _calibrationOffset = Map.from(p.offsets);
    });
  }

  void _clearProfile() {
    setState(() {
      _activeProfile = null;
      _calibrationOffset = {};
    });
  }

  Future<void> _showSaveProfileDialog() async {
    final loc = AppLocalizations.of(context);
    final nameCtrl = TextEditingController(
      text: _activeProfile?.name ?? '',
    );

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        title: Text(loc.lightFilterLedSaveProfileTitle),
        content: TextField(
          controller: nameCtrl,
          autofocus: true,
          decoration: InputDecoration(
            labelText: loc.lightFilterLedProfileNameLabel,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(loc.commonCancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(loc.commonSave),
          ),
        ],
      ),
    );

    if (confirmed != true) return;
    final name = nameCtrl.text.trim();
    if (name.isEmpty) return;

    final profile = FixtureProfile(
      name: name,
      engine: _selectedEngine,
      offsets: Map.from(_calibrationOffset),
    );

    setState(() {
      _profiles.removeWhere((p) => p.name == name);
      _profiles.add(profile);
      _activeProfile = profile;
    });
    await _saveProfiles();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loc.lightFilterLedProfileSaved(name)),
          backgroundColor: Colors.green.shade800,
        ),
      );
    }
  }

  Future<void> _deleteProfile(FixtureProfile p) async {
    setState(() {
      _profiles.remove(p);
      if (_activeProfile == p) {
        _activeProfile = null;
        _calibrationOffset = {};
      }
    });
    await _saveProfiles();
  }

  // ─── UI ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(loc.lightFilterLedTitle)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.lightFilterLedTitle),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Icons.palette_outlined),
              text: loc.lightFilterLedTabConvert,
            ),
            Tab(
              icon: const Icon(Icons.tune),
              text: loc.lightFilterLedTabProfiles,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildConvertTab(loc),
          _buildProfilesTab(loc),
        ],
      ),
    );
  }

  // ─── TAB 1 : CONVERT ─────────────────────────────────────────────────────

  Widget _buildConvertTab(AppLocalizations loc) {
    final theme = Theme.of(context);
    final visible = _visibleFilters;
    final selected = _selectedFilter;
    final result = _currentResult;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      children: [
        // ── active profile banner ──
        if (_activeProfile != null)
          _ProfileBanner(
            profile: _activeProfile!,
            onClear: _clearProfile,
          ),

        if (_activeProfile != null) const SizedBox(height: 8),

        // ── selection card ──
        _BlockCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // brand
              DropdownButtonFormField<String>(
                initialValue: _selectedBrand,
                decoration: InputDecoration(
                  labelText: loc.lightFilterLedBrandLabel,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.business_outlined),
                ),
                items: _brands
                    .map((b) => DropdownMenuItem(value: b, child: Text(b)))
                    .toList(),
                onChanged: (v) {
                  if (v == null) return;
                  setState(() {
                    _selectedBrand = v;
                    _refreshSelectedFilter();
                  });
                },
              ),

              const SizedBox(height: 12),

              // search
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: loc.lightFilterLedSearchLabel,
                  hintText: loc.lightFilterLedSearchHint,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _search.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _search = '';
                              _refreshSelectedFilter();
                            });
                          },
                        ),
                ),
                onChanged: (v) {
                  setState(() {
                    _search = v;
                    _refreshSelectedFilter();
                  });
                },
              ),

              const SizedBox(height: 12),

              // filter
              DropdownButtonFormField<FilterEntry>(
                initialValue: visible.contains(selected)
                    ? selected
                    : (visible.isNotEmpty ? visible.first : null),
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: loc.lightFilterLedFilterLabel,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.filter_alt_outlined),
                ),
                items: visible
                    .map((f) => DropdownMenuItem(
                          value: f,
                          child: Text(
                            '${f.code} — ${f.name}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                onChanged: (v) => setState(() => _selectedFilter = v),
              ),

              const SizedBox(height: 12),

              // source / color temperature
              DropdownButtonFormField<ColorTemperature>(
                initialValue: _selectedSource,
                decoration: InputDecoration(
                  labelText: loc.lightFilterLedSourceLabel,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.wb_incandescent_outlined),
                ),
                items: ColorTemperature.values
                    .map((ct) => DropdownMenuItem(
                          value: ct,
                          child: Text(ct.label),
                        ))
                    .toList(),
                onChanged: (v) {
                  if (v == null) return;
                  setState(() => _selectedSource = v);
                },
              ),

              const SizedBox(height: 12),

              // LED engine
              DropdownButtonFormField<LedEngine>(
                initialValue: _selectedEngine,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: loc.lightFilterLedEngineLabel,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lightbulb_outline),
                ),
                items: LedEngine.values
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.label,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                onChanged: (v) {
                  if (v == null) return;
                  setState(() {
                    _selectedEngine = v;
                    // reset offset when engine changes (channels differ)
                    _calibrationOffset = {};
                    _activeProfile = null;
                  });
                },
              ),

              const SizedBox(height: 12),

              // show % toggle
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                value: _showPercent,
                title: Text(loc.lightFilterLedShowPercentLabel),
                onChanged: (v) => setState(() => _showPercent = v),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // ── result card ──
        if (selected != null && result != null) ...[
          // filter preview
          _FilterPreviewCard(filter: selected, source: _selectedSource),

          const SizedBox(height: 12),

          // channels result
          _ResultCard(
            result: result,
            showPercent: _showPercent,
            filter: selected,
            calibrationMode: _calibrationMode,
            offsets: _calibrationOffset,
            onOffsetChanged: (key, val) {
              setState(() => _calibrationOffset[key] = val);
            },
            onToggleCalibration: () {
              setState(() => _calibrationMode = !_calibrationMode);
            },
            onSaveProfile: _showSaveProfileDialog,
          ),
        ],

        const SizedBox(height: 12),

        // disclaimer
        _BlockCard(
          child: Text(
            loc.lightFilterLedDisclaimer,
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.white60),
          ),
        ),
      ],
    );
  }

  // ─── TAB 2 : PROFILES ────────────────────────────────────────────────────

  Widget _buildProfilesTab(AppLocalizations loc) {
    if (_profiles.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.tune, size: 64, color: Colors.white24),
              const SizedBox(height: 16),
              Text(
                loc.lightFilterLedNoProfiles,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white54),
              ),
              const SizedBox(height: 8),
              Text(
                loc.lightFilterLedNoProfilesHint,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white38, fontSize: 13),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      itemCount: _profiles.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (ctx, i) {
        final p = _profiles[i];
        final isActive = _activeProfile == p;
        return _ProfileCard(
          profile: p,
          isActive: isActive,
          onApply: () {
            _applyProfile(p);
            _tabController.animateTo(0);
          },
          onDelete: () => _deleteProfile(p),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// WIDGETS
// ─────────────────────────────────────────────────────────────────────────────

class _BlockCard extends StatelessWidget {
  const _BlockCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}

// ── Filter Preview Card ──────────────────────────────────────────────────────

class _FilterPreviewCard extends StatelessWidget {
  const _FilterPreviewCard({
    required this.filter,
    required this.source,
  });

  final FilterEntry filter;
  final ColorTemperature source;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final corrected = ColorTemperatureCorrection.apply(filter.rgb, source);
    final correctedColor = Color.fromARGB(255, corrected.r.clamp(0, 255),
        corrected.g.clamp(0, 255), corrected.b.clamp(0, 255));

    return _BlockCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // original swatch
              _ColorSwatch(
                color: filter.displayColor,
                label: 'Filtre',
                size: 56,
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Colors.white38, size: 18),
              const SizedBox(width: 8),
              // corrected swatch (with source)
              _ColorSwatch(
                color: correctedColor,
                label: source.shortLabel,
                size: 56,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${filter.brand} ${filter.code}',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      filter.name,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.white70),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      filter.hex.toUpperCase(),
                      style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white38, fontFamily: 'monospace'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (filter.transmissionY != null) ...[
            const SizedBox(height: 12),
            _TransmissionBar(value: filter.transmissionY! / 100.0),
          ],
        ],
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({
    required this.color,
    required this.label,
    this.size = 48,
  });
  final Color color;
  final String label;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white12),
          ),
        ),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.white38, fontSize: 10)),
      ],
    );
  }
}

class _TransmissionBar extends StatelessWidget {
  const _TransmissionBar({required this.value});
  final double value; // 0.0 → 1.0

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Transmission',
                style: const TextStyle(color: Colors.white54, fontSize: 12)),
            Text('${(value * 100).toStringAsFixed(1)} %',
                style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 6,
            backgroundColor: Colors.white12,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white54),
          ),
        ),
      ],
    );
  }
}

// ── Result Card ──────────────────────────────────────────────────────────────

class _ResultCard extends StatelessWidget {
  const _ResultCard({
    required this.result,
    required this.showPercent,
    required this.filter,
    required this.calibrationMode,
    required this.offsets,
    required this.onOffsetChanged,
    required this.onToggleCalibration,
    required this.onSaveProfile,
  });

  final LedResult result;
  final bool showPercent;
  final FilterEntry filter;
  final bool calibrationMode;
  final Map<String, double> offsets;
  final void Function(String key, double val) onOffsetChanged;
  final VoidCallback onToggleCalibration;
  final VoidCallback onSaveProfile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _BlockCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          Row(
            children: [
              Expanded(
                child: Text(
                  'Résultat LED',
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              // calibration toggle
              IconButton(
                icon: Icon(
                  Icons.tune,
                  color: calibrationMode ? Colors.amber : Colors.white38,
                ),
                tooltip: calibrationMode
                    ? 'Masquer calibration'
                    : 'Calibrer ma fixture',
                onPressed: onToggleCalibration,
              ),
              // save profile
              IconButton(
                icon: const Icon(Icons.save_outlined, color: Colors.white38),
                tooltip: 'Sauvegarder le profil',
                onPressed: onSaveProfile,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // channel bars
          ...result.channels.entries.map((entry) {
            final key = entry.key;
            final rawPct = entry.value / 255.0 * 100.0;
            final offset = offsets[key] ?? 0.0;
            final finalPct = (rawPct + offset).clamp(0.0, 100.0);
            final finalVal = (finalPct / 100.0 * 255.0).round();

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ChannelBar(
                label: key,
                rawPercent: rawPct,
                finalPercent: finalPct,
                finalValue: finalVal,
                showPercent: showPercent,
                calibrationMode: calibrationMode,
                offset: offset,
                onOffsetChanged: (val) => onOffsetChanged(key, val),
              ),
            );
          }),

          const SizedBox(height: 8),

          // color preview comparison
          _ColorComparisonBar(
            original: filter.displayColor,
            approximated: result.previewColor,
          ),
        ],
      ),
    );
  }
}

class _ChannelBar extends StatelessWidget {
  const _ChannelBar({
    required this.label,
    required this.rawPercent,
    required this.finalPercent,
    required this.finalValue,
    required this.showPercent,
    required this.calibrationMode,
    required this.offset,
    required this.onOffsetChanged,
  });

  final String label;
  final double rawPercent;
  final double finalPercent;
  final int finalValue;
  final bool showPercent;
  final bool calibrationMode;
  final double offset;
  final ValueChanged<double> onOffsetChanged;

  static const Map<String, Color> _channelColors = {
    'R': Color(0xFFEF5350),
    'G': Color(0xFF66BB6A),
    'B': Color(0xFF42A5F5),
    'W': Color(0xFFF5F5F5),
    'WW': Color(0xFFFFB300),
    'CW': Color(0xFFB3E5FC),
    'A': Color(0xFFFFB74D),
    'UV': Color(0xFF9C27B0),
    'L': Color(0xFFCDDC39),
    'CY': Color(0xFF00BCD4),
    'MI': Color(0xFFFF7043),
    // ETC Source Four LED
    'DR': Color(0xFFB71C1C), // Deep Red
    'Li': Color(0xFFAED581), // Lime
    'Cy': Color(0xFF26C6DA), // Cyan ETC
    'In': Color(0xFF5C6BC0), // Indigo
    'RO': Color(0xFFFF7043), // Red-Orange
    'Mi': Color(0xFF80CBC4), // Mint
  };

  Color get _color => _channelColors[label] ?? const Color(0xFF90A4AE);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayValue =
        showPercent ? '${finalPercent.toStringAsFixed(1)} %' : '$finalValue';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // channel label badge
            Container(
              width: 36,
              height: 24,
              decoration: BoxDecoration(
                color: _color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: _color.withValues(alpha: 0.4)),
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: _color,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // bar
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: finalPercent / 100.0,
                  minHeight: 10,
                  backgroundColor: Colors.white10,
                  valueColor: AlwaysStoppedAnimation<Color>(_color),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // value
            SizedBox(
              width: 64,
              child: Text(
                displayValue,
                textAlign: TextAlign.right,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ],
        ),

        // calibration slider
        if (calibrationMode) ...[
          const SizedBox(height: 4),
          Row(
            children: [
              const SizedBox(width: 46),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 7),
                    activeTrackColor: _color.withValues(alpha: 0.6),
                    inactiveTrackColor: Colors.white12,
                    thumbColor: _color,
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 14),
                  ),
                  child: Slider(
                    min: -50,
                    max: 50,
                    divisions: 200,
                    value: offset.clamp(-50.0, 50.0),
                    onChanged: onOffsetChanged,
                  ),
                ),
              ),
              SizedBox(
                width: 64,
                child: Text(
                  offset >= 0
                      ? '+${offset.toStringAsFixed(1)}%'
                      : '${offset.toStringAsFixed(1)}%',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 11,
                    color: offset == 0 ? Colors.white38 : Colors.amber,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _ColorComparisonBar extends StatelessWidget {
  const _ColorComparisonBar({
    required this.original,
    required this.approximated,
  });
  final Color original;
  final Color approximated;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 24, color: Colors.white12),
        Text('Comparaison couleur',
            style: const TextStyle(color: Colors.white54, fontSize: 12)),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(height: 32, color: original),
                    const SizedBox(height: 4),
                    const Text('Filtre',
                        style: TextStyle(color: Colors.white38, fontSize: 11)),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  children: [
                    Container(height: 32, color: approximated),
                    const SizedBox(height: 4),
                    const Text('LED',
                        style: TextStyle(color: Colors.white38, fontSize: 11)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Profile Widgets ──────────────────────────────────────────────────────────

class _ProfileBanner extends StatelessWidget {
  const _ProfileBanner({required this.profile, required this.onClear});
  final FixtureProfile profile;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.amber.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.amber.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.tune, color: Colors.amber, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              profile.name,
              style: const TextStyle(
                  color: Colors.amber, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            profile.engine.label,
            style: const TextStyle(color: Colors.amber, fontSize: 12),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 16, color: Colors.amber),
            onPressed: onClear,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({
    required this.profile,
    required this.isActive,
    required this.onApply,
    required this.onDelete,
  });
  final FixtureProfile profile;
  final bool isActive;
  final VoidCallback onApply;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final hasOffsets = profile.offsets.values.any((v) => v != 0);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isActive
            ? const BorderSide(color: Colors.amber, width: 1.5)
            : BorderSide.none,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor:
              isActive ? Colors.amber.withValues(alpha: 0.2) : Colors.white10,
          child: Icon(
            Icons.memory_outlined,
            color: isActive ? Colors.amber : Colors.white54,
          ),
        ),
        title: Text(
          profile.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.amber : Colors.white,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profile.engine.label,
              style: const TextStyle(color: Colors.white54),
            ),
            if (hasOffsets)
              Text(
                _offsetSummary(profile.offsets),
                style: const TextStyle(color: Colors.white38, fontSize: 11),
              ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isActive)
              TextButton(
                onPressed: onApply,
                child: const Text('Appliquer'),
              ),
            IconButton(
              icon: const Icon(Icons.delete_outline,
                  color: Colors.redAccent, size: 20),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }

  String _offsetSummary(Map<String, double> offsets) {
    final parts = offsets.entries.where((e) => e.value != 0).map((e) {
      final v = e.value;
      return '${e.key}: ${v > 0 ? '+' : ''}${v.toStringAsFixed(0)}%';
    }).toList();
    return parts.join(' · ');
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// MODELS
// ─────────────────────────────────────────────────────────────────────────────

class FilterEntry {
  const FilterEntry({
    required this.brand,
    required this.code,
    required this.name,
    required this.hex,
    required this.rgb,
    this.xy,
    this.transmissionY,
    this.etcLustrX8,
  });

  final String brand;
  final String code;
  final String name;
  final String hex;
  final RgbColor rgb;
  final Chromaticity? xy;
  final double? transmissionY;

  // Données ETC officielles si disponibles
  final Map<String, int>? etcLustrX8;

  factory FilterEntry.fromJson(Map<String, dynamic> json) {
    final rgbJson =
        (json['rgb'] as Map<String, dynamic>?) ?? <String, dynamic>{};
    final xyJson = json['xy'] as Map<String, dynamic>?;
    final etcJson = json['etcLustrX8'] as Map<String, dynamic>?;

    return FilterEntry(
      brand: (json['brand'] as String? ?? '').trim(),
      code: (json['code'] as String? ?? '').trim(),
      name: (json['name'] as String? ?? '').trim(),
      hex: (json['hex'] as String? ?? '#000000').trim(),
      rgb: RgbColor(
        r: (rgbJson['r'] as num? ?? 0).round().clamp(0, 255),
        g: (rgbJson['g'] as num? ?? 0).round().clamp(0, 255),
        b: (rgbJson['b'] as num? ?? 0).round().clamp(0, 255),
      ),
      xy: xyJson == null
          ? null
          : Chromaticity(
              x: (xyJson['x'] as num? ?? 0).toDouble(),
              y: (xyJson['y'] as num? ?? 0).toDouble(),
            ),
      transmissionY: (json['transmissionY'] as num?)?.toDouble(),
      etcLustrX8: etcJson?.map(
        (k, v) => MapEntry(k, ((v as num?) ?? 0).round().clamp(0, 100)),
      ),
    );
  }

  Color get displayColor => Color.fromARGB(255, rgb.r, rgb.g, rgb.b);
}

class RgbColor {
  const RgbColor({required this.r, required this.g, required this.b});
  final int r;
  final int g;
  final int b;
}

class Chromaticity {
  const Chromaticity({required this.x, required this.y});
  final double x;
  final double y;
}

class LedResult {
  const LedResult({required this.channels, required this.previewColor});
  final Map<String, int> channels; // key → 0..255
  final Color previewColor;
}

// ── Fixture Profile ──────────────────────────────────────────────────────────

class FixtureProfile {
  FixtureProfile({
    required this.name,
    required this.engine,
    required this.offsets,
  });

  final String name;
  final LedEngine engine;
  final Map<String, double> offsets;

  factory FixtureProfile.fromJson(Map<String, dynamic> json) {
    final rawOffsets = (json['offsets'] as Map<String, dynamic>?) ?? {};
    return FixtureProfile(
      name: json['name'] as String? ?? '',
      engine: LedEngine.values.firstWhere(
        (e) => e.name == json['engine'],
        orElse: () => LedEngine.rgb,
      ),
      offsets: rawOffsets.map((k, v) => MapEntry(k, (v as num).toDouble())),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'engine': engine.name,
        'offsets': offsets,
      };
}

// ─────────────────────────────────────────────────────────────────────────────
// ENUMS
// ─────────────────────────────────────────────────────────────────────────────

/// Color temperature / light source
enum ColorTemperature {
  tungsten2800('Tungstène 2800 K', '2800K'),
  tungsten3200('Tungstène 3200 K', '3200K'),
  halogen3400('Halogène 3400 K', '3400K'),
  fluorescent4000('Fluorescent 4000 K', '4000K'),
  daylight5600('Lumière du jour 5600 K', '5600K'),
  hmi6000('HMI 6000 K', '6000K'),
  sky7500('Ciel bleu 7500 K', '7500K');

  const ColorTemperature(this.label, this.shortLabel);
  final String label;
  final String shortLabel;
}

/// LED engine types
enum LedEngine {
  rgb('RGB', ['R', 'G', 'B']),
  rgbw('RGBW', ['R', 'G', 'B', 'W']),
  rgbww('RGBWW', ['R', 'G', 'B', 'WW', 'CW']),
  rgba('RGBA', ['R', 'G', 'B', 'A']),
  rgbaw('RGBAW', ['R', 'G', 'B', 'A', 'W']),
  rgbauv('RGBAUV', ['R', 'G', 'B', 'A', 'UV']),
  rgbwauv('RGBWAUV', ['R', 'G', 'B', 'W', 'A', 'UV']),
  rgbl('RGBL', ['R', 'G', 'B', 'L']),
  rgbal('RGBAL', ['R', 'G', 'B', 'A', 'L']),
  rgbrcl('RGBRCL', ['R', 'G', 'B', 'RC', 'CY', 'L']),
  cmy('CMY', ['C', 'M', 'Y']),

  // ── ETC Source Four LED ────────────────────────────────────────
  etcLustrS2('ETC Lustr S2 (R-Li-A-G-Cy-B-In)',
      ['R', 'Li', 'A', 'G', 'Cy', 'B', 'In']),
  etcLustrPlus('ETC Lustr+ S1 (R-RO-Mi-B-In)', ['R', 'RO', 'Mi', 'B', 'In']),
  etcLustrX8('ETC Lustr X8 S3 (DR-R-A-Li-G-Cy-B-In)',
      ['DR', 'R', 'A', 'Li', 'G', 'Cy', 'B', 'In']);

  const LedEngine(this.label, this.channels);
  final String label;
  final List<String> channels;
}

// ─────────────────────────────────────────────────────────────────────────────
// COLOR TEMPERATURE CORRECTION
// ─────────────────────────────────────────────────────────────────────────────

class ColorTemperatureCorrection {
  /// Returns the RGB of a standard tungsten 3200 K white adjusted
  /// for the given color temperature source.
  static RgbColor apply(RgbColor rgb, ColorTemperature source) {
    // Each source has a correction factor per channel
    // relative to the reference 3200 K tungsten lamp.
    // Values derived from standard CIE correlated color temperature tables.
    final (double rFactor, double gFactor, double bFactor) = _factors(source);

    return RgbColor(
      r: (rgb.r * rFactor).round().clamp(0, 255),
      g: (rgb.g * gFactor).round().clamp(0, 255),
      b: (rgb.b * bFactor).round().clamp(0, 255),
    );
  }

  static (double, double, double) _factors(ColorTemperature ct) {
    // (R, G, B) multiplicative factors
    // lower R = bluer (cooler), lower B = warmer
    switch (ct) {
      case ColorTemperature.tungsten2800:
        return (1.08, 0.97, 0.80);
      case ColorTemperature.tungsten3200:
        return (1.00, 1.00, 1.00); // reference
      case ColorTemperature.halogen3400:
        return (0.96, 1.01, 1.07);
      case ColorTemperature.fluorescent4000:
        return (0.91, 1.02, 1.18);
      case ColorTemperature.daylight5600:
        return (0.84, 1.01, 1.35);
      case ColorTemperature.hmi6000:
        return (0.80, 1.00, 1.48);
      case ColorTemperature.sky7500:
        return (0.72, 0.97, 1.70);
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ALGORITHM
// ─────────────────────────────────────────────────────────────────────────────

class FilterLedAlgorithm {
  static LedResult convert({
    required FilterEntry filter,
    required LedEngine engine,
    required ColorTemperature source,
    Map<String, double> offsets = const {},
  }) {
    // 1 — Apply color temperature correction
    final corrected = ColorTemperatureCorrection.apply(filter.rgb, source);

    final double r = corrected.r / 255.0;
    final double g = corrected.g / 255.0;
    final double b = corrected.b / 255.0;

    // 2 — Compute base channels
    final Map<String, double> base = _computeBase(r, g, b, engine, filter);

    // 3 — Apply calibration offsets (in %)
    final Map<String, double> calibrated = {};
    for (final entry in base.entries) {
      final offset = (offsets[entry.key] ?? 0.0) / 100.0;
      calibrated[entry.key] = _clamp01(entry.value + offset);
    }

    // 4 — Build result
    final Map<String, int> channels = {};
    for (final entry in calibrated.entries) {
      channels[entry.key] = (entry.value * 255.0).round().clamp(0, 255);
    }

    // 5 — Reconstruct preview color from channels
    final preview = _reconstructPreview(calibrated);

    return LedResult(channels: channels, previewColor: preview);
  }

  // ─── Base computation per engine ─────────────────────────────────────────

  static Map<String, double> _computeBase(
      double r, double g, double b, LedEngine engine, FilterEntry filter) {
    switch (engine) {
      case LedEngine.rgb:
        return {'R': r, 'G': g, 'B': b};

      case LedEngine.rgbw:
        {
          final w = math.min(r, math.min(g, b));
          return {
            'R': _clamp01(r - w),
            'G': _clamp01(g - w),
            'B': _clamp01(b - w),
            'W': w,
          };
        }

      case LedEngine.rgbww:
        {
          // Split white into warm (WW) and cool (CW) components
          final w = math.min(r, math.min(g, b));
          // Warm fraction based on red channel dominance over blue
          final warmRatio = _clamp01((r - b + 1.0) / 2.0);
          final ww = w * warmRatio;
          final cw = w * (1.0 - warmRatio);
          return {
            'R': _clamp01(r - w),
            'G': _clamp01(g - w),
            'B': _clamp01(b - w),
            'WW': ww,
            'CW': cw,
          };
        }

      case LedEngine.rgba:
        {
          final a = _extractAmber(r, g, b);
          return {
            'R': _clamp01(r - a * 0.55),
            'G': _clamp01(g - a * 0.25),
            'B': b,
            'A': a,
          };
        }

      case LedEngine.rgbaw:
        {
          final w = math.min(r, math.min(g, b)) * 0.85;
          final a =
              _extractAmber(_clamp01(r - w), _clamp01(g - w), _clamp01(b - w));
          return {
            'R': _clamp01(r - w - a * 0.55),
            'G': _clamp01(g - w - a * 0.25),
            'B': _clamp01(b - w),
            'A': a,
            'W': w,
          };
        }

      case LedEngine.rgbauv:
        {
          final a = _extractAmber(r, g, b);
          final uv = _extractUv(r, g, b);
          return {
            'R': _clamp01(r - a * 0.55),
            'G': _clamp01(g - a * 0.25),
            'B': _clamp01(b - uv * 0.6),
            'A': a,
            'UV': uv,
          };
        }

      case LedEngine.rgbwauv:
        {
          final w = math.min(r, math.min(g, b)) * 0.70;
          final a =
              _extractAmber(_clamp01(r - w), _clamp01(g - w), _clamp01(b - w));
          final uv = _extractUv(r, g, b);
          return {
            'R': _clamp01(r - w - a * 0.55),
            'G': _clamp01(g - w - a * 0.25),
            'B': _clamp01(b - w - uv * 0.6),
            'W': w,
            'A': a,
            'UV': uv,
          };
        }

      case LedEngine.rgbl:
        {
          final l = _extractLime(r, g, b);
          return {
            'R': _clamp01(r - l * 0.20),
            'G': _clamp01(g - l * 0.45),
            'B': _clamp01(b - l * 0.05),
            'L': l,
          };
        }

      case LedEngine.rgbal:
        {
          final a = _extractAmber(r, g, b);
          final l =
              _extractLime(_clamp01(r - a * 0.30), _clamp01(g - a * 0.10), b);
          return {
            'R': _clamp01(r - a * 0.50 - l * 0.15),
            'G': _clamp01(g - a * 0.20 - l * 0.40),
            'B': _clamp01(b - l * 0.05),
            'A': a,
            'L': l,
          };
        }

      case LedEngine.rgbrcl:
        {
          // R, G, B, Red-orange (RC), Cyan (CY), Lime (L)
          final rc = _clamp01((r - b) * 0.4); // red-orange component
          final cy = _clamp01((g + b) / 2.0 - r * 0.5); // cyan component
          final l = _extractLime(r, g, b);
          return {
            'R': _clamp01(r - rc * 0.6 - l * 0.1),
            'G': _clamp01(g - cy * 0.4 - l * 0.3),
            'B': _clamp01(b - cy * 0.5),
            'RC': rc,
            'CY': cy,
            'L': l,
          };
        }

      case LedEngine.cmy:
        {
          // CMY is subtractive — invert RGB
          return {
            'C': _clamp01(1.0 - r),
            'M': _clamp01(1.0 - g),
            'Y': _clamp01(1.0 - b),
          };
        }

      // ── ETC Source Four LED ─────────────────────────────────────────────

      case LedEngine.etcLustrS2:
        {
          // Series 2 Lustr — 7 couleurs : Red, Lime, Amber, Green, Cyan, Blue, Indigo
          // Algorithme : décomposition spectrale sur les 7 emetteurs ETC x7
          final li = _extractLime(r, g, b);
          final a =
              _extractAmber(_clamp01(r - li * 0.3), _clamp01(g - li * 0.5), b);
          final cy = _clamp01((g * 0.4 + b * 0.6) - r * 0.5);
          final ind = _clamp01(b * 0.6 - r * 0.3 - g * 0.2);
          final nr = _clamp01(r - a * 0.7 - li * 0.2);
          final ng = _clamp01(g - li * 0.6 - cy * 0.5);
          final nb = _clamp01(b - cy * 0.5 - ind * 0.7);
          return {
            'R': nr,
            'Li': li,
            'A': a,
            'G': ng,
            'Cy': cy,
            'B': nb,
            'In': ind,
          };
        }

      case LedEngine.etcLustrPlus:
        {
          // Lustr+ Series 1 — 5 couleurs : Red, Red-Orange, Mint, Blue, Indigo
          final ro = _clamp01((r - b) * 0.5); // red-orange = chaud sans bleu
          final mi =
              _clamp01(g * 0.4 + b * 0.3 - r * 0.3); // mint = vert-bleu doux
          final ind = _clamp01(b * 0.5 - r * 0.2);
          final nr = _clamp01(r - ro * 0.6);
          final nb = _clamp01(b - ind * 0.5 - mi * 0.3);
          return {
            'R': nr,
            'RO': ro,
            'Mi': mi,
            'B': nb,
            'In': ind,
          };
        }

      case LedEngine.etcLustrX8:
        {
          // Lustr X8 Series 3 — utilise les données officielles ETC si disponibles
          // sinon algorithme de calcul
          if (filter.etcLustrX8 != null) {
            // Vraies valeurs calibrées ETC (en %)
            final etc = filter.etcLustrX8!;
            return {
              'DR': etc['DR']! / 100.0,
              'R': etc['R']! / 100.0,
              'A': etc['A']! / 100.0,
              'Li': etc['Li']! / 100.0,
              'G': etc['G']! / 100.0,
              'Cy': etc['Cy']! / 100.0,
              'B': etc['B']! / 100.0,
              'In': etc['In']! / 100.0,
            };
          }
          // Fallback algorithmique
          final dr = _clamp01(r * 0.35 - g * 0.2 - b * 0.1);
          final li = _extractLime(_clamp01(r - dr * 0.5), g, b);
          final a = _extractAmber(
              _clamp01(r - dr * 0.4 - li * 0.2), _clamp01(g - li * 0.4), b);
          final cy = _clamp01((g * 0.4 + b * 0.5) - r * 0.4);
          final ind = _clamp01(b * 0.55 - r * 0.25 - g * 0.15);
          final nr = _clamp01(r - dr * 0.8 - a * 0.6 - li * 0.15);
          final ng = _clamp01(g - li * 0.55 - cy * 0.45);
          final nb = _clamp01(b - cy * 0.45 - ind * 0.65);
          return {
            'DR': dr,
            'R': nr,
            'A': a,
            'Li': li,
            'G': ng,
            'Cy': cy,
            'B': nb,
            'In': ind,
          };
        }
    }
  }

  // ─── Component extractors ─────────────────────────────────────────────────

  static double _extractAmber(double r, double g, double b) {
    final warm = math.min(r, g);
    return _clamp01(warm * (1.0 - b));
  }

  static double _extractLime(double r, double g, double b) {
    final yellowZone = math.min(r, g);
    return _clamp01(yellowZone * (1.0 - b * 0.75));
  }

  static double _extractUv(double r, double g, double b) {
    // UV is pronounced when blue dominates strongly
    return _clamp01((b - math.max(r, g) * 0.5).clamp(0.0, 1.0));
  }

  // ─── Preview reconstruction ───────────────────────────────────────────────

  static Color _reconstructPreview(Map<String, double> ch) {
    double r = ch['R'] ?? 0;
    double g = ch['G'] ?? 0;
    double b = ch['B'] ?? 0;

    final w = ch['W'] ?? 0;
    final ww = ch['WW'] ?? 0;
    final cw = ch['CW'] ?? 0;
    final a = ch['A'] ?? 0;
    final l = ch['L'] ?? 0;
    final rc = ch['RC'] ?? 0;
    final cy = ch['CY'] ?? 0;

    // W → neutral white
    r += w;
    g += w;
    b += w;
    // WW → warm white (yellowish)
    r += ww * 1.0;
    g += ww * 0.85;
    b += ww * 0.55;
    // CW → cool white (bluish)
    r += cw * 0.85;
    g += cw * 0.95;
    b += cw * 1.0;
    // A → amber
    r += a * 0.90;
    g += a * 0.55;
    b += a * 0.10;
    // L → lime
    r += l * 0.35;
    g += l * 0.95;
    b += l * 0.12;
    // RC → red-orange
    r += rc * 1.0;
    g += rc * 0.30;
    b += rc * 0.0;
    // CY → cyan
    r += cy * 0.0;
    g += cy * 0.80;
    b += cy * 0.90;

    // ── ETC channels ──
    final dr = ch['DR'] ?? 0; // Deep Red
    final li2 = ch['Li'] ?? 0; // Lime

    final cy2 = ch['Cy'] ?? 0; // Cyan ETC
    final ind = ch['In'] ?? 0; // Indigo
    final ro = ch['RO'] ?? 0; // Red-Orange
    final mi = ch['Mi'] ?? 0; // Mint
    // DR → rouge très profond
    r += dr * 0.85;
    g += dr * 0.05;
    b += dr * 0.02;
    // Li → lime ETC
    r += li2 * 0.40;
    g += li2 * 0.90;
    b += li2 * 0.10;
    // A2 (canal ETC Amber — déjà géré par 'a' plus haut si présent)
    // Pas de doublon car ETC utilise 'A' comme clé identique
    // Cy → cyan ETC
    r += cy2 * 0.05;
    g += cy2 * 0.75;
    b += cy2 * 0.85;
    // In → indigo (bleu-violet)
    r += ind * 0.15;
    g += ind * 0.05;
    b += ind * 0.90;
    // RO → red-orange
    r += ro * 1.0;
    g += ro * 0.40;
    b += ro * 0.02;
    // Mi → mint
    r += mi * 0.15;
    g += mi * 0.75;
    b += mi * 0.65;

    // CMY case — convert back to RGB
    if (ch.containsKey('C') && !ch.containsKey('R')) {
      r = 1.0 - (ch['C'] ?? 0);
      g = 1.0 - (ch['M'] ?? 0);
      b = 1.0 - (ch['Y'] ?? 0);
    }

    return Color.fromARGB(
      255,
      (_clamp01(r) * 255).round(),
      (_clamp01(g) * 255).round(),
      (_clamp01(b) * 255).round(),
    );
  }

  static double _clamp01(double v) => v.isNaN ? 0.0 : v.clamp(0.0, 1.0);
}
