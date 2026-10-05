// lib/pages/electricity/power_plan/power_plan_sheets.dart
//
// Feuilles de saisie du plan électrique : source, « brancher quoi ? »,
// choix de tableau, charge, départ, tableau.

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/app/ui/widgets.dart' show numFormatter;
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import 'power_plan_models.dart';
import 'power_plan_widgets.dart';

const List<int> kPpBreakers = [
  6, 10, 16, 20, 25, 32, 40, 50, 63, 80, 100, 125, 160, 200, 250, 315, 400,
  500, 630,
];

final TextInputFormatter _numFormatter = numFormatter;

String ppUniqueName(String base, Iterable<String> existing) {
  final set = existing.toSet();
  if (!set.contains(base)) return base;
  var i = 2;
  while (set.contains('$base #$i')) {
    i++;
  }
  return '$base #$i';
}

// ═══ Source ══════════════════════════════════════════════════════════════════

Future<PpSource?> showPpSourceSheet(BuildContext context, {PpSource? initial}) {
  return showPpSheet<PpSource>(
    context,
    builder: (_) => _SourceSheet(initial: initial),
  );
}

class _SourceSheet extends StatefulWidget {
  const _SourceSheet({this.initial});
  final PpSource? initial;

  @override
  State<_SourceSheet> createState() => _SourceSheetState();
}

class _SourceSheetState extends State<_SourceSheet> {
  late PpSourceKind _kind;
  late int _kva;
  late int _amps;
  late PpConnector _outlet;
  late final TextEditingController _name;

