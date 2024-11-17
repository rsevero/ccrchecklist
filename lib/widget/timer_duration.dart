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
import 'package:ccrchecklist/misc/datetime_formater_helper.dart';
import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:ccrchecklist/widget/dialog_box_column_item.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class TimerDuration extends StatelessWidget {
  final int minutes;
  final int seconds;
  final ValueChanged<int> onMinutesChanged;
  final ValueChanged<int> onSecondsChanged;

  const TimerDuration({
    super.key,
    required this.minutes,
    required this.seconds,
    required this.onMinutesChanged,
    required this.onSecondsChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.ccrThemeExtension;

    return DialogBoxColumnItem(
      children: [
        Text(
          'Timer Duration',
          style: theme.dialogFieldTitleTextTheme,
        ),
        Row(
          children: [
            // NumberPicker for minutes
            Column(
              children: [
                const Text('minutes'),
                NumberPicker(
                  value: minutes,
                  minValue: 0,
                  maxValue: 99,
                  infiniteLoop: true,
                  onChanged: onMinutesChanged,
                  decoration: BoxDecoration(
                    borderRadius: ccrTemplateListTileBorderRadius,
                    border: Border.all(color: theme.outline),
                  ),
                ),
                const Text('minutes'),
              ],
            ),
            Text(
              ':',
              style: theme.timerTextTheme,
            ),
            // NumberPicker for seconds
            Column(
              children: [
                const Text('seconds'),
                NumberPicker(
                  value: seconds,
                  minValue: 0,
                  maxValue: 59,
                  infiniteLoop: true,
                  onChanged: onSecondsChanged,
                  decoration: BoxDecoration(
                    borderRadius: ccrTemplateListTileBorderRadius,
                    border: Border.all(color: theme.outline),
                  ),
                ),
                const Text('seconds'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 8),
              child: Text(
                ccrFormatMinutesSecondsToMinutesSecondsTimer(
                  minutes,
                  seconds,
                ),
                style: theme.dialogHintTextTheme.copyWith(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
