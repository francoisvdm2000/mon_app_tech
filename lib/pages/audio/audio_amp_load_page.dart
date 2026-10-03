import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:flutter/services.dart';
import '../about/about_favorites.dart';
import 'amp_speaker_presets.dart';

const _kAccent = Color(0xFF00E5FF);
const _kBg = Color(0xFF0D0D14);
const _kCard = Color(0xFF161622);
const _kField = Color(0xFF0E0E18);
const _kSheet = Color(0xFF12121E);

const _cRed = Color(0xFFFF3B30);
const _cOrange = Color(0xFFFF9800);
const _cYellow = Color(0xFFFFD54F);
const _cGreen = Color(0xFF66BB6A);
const _cLime = Color(0xFFC0E15C);
const _cBlue = Color(0xFF4FC3F7);
const _cGrey = Color(0xFFB0BEC5);

String _fmtNum(double v) =>
    v == v.roundToDouble() ? '${v.round()}' : v.toStringAsFixed(1);
String _fmtOhm(double z) => '${_fmtNum(z)} Ω';

String _ampSubtitle(AppLocalizations loc, AmpPreset a) {
  final best = a.sortedRatings.reduce((x, y) => y.w > x.w ? y : x);
  return '${loc.audioChannelsCount(a.channels)} · Z min ${_fmtOhm(a.zMin)}'
      ' · ${best.w.round()} W @ ${_fmtOhm(best.z)}';
}

String _spkSubtitle(SpkPreset s) {
  final parts = <String>[_fmtOhm(s.zNom)];
  if (s.pRms != null) parts.add('${s.pRms!.round()} W RMS');
  if (s.hasRange) parts.add('amp ${_rangeText(s)}');
  return parts.join(' · ');
}

String _rangeText(SpkPreset s) {
  if (s.ampMin != null && s.ampMax != null) {
    return '${s.ampMin!.round()}–${s.ampMax!.round()} W';
  }
  if (s.ampMax != null) return '≤ ${s.ampMax!.round()} W';
  return '≥ ${s.ampMin!.round()} W';
}

// ── Page ──────────────────────────────────────────────────────────────────────

class AudioAmpLoadPage extends StatefulWidget {
  const AudioAmpLoadPage({super.key});
  @override
  State<AudioAmpLoadPage> createState() => _AudioAmpLoadPageState();
}

class _AudioAmpLoadPageState extends State<AudioAmpLoadPage> {
  /// null = ampli personnalisé
  AmpPreset? _amp =
      kAmpPresets.firstWhere((a) => a.model == 'D80', orElse: () => kAmpPresets.first);

  /// null = enceinte personnalisée
  SpkPreset? _spk =
      kSpkPresets.firstWhere((s) => s.model == 'V8', orElse: () => kSpkPresets.first);

  final _ampZminCtrl = TextEditingController(text: '4');
  final _ampPrefCtrl = TextEditingController(text: '1000');
  final _ampZrefCtrl = TextEditingController(text: '4');
  final _spkZCtrl = TextEditingController(text: '8');
  final _spkPCtrl = TextEditingController(text: '300');

  double _parse(TextEditingController c, double fallback) {
    final v = double.tryParse(c.text.replaceAll(',', '.'));
    return (v == null || v <= 0) ? fallback : v;
  }

  AmpPreset get _effAmp =>
      _amp ??
      AmpPreset(
        brand: '',
        model: '',
        channels: 1,
        zMin: _parse(_ampZminCtrl, 4),
        ratings: [R(_parse(_ampZrefCtrl, 4), _parse(_ampPrefCtrl, 1000))],
      );

  SpkPreset get _effSpk =>
      _spk ??
      SpkPreset(
        brand: '',
        model: '',
        zNom: _parse(_spkZCtrl, 8),
        pRms: double.tryParse(_spkPCtrl.text.replaceAll(',', '.')),
      );

