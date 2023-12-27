import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:ccr_checklist/misc/get_directory_helper.dart';
import 'package:flutter/material.dart';

// Future<String> ccrCaptureIcon(IconData icon) async {
//   final recorder = PictureRecorder();
//   final canvas = Canvas(recorder);
//   const paint = Colors.black;
//   const size = 100.0;

//   TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
//   textPainter.text = TextSpan(
//     text: String.fromCharCode(icon.codePoint),
//     style: TextStyle(
//         fontSize: size,
//         fontFamily: icon.fontFamily,
//         fontFamilyFallback: icon.fontFamilyFallback,
//         color: paint),
//   );
//   textPainter.layout();
//   textPainter.paint(canvas, Offset.zero);

//   final picture = recorder.endRecording();
//   final image = await picture.toImage(size.toInt(), size.toInt());
//   final byteData = await image.toByteData(format: ImageByteFormat.png);
//   final pngBytes = byteData!.buffer.asUint8List();

//   final fileName =
//       'icon_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}.png';
//   // final directory = await ccrGetTemporaryIconImagesDirectory();
//   final filePath = '${directory.path}/$fileName';
//   final file = File(filePath);
//   await file.writeAsBytes(pngBytes);

//   return filePath;
// }

// Map<String, dynamic> ccrIconDataToJson(IconData icon) {
//   return {
//     'codePoint': icon.codePoint,
//     'fontFamily': icon.fontFamily,
//     'fontPackage': icon.fontPackage,
//     'matchTextDirection': icon.matchTextDirection,
//   };
// }

IconData ccrIconDataFromJson(Map<String, dynamic> json) {
  return IconData(
    json['codePoint'],
    fontFamily: json['fontFamily'],
    fontPackage: json['fontPackage'],
    matchTextDirection: json['matchTextDirection'] ?? false,
  );
}
