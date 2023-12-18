import 'dart:io';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:path_provider/path_provider.dart';

String formatSecondsToMinutesSecondsTimer(int totalSeconds) {
  if (totalSeconds < 0) {
    return "Invalid Input"; // Handle negative input
  }

  if (totalSeconds == 0) {
    return ccrNoTimer; // Handle 0 input
  }

  // Formatting the output, e.g., "2:30"
  final String formattedTime =
      "${formatSecondsToMinutesSeconds(totalSeconds)}s";

  return formattedTime;
}

String formatSecondsToMinutesSeconds(int totalSeconds) {
  if (totalSeconds < 0) {
    return "Invalid Input"; // Handle negative input
  }

  if (totalSeconds == 0) {
    return ccrNoTimer; // Handle 0 input
  }

  int minutes = totalSeconds ~/ 60; // Integer division to get minutes
  int seconds = totalSeconds % 60; // Remainder to get seconds

  // Formatting the output, e.g., "2:30"
  String formattedTime =
      "${minutes.toString().padLeft(1, '0')}:${seconds.toString().padLeft(2, '0')}";

  return formattedTime;
}

Map<int, double> createAndInitializeReferencesMap(int numberOfEntries) {
  Map<int, double> myMap = {};

  for (int i = 0; i < numberOfEntries; i++) {
    myMap[i] = 0.0;
  }

  return myMap;
}

Future<Directory> getTemplatesDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  final templateDirectory = Directory('${directory.path}/templates');

  return templateDirectory;
}

Future<Directory> getSharedDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  final templateDirectory = Directory('${directory.path}/share');

  return templateDirectory;
}
