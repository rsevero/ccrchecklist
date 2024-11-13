import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/datetime_formater_helper.dart';
import 'package:ccr_checklist/misc/flutter_extension_methods.dart';
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: ccrVerticalPaddingItem),
      child: SizedBox(
        width: ccrDescriptionFieldWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ),
    );
  }
}
