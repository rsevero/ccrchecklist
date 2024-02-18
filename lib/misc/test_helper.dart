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
