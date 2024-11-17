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

import 'package:ccrchecklist/misc/constants.dart';

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
