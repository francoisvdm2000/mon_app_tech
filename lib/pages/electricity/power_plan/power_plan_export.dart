// lib/pages/electricity/power_plan/power_plan_export.dart
//
// Exports du plan électrique : PDF (synoptique + tableau de charge) et CSV.
// Police embarquée IBM Plex Sans (assets/fonts/pdf/) pour les accents, φ, Δ…

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'power_plan_models.dart';
import 'power_plan_widgets.dart';

/// Un bloc du tableau de charge : la source ou un tableau, avec ses départs.
class PpLoadBlock {
  PpLoadBlock({
    required this.title,
    required this.detail,
    required this.currents,
    required this.limitA,
    required this.threePhase,
    required this.rows,
  });

  final String title;
  final String detail;
  final PpCurrents currents;
  final double limitA;
  final bool threePhase;
  final List<PpLoadRow> rows;
}

List<PpLoadBlock> ppLoadBlocks(
    PpPlan plan, PpCalc calc, AppLocalizations loc) {
  final s = plan.source;
  if (s == null) return [];
  final byId = {for (final r in calc.rows) r.output.id: r};
  final blocks = <PpLoadBlock>[
    PpLoadBlock(
      title: s.name,
      detail: '${ppSourceKindName(loc, s.kind)} · ${ppSourceDetail(loc, s)}',
      currents: calc.sourceCurrents,
      limitA: s.capacityAmps,
      threePhase: s.isThreePhase,
      rows: [for (final o in s.outputs) if (byId[o.id] != null) byId[o.id]!],
    ),
  ];
  for (final p in plan.allPanels) {
    blocks.add(PpLoadBlock(
      title: p.name,
      detail: '${p.input.label} · ${p.mainBreakerA} A',
      currents: calc.panelCurrents[p.id] ?? PpCurrents(),
      limitA: p.mainBreakerA.toDouble(),
      threePhase: p.isThreePhase,
      rows: [for (final o in p.outputs) if (byId[o.id] != null) byId[o.id]!],
    ));
  }
  return blocks;
}

String ppRowPhase(PpLoadRow r) => r.phase?.label ?? 'L1·L2·L3';

String ppRowCurrent(PpLoadRow r) {
  final c = r.currents;
  if (r.phase != null) return ppFormatAmps(c.of(r.phase!));
  return '${ppFormatAmps(c.l1)} / ${ppFormatAmps(c.l2)} / ${ppFormatAmps(c.l3)}';
}

String ppRowConnected(PpLoadRow r) {
  final c = r.output.child;
  return switch (c) {
    null => '—',
    PpPanel(:final name) => '→ $name',
    PpLoad(:final name) => name,
  };
}

String ppRowBreaker(PpLoadRow r) =>
    '${r.output.connector.breakerLabel(r.output.breakerA)}${r.output.rcd ? ' · 30 mA' : ''}';

String ppRowCable(PpLoadRow r) =>
    '${ppFormatLength(r.output.cableLength)} m · '
    '${r.output.connector.cableName(r.output.cableSection)}';

// ═══ PDF ═════════════════════════════════════════════════════════════════════

class PowerPlanPdf {
  static const _ink = PdfColor.fromInt(0xFF15151F);
  static const _muted = PdfColor.fromInt(0xFF5A5A6A);
  static const _band = PdfColor.fromInt(0xFFFFF1DE);
  static const _accent = PdfColor.fromInt(0xFFFF9F1C);
  static const _line = PdfColor.fromInt(0xFFD5D5DD);
  static const _red = PdfColor.fromInt(0xFFD32F2F);
  static const _orange = PdfColor.fromInt(0xFFEF6C00);
  static const _blue = PdfColor.fromInt(0xFF1E88E5);

