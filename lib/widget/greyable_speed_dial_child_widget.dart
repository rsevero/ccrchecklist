import 'package:ccr_checklist/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class GreyableSpeedDialChild extends SpeedDialChild {
  final Widget child;
  final String text;
  final bool isEnabled;
  final Function()? onTap;

  GreyableSpeedDialChild(
      {super.key,
      required this.text,
      required this.isEnabled,
      required this.child,
      required this.onTap});

  @override
  Widget get labelWidget => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isEnabled
              ? speedDialButtonBackgroundColor
              : speedDialButtonDisabledBackgroundColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: isEnabled ? Colors.black26 : Colors.transparent,
              blurRadius: 2,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isEnabled
                ? speedDialButtonTextColor
                : speedDialButtonDisabledTextColor,
          ),
        ),
      );
  @override
  Color? get backgroundColor => isEnabled
      ? speedDialButtonBackgroundColor
      : speedDialButtonDisabledBackgroundColor;

  @override
  Color? get foregroundColor =>
      isEnabled ? speedDialButtonTextColor : speedDialButtonDisabledTextColor;

  @override
  double? get elevation => isEnabled ? null : 0;

  // return SpeedDialChild(
  //   child: child,
  //   labelWidget: Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
  //     margin: const EdgeInsets.symmetric(horizontal: 10),
  //     decoration: BoxDecoration(
  //       color: isEnabled
  //           ? speedDialButtonBackgroundColor
  //           : speedDialButtonDisabledBackgroundColor,
  //       borderRadius: BorderRadius.circular(6),
  //       boxShadow: [
  //         BoxShadow(
  //           color: isEnabled ? Colors.black26 : Colors.transparent,
  //           blurRadius: 4,
  //         ),
  //       ],
  //     ),
  //     child: Text(
  //       text,
  //       style: TextStyle(
  //         color: isEnabled
  //             ? speedDialButtonTextColor
  //             : speedDialButtonDisabledTextColor,
  //       ),
  //     ),
  //   ),
  //   backgroundColor: isEnabled
  //       ? speedDialButtonBackgroundColor
  //       : speedDialButtonDisabledBackgroundColor,
  //   foregroundColor: isEnabled
  //       ? speedDialButtonTextColor
  //       : speedDialButtonDisabledTextColor,
  //   onTap: isEnabled
  //       ? () => _onTapAddRegularCheck(context, templateEditorStore)
  //       : null,
  // );
}