  @override
  void initState() {
    super.initState();
    final s = widget.initial;
    _kind = s?.kind ?? PpSourceKind.generator;
    _kva = s?.kva ?? 100;
    _amps = s?.amps ?? 125;
    _outlet = s?.outletConnector ?? PpConnector.byId('cee63');
    _name = TextEditingController(text: s?.name ?? '');
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  PpSource _preview() => PpSource(
        kind: _kind,
        name: '',
        kva: _kva,
        amps: _amps,
        outletConnector: _outlet,
        outputs: const [],
      );

  void _submit() {
    final loc = AppLocalizations.of(context);
    final name = _name.text.trim().isEmpty
        ? ppSourceKindName(loc, _kind)
        : _name.text.trim();
    final init = widget.initial;
    if (init == null) {
      final s = PpSource(
        kind: _kind,
        name: name,
        kva: _kva,
        amps: _amps,
        outletConnector: _outlet,
        outputs: [],
      )..resetOutputs();
      Navigator.pop(context, s);
      return;
    }
    final changed = init.kind != _kind ||
        init.kva != _kva ||
        init.amps != _amps ||
        init.outletConnector != _outlet;
    init
      ..kind = _kind
      ..name = name
      ..kva = _kva
      ..amps = _amps
      ..outletConnector = _outlet;
    if (changed) {
      final keepLen = init.outputs.isNotEmpty ? init.outputs.first.cableLength : 10.0;
      init.resetOutputs();
      init.outputs.first.cableLength = keepLen;
    }
    Navigator.pop(context, init);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final p = _preview();
    return PpSheetScaffold(
      emoji: '⚡',
      title: loc.ppSourceSheetTitle,
      footer: PpPrimaryButton(
        label: widget.initial == null ? loc.ppValidate : loc.ppSave,
        onPressed: _submit,
      ),
      children: [
        Row(
          children: [
            for (final k in PpSourceKind.values) ...[
              Expanded(
                child: _KindTile(
                  emoji: switch (k) {
                    PpSourceKind.generator => '⛽',
                    PpSourceKind.mains => '🏢',
                    PpSourceKind.outlet => '🔌',
                  },
                  label: ppSourceKindName(loc, k),
                  selected: _kind == k,
                  onTap: () => setState(() => _kind = k),
                ),
              ),
              if (k != PpSourceKind.values.last) const SizedBox(width: 8),
            ],
          ],
        ),
        const SizedBox(height: 14),
        TextField(
          controller: _name,
          textCapitalization: TextCapitalization.sentences,
          decoration: ppInputDecoration(loc.ppNameLabel,
              hint: ppSourceKindName(loc, _kind)),
        ),
        if (_kind == PpSourceKind.generator) ...[
          PpLabel(loc.ppGeneratorSizeLabel),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final k in kPpGeneratorSizes)
                PpChoiceChip(
                  label: '$k kVA',
                  selected: _kva == k,
                  onTap: () => setState(() => _kva = k),
                ),
            ],
          ),
        ],
        if (_kind == PpSourceKind.mains) ...[
          PpLabel(loc.ppMainsSizeLabel),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final a in kPpMainsSizes)
                PpChoiceChip(
                  label: '$a A',
                  selected: _amps == a,
                  onTap: () => setState(() => _amps = a),
                ),
            ],
          ),
        ],
        if (_kind == PpSourceKind.outlet) ...[
          PpLabel(loc.ppOutletTypeLabel),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final c in PpCatalog.current.connectors
                  .where((c) => !c.isMulti))
                PpChoiceChip(
                  label: c.label,
                  color: Color(c.colorValue),
                  selected: _outlet == c,
                  onTap: () => setState(() => _outlet = c),
                ),
            ],
          ),
        ],
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: kPpAccent.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: kPpAccent.withValues(alpha: 0.35)),
          ),
          child: Row(
            children: [
              const Text('🔋', style: TextStyle(fontSize: 22)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  loc.ppSourceCapacity(
                    ppFormatAmps(p.capacityAmps),
                    p.capacityKva.toStringAsFixed(p.capacityKva >= 100 ? 0 : 1),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _KindTile extends StatelessWidget {
  const _KindTile({
    required this.emoji,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String emoji;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: selected ? kPpAccent.withValues(alpha: 0.16) : kPpFieldBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? kPpAccent : Colors.white12,
            width: selected ? 1.6 : 1,
          ),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: selected ? kPpAccent : Colors.white70,
                fontWeight: FontWeight.w800,
                fontSize: 12.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══ Brancher quoi ? ═════════════════════════════════════════════════════════

Future<PpNode?> showPpConnectSheet(
  BuildContext context, {
  required PpOutput output,
  required Iterable<String> existingNames,
  PpNode? clipboard,
}) {
  return showPpSheet<PpNode>(
    context,
    builder: (ctx) {
      final loc = AppLocalizations.of(ctx);
      final tri = output.connector.isThreePhase;
      final clip = clipboard;
      final canPaste = clip != null &&
          (clip is PpLoad || (clip is PpPanel && clip.isThreePhase == tri));
      return PpSheetScaffold(
        emoji: '🔌',
        title: loc.ppConnectTitle(output.connector.label),
        children: [
          if (canPaste) ...[
            _BigOption(
              emoji: '📋',
              title: loc.ppPasteTitle(clip.name),
              subtitle: loc.ppPasteSubtitle,
              onTap: () => Navigator.pop(ctx, clip.cloneFresh()),
            ),
            const SizedBox(height: 10),
          ],
          _BigOption(
            emoji: '🗄️',
            title: loc.ppConnectPanel,
            subtitle: loc.ppConnectPanelSubtitle,
            onTap: () async {
              final p = await showPpTemplateSheet(ctx,
                  output: output, existingNames: existingNames);
              if (p != null && ctx.mounted) Navigator.pop(ctx, p);
            },
          ),
          const SizedBox(height: 10),
          _BigOption(
            emoji: '💡',
            title: loc.ppConnectLoad,
            subtitle: loc.ppConnectLoadSubtitle,
            onTap: () async {
              final l = await showPpLoadSheet(ctx, threePhase: tri);
              if (l != null && ctx.mounted) Navigator.pop(ctx, l);
            },
          ),
        ],
      );
    },
  );
}

class _BigOption extends StatelessWidget {
  const _BigOption({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });

  final String emoji;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: ppCardDecoration(),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kPpAccent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(emoji, style: const TextStyle(fontSize: 24)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 12.5),
                    ),
                  ],
                ),
              ),
              trailing ??
                  const Icon(Icons.chevron_right_rounded,
                      color: Colors.white38),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══ Choix du tableau ════════════════════════════════════════════════════════

Future<PpPanel?> showPpTemplateSheet(
  BuildContext context, {
  required PpOutput output,
  required Iterable<String> existingNames,
}) {
  return showPpSheet<PpPanel>(
    context,
    builder: (ctx) {
      final loc = AppLocalizations.of(ctx);
      final tri = output.connector.isThreePhase;
      final list = PpCatalog.current.allTemplates
          .where((t) => t.isCustom ||
              (output.connector.isMulti || t.input.isMulti
                  ? t.input == output.connector
                  : t.input.isThreePhase == tri))
          .where((t) => !t.isCustom || (t.key == 'custom3') == tri)
          .toList()
        ..sort((a, b) {
          int score(PpPanelTemplate t) => t.isCustom
              ? 2
              : (t.input == output.connector ? 0 : 1);
          return score(a).compareTo(score(b));
        });

      return PpSheetScaffold(
        emoji: '🗄️',
        title: loc.ppTemplateSheetTitle,
        children: [
          for (final t in list) ...[
            _BigOption(
              emoji: t.isCustom ? '🛠️' : (t.input.isThreePhase ? '🟥' : '🟦'),
              title: ppTemplateName(loc, t),
              subtitle: t.isCustom
                  ? loc.ppTemplateCustomSubtitle
                  : '${t.input.label} → ${t.outputsSummary}'
                      '${t.note.isEmpty ? '' : '\n${t.note}'}',
              trailing: t.isCustom
                  ? null
                  : _CompatBadge(ok: t.input == output.connector),
              onTap: () {
                final base = ppTemplateName(loc, t);
                final panel = t.build(ppUniqueName(base, existingNames));
                if (t.isCustom) {
                  panel.input = output.connector;
                  panel.mainBreakerA = output.breakerA;
                }
                Navigator.pop(ctx, panel);
              },
            ),
            const SizedBox(height: 10),
          ],
        ],
      );
    },
  );
}

class _CompatBadge extends StatelessWidget {
  const _CompatBadge({required this.ok});
  final bool ok;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final c = ok ? const Color(0xFF69F0AE) : const Color(0xFFFFAB40);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        ok ? loc.ppCompatOk : loc.ppCompatAdapter,
        style: TextStyle(color: c, fontSize: 11, fontWeight: FontWeight.w800),
      ),
    );
  }
}

