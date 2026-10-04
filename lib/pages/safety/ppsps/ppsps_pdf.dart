// lib/pages/safety/ppsps/ppsps_pdf.dart
//
// Génération du PDF d'un plan de sécurité. Le document est rédigé dans la
// langue du pays du chantier (français pour la France et la Belgique,
// anglais sinon), indépendamment de la langue de l'app.
//
// Police embarquée (IBM Plex Sans, licence OFL, assets/fonts/pdf/) : couvre
// les accents, « œ », les guillemets typographiques, etc., hors ligne.

import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../safety_library.dart';
import 'ppsps_models.dart';

/// Libellés du PDF, par langue de document.
const Map<String, Map<String, String>> _kTexts = {
  'fr': {
    'general': 'Renseignements généraux',
    'event': 'Événement',
    'venue': 'Lieu',
    'address': 'Adresse',
    'organizer': 'Organisateur (maître d\'ouvrage)',
    'coordinator': 'Coordinateur sécurité',
    'phases': 'Phases du chantier',
    'montage': 'Montage',
    'exploitation': 'Exploitation',
    'demontage': 'Démontage',
    'company': 'Entreprise rédactrice',
    'companyName': 'Raison sociale',
    'activity': 'Activité sur le chantier',
    'responsible': 'Responsable sur site',
    'phone': 'Téléphone',
    'workers': 'Intervenants',
    'workerCompany': 'Entreprise',
    'trade': 'Métier',
    'contact': 'Contact',
    'headcount': 'Effectif',
    'total': 'Effectif total',
    'risks': 'Analyse des risques et mesures de prévention',
    'riskSummary': 'risques retenus',
    'severity': 'Gravité',
    'probability': 'Probabilité',
    'criticality': 'Criticité',
    'collective': 'Protection collective',
    'individuelle': 'Protection individuelle',
    'organisationnelle': 'Organisation',
    'custom': 'Mesures complémentaires',
    'emergency': 'Organisation des secours',
    'numbers': 'Numéros d\'urgence',
    'hospital': 'Hôpital le plus proche',
    'firstAiders': 'Secouristes présents',
    'assembly': 'Point de rassemblement',
    'equipment': 'Matériel de secours',
    'regulation': 'Cadre réglementaire',
    'signatures': 'Signatures',
    'signedBy': 'Établi par',
    'coordVisa': 'Visa du coordinateur',
    'date': 'Date',
    'draft': 'BROUILLON',
    'generated': 'Document généré avec ShowTech Tools le',
    'page': 'Page',
    'none': 'Aucun',
    'disclaimer':
        'Document établi à l\'aide d\'un outil d\'aide à la rédaction. Son contenu reste sous la responsabilité de l\'entreprise signataire.',
  },
  'en': {
    'general': 'General information',
    'event': 'Event',
    'venue': 'Venue',
    'address': 'Address',
    'organizer': 'Client / organiser',
    'coordinator': 'Safety coordinator',
    'phases': 'Site phases',
    'montage': 'Load-in',
    'exploitation': 'Show',
    'demontage': 'Load-out',
    'company': 'Contractor',
    'companyName': 'Company name',
    'activity': 'Activity on site',
    'responsible': 'Site manager',
    'phone': 'Phone',
    'workers': 'Contractors on site',
    'workerCompany': 'Company',
    'trade': 'Trade',
    'contact': 'Contact',
    'headcount': 'Headcount',
    'total': 'Total headcount',
    'risks': 'Risk assessment and control measures',
    'riskSummary': 'risks identified',
    'severity': 'Severity',
    'probability': 'Likelihood',
    'criticality': 'Risk level',
    'collective': 'Collective protection',
    'individuelle': 'Personal protection',
    'organisationnelle': 'Organisation',
    'custom': 'Additional measures',
    'emergency': 'Emergency arrangements',
    'numbers': 'Emergency numbers',
    'hospital': 'Nearest hospital',
    'firstAiders': 'First aiders on site',
    'assembly': 'Assembly point',
    'equipment': 'First aid and fire equipment',
    'regulation': 'Regulatory framework',
    'signatures': 'Signatures',
    'signedBy': 'Prepared by',
    'coordVisa': 'Coordinator approval',
    'date': 'Date',
    'draft': 'DRAFT',
    'generated': 'Document generated with ShowTech Tools on',
    'page': 'Page',
    'none': 'None',
    'disclaimer':
        'This document was prepared with a drafting aid. Its content remains the responsibility of the signing company.',
  },
};

