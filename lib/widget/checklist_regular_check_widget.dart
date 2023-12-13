import 'dart:async';
import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChecklistRegularCheckWidget extends StatefulWidget {
  final int sectionIndex;
  final int checkIndex;

  const ChecklistRegularCheckWidget({
    super.key,
    required this.sectionIndex,
    required this.checkIndex,
  });

  @override
  State<ChecklistRegularCheckWidget> createState() =>
      _ChecklistRegularCheckWidgetState();
}

class _ChecklistRegularCheckWidgetState
    extends State<ChecklistRegularCheckWidget> {
  late Timer _timer;
  late int _remainingSeconds;
  bool _timerAvailable = false;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_isInit) {
      _isInit = false;
      final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
      final check = checklistEditorStore.checks[widget.sectionIndex]
          [widget.checkIndex] as ChecklistRegularCheck;

      _timerAvailable = (check.secondsTimer > 0);
      if (_timerAvailable) {
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
        _timer.cancel();
        _remainingSeconds = check.secondsTimer;
      }
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final check = checklistEditorStore.checks[widget.sectionIndex]
        [widget.checkIndex] as ChecklistRegularCheck;

    return ListTile(
      leading: Checkbox(
        value: check.isChecked,
        onChanged: (bool? value) {
          if (value != null) {
            checklistEditorStore.setCheckIsChecked(
                widget.sectionIndex, widget.checkIndex, value);
          }
        },
      ),
      title: Row(
        children: [
          Expanded(child: Text(check.description)),
          if (_timerAvailable)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                onTap: _toggleTimer,
                onLongPress: _changeTimerValue,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: _getTimerBackgroundColor(),
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                  child: Text(
                    _formatTime(_remainingSeconds),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _getTimerTextColor(),
                    ),
                  ),
                ),
              ),
            ),
          ...List.generate(check.referenceCount, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: 60,
                child: TextFormField(
                  initialValue: check.references[index]?.toString() ?? '',
                  decoration: InputDecoration(
                    labelText: 'Ref ${index + 1}',
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    double? newValue = double.tryParse(value);
                    if (newValue != null) {
                      check.references[index] = newValue;
                    }
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  void _toggleTimer() {
    if (_timer.isActive) {
      setState(() {
        _timer.cancel();
      });
    } else {
      setState(() {
        _startTimer();
      });
    }
  }

  Color _getTimerTextColor() {
    if (_remainingSeconds == 0) {
      return ccrTimerTextColorFinished;
    } else if (_timer.isActive) {
      return ccrTimerTextColorRunning;
    } else {
      return ccrTimerTextColorNotRunning;
    }
  }

  Color _getTimerBackgroundColor() {
    if (_remainingSeconds == 0) {
      return ccrTimerBackgroundcolorFinished; // Timer reached zero
    } else if (_timer.isActive) {
      return ccrTimerBackgroundcolorRunning; // Timer is running
    } else {
      return ccrTimerBackgroundcolorNotRunning; // Timer is stopped but not zero
    }
  }

  void _startTimer() {
    if (_remainingSeconds > 0) {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          if (_remainingSeconds > 0) {
            setState(() {
              _remainingSeconds--;
            });
          } else {
            _timer.cancel();
          }
        },
      );
    }
  }

  void _changeTimerValue() async {
    final currentMinutes = _remainingSeconds ~/ 60;
    final currentSeconds = _remainingSeconds % 60;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: currentMinutes, minute: currentSeconds),
    );
    if (pickedTime != null) {
      setState(
        () {
          _remainingSeconds = (pickedTime.hour * 60) + pickedTime.minute;
        },
      );
    }
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