// ═══ Charge ══════════════════════════════════════════════════════════════════

Future<PpLoad?> showPpLoadSheet(
  BuildContext context, {
  PpLoad? initial,
  required bool threePhase,
}) {
  return showPpSheet<PpLoad>(
    context,
    builder: (_) => _LoadSheet(initial: initial, threePhase: threePhase),
  );
}

class _LoadSheet extends StatefulWidget {
  const _LoadSheet({this.initial, required this.threePhase});
  final PpLoad? initial;
  final bool threePhase;

  @override
  State<_LoadSheet> createState() => _LoadSheetState();
}

class _LoadSheetState extends State<_LoadSheet> {
  late PpLoadCategory _cat;
  late double _cos;
  bool _cosTouched = false;
  bool _kw = true;
  late final TextEditingController _name;
  late final TextEditingController _power;

  static const _presetsW = [500.0, 1000.0, 2000.0, 3500.0, 5000.0, 10000.0];
  static const _cosValues = [0.8, 0.85, 0.9, 0.95, 1.0];

  @override
  void initState() {
    super.initState();
    final l = widget.initial;
    _cat = l?.category ?? PpLoadCategory.lighting;
    _cos = l?.cosPhi ?? _cat.defaultCosPhi;
    _cosTouched = l != null;
    _name = TextEditingController(text: l?.name ?? '');
    _power = TextEditingController(
        text: l == null ? '' : _fmt((l.powerW) / 1000));
  }

