import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Page de présentation / téléchargement de l'app.
const String kShowTechToolsUrl = 'https://www.openwhite.eu/showtech-tools/';

/// Petit badge « ShowTech Tools » pour le pied de page des PDF exportés :
/// QR code + lien cliquable vers la page de l'app.
/// Discret, pour rester acceptable sur des documents officiels.
pw.Widget showTechPdfBadge({
  double qrSize = 24,
  PdfColor color = PdfColors.grey600,
}) {
  return pw.UrlLink(
    destination: kShowTechToolsUrl,
    child: pw.Row(
      mainAxisSize: pw.MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.BarcodeWidget(
          barcode: pw.Barcode.qrCode(),
          data: kShowTechToolsUrl,
          width: qrSize,
          height: qrSize,
          drawText: false,
          color: color,
        ),
        pw.SizedBox(width: 5),
        pw.Column(
          mainAxisSize: pw.MainAxisSize.min,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'ShowTech Tools',
              style: pw.TextStyle(
                fontSize: 7.5,
                fontWeight: pw.FontWeight.bold,
                color: color,
              ),
            ),
            pw.Text(
              'openwhite.eu/showtech-tools',
              style: pw.TextStyle(fontSize: 6.5, color: color),
            ),
          ],
        ),
      ],
    ),
  );
}