  static Future<Uint8List> build({
    required PpPlan plan,
    required PpCalc calc,
    required AppLocalizations loc,
    required Uint8List synopticPng,
    required String localeName,
  }) async {
    final regular = pw.Font.ttf(
        await rootBundle.load('assets/fonts/pdf/IBMPlexSans-Regular.ttf'));
    final bold = pw.Font.ttf(
        await rootBundle.load('assets/fonts/pdf/IBMPlexSans-Bold.ttf'));
    final theme = pw.ThemeData.withFont(base: regular, bold: bold);
    String date;
    try {
      date = DateFormat.yMMMd(localeName).add_Hm().format(DateTime.now());
    } catch (_) {
      date = DateTime.now().toIso8601String().substring(0, 16).replaceAll('T', ' ');
    }

    final h1 = pw.TextStyle(font: bold, fontSize: 18, color: _ink);
    final h2 = pw.TextStyle(font: bold, fontSize: 12, color: _ink);
    const body = pw.TextStyle(fontSize: 8.5, color: _ink);
    const small = pw.TextStyle(fontSize: 8, color: _muted);

    final doc = pw.Document(title: plan.name, author: 'ShowTech Tools');
    final s = plan.source;

    pw.Widget kpi(String label, String value, {PdfColor color = _ink}) =>
        pw.Expanded(
          child: pw.Container(
            margin: const pw.EdgeInsets.only(right: 6),
            padding: const pw.EdgeInsets.all(7),
            decoration: pw.BoxDecoration(
              color: const PdfColor.fromInt(0xFFF7F7FA),
              borderRadius: pw.BorderRadius.circular(5),
              border: pw.Border.all(color: _line, width: 0.5),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(label, style: small),
                pw.SizedBox(height: 2),
                pw.Text(value,
                    style: pw.TextStyle(font: bold, fontSize: 12, color: color)),
              ],
            ),
          ),
        );

    final total = calc.sourceCurrents;
    final ratio = calc.sourceLoadRatio;
    final kpis = pw.Row(children: [
      kpi(loc.ppKpiPower, '${ppFormatKw(total.watts)} kW'),
      kpi(loc.ppKpiApparent, '${(total.va / 1000).toStringAsFixed(1)} kVA'),
      kpi(loc.ppKpiMaxPhase, '${ppFormatAmps(total.max)} A'),
      if (s != null)
        kpi(loc.ppKpiSourceUse, '${(ratio * 100).round()} %',
            color: ratio > 1 ? _red : (ratio > kPpWarnRatio ? _orange : _ink)),
      kpi(loc.ppKpiWorstDrop, '${calc.worstDrop.toStringAsFixed(1)} %',
          color: calc.worstDrop > kPpMaxDropPercent ? _orange : _ink),
      if (s != null &&
          s.kind == PpSourceKind.generator &&
          calc.recommendedGeneratorKva != null)
        kpi(loc.ppKpiGenerator, '${calc.recommendedGeneratorKva} kVA'),
    ]);