  @override
  void dispose() {
    _name.dispose();
    _power.dispose();
    super.dispose();
  }

  String _fmt(double v) {
    final s = v.toStringAsFixed(v >= 100 ? 0 : 2);
    return s.contains('.')
        ? s.replaceFirst(RegExp(r'\.?0+$'), '')
        : s;
  }

  double get _watts {
    final v = ppParseNum(_power.text) ?? 0;
    return _kw ? v * 1000 : v;
  }

  void _setUnit(bool kw) {
    if (kw == _kw) return;
    final w = _watts;
    setState(() {
      _kw = kw;
      if (w > 0) _power.text = _fmt(kw ? w / 1000 : w);
    });
  }

  void _submit() {
    final loc = AppLocalizations.of(context);
    final w = _watts;
    if (w <= 0) return;
    final name = _name.text.trim().isEmpty
        ? ppCategoryName(loc, _cat)
        : _name.text.trim();
    final init = widget.initial;
    if (init != null) {
      init
        ..name = name
        ..powerW = w
        ..category = _cat
        ..cosPhi = _cos;
      Navigator.pop(context, init);
    } else {
      Navigator.pop(
        context,
        PpLoad(
          id: ppMakeId(),
          name: name,
          powerW: w,
          category: _cat,
          cosPhi: _cos,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final w = _watts;
    final amps = w <= 0
        ? 0.0
        : widget.threePhase
            ? w / (3 * kPpVoltPhase * _cos)
            : w / (kPpVoltPhase * _cos);

    return PpSheetScaffold(
      emoji: _cat.emoji,
      title: widget.initial == null ? loc.ppLoadSheetTitle : loc.ppLoadEditTitle,
      footer: PpPrimaryButton(
        label: widget.initial == null ? loc.ppConnectAction : loc.ppSave,
        icon: widget.initial == null ? Icons.power_rounded : Icons.check_rounded,
        onPressed: w > 0 ? _submit : null,
      ),
      children: [
        PpLabel(loc.ppCategoryLabel),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final c in PpLoadCategory.values)
              PpChoiceChip(
                label: '${c.emoji} ${ppCategoryName(loc, c)}',
                color: Color(c.colorValue),
                selected: _cat == c,
                onTap: () => setState(() {
                  _cat = c;
                  if (!_cosTouched) _cos = c.defaultCosPhi;
                }),
              ),
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _name,
          textCapitalization: TextCapitalization.sentences,
          decoration: ppInputDecoration(loc.ppNameLabel,
              hint: loc.ppLoadNameHint),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _power,
                autofocus: widget.initial == null,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [_numFormatter],
                onChanged: (_) => setState(() {}),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                decoration: ppInputDecoration(loc.ppPowerLabel,
                    suffix: _kw ? 'kW' : 'W'),
              ),
            ),
            const SizedBox(width: 10),
            ToggleButtons(
              isSelected: [!_kw, _kw],
              onPressed: (i) => _setUnit(i == 1),
              borderRadius: BorderRadius.circular(12),
              selectedColor: Colors.black,
              fillColor: kPpAccent,
              color: Colors.white60,
              constraints: const BoxConstraints(minWidth: 44, minHeight: 48),
              children: const [Text('W'), Text('kW')],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final p in _presetsW)
              ActionChip(
                label: Text(p >= 1000 ? '${_fmt(p / 1000)} kW' : '${p.round()} W'),
                backgroundColor: kPpFieldBg,
                side: const BorderSide(color: Colors.white12),
                labelStyle:
                    const TextStyle(color: Colors.white70, fontSize: 12),
                onPressed: () => setState(() {
                  _power.text = _fmt(_kw ? p / 1000 : p);
                }),
              ),
          ],
        ),
        PpLabel('${loc.ppCosPhiLabel} (cos φ)'),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final c in _cosValues)
              PpChoiceChip(
                label: c.toStringAsFixed(c == 1.0 ? 0 : 2),
                selected: (_cos - c).abs() < 0.001,
                onTap: () => setState(() {
                  _cos = c;
                  _cosTouched = true;
                }),
              ),
          ],
        ),
        const SizedBox(height: 16),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: w > 0 ? 1 : 0.4,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Color(_cat.colorValue).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: Color(_cat.colorValue).withValues(alpha: 0.35)),
            ),
            child: Row(
              children: [
                const Text('⚡', style: TextStyle(fontSize: 22)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.threePhase
                        ? loc.ppLoadPreviewTri(ppFormatAmps(amps))
                        : loc.ppLoadPreviewMono(ppFormatAmps(amps)),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ═══ Départ (prise + protection + câble) ═════════════════════════════════════

enum PpOutputAction { done, delete }

Future<PpOutputAction?> showPpOutputSheet(
  BuildContext context, {
  required PpOutput output,
  required bool ownerThreePhase,
  required PpPhase? lockedPhase,
  required bool canDelete,
  required VoidCallback onChanged,
}) {
  return showPpSheet<PpOutputAction>(
    context,
    builder: (_) => _OutputSheet(
      output: output,
      ownerThreePhase: ownerThreePhase,
      lockedPhase: lockedPhase,
      canDelete: canDelete,
      onChanged: onChanged,
    ),
  );
}

class _OutputSheet extends StatefulWidget {
  const _OutputSheet({
    required this.output,
    required this.ownerThreePhase,
    required this.lockedPhase,
    required this.canDelete,
    required this.onChanged,
  });

  final PpOutput output;
  final bool ownerThreePhase;
  final PpPhase? lockedPhase;
  final bool canDelete;
  final VoidCallback onChanged;

  @override
  State<_OutputSheet> createState() => _OutputSheetState();
}

class _OutputSheetState extends State<_OutputSheet> {
  late final TextEditingController _len;

  PpOutput get o => widget.output;

  @override
  void initState() {
    super.initState();
    _len = TextEditingController(text: ppFormatLength(o.cableLength));
  }

  @override
  void dispose() {
    _len.dispose();
    super.dispose();
  }

  void _update(VoidCallback fn) {
    setState(fn);
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final connectors = PpCatalog.current.connectors
        .where((c) => widget.ownerThreePhase || !c.isThreePhase)
        .toList();
    final amp = ppConnectorAmpacity(o.connector, o.cableSection);
    final cableOk = amp >= o.breakerA;

    return PpSheetScaffold(
      emoji: '🔧',
      title: loc.ppOutputSheetTitle,
      footer: Row(
        children: [
          if (widget.canDelete) ...[
            SizedBox(
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () =>
                    Navigator.pop(context, PpOutputAction.delete),
                icon: const Icon(Icons.delete_outline_rounded),
                label: Text(loc.ppDelete),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFFF5252),
                  side: const BorderSide(color: Color(0x66FF5252)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: PpPrimaryButton(
              label: loc.ppDone,
              onPressed: () => Navigator.pop(context, PpOutputAction.done),
            ),
          ),
        ],
      ),
      children: [
        PpLabel(loc.ppConnectorLabel),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final c in connectors)
              PpChoiceChip(
                label: c.label,
                color: Color(c.colorValue),
                selected: o.connector == c,
                onTap: () => _update(() {
                  o.connector = c;
                  o.breakerA = c.ampere;
                  o.cableSection = c.defaultSection;
                  o.rcd = c.ampere <= 32;
                }),
              ),
          ],
        ),
        PpLabel(loc.ppBreakerLabel),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final b in kPpBreakers.where(
                (b) => b <= math.max(o.connector.ampere, o.breakerA)))
              PpChoiceChip(
                label: '$b A',
                selected: o.breakerA == b,
                onTap: () => _update(() => o.breakerA = b),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: Text(loc.ppRcdLabel,
                  style: const TextStyle(color: Colors.white, fontSize: 14)),
            ),
            Switch(
              value: o.rcd,
              activeThumbColor: kPpAccent,
              onChanged: (v) => _update(() => o.rcd = v),
            ),
          ],
        ),
        if (!o.connector.isThreePhase) ...[
          PpLabel(loc.ppPhaseLabel),
          if (widget.lockedPhase != null)
            Row(
              children: [
                PpPhaseBadge(widget.lockedPhase!, locked: true),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(loc.ppPhaseInherited,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 12.5)),
                ),
              ],
            )
          else
            Wrap(
              spacing: 8,
              children: [
                for (final p in PpPhase.values)
                  PpChoiceChip(
                    label: p.label,
                    color: ppPhaseColor(p),
                    selected: o.phase == p,
                    onTap: () => _update(() => o.phase = p),
                  ),
              ],
            ),
        ],
        PpLabel(loc.ppCableLabel),
        TextField(
          controller: _len,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [_numFormatter],
          decoration: ppInputDecoration(loc.ppCableLengthLabel, suffix: 'm'),
          onChanged: (v) {
            final d = ppParseNum(v);
            if (d != null && d >= 0) _update(() => o.cableLength = d);
          },
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final s in kPpSections)
              PpChoiceChip(
                label: '${ppFormatSection(s)} mm²',
                selected: o.cableSection == s,
                onTap: () => _update(() => o.cableSection = s),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: (cableOk ? const Color(0xFF69F0AE) : const Color(0xFFFFAB40))
                .withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${cableOk ? '✅' : '⚠️'}  ${o.connector.cableName(o.cableSection)} · '
            '${loc.ppAmpacityShort(amp.round().toString())}',
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ),
      ],
    );
  }
}

