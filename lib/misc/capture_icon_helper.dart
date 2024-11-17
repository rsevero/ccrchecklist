// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
