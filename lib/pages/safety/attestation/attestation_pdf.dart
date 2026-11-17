// lib/pages/safety/attestation/attestation_pdf.dart
//
// PDF de l'attestation de bon montage : réserves en tête de document,
// résultats des contrôles par élément avec photos, texte d'attestation et
// signature. Rédigé dans la langue demandée (6 langues).

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:mon_app_tech/app/utils/pdf_branding.dart';

import '../safety_library.dart';
import 'attestation_models.dart';
import 'attestation_storage.dart';

const Map<String, Map<String, String>> _kTexts = {
  'fr': {
    'title': 'Attestation de bon montage',
    'event': 'Événement',
    'venue': 'Lieu',
    'address': 'Adresse',
    'organizer': 'Organisateur',
    'company': 'Entreprise',
    'reserves': 'Réserves',
    'reservesIntro': 'Points non conformes à lever avant l\'accueil du public :',
    'noReserve': 'Aucune réserve.',
    'elements': 'Éléments contrôlés',
    'applied': 'Charge appliquée',
    'rated': 'charge admissible',
    'overload': 'SURCHARGE',
    'check': 'Point de contrôle',
    'result': 'Résultat',
    'ok': 'Conforme',
    'nc': 'Non conforme',
    'na': 'Sans objet',
    'notChecked': 'Non contrôlé',
    'photos': 'Photos',
    'attestation': 'Attestation',
    'statement':
        'Je soussigné(e), {name}, atteste que les installations listées ci-dessus ont été montées conformément aux notices des fabricants et aux règles de l\'art, et qu\'elles ont été vérifiées avant l\'accueil du public.',
    'statementReserve':
        ' Cette attestation est délivrée sous réserve des points listés en tête de document.',
    'signedBy': 'Signature',
    'role': 'Fonction',
    'date': 'Date',
    'draft': 'NON SIGNÉ',
    'withReserve': 'SIGNÉ AVEC RÉSERVE',
    'generated': 'Document généré avec ShowTech Tools le',
    'page': 'Page',
    'disclaimer':
        'Document établi à l\'aide d\'un outil d\'aide à la rédaction. Son contenu reste sous la responsabilité de l\'entreprise signataire.',
  },
  'en': {
    'title': 'Installation certificate',
    'event': 'Event',
    'venue': 'Venue',
    'address': 'Address',
    'organizer': 'Organiser',
    'company': 'Company',
    'reserves': 'Reservations',
    'reservesIntro': 'Non-conformities to be cleared before the audience is admitted:',
    'noReserve': 'No reservations.',
    'elements': 'Inspected elements',
    'applied': 'Applied load',
    'rated': 'rated load',
    'overload': 'OVERLOAD',
    'check': 'Check',
    'result': 'Result',
    'ok': 'Compliant',
    'nc': 'Non-compliant',
    'na': 'Not applicable',
    'notChecked': 'Not checked',
    'photos': 'Photos',
    'attestation': 'Certification',
    'statement':
        'I, the undersigned, {name}, certify that the installations listed above have been assembled in accordance with the manufacturers\' instructions and good practice, and were inspected before the audience was admitted.',
    'statementReserve':
        ' This certificate is issued subject to the reservations listed at the top of this document.',
    'signedBy': 'Signature',
    'role': 'Position',
    'date': 'Date',
    'draft': 'NOT SIGNED',
    'withReserve': 'SIGNED WITH RESERVATIONS',
    'generated': 'Document generated with ShowTech Tools on',
    'page': 'Page',
    'disclaimer':
        'This document was prepared with a drafting aid. Its content remains the responsibility of the signing company.',
  },
  'nl': {
    'title': 'Attest van correcte montage',
    'event': 'Evenement',
    'venue': 'Locatie',
    'address': 'Adres',
    'organizer': 'Organisator',
    'company': 'Bedrijf',
    'reserves': 'Voorbehouden',
    'reservesIntro': 'Non-conformiteiten weg te werken vóór de toegang van het publiek:',
    'noReserve': 'Geen voorbehoud.',
    'elements': 'Gecontroleerde elementen',
    'applied': 'Toegepaste last',
    'rated': 'toelaatbare last',
    'overload': 'OVERBELASTING',
    'check': 'Controlepunt',
    'result': 'Resultaat',
    'ok': 'Conform',
    'nc': 'Niet conform',
    'na': 'Niet van toepassing',
    'notChecked': 'Niet gecontroleerd',
    'photos': 'Foto\'s',
    'attestation': 'Attest',
    'statement':
        'Ondergetekende, {name}, verklaart dat de hierboven vermelde installaties gemonteerd zijn volgens de handleidingen van de fabrikanten en de regels van goed vakmanschap, en dat ze gecontroleerd zijn vóór de toegang van het publiek.',
    'statementReserve':
        ' Dit attest wordt afgeleverd onder voorbehoud van de punten bovenaan dit document.',
    'signedBy': 'Handtekening',
    'role': 'Functie',
    'date': 'Datum',
    'draft': 'NIET ONDERTEKEND',
    'withReserve': 'ONDERTEKEND MET VOORBEHOUD',
    'generated': 'Document aangemaakt met ShowTech Tools op',
    'page': 'Pagina',
    'disclaimer':
        'Document opgesteld met een hulpmiddel. De inhoud blijft de verantwoordelijkheid van het ondertekenende bedrijf.',
  },
  'de': {
    'title': 'Bescheinigung über die ordnungsgemäße Montage',
    'event': 'Veranstaltung',
    'venue': 'Veranstaltungsort',
    'address': 'Adresse',
    'organizer': 'Veranstalter',
    'company': 'Unternehmen',
    'reserves': 'Vorbehalte',
    'reservesIntro': 'Vor dem Einlass des Publikums zu behebende Mängel:',
    'noReserve': 'Keine Vorbehalte.',
    'elements': 'Geprüfte Elemente',
    'applied': 'Aufgebrachte Last',
    'rated': 'zulässige Last',
    'overload': 'ÜBERLAST',
    'check': 'Prüfpunkt',
    'result': 'Ergebnis',
    'ok': 'In Ordnung',
    'nc': 'Mangel',
    'na': 'Entfällt',
    'notChecked': 'Nicht geprüft',
    'photos': 'Fotos',
    'attestation': 'Bescheinigung',
    'statement':
        'Ich, {name}, bescheinige, dass die oben aufgeführten Einrichtungen gemäß den Herstellerangaben und den anerkannten Regeln der Technik montiert und vor dem Einlass des Publikums geprüft wurden.',
    'statementReserve':
        ' Diese Bescheinigung gilt vorbehaltlich der zu Beginn des Dokuments aufgeführten Punkte.',
    'signedBy': 'Unterschrift',
    'role': 'Funktion',
    'date': 'Datum',
    'draft': 'NICHT UNTERSCHRIEBEN',
    'withReserve': 'MIT VORBEHALT UNTERSCHRIEBEN',
    'generated': 'Dokument erstellt mit ShowTech Tools am',
    'page': 'Seite',
    'disclaimer':
        'Dieses Dokument wurde mit einer Erstellungshilfe erstellt. Für den Inhalt bleibt das unterzeichnende Unternehmen verantwortlich.',
  },
  'es': {
    'title': 'Certificado de montaje correcto',
    'event': 'Evento',
    'venue': 'Lugar',
    'address': 'Dirección',
    'organizer': 'Organizador',
    'company': 'Empresa',
    'reserves': 'Reservas',
    'reservesIntro': 'No conformidades a subsanar antes de la entrada del público:',
    'noReserve': 'Sin reservas.',
    'elements': 'Elementos controlados',
    'applied': 'Carga aplicada',
    'rated': 'carga admisible',
    'overload': 'SOBRECARGA',
    'check': 'Punto de control',
    'result': 'Resultado',
    'ok': 'Conforme',
    'nc': 'No conforme',
    'na': 'No aplica',
    'notChecked': 'No controlado',
    'photos': 'Fotos',
    'attestation': 'Certificación',
    'statement':
        'El abajo firmante, {name}, certifica que las instalaciones indicadas se han montado conforme a los manuales de los fabricantes y a las buenas prácticas, y que se han verificado antes de la entrada del público.',
    'statementReserve':
        ' Este certificado se emite con las reservas indicadas al principio del documento.',
    'signedBy': 'Firma',
    'role': 'Cargo',
    'date': 'Fecha',
    'draft': 'SIN FIRMAR',
    'withReserve': 'FIRMADO CON RESERVAS',
    'generated': 'Documento generado con ShowTech Tools el',
    'page': 'Página',
    'disclaimer':
        'Documento elaborado con una herramienta de ayuda a la redacción. Su contenido sigue siendo responsabilidad de la empresa firmante.',
  },
  'pt': {
    'title': 'Certificado de montagem conforme',
    'event': 'Evento',
    'venue': 'Local',
    'address': 'Morada',
    'organizer': 'Organizador',
    'company': 'Empresa',
    'reserves': 'Reservas',
    'reservesIntro': 'Não conformidades a resolver antes da entrada do público:',
    'noReserve': 'Sem reservas.',
    'elements': 'Elementos controlados',
    'applied': 'Carga aplicada',
    'rated': 'carga admissível',
    'overload': 'SOBRECARGA',
    'check': 'Ponto de controlo',
    'result': 'Resultado',
    'ok': 'Conforme',
    'nc': 'Não conforme',
    'na': 'Não aplicável',
    'notChecked': 'Não controlado',
    'photos': 'Fotos',
    'attestation': 'Certificação',
    'statement':
        'O(A) abaixo assinado(a), {name}, certifica que as instalações acima indicadas foram montadas de acordo com os manuais dos fabricantes e as boas práticas, e verificadas antes da entrada do público.',
    'statementReserve':
        ' Este certificado é emitido sob reserva dos pontos indicados no início do documento.',
    'signedBy': 'Assinatura',
    'role': 'Função',
    'date': 'Data',
    'draft': 'NÃO ASSINADO',
    'withReserve': 'ASSINADO COM RESERVAS',
    'generated': 'Documento gerado com ShowTech Tools em',
    'page': 'Página',
    'disclaimer':
        'Documento elaborado com uma ferramenta de apoio à redação. O seu conteúdo continua a ser da responsabilidade da empresa signatária.',
  },
};

