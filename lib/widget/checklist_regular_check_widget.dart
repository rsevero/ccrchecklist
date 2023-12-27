import 'dart:async';
import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

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
  bool isHovering = false;

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
    if (_timerAvailable) {
      _timer.cancel();
    }
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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(text: check.description),
                if (check.observation.isNotEmpty) ...[
                  const TextSpan(text: ' '),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: InkWell(
                        onTap: () => onPressedInfo(context, check),
                        onHover: (hovering) {
                          setState(() {
                            isHovering = hovering;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:
                                isHovering ? Colors.grey : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.info_outline,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (_timerAvailable) _buildTimer(),
          const SizedBox(width: 8),
          Wrap(
            spacing: 8.0, // Horizontal space between reference fields
            children: _buildReferences(check),
          ),
        ],
      ),
    );
  }

  void onPressedInfo(BuildContext context, ChecklistRegularCheck check) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Info'),
          content: Text(check.observation),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTimer() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: _toggleTimer,
        onLongPress: _changeTimerValue,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: _getTimerBackgroundColor(),
            borderRadius: BorderRadius.circular(10.0),
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
    );
  }

  List<Widget> _buildReferences(ChecklistRegularCheck check) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);

    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Column for all prefixes
          Column(
            children: List.generate(
              check.references.length,
              (index) => SizedBox(
                height: 68,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(check.references[index].prefix ?? ''),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Column for all TextFormField
          SizedBox(
            width: 80,
            child: Column(
              children: List.generate(
                check.references.length,
                (index) => SizedBox(
                  height: 68,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Observer(
                      builder: (_) => TextFormField(
                        initialValue: check.references[index].value == null
                            ? ''
                            : check.references[index].value.toString(),
                        decoration: InputDecoration(
                          labelText: 'Ref ${index + 1}',
                          border: const OutlineInputBorder(),
                          counterText: '',
                        ),
                        maxLength: 5,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true, signed: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.-]'))
                        ],
                        onChanged: (value) {
                          double? newValue = double.tryParse(value);
                          checklistEditorStore.setCheckReferenceValue(
                              widget.sectionIndex,
                              widget.checkIndex,
                              index,
                              newValue);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Column for all suffixes
          Column(
            children: List.generate(
              check.references.length,
              (index) => SizedBox(
                height: 68,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(check.references[index].suffix ?? ''),
                ),
              ),
            ),
          ),
        ],
      ),
    ];
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
        (timer) async {
          if (_remainingSeconds > 0) {
            setState(() {
              _remainingSeconds--;
            });
          } else {
            _timer.cancel();

            // Play sound alarm
            // await audioPlayer
            //     .play(AssetSource('assets/sounds/alarm-clock-short.mp3'));

            // Vibrate the device
            if (await Vibration.hasVibrator() ?? false) {
              Vibration.vibrate();
            }
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
