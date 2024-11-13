import 'package:ccr_checklist/misc/constants.dart';

String ccrFormatMinutesSecondsToMinutesSecondsTimer(int minutes, int seconds) {
  if ((minutes < 0) || (seconds < 0)) {
    return "Invalid Input";
  }

  if ((minutes == 0) && (seconds == 0)) {
    return ccrNoTimer;
  }

  final String formattedTime =
      "${minutes.toString().padLeft(1, '0')}:${seconds.toString().padLeft(2, '0')}s";

  return formattedTime;
}

String ccrFormatSecondsToMinutesSecondsTimer(int totalSeconds) {
  final (minutes, seconds) = ccrConvertSecondsToMinutesSeconds(totalSeconds);

  return ccrFormatMinutesSecondsToMinutesSecondsTimer(minutes, seconds);
}

(int, int) ccrConvertSecondsToMinutesSeconds(int totalSeconds) {
  final int minutes = totalSeconds ~/ ccrSecondsInAMinute;
  final int seconds = totalSeconds % ccrSecondsInAMinute;

  return (minutes, seconds);
}