class PpspsPdf {
  static const PdfColor _accent = PdfColor.fromInt(0xFFB86E00);
  static const PdfColor _ink = PdfColor.fromInt(0xFF1A1C20);
  static const PdfColor _muted = PdfColor.fromInt(0xFF5A5E66);
  static const PdfColor _line = PdfColor.fromInt(0xFFD8DAD4);
  static const PdfColor _band = PdfColor.fromInt(0xFFF3F1EC);
  static const PdfColor _high = PdfColor.fromInt(0xFFC62828);
  static const PdfColor _mid = PdfColor.fromInt(0xFFE08A00);
  static const PdfColor _low = PdfColor.fromInt(0xFF2E7D32);

  static String _docLanguage(String country) =>
      const {'FR', 'BE', 'LU'}.contains(country) ? 'fr' : 'en';

  static PdfColor _critColor(int c) =>
      c >= 12 ? _high : (c >= 6 ? _mid : _low);

  static String _fmtDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

  static String _fmtRange(PpspsPhaseDates? p) {
    if (p?.start == null) return '';
    final start = _fmtDate(p!.start!);
    if (p.end == null || _fmtDate(p.end!) == start) return start;
    return '$start – ${_fmtDate(p.end!)}';
  }

  static Future<Uint8List> build(PpspsDocument doc, SafetyLibrary lib) async {
    final regular =
        pw.Font.ttf(await rootBundle.load('assets/fonts/pdf/IBMPlexSans-Regular.ttf'));
    final bold =
        pw.Font.ttf(await rootBundle.load('assets/fonts/pdf/IBMPlexSans-Bold.ttf'));

    final lang = _docLanguage(doc.country);
    final t = _kTexts[lang]!;
    String phaseName(SafetyPhase p) => t[p.name]!;

    SafetyCountry? country;
    for (final c in lib.countries) {
      if (c.code == doc.country) country = c;
    }
    final docTitle = country?.document.isNotEmpty == true
        ? country!.document
        : (lang == 'fr' ? 'Plan de sécurité' : 'Safety plan');

    final categories = {for (final c in lib.categories) c.id: c};
    final selectedRisks = lib.risks
        .where((r) => doc.risks.containsKey(r.id))
        .toList()
      ..sort((a, b) => b.criticality.compareTo(a.criticality));
    final measuresById = {for (final m in lib.measures) m.id: m};

    final now = DateTime.now();
    final draft = doc.status == PpspsStatus.draft;

    // ── Styles ──
    final h1 = pw.TextStyle(font: bold, fontSize: 20, color: _ink);
    final h2 = pw.TextStyle(font: bold, fontSize: 13, color: _accent);
    final body = pw.TextStyle(font: regular, fontSize: 9.5, color: _ink);
    final small = pw.TextStyle(font: regular, fontSize: 8, color: _muted);
    final label = pw.TextStyle(font: bold, fontSize: 9, color: _muted);

    String orDash(String s) => s.trim().isEmpty ? '–' : s.trim();

    var sectionNo = 0;
    pw.Widget section(String title) {
      sectionNo++;
      return pw.Container(
        margin: const pw.EdgeInsets.only(top: 16, bottom: 6),
        padding: const pw.EdgeInsets.only(bottom: 4),
        decoration: const pw.BoxDecoration(
          border: pw.Border(bottom: pw.BorderSide(color: _accent, width: 1)),
        ),
        child: pw.Text('$sectionNo. $title', style: h2),
      );
    }

    pw.Widget keyValues(List<List<String>> rows) => pw.Table(
          columnWidths: const {
            0: pw.FixedColumnWidth(150),
            1: pw.FlexColumnWidth(),
          },
          children: [
            for (final r in rows)
              pw.TableRow(children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 3),
                  child: pw.Text(r[0], style: label),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 3),
                  child: pw.Text(orDash(r[1]), style: body),
                ),
              ]),
          ],
        );

    pw.Widget badge(String text, PdfColor color) => pw.Container(
          padding: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: pw.BoxDecoration(
            color: color,
            borderRadius: pw.BorderRadius.circular(3),
          ),
          child: pw.Text(text,
              style: pw.TextStyle(
                  font: bold, fontSize: 8.5, color: PdfColors.white)),
        );

    pw.Widget riskBlock(SafetyRisk r) {
      final sel = doc.risks[r.id]!;
      final byType = <SafetyMeasureType, List<String>>{};
      for (final id in sel.measureIds) {
        final m = measuresById[id];
        if (m == null) continue;
        byType.putIfAbsent(m.type, () => []).add(m.label.forLanguage(lang));
      }
      final cat = categories[r.categoryId]?.label.forLanguage(lang) ?? '';
      final phases =
          SafetyPhase.values.where(r.phases.contains).map(phaseName).join(', ');

      return pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 8),
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: _line, width: 0.6),
          borderRadius: pw.BorderRadius.circular(4),
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            pw.Container(
              color: _band,
              padding: const pw.EdgeInsets.fromLTRB(8, 6, 8, 6),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(r.label.forLanguage(lang),
                            style: pw.TextStyle(
                                font: bold, fontSize: 10, color: _ink)),
                        pw.SizedBox(height: 2),
                        pw.Text('$cat · $phases', style: small),
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 8),
                  pw.Text(
                    '${t['severity']} ${r.severity} · ${t['probability']} ${r.probability}  ',
                    style: small,
                  ),
                  badge('${r.criticality}', _critColor(r.criticality)),
                ],
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.fromLTRB(8, 6, 8, 6),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  for (final type in SafetyMeasureType.values)
                    if (byType[type]?.isNotEmpty == true) ...[
                      pw.Text(t[type.name]!, style: label),
                      for (final m in byType[type]!)
                        pw.Bullet(text: m, style: body),
                      pw.SizedBox(height: 3),
                    ],
                  if (sel.customMeasures.isNotEmpty) ...[
                    pw.Text(t['custom']!, style: label),
                    for (final m in sel.customMeasures)
                      pw.Bullet(text: m, style: body),
                  ],
                  if (sel.measureCount == 0) pw.Text('–', style: body),
                ],
              ),
            ),
          ],
        ),
      );
    }

    pw.Widget signatureBox(String title, String name) => pw.Expanded(
          child: pw.Container(
            height: 90,
            padding: const pw.EdgeInsets.all(8),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: _line, width: 0.8),
              borderRadius: pw.BorderRadius.circular(4),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(title, style: label),
                if (name.trim().isNotEmpty)
                  pw.Text(name.trim(), style: body),
                pw.Spacer(),
                pw.Text('${t['date']} :', style: small),
              ],
            ),
          ),
        );

    final pdf = pw.Document(
      title: '$docTitle – ${doc.eventName}',
      author: doc.companyName,
      creator: 'ShowTech Tools',
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.fromLTRB(40, 40, 40, 44),
        theme: pw.ThemeData.withFont(base: regular, bold: bold),
        header: (ctx) => ctx.pageNumber == 1
            ? pw.SizedBox()
            : pw.Container(
                margin: const pw.EdgeInsets.only(bottom: 10),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(orDash(doc.eventName), style: small),
                    pw.Text(docTitle, style: small),
                  ],
                ),
              ),
        footer: (ctx) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('${t['generated']} ${_fmtDate(now)}', style: small),
            pw.Text('${t['page']} ${ctx.pageNumber} / ${ctx.pagesCount}',
                style: small),
          ],
        ),
        build: (ctx) => [
          // ── En-tête ──
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(docTitle.toUpperCase(),
                        style: pw.TextStyle(
                            font: bold,
                            fontSize: 10,
                            letterSpacing: 0.8,
                            color: _accent)),
                    pw.SizedBox(height: 4),
                    pw.Text(orDash(doc.eventName), style: h1),
                    pw.SizedBox(height: 2),
                    pw.Text(
                      [doc.venue, doc.address]
                          .where((s) => s.trim().isNotEmpty)
                          .join(' · '),
                      style: body,
                    ),
                  ],
                ),
              ),
              if (draft) badge(t['draft']!, _mid),
            ],
          ),

          // ── 1. Renseignements généraux ──
          section(t['general']!),
          keyValues([
            [t['event']!, doc.eventName],
            [t['venue']!, doc.venue],
            [t['address']!, doc.address],
            [t['organizer']!, doc.organizer],
            [t['coordinator']!, doc.coordinator],
            for (final p in SafetyPhase.values)
              if (doc.phases[p]?.isSet == true)
                [phaseName(p), _fmtRange(doc.phases[p])],
          ]),

          // ── 2. Entreprise ──
          section(t['company']!),
          keyValues([
            [t['companyName']!, doc.companyName],
            [t['address']!, doc.companyAddress],
            [t['activity']!, doc.companyActivity],
            [t['responsible']!, doc.responsibleName],
            [t['phone']!, doc.responsiblePhone],
          ]),

          // ── 3. Intervenants ──
          section(t['workers']!),
          if (doc.workers.isEmpty)
            pw.Text(t['none']!, style: body)
          else ...[
            pw.TableHelper.fromTextArray(
              headers: [
                t['workerCompany']!,
                t['trade']!,
                t['contact']!,
                t['phone']!,
                t['headcount']!,
              ],
              data: [
                for (final w in doc.workers)
                  [
                    w.company,
                    w.trade,
                    w.contact,
                    w.phone,
                    w.headcount > 0 ? '${w.headcount}' : '',
                  ],
              ],
              headerStyle: pw.TextStyle(font: bold, fontSize: 9, color: _ink),
              cellStyle: body,
              headerDecoration: const pw.BoxDecoration(color: _band),
              border: pw.TableBorder.all(color: _line, width: 0.5),
              cellPadding:
                  const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            ),
            if (doc.totalHeadcount > 0)
              pw.Padding(
                padding: const pw.EdgeInsets.only(top: 4),
                child: pw.Text('${t['total']} : ${doc.totalHeadcount}',
                    style: label),
              ),
          ],

          // ── 4. Risques ──
          section(t['risks']!),
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 8),
            child: pw.Text('${selectedRisks.length} ${t['riskSummary']}',
                style: body),
          ),
          for (final r in selectedRisks) riskBlock(r),

          // ── 5. Secours ──
          section(t['emergency']!),
          pw.Text(t['numbers']!, style: label),
          pw.SizedBox(height: 4),
          pw.Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              for (final n in emergencyNumbersFor(doc.country))
                pw.Container(
                  padding:
                      const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: _high, width: 0.8),
                    borderRadius: pw.BorderRadius.circular(4),
                  ),
                  child: pw.RichText(
                    text: pw.TextSpan(children: [
                      pw.TextSpan(
                          text: '${n.number}  ',
                          style: pw.TextStyle(
                              font: bold, fontSize: 11, color: _high)),
                      pw.TextSpan(text: n.label, style: body),
                    ]),
                  ),
                ),
            ],
          ),
          pw.SizedBox(height: 8),
          keyValues([
            [
              t['hospital']!,
              [
                doc.emergency.hospitalName,
                doc.emergency.hospitalAddress,
                doc.emergency.hospitalPhone,
              ].where((s) => s.trim().isNotEmpty).join(' · '),
            ],
            [t['firstAiders']!, doc.emergency.firstAiders],
            [t['assembly']!, doc.emergency.assemblyPoint],
            [t['equipment']!, doc.emergency.equipment],
          ]),

          // ── 6. Réglementation et signatures ──
          if (country != null && country.references.isNotEmpty) ...[
            section(t['regulation']!),
            pw.Text(country.references, style: body),
          ],
          section(t['signatures']!),
          pw.Row(
            children: [
              signatureBox(t['signedBy']!, doc.responsibleName),
              pw.SizedBox(width: 12),
              signatureBox(t['coordVisa']!, doc.coordinator),
            ],
          ),
          pw.SizedBox(height: 12),
          pw.Text(t['disclaimer']!, style: small),
        ],
      ),
    );

    return pdf.save();
  }
}