  @override
  void dispose() {
    _ampZminCtrl.dispose();
    _ampPrefCtrl.dispose();
    _ampZrefCtrl.dispose();
    _spkZCtrl.dispose();
    _spkPCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickAmp() async {
    final loc = AppLocalizations.of(context);
    final res = await showModalBottomSheet<_Pick<AmpPreset>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _PresetPickerSheet<AmpPreset>(
        title: loc.audioPickAmplifier,
        items: kAmpPresets,
        selected: _amp,
        brandOf: (a) => a.brand,
        titleOf: (a) => a.model,
        subtitleOf: (a) => _ampSubtitle(loc, a),
      ),
    );
    if (res == null || !mounted) return;
    HapticFeedback.selectionClick();
    setState(() {
      // En passant en « personnalisé », on pré-remplit avec l'ampli courant.
      if (res.value == null && _amp != null) {
        final top = _amp!.sortedRatings
            .lastWhere((r) => r.z <= 4.01, orElse: () => _amp!.sortedRatings.first);
        _ampZminCtrl.text = _fmtNum(_amp!.zMin);
        _ampPrefCtrl.text = top.w.round().toString();
        _ampZrefCtrl.text = _fmtNum(top.z);
      }
      _amp = res.value;
    });
  }

  Future<void> _pickSpk() async {
    final loc = AppLocalizations.of(context);
    final res = await showModalBottomSheet<_Pick<SpkPreset>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _PresetPickerSheet<SpkPreset>(
        title: loc.audioPickSpeaker,
        items: kSpkPresets,
        selected: _spk,
        brandOf: (s) => s.brand,
        titleOf: (s) => s.label,
        subtitleOf: _spkSubtitle,
      ),
    );
    if (res == null || !mounted) return;
    HapticFeedback.selectionClick();
    setState(() {
      if (res.value == null && _spk != null) {
        _spkZCtrl.text = _fmtNum(_spk!.zNom);
        _spkPCtrl.text = _spk!.pRms?.round().toString() ?? '';
      }
      _spk = res.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final amp = _effAmp;
    final spk = _effSpk;

    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.audioAmpLoadTitle,
          style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_amp_load', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Ampli ──
          _SectionCard(
            label: loc.audioAmplifierPerChannel,
            icon: Icons.speed_rounded,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SelectorTile(
                  brand: _amp?.brand,
                  title: _amp?.model ?? loc.audioCustomPreset,
                  subtitle: _amp == null
                      ? loc.audioCustomPresetHint
                      : loc.audioChannelsCount(_amp!.channels),
                  onTap: _pickAmp,
                ),
                const SizedBox(height: 12),
                if (_amp != null)
                  _AmpDetails(amp: _amp!)
                else
                  Row(children: [
                    Expanded(
                        child: _NumField(
                      ctrl: _ampZminCtrl,
                      label: loc.audioMinimumImpedance,
                      onChanged: (_) => setState(() {}),
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                        child: _NumField(
                      ctrl: _ampPrefCtrl,
                      label: loc.audioPowerW,
                      onChanged: (_) => setState(() {}),
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                        child: _NumField(
                      ctrl: _ampZrefCtrl,
                      label: loc.audioAtOhm,
                      onChanged: (_) => setState(() {}),
                    )),
                  ]),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // ── Enceinte ──
          _SectionCard(
            label: loc.audioSpeaker,
            icon: Icons.speaker_rounded,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SelectorTile(
                  brand: _spk?.brand,
                  title: _spk?.label ?? loc.audioCustomPreset,
                  subtitle: _spk == null
                      ? loc.audioCustomPresetHint
                      : _spkSubtitle(_spk!),
                  onTap: _pickSpk,
                ),
                const SizedBox(height: 12),
                if (_spk != null)
                  _SpkDetails(spk: _spk!)
                else
                  Row(children: [
                    Expanded(
                        child: _NumField(
                      ctrl: _spkZCtrl,
                      label: loc.audioNominalImpedance,
                      onChanged: (_) => setState(() {}),
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                        child: _NumField(
                      ctrl: _spkPCtrl,
                      label: loc.audioContinuousPower,
                      onChanged: (_) => setState(() {}),
                    )),
                  ]),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // ── Résultats ──
          _ResultsTable(amp: amp, spk: spk),
          const SizedBox(height: 14),
          const _InfoNote(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ── Détails ampli / enceinte ──────────────────────────────────────────────────

class _AmpDetails extends StatelessWidget {
  final AmpPreset amp;
  const _AmpDetails({required this.amp});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final pts = amp.sortedRatings.reversed.toList(); // 16 → 2 Ω
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            _Chip(text: 'Z min ${_fmtOhm(amp.zMin)}', color: _cOrange),
            _Chip(text: loc.audioChannelsCount(amp.channels)),
            for (final r in pts)
              _Chip(text: '${_fmtOhm(r.z)} → ${r.w.round()} W'),
          ],
        ),
        if (amp.note != null) ...[
          const SizedBox(height: 8),
          _SmallNote(text: amp.note!),
        ],
      ],
    );
  }
}

class _SpkDetails extends StatelessWidget {
  final SpkPreset spk;
  const _SpkDetails({required this.spk});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final hasData = spk.pRms != null || spk.hasRange;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            if (spk.section != null)
              _Chip(text: spk.section!, color: _kAccent, icon: Icons.call_split_rounded),
            _Chip(text: 'Z ${_fmtOhm(spk.zNom)}'),
            if (spk.pRms != null)
              _Chip(text: loc.audioPowerHandling(spk.pRms!.round()), color: _cGreen),
            if (spk.hasRange)
              _Chip(text: loc.audioRecommendedAmp(_rangeText(spk)), color: _cGreen),
          ],
        ),
        if (spk.isSection) ...[
          const SizedBox(height: 8),
          _SmallNote(text: loc.audioActiveSection, icon: Icons.info_outline_rounded),
        ],
        if (!hasData) ...[
          const SizedBox(height: 8),
          _SmallNote(text: loc.audioNoPowerData, icon: Icons.info_outline_rounded),
        ],
        if (spk.note != null) ...[
          const SizedBox(height: 8),
          _SmallNote(text: spk.note!),
        ],
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  final Color? color;
  final IconData? icon;
  const _Chip({required this.text, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    final c = color ?? Colors.white;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: c.withValues(alpha: color == null ? 0.05 : 0.10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: c.withValues(alpha: color == null ? 0.10 : 0.30)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: c.withValues(alpha: 0.9)),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color == null ? Colors.white.withValues(alpha: 0.75) : c,
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallNote extends StatelessWidget {
  final String text;
  final IconData? icon;
  const _SmallNote({required this.text, this.icon});

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Icon(icon, size: 14, color: Colors.white.withValues(alpha: 0.4)),
            ),
            const SizedBox(width: 6),
          ],
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 11.5,
                height: 1.4,
                color: Colors.white.withValues(alpha: 0.45),
              ),
            ),
          ),
        ],
      );
}