class AttestationPdf {
  static const PdfColor _accent = PdfColor.fromInt(0xFFB86E00);
  static const PdfColor _ink = PdfColor.fromInt(0xFF1A1C20);
  static const PdfColor _muted = PdfColor.fromInt(0xFF5A5E66);
  static const PdfColor _line = PdfColor.fromInt(0xFFD8DAD4);
  static const PdfColor _band = PdfColor.fromInt(0xFFF3F1EC);
  static const PdfColor _red = PdfColor.fromInt(0xFFC62828);
  static const PdfColor _orange = PdfColor.fromInt(0xFFE08A00);
  static const PdfColor _orangeBg = PdfColor.fromInt(0xFFFFF4E0);
  static const PdfColor _green = PdfColor.fromInt(0xFF2E7D32);

  static String defaultLanguage(String country) =>
      const {'FR', 'BE', 'LU'}.contains(country) ? 'fr' : 'en';

  static String _fmtDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

  static String _fmtTime(DateTime d) =>
      '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';

  static Future<Uint8List> build(
    AttestationDocument doc,
    SafetyLibrary lib, {
    required String language,
  }) async {
    final regular = pw.Font.ttf(
        await rootBundle.load('assets/fonts/pdf/IBMPlexSans-Regular.ttf'));
    final bold = pw.Font.ttf(
        await rootBundle.load('assets/fonts/pdf/IBMPlexSans-Bold.ttf'));

    final lang = _kTexts.containsKey(language) ? language : 'en';
    final t = _kTexts[lang]!;
    final controlsById = {for (final c in lib.controls) c.id: c};

    List<SafetyControl> controlsFor(MountedElement e) => [
          for (final f in lib.controlFamilies)
            if (e.families.contains(f)) ...lib.controlsFor(doc.country, family: f),
        ];

    // Photos chargées à l'avance (le constructeur de page est synchrone).
    final photoBytes = <String, Uint8List>{};
    for (final e in doc.elements) {
      for (final c in e.checks.values) {
        for (final p in c.photos) {
          final b = await AttestationPhotos.bytes(doc.id, p);
          if (b != null) photoBytes[p] = b;
        }
      }
    }

    final h1 = pw.TextStyle(font: bold, fontSize: 20, color: _ink);
    final h2 = pw.TextStyle(font: bold, fontSize: 13, color: _accent);
    final body = pw.TextStyle(font: regular, fontSize: 9.5, color: _ink);
    final small = pw.TextStyle(font: regular, fontSize: 8, color: _muted);
    final label = pw.TextStyle(font: bold, fontSize: 9, color: _muted);
    String orDash(String s) => s.trim().isEmpty ? '–' : s.trim();

    pw.Widget section(String title) => pw.Container(
          margin: const pw.EdgeInsets.only(top: 16, bottom: 6),
          padding: const pw.EdgeInsets.only(bottom: 4),
          decoration: const pw.BoxDecoration(
            border: pw.Border(bottom: pw.BorderSide(color: _accent, width: 1)),
          ),
          child: pw.Text(title, style: h2),
        );

    pw.Widget badge(String text, PdfColor color) => pw.Container(
          padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: pw.BoxDecoration(
              color: color, borderRadius: pw.BorderRadius.circular(3)),
          child: pw.Text(text,
              style: pw.TextStyle(font: bold, fontSize: 8.5, color: PdfColors.white)),
        );

    String statusText(ControlCheck? c) {
      switch (c?.status) {
        case CheckStatus.ok:
          return t['ok']!;
        case CheckStatus.nc:
          return t['nc']!;
        case CheckStatus.na:
          return t['na']!;
        case null:
          return t['notChecked']!;
      }
    }

    PdfColor statusColor(ControlCheck? c) {
      switch (c?.status) {
        case CheckStatus.ok:
          return _green;
        case CheckStatus.nc:
          return _red;
        default:
          return _muted;
      }
    }

    final reserves = [
      for (final e in doc.elements)
        for (final entry in e.checks.entries)
          if (entry.value.status == CheckStatus.nc) (e, entry.key, entry.value),
    ];

    final signed = doc.signature != null;
    final headerBadge = !signed
        ? badge(t['draft']!, _orange)
        : (doc.hasReserves ? badge(t['withReserve']!, _orange) : null);

    final statementName = orDash(doc.signature?.name.isNotEmpty == true
        ? doc.signature!.name
        : doc.signerName);
    final statement = t['statement']!.replaceAll('{name}', statementName) +
        (doc.hasReserves ? t['statementReserve']! : '');

    final pdf = pw.Document(
      title: '${t['title']} – ${doc.eventName}',
      author: doc.companyName,
      creator: 'ShowTech Tools',
    );
    final now = DateTime.now();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.fromLTRB(40, 40, 40, 44),
        theme: pw.ThemeData.withFont(base: regular, bold: bold),
        footer: (ctx) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('${t['generated']} ${_fmtDate(now)}', style: small),
            showTechPdfBadge(),
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
                    pw.Text(t['title']!.toUpperCase(),
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
                    pw.SizedBox(height: 2),
                    pw.Text(
                      [
                        if (doc.organizer.trim().isNotEmpty)
                          '${t['organizer']} : ${doc.organizer.trim()}',
                        if (doc.companyName.trim().isNotEmpty)
                          '${t['company']} : ${doc.companyName.trim()}',
                      ].join(' · '),
                      style: small,
                    ),
                  ],
                ),
              ),
              if (headerBadge != null) headerBadge,
            ],
          ),

          // ── Réserves (en tête, bien visibles) ──
          section(t['reserves']!),
          if (reserves.isEmpty)
            pw.Text(t['noReserve']!, style: body)
          else
            pw.Container(
              padding: const pw.EdgeInsets.all(8),
              decoration: pw.BoxDecoration(
                color: _orangeBg,
                border: pw.Border.all(color: _orange, width: 0.8),
                borderRadius: pw.BorderRadius.circular(4),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(t['reservesIntro']!, style: label),
                  pw.SizedBox(height: 4),
                  for (final r in reserves)
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(bottom: 4),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            '${r.$1.name} – ${controlsById[r.$2]?.label.forLanguage(lang) ?? r.$2}',
                            style: pw.TextStyle(font: bold, fontSize: 9.5, color: _ink),
                          ),
                          pw.Text(orDash(r.$3.reserve), style: body),
                        ],
                      ),
                    ),
                ],
              ),
            ),

          // ── Éléments contrôlés ──
          section(t['elements']!),
          for (final e in doc.elements) ...[
            pw.Container(
              color: _band,
              padding: const pw.EdgeInsets.fromLTRB(8, 6, 8, 6),
              margin: const pw.EdgeInsets.only(top: 6),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(orDash(e.name),
                            style: pw.TextStyle(font: bold, fontSize: 11, color: _ink)),
                        if (e.description.isNotEmpty)
                          pw.Text(e.description, style: small),
                        if (e.loadRatio != null)
                          pw.Text(
                            '${t['applied']} : ${e.appliedLoadKg!.round()} kg / '
                            '${t['rated']} : ${e.ratedLoadKg!.round()} kg',
                            style: small,
                          ),
                      ],
                    ),
                  ),
                  if (e.overloaded) badge(t['overload']!, _red),
                ],
              ),
            ),
            pw.TableHelper.fromTextArray(
              headers: [t['check']!, t['result']!],
              columnWidths: const {
                0: pw.FlexColumnWidth(3),
                1: pw.FlexColumnWidth(1),
              },
              data: [
                for (final c in controlsFor(e))
                  [c.label.forLanguage(lang), statusText(e.checks[c.id])],
              ],
              headerStyle: pw.TextStyle(font: bold, fontSize: 8.5, color: _muted),
              cellStyle: body,
              border: pw.TableBorder.all(color: _line, width: 0.5),
              cellPadding: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              cellDecoration: (index, data, rowNum) => index == 1 && rowNum > 0
                  ? pw.BoxDecoration(
                      color: data == t['nc']
                          ? const PdfColor.fromInt(0xFFFDE7E7)
                          : (data == t['ok']
                              ? const PdfColor.fromInt(0xFFE8F5E9)
                              : null))
                  : const pw.BoxDecoration(),
            ),
            if (e.photoCount > 0)
              pw.Padding(
                padding: const pw.EdgeInsets.only(top: 6, bottom: 4),
                child: pw.Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final c in controlsFor(e))
                      for (final p in e.checks[c.id]?.photos ?? const <String>[])
                        if (photoBytes[p] != null)
                          pw.Container(
                            width: 120,
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Container(
                                  width: 120,
                                  height: 90,
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                        color: statusColor(e.checks[c.id]),
                                        width: 1),
                                  ),
                                  child: pw.Image(pw.MemoryImage(photoBytes[p]!),
                                      fit: pw.BoxFit.cover),
                                ),
                                pw.SizedBox(height: 2),
                                pw.Text(c.label.forLanguage(lang),
                                    style: small, maxLines: 2),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
          ],

          // ── Attestation et signature ──
          section(t['attestation']!),
          pw.Text(statement, style: body),
          pw.SizedBox(height: 10),
          pw.Container(
            height: 120,
            padding: const pw.EdgeInsets.all(8),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: _line, width: 0.8),
              borderRadius: pw.BorderRadius.circular(4),
            ),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(t['signedBy']!, style: label),
                      pw.Text(statementName, style: body),
                      if (doc.signerRole.trim().isNotEmpty)
                        pw.Text('${t['role']} : ${doc.signerRole.trim()}',
                            style: small),
                      pw.Spacer(),
                      pw.Text(
                        signed
                            ? '${t['date']} : ${_fmtDate(doc.signature!.signedAt)} ${_fmtTime(doc.signature!.signedAt)}'
                            : '${t['date']} :',
                        style: small,
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(
                  width: 200,
                  child: signed
                      ? pw.Image(
                          pw.MemoryImage(base64Decode(doc.signature!.pngBase64)),
                          fit: pw.BoxFit.contain)
                      : pw.SizedBox(),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Text(t['disclaimer']!, style: small),
        ],
      ),
    );

    return pdf.save();
  }
}
