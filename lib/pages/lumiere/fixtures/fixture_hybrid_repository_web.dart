import 'dart:js_interop';

import 'package:web/web.dart' as web;

/// Web implementation (used only when kIsWeb == true)
Future<String> fetchTextWeb(String url) async {
  final resp = await web.window.fetch(url.toJS).toDart;

  final status = resp.status;
  if (status != 200) {
    throw Exception('HTTP error: $status');
  }

  final text = await resp.text().toDart;
  final s = text.toDart;

  if (s.trim().isEmpty) {
    throw Exception('Empty response');
  }

  return s;
}