// ── Tableau de résultats ──────────────────────────────────────────────────────

class _Status {
  final Color color;
  final String text;
  const _Status(this.color, this.text);
}

_Status _statusFor(
  AppLocalizations loc, {
  required double zLoad,
  required double zMin,
  required double pPerSpk,
  required SpkPreset spk,
}) {
  if (zLoad < zMin - 0.01) {
    return _Status(_cRed, loc.audioStatusZTooLow(_fmtNum(zMin - zLoad)));
  }
  final p = spk.pRms;
  if (p != null && p > 0) {
    final r = pPerSpk / p;
    final pct = (r * 100).round();
    // Repères : crête ≈ 4 × RMS chez la plupart des fabricants ; une marge
    // de 1,5 à 2 × RMS est la règle courante avec limiteur.
    if (r > 4.05) {
      return _Status(_cOrange, loc.audioStatusOverpowered(r.toStringAsFixed(1)));
    }
    if (r > 2.05) {
      return _Status(
          _cYellow, loc.audioStatusLimiterRequired(r.toStringAsFixed(1)));
    }
    if (r > 1.0) {
      return _Status(_cLime, loc.audioStatusHeadroom(r.toStringAsFixed(1)));
    }
    if (r < 0.5) return _Status(_cBlue, loc.audioStatusUnderpowered(pct));
    return _Status(_cGreen, loc.audioStatusOkPct(pct));
  }
  if (spk.hasRange) {
    if (spk.ampMax != null && pPerSpk > spk.ampMax! * 1.05) {
      return _Status(_cOrange, loc.audioStatusAboveRange);
    }
    if (spk.ampMin != null && pPerSpk < spk.ampMin! * 0.95) {
      return _Status(_cBlue, loc.audioStatusBelowRange);
    }
    return _Status(_cGreen, loc.audioStatusInRange);
  }
  return _Status(_cGrey, loc.audioStatusZOkNoData);
}

