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

import 'package:ccrchecklist/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class GreyableSpeedDialChild extends SpeedDialChild {
  final String text;
  final bool isEnabled;

  GreyableSpeedDialChild(
      {super.key,
      required this.text,
      required this.isEnabled,
      super.child,
      super.onTap});

  @override
  Widget? get child => IgnorePointer(ignoring: !isEnabled, child: super.child);

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
}