    pw.Widget header(pw.Context ctx) => pw.Container(
          margin: const pw.EdgeInsets.only(bottom: 8),
          padding: const pw.EdgeInsets.only(bottom: 4),
          decoration: const pw.BoxDecoration(
            border: pw.Border(bottom: pw.BorderSide(color: _accent, width: 1.2)),
          ),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(plan.name, style: pw.TextStyle(font: bold, fontSize: 9)),
              pw.Text(loc.ppPdfTitle, style: small),
            ],
          ),
        );

    pw.Widget footer(pw.Context ctx) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('${loc.ppPdfGenerated} · $date', style: small),
            pw.Text('${ctx.pageNumber} / ${ctx.pagesCount}', style: small),
          ],
        );

    // ── Page 1 : synthèse + synoptique ──
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: const pw.EdgeInsets.all(28),
        theme: theme,
        build: (ctx) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(loc.ppPdfTitle.toUpperCase(),
                        style: pw.TextStyle(
                            font: bold, fontSize: 9, color: _accent,
                            letterSpacing: 1.5)),
                    pw.Text(plan.name, style: h1),
                  ],
                ),
                pw.Text(date, style: small),
              ],
            ),
            pw.SizedBox(height: 10),
            kpis,
            pw.SizedBox(height: 10),
            pw.Expanded(
              child: pw.Container(
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: _line, width: 0.5),
                  borderRadius: pw.BorderRadius.circular(6),
                ),
                padding: const pw.EdgeInsets.all(6),
                child: pw.Center(
                  child: pw.Image(pw.MemoryImage(synopticPng),
                      fit: pw.BoxFit.contain),
                ),
              ),
            ),
            pw.SizedBox(height: 6),
            footer(ctx),
          ],
        ),
      ),
    );

    // ── Pages suivantes : tableau de charge ──
    final blocks = ppLoadBlocks(plan, calc, loc);
    final headers = [
      loc.ppColOutput,
      loc.ppColBreaker,
      loc.ppColPhase,
      loc.ppColCable,
      loc.ppColConnected,
      loc.ppColPower,
      loc.ppColCurrent,
      loc.ppColDrop,
    ];

    pw.Widget blockWidget(PpLoadBlock b) {
      final c = b.currents;
      final phases = b.threePhase
          ? 'L1 ${ppFormatAmps(c.l1)} · L2 ${ppFormatAmps(c.l2)} · L3 ${ppFormatAmps(c.l3)} A'
          : '${ppFormatAmps(c.max)} A';
      final over = c.max > b.limitA;
      return pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 14),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            pw.Container(
              padding:
                  const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 5),
              color: _band,
              child: pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Text('${b.title}  —  ${b.detail}', style: h2),
                  ),
                  pw.Text(
                    '${ppFormatKw(c.watts)} kW  ·  $phases  /  ${b.limitA.round()} A',
                    style: pw.TextStyle(
                        font: bold, fontSize: 9, color: over ? _red : _ink),
                  ),
                ],
              ),
            ),
            if (b.rows.isEmpty)
              pw.Padding(
                padding: const pw.EdgeInsets.all(6),
                child: pw.Text('—', style: body),
              )
            else
              pw.TableHelper.fromTextArray(
                headers: headers,
                data: [
                  for (final r in b.rows)
                    [
                      '${r.index}. ${r.output.connector.label}',
                      ppRowBreaker(r),
                      ppRowPhase(r),
                      ppRowCable(r),
                      ppRowConnected(r),
                      r.output.child == null ? '' : ppFormatKw(r.currents.watts),
                      r.output.child == null ? '' : ppRowCurrent(r),
                      r.output.child == null
                          ? ''
                          : r.dropPercent.toStringAsFixed(1),
                    ],
                ],
                headerStyle: pw.TextStyle(font: bold, fontSize: 8, color: _ink),
                cellStyle: body,
                headerDecoration:
                    const pw.BoxDecoration(color: PdfColor.fromInt(0xFFF2F2F6)),
                border: pw.TableBorder.all(color: _line, width: 0.5),
                cellPadding:
                    const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                columnWidths: const {
                  0: pw.FlexColumnWidth(2.2),
                  1: pw.FlexColumnWidth(1.3),
                  2: pw.FlexColumnWidth(1),
                  3: pw.FlexColumnWidth(1.8),
                  4: pw.FlexColumnWidth(2.6),
                  5: pw.FlexColumnWidth(0.9),
                  6: pw.FlexColumnWidth(1.8),
                  7: pw.FlexColumnWidth(0.9),
                },
              ),
          ],
        ),
      );
    }

    final catEntries = calc.categoryWatts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: const pw.EdgeInsets.fromLTRB(28, 24, 28, 24),
        theme: theme,
        header: header,
        footer: footer,
        build: (ctx) => [
          pw.Text(loc.ppTabLoadTable, style: h1),
          pw.SizedBox(height: 10),
          for (final b in blocks) blockWidget(b),
          if (catEntries.isNotEmpty) ...[
            pw.SizedBox(height: 6),
            pw.Text(loc.ppCategoriesTitle, style: h2),
            pw.SizedBox(height: 6),
            pw.TableHelper.fromTextArray(
              headers: [loc.ppColCategory, loc.ppColPower, '%'],
              data: [
                for (final e in catEntries)
                  [
                    ppCategoryName(loc, e.key),
                    ppFormatKw(e.value),
                    total.watts > 0
                        ? (e.value / total.watts * 100).toStringAsFixed(0)
                        : '0',
                  ],
              ],
              headerStyle: pw.TextStyle(font: bold, fontSize: 8, color: _ink),
              cellStyle: body,
              border: pw.TableBorder.all(color: _line, width: 0.5),
              cellPadding:
                  const pw.EdgeInsets.symmetric(horizontal: 4, vertical: 3),
            ),
          ],
          pw.SizedBox(height: 14),
          pw.Text(loc.ppAlertsTitle, style: h2),
          pw.SizedBox(height: 6),
          if (calc.alerts.isEmpty)
            pw.Text(loc.ppAllGoodPdf, style: body)
          else
            for (final a in calc.alerts)
              pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 3),
                child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      width: 6,
                      height: 6,
                      margin: const pw.EdgeInsets.only(top: 3, right: 6),
                      decoration: pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        color: switch (a.level) {
                          PpAlertLevel.error => _red,
                          PpAlertLevel.warning => _orange,
                          PpAlertLevel.info => _blue,
                        },
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        a.where.isEmpty
                            ? ppAlertText(loc, a)
                            : '${a.where} — ${ppAlertText(loc, a)}',
                        style: body,
                      ),
                    ),
                  ],
                ),
              ),
          pw.SizedBox(height: 14),
          pw.Text(loc.ppDisclaimer, style: small),
        ],
      ),
    );

    return doc.save();
  }
}