class _ResultsTable extends StatelessWidget {
  final AmpPreset amp;
  final SpkPreset spk;
  const _ResultsTable({required this.amp, required this.spk});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final zMin = amp.zMin;
    final zNom = spk.zNom;
    final maxN =
        (zMin > 0 && zNom > 0) ? (zNom / zMin + 1e-6).floor().clamp(1, 8) : 1;
    // On affiche jusqu'à maxN + 1 (pour montrer la limite bloquée)
    final showUpTo = (maxN + 1).clamp(2, 9);

    return Container(
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: Text(
              loc.audioParallelConnection,
              style: const TextStyle(
                color: _kAccent,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const SizedBox(width: 42, child: _Hdr('N×')),
                SizedBox(width: 72, child: _Hdr(loc.audioLoadImpedance)),
                SizedBox(width: 84, child: _Hdr(loc.audioPowerPerSpeaker)),
                Expanded(child: _Hdr(loc.audioStatus)),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
          for (int n = 1; n <= showUpTo; n++)
            Builder(builder: (context) {
              final zLoad = zNom / n;
              final ok = zLoad >= zMin - 0.01;
              final pPerSpk = ok ? amp.powerAt(zLoad) / n : 0.0;
              return _ResultRow(
                n: n,
                zLoad: zLoad,
                pPerSpk: ok ? pPerSpk : null,
                status: _statusFor(loc,
                    zLoad: zLoad, zMin: zMin, pPerSpk: pPerSpk, spk: spk),
                blocked: !ok,
              );
            }),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _Hdr extends StatelessWidget {
  final String text;
  const _Hdr(this.text);
  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.white.withValues(alpha: 0.38),
          letterSpacing: 0.4,
        ),
      );
}

class _ResultRow extends StatelessWidget {
  final int n;
  final double zLoad;
  final double? pPerSpk;
  final _Status status;
  final bool blocked;

  const _ResultRow({
    required this.n,
    required this.zLoad,
    required this.pPerSpk,
    required this.status,
    required this.blocked,
  });

  @override
  Widget build(BuildContext context) {
    final secondAlpha = blocked ? 0.30 : 0.75;
    return Container(
      decoration: blocked
          ? BoxDecoration(
              color: _cRed.withValues(alpha: 0.06),
              border: Border(
                  bottom:
                      BorderSide(color: Colors.white.withValues(alpha: 0.03))),
            )
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 42,
            child: Text(
              '$n×',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: status.color,
              ),
            ),
          ),
          SizedBox(
            width: 72,
            child: Text(
              _fmtOhm(zLoad),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white.withValues(alpha: secondAlpha),
              ),
            ),
          ),
          SizedBox(
            width: 84,
            child: Text(
              pPerSpk == null ? '—' : '${pPerSpk!.round()} W',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white.withValues(alpha: secondAlpha),
              ),
            ),
          ),
          Expanded(
            child: Text(
              status.text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: status.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Note pédagogique ──────────────────────────────────────────────────────────

class _InfoNote extends StatelessWidget {
  const _InfoNote();
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.035),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Text(
        loc.audioAmpLoadNote,
        style: TextStyle(
          fontSize: 11.5,
          color: Colors.white.withValues(alpha: 0.35),
          height: 1.5,
        ),
      ),
    );
  }
}

// ── Widgets génériques ────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Widget child;
  const _SectionCard(
      {required this.label, required this.icon, required this.child});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 14, color: _kAccent),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: _kAccent,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      );
}

/// Couleur stable par marque, pour des pastilles un peu plus vivantes.
Color _brandColor(String brand) {
  const palette = [
    Color(0xFF00E5FF),
    Color(0xFFFF4081),
    Color(0xFF7C4DFF),
    Color(0xFF69F0AE),
    Color(0xFFFFAB40),
    Color(0xFF40C4FF),
    Color(0xFFFFD740),
    Color(0xFFFF6E40),
    Color(0xFFB2FF59),
    Color(0xFFE040FB),
  ];
  var h = 0;
  for (final c in brand.codeUnits) {
    h = (h * 31 + c) & 0x7fffffff;
  }
  return palette[h % palette.length];
}

