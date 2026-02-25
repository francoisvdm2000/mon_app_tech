import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Future<void> exportPngBytes(
  BuildContext context,
  Uint8List bytes,
  String filename,
) async {
  final box = context.findRenderObject() as RenderBox?;

  Rect? origin;
  if (box != null && box.hasSize) {
    origin = box.localToGlobal(Offset.zero) & box.size;
  }

  final xFile = XFile.fromData(
    bytes,
    mimeType: 'image/png',
    name: filename,
  );

  await Share.shareXFiles(
    [xFile],
    sharePositionOrigin: origin,
  );
}
