import 'package:url_launcher/url_launcher.dart';

Future<void> openContactEmail({
  required String toEmail,
  String? subject,
  String? body,
}) async {
  final uri = Uri(
    scheme: 'mailto',
    path: toEmail,
    queryParameters: <String, String>{
      if (subject != null && subject.trim().isNotEmpty) 'subject': subject,
      if (body != null && body.trim().isNotEmpty) 'body': body,
    },
  );

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Impossible d’ouvrir la messagerie.');
  }
}
