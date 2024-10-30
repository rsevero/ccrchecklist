import 'package:ccr_checklist/misc/constants.dart';

String ccrFormatSecondsToMinutesSecondsTimer(int totalSeconds) {
  if (totalSeconds < 0) {
    return "Invalid Input"; // Handle negative input
  }

  if (totalSeconds == 0) {
    return ccrNoTimer; // Handle 0 input
  }

  final String formattedTime =
      "${ccrFormatSecondsToMinutesSeconds(totalSeconds)}s";

  return formattedTime;
}

String ccrFormatSecondsToMinutesSeconds(int totalSeconds) {
  if (totalSeconds < 0) {
    return "Invalid Input";
  }

  if (totalSeconds == 0) {
    return ccrNoTimer;
  }

  int minutes = totalSeconds ~/ 60; // Integer division to get minutes
  int seconds = totalSeconds % 60; // Remainder to get seconds

  String formattedTime =
      "${minutes.toString().padLeft(1, '0')}:${seconds.toString().padLeft(2, '0')}";

  return formattedTime;
}
