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

import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:ccrchecklist/widget/linearity_worksheet_text.dart';
import 'package:flutter/material.dart';

Widget buildNonEditableLinearityCheckCell(
    BuildContext context, int index, String text, VoidCallback onTap) {
  return SizedBox(
    height: 68,
    child: InkWell(
      onTap: onTap,
      child: Center(
        child: LinearityWorksheetText(
          text,
          context.ccrThemeExtension.linearityColumnContentTextTheme,
        ),
      ),
    ),
  );
}

enum LinearityCheckDataType {
  mv,
  actual,
}