String _brandInitials(String brand) {
  final clean = brand.replaceAll(RegExp(r'[^A-Za-z0-9& ]'), ' ').trim();
  final words = clean.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
  if (words.isEmpty) return '?';
  if (brand.startsWith('d&b')) return 'd&b';
  if (words.length == 1) {
    final w = words.first;
    return w.length <= 3 ? w.toUpperCase() : w.substring(0, 2).toUpperCase();
  }
  return (words[0][0] + words[1][0]).toUpperCase();
}

class _BrandAvatar extends StatelessWidget {
  final String? brand;
  final double size;
  const _BrandAvatar({required this.brand, this.size = 40});

  @override
  Widget build(BuildContext context) {
    final c = brand == null ? Colors.white : _brandColor(brand!);
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [c.withValues(alpha: 0.35), c.withValues(alpha: 0.10)],
        ),
        border: Border.all(color: c.withValues(alpha: 0.45)),
      ),
      child: brand == null
          ? Icon(Icons.tune_rounded, size: size * 0.45, color: Colors.white70)
          : Text(
              _brandInitials(brand!),
              style: TextStyle(
                fontSize: size * 0.30,
                fontWeight: FontWeight.w800,
                color: c,
              ),
            ),
    );
  }
}

class _SelectorTile extends StatelessWidget {
  final String? brand;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _SelectorTile({
    required this.brand,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: _kField,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
            ),
            child: Row(
              children: [
                _BrandAvatar(brand: brand),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (brand != null)
                        Text(
                          brand!.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.1,
                            color: _brandColor(brand!),
                          ),
                        ),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.unfold_more_rounded,
                    color: _kAccent.withValues(alpha: 0.8), size: 22),
              ],
            ),
          ),
        ),
      );
}

class _NumField extends StatelessWidget {
  final TextEditingController ctrl;
  final String label;
  final ValueChanged<String>? onChanged;
  const _NumField({
    required this.ctrl,
    required this.label,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.white.withValues(alpha: 0.42),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: ctrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[\d.,]')),
            ],
            onChanged: onChanged,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: _kField,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Colors.white.withValues(alpha: 0.10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Colors.white.withValues(alpha: 0.10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: _kAccent.withValues(alpha: 0.5)),
              ),
            ),
          ),
        ],
      );
}

// ── Sélecteur marque → modèle (bottom sheet) ─────────────────────────────────

/// Résultat du sélecteur : [value] == null signifie « Personnalisé ».
class _Pick<T> {
  final T? value;
  const _Pick(this.value);
}

class _PresetPickerSheet<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final T? selected;
  final String Function(T) brandOf;
  final String Function(T) titleOf;
  final String Function(T) subtitleOf;

  const _PresetPickerSheet({
    super.key,
    required this.title,
    required this.items,
    required this.selected,
    required this.brandOf,
    required this.titleOf,
    required this.subtitleOf,
  });

  @override
  State<_PresetPickerSheet<T>> createState() => _PresetPickerSheetState<T>();
}

class _PresetPickerSheetState<T> extends State<_PresetPickerSheet<T>> {
  final _searchCtrl = TextEditingController();
  String? _brand;