// ═══ CSV ═════════════════════════════════════════════════════════════════════

Uint8List ppBuildCsv(PpPlan plan, PpCalc calc, AppLocalizations loc) {
  String esc(String v) {
    final needs = v.contains(';') || v.contains('"') || v.contains('\n');
    final x = v.replaceAll('"', '""');
    return needs ? '"$x"' : x;
  }

  String fx(double v, [int d = 2]) => v.toStringAsFixed(d);

  final lines = <String>[
    [
      loc.ppColPanel,
      loc.ppColOutput,
      loc.ppColConnector,
      loc.ppColBreaker,
      loc.ppColPhase,
      loc.ppColLength,
      loc.ppColCable,
      loc.ppColConnected,
      loc.ppColCategory,
      loc.ppColPower,
      'I L1 (A)',
      'I L2 (A)',
      'I L3 (A)',
      loc.ppColDrop,
    ].map(esc).join(';'),
  ];
  for (final b in ppLoadBlocks(plan, calc, loc)) {
    for (final r in b.rows) {
      final child = r.output.child;
      lines.add([
        b.title,
        '${r.index}',
        r.output.connector.label,
        ppRowBreaker(r),
        ppRowPhase(r),
        ppFormatLength(r.output.cableLength),
        r.output.connector.cableName(r.output.cableSection),
        child?.name ?? '',
        child is PpLoad ? ppCategoryName(loc, child.category) : '',
        child == null ? '' : fx(r.currents.watts / 1000),
        child == null ? '' : fx(r.currents.l1, 1),
        child == null ? '' : fx(r.currents.l2, 1),
        child == null ? '' : fx(r.currents.l3, 1),
        child == null ? '' : fx(r.dropPercent, 1),
      ].map(esc).join(';'));
    }
  }
  // BOM UTF-8 pour qu'Excel lise bien les accents.
  return Uint8List.fromList([0xEF, 0xBB, 0xBF, ...utf8.encode(lines.join('\r\n'))]);
}