// ═══ Tableau ═════════════════════════════════════════════════════════════════

enum PpPanelAction { done, delete }

Future<PpPanelAction?> showPpPanelSheet(
  BuildContext context, {
  required PpPanel panel,
  required bool monoFeed,
  required VoidCallback onChanged,
}) {
  return showPpSheet<PpPanelAction>(
    context,
    builder: (_) =>
        _PanelSheet(panel: panel, monoFeed: monoFeed, onChanged: onChanged),
  );
}

class _PanelSheet extends StatefulWidget {
  const _PanelSheet({
    required this.panel,
    required this.monoFeed,
    required this.onChanged,
  });

  final PpPanel panel;
  final bool monoFeed;
  final VoidCallback onChanged;

  @override
  State<_PanelSheet> createState() => _PanelSheetState();
}

class _PanelSheetState extends State<_PanelSheet> {
  late final TextEditingController _name;

  PpPanel get p => widget.panel;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: p.name);
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  void _update(VoidCallback fn) {
    setState(fn);
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final tri = p.isThreePhase && !widget.monoFeed;
    final inputs = PpCatalog.current.connectors
        .where((c) => c.isThreePhase == p.input.isThreePhase)
        .toList();
    final outConnectors =
        PpCatalog.current.connectors.where((c) => tri || !c.isThreePhase).toList();

    return PpSheetScaffold(
      emoji: '🗄️',
      title: loc.ppPanelSheetTitle,
      footer: Row(
        children: [
          SizedBox(
            height: 50,
            child: OutlinedButton.icon(
              onPressed: () => Navigator.pop(context, PpPanelAction.delete),
              icon: const Icon(Icons.delete_outline_rounded),
              label: Text(loc.ppDelete),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFFF5252),
                side: const BorderSide(color: Color(0x66FF5252)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: PpPrimaryButton(
              label: loc.ppDone,
              onPressed: () => Navigator.pop(context, PpPanelAction.done),
            ),
          ),
        ],
      ),
      children: [
        TextField(
          controller: _name,
          textCapitalization: TextCapitalization.sentences,
          decoration: ppInputDecoration(loc.ppNameLabel),
          onChanged: (v) => _update(() => p.name = v.trim().isEmpty ? p.name : v.trim()),
        ),
        PpLabel(loc.ppPanelInputLabel),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final c in inputs)
              PpChoiceChip(
                label: c.label,
                color: Color(c.colorValue),
                selected: p.input == c,
                onTap: () => _update(() => p.input = c),
              ),
          ],
        ),
        PpLabel(loc.ppMainBreakerLabel),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final b in kPpBreakers.where((b) => b >= 10))
              PpChoiceChip(
                label: '$b A',
                selected: p.mainBreakerA == b,
                onTap: () => _update(() => p.mainBreakerA = b),
              ),
          ],
        ),
        PpLabel(loc.ppOutputsLabel(p.outputs.length.toString())),
        for (final (i, o) in p.outputs.indexed)
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: kPpFieldBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text('${i + 1}',
                    style: const TextStyle(
                        color: Colors.white38, fontWeight: FontWeight.w800)),
                const SizedBox(width: 10),
                PpConnectorChip(o.connector, dense: true),
                const SizedBox(width: 8),
                if (!o.connector.isThreePhase && tri)
                  PpPhaseBadge(o.phase),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    o.child?.name ?? loc.ppFreeOutput,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: o.child == null ? Colors.white30 : Colors.white70,
                      fontSize: 12.5,
                    ),
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(Icons.remove_circle_outline_rounded,
                      color: Colors.white38, size: 20),
                  onPressed: () => _update(() => p.outputs.removeAt(i)),
                ),
              ],
            ),
          ),
        const SizedBox(height: 6),
        Text(loc.ppAddOutputHint,
            style: const TextStyle(color: Colors.white54, fontSize: 12.5)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final c in outConnectors)
              ActionChip(
                avatar: const Icon(Icons.add_rounded, size: 16),
                label: Text(c.shortLabel),
                backgroundColor: Color(c.colorValue).withValues(alpha: 0.12),
                side: BorderSide(color: Color(c.colorValue).withValues(alpha: 0.5)),
                labelStyle: TextStyle(
                    color: Color(c.colorValue), fontWeight: FontWeight.w700),
                onPressed: () => _update(() {
                  final monoCount =
                      p.outputs.where((x) => !x.connector.isThreePhase).length;
                  p.outputs.add(PpOutput.fresh(c,
                      phase: PpPhase.values[monoCount % 3]));
                }),
              ),
          ],
        ),
        if (tri && p.outputs.any((o) => !o.connector.isThreePhase)) ...[
          const SizedBox(height: 14),
          OutlinedButton.icon(
            onPressed: () => _update(p.autoAssignPhases),
            icon: const Icon(Icons.auto_fix_high_rounded),
            label: Text(loc.ppAutoPhases),
            style: OutlinedButton.styleFrom(
              foregroundColor: kPpAccent,
              side: BorderSide(color: kPpAccent.withValues(alpha: 0.5)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
            ),
          ),
        ],
      ],
    );
  }
}

// ═══ Ajouter un départ (source) ══════════════════════════════════════════════

Future<PpConnector?> showPpConnectorPicker(
  BuildContext context, {
  required bool threePhase,
}) {
  return showPpSheet<PpConnector>(
    context,
    builder: (ctx) {
      final loc = AppLocalizations.of(ctx);
      return PpSheetScaffold(
        emoji: '➕',
        title: loc.ppAddOutput,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final c in PpCatalog.current.connectors
                  .where((c) => threePhase || !c.isThreePhase))
                PpChoiceChip(
                  label: c.label,
                  color: Color(c.colorValue),
                  selected: false,
                  onTap: () => Navigator.pop(ctx, c),
                ),
            ],
          ),
        ],
      );
    },
  );
}
