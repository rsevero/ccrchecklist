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

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TestWidgetFinder extends MatchFinder {
  TestWidgetFinder({super.skipOffstage});

  @override
  String get description => 'icons with no key';

  @override
  bool matches(Element candidate) {
    final Widget widget = candidate.widget;
    print("${widget.runtimeType} - ${widget.key}");
    return widget is ListView;
  }
}