  @override
  void initState() {
    super.initState();
    // Ouvre directement sur la marque de l'élément sélectionné.
    final sel = widget.selected;
    if (sel != null) _brand = widget.brandOf(sel);
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  /// Marques dans l'ordre d'apparition, avec leur nombre de modèles.
  List<MapEntry<String, int>> get _brands {
    final counts = <String, int>{};
    for (final it in widget.items) {
      final b = widget.brandOf(it);
      counts[b] = (counts[b] ?? 0) + 1;
    }
    return counts.entries.toList();
  }

  List<T> get _searchResults {
    final tokens = _searchCtrl.text
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((t) => t.isNotEmpty)
        .toList();
    if (tokens.isEmpty) return const [];
    return widget.items.where((it) {
      final hay = '${widget.brandOf(it)} ${widget.titleOf(it)}'.toLowerCase();
      return tokens.every(hay.contains);
    }).toList();
  }

  void _pick(T? v) => Navigator.of(context).pop(_Pick<T>(v));

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final searching = _searchCtrl.text.trim().isNotEmpty;
    final maxH = MediaQuery.of(context).size.height * 0.88;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    Widget list;
    if (searching) {
      final res = _searchResults;
      list = res.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(loc.audioNoResults,
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.4))),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
              itemCount: res.length,
              itemBuilder: (_, i) => _itemTile(res[i], showBrand: true),
            );
    } else if (_brand == null) {
      final brands = _brands;
      list = ListView(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
        children: [
          _Tile(
            leading: const _BrandAvatar(brand: null, size: 38),
            title: loc.audioCustomPreset,
            subtitle: loc.audioCustomPresetHint,
            selected: widget.selected == null,
            onTap: () => _pick(null),
          ),
          const SizedBox(height: 6),
          for (final b in brands)
            _Tile(
              leading: _BrandAvatar(brand: b.key, size: 38),
              title: b.key,
              subtitle: loc.audioModelsCount(b.value),
              selected: widget.selected != null &&
                  widget.brandOf(widget.selected as T) == b.key,
              trailing: Icon(Icons.chevron_right_rounded,
                  color: Colors.white.withValues(alpha: 0.35)),
              onTap: () => setState(() => _brand = b.key),
            ),
        ],
      );
    } else {
      final items =
          widget.items.where((it) => widget.brandOf(it) == _brand).toList();
      list = ListView.builder(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
        itemCount: items.length,
        itemBuilder: (_, i) => _itemTile(items[i], showBrand: false),
      );
    }

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        height: maxH,
        decoration: const BoxDecoration(
          color: _kSheet,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 6),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 8, 0),
              child: Row(
                children: [
                  if (_brand != null && !searching)
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white70, size: 20),
                      onPressed: () => setState(() => _brand = null),
                    )
                  else
                    const SizedBox(width: 8),
                  if (_brand != null && !searching) ...[
                    _BrandAvatar(brand: _brand, size: 30),
                    const SizedBox(width: 10),
                  ],
                  Expanded(
                    child: Text(
                      (_brand != null && !searching) ? _brand! : widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: Colors.white54),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
              child: TextField(
                controller: _searchCtrl,
                onChanged: (_) => setState(() {}),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: InputDecoration(
                  hintText: loc.audioSearchBrandModel,
                  hintStyle:
                      TextStyle(color: Colors.white.withValues(alpha: 0.35)),
                  prefixIcon: Icon(Icons.search_rounded,
                      color: _kAccent.withValues(alpha: 0.7)),
                  suffixIcon: searching
                      ? IconButton(
                          icon: const Icon(Icons.clear_rounded,
                              color: Colors.white38, size: 18),
                          onPressed: () => setState(_searchCtrl.clear),
                        )
                      : null,
                  filled: true,
                  fillColor: _kField,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(child: list),
          ],
        ),
      ),
    );
  }

  Widget _itemTile(T it, {required bool showBrand}) {
    final brand = widget.brandOf(it);
    return _Tile(
      leading: showBrand
          ? _BrandAvatar(brand: brand, size: 38)
          : null,
      overline: showBrand ? brand : null,
      overlineColor: _brandColor(brand),
      title: widget.titleOf(it),
      subtitle: widget.subtitleOf(it),
      selected: identical(it, widget.selected),
      onTap: () => _pick(it),
    );
  }
}

class _Tile extends StatelessWidget {
  final Widget? leading;
  final String? overline;
  final Color? overlineColor;
  final String title;
  final String subtitle;
  final bool selected;
  final Widget? trailing;
  final VoidCallback onTap;

  const _Tile({
    this.leading,
    this.overline,
    this.overlineColor,
    required this.title,
    required this.subtitle,
    required this.selected,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Material(
          color: selected
              ? _kAccent.withValues(alpha: 0.10)
              : Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: selected
                      ? _kAccent.withValues(alpha: 0.45)
                      : Colors.white.withValues(alpha: 0.05),
                ),
              ),
              child: Row(
                children: [
                  if (leading != null) ...[leading!, const SizedBox(width: 12)],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (overline != null)
                          Text(
                            overline!.toUpperCase(),
                            style: TextStyle(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                              color: overlineColor ?? _kAccent,
                            ),
                          ),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (selected)
                    const Icon(Icons.check_circle_rounded,
                        color: _kAccent, size: 20)
                  else if (trailing != null)
                    trailing!,
                ],
              ),
            ),
          ),
        ),
      );
}
