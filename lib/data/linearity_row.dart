import 'package:ccr_checklist/misc/constants.dart';
import 'package:dart_numerics/dart_numerics.dart';

class LinearityRow {
  double? _mv;
  double? _divided;
  double? _multiplied;
  double? _actual;
  double? _percentage;

  LinearityRow({
    double? mv,
    double? divided,
    double? multiplied,
    double? actual,
    double? percentage,
  }) {
    _divided = divided;
    _multiplied = multiplied;
    _percentage = percentage;
    setMV(mv);
    setActual(actual);
  }

  double? get mv => _mv;
  double? get divided => _divided;
  double? get multiplied => _multiplied;
  double? get actual => _actual;
  double? get percentage => _percentage;

  void setMV(double? value) {
    if (value == null) {
      _mv = null;
      _divided = null;
      _multiplied = null;
      return;
    }

    _mv = value;
    _divided = _mv! / ccrLinearityWorksheetDivider;
    _multiplied = _divided! * ccrLinearityWorksheetMultiplier;
  }

  void setActual(double? value) {
    if (value == null) {
      _actual = null;
      _percentage = null;
      return;
    }

    _actual = value;
    if ((_divided == null) || (almostEqualI(_divided!, 0, 1))) {
      _percentage = null;
    } else {
      _percentage = _actual! / _divided! * 100;
    }
  }

  LinearityRow copyWith({
    double? mv,
    double? divided,
    double? multiplied,
    double? actual,
    double? percentage,
  }) {
    return LinearityRow(
      mv: mv ?? _mv,
      divided: divided ?? _divided,
      multiplied: multiplied ?? _multiplied,
      actual: actual ?? _actual,
      percentage: percentage ?? _percentage,
    );
  }

  // Method to create a LinearityRow from JSON
  factory LinearityRow.fromJson(Map<String, dynamic> json) {
    return LinearityRow(
      mv: json['mv']?.toDouble(),
      divided: json['divided']?.toDouble(),
      multiplied: json['multiplied']?.toDouble(),
      actual: json['actual']?.toDouble(),
      percentage: json['percentage']?.toDouble(),
    );
  }

  // Method to convert LinearityRow to JSON
  Map<String, dynamic> toJson() {
    return {
      'mv': _mv,
      'divided': _divided,
      'multiplied': _multiplied,
      'actual': _actual,
      'percentage': _percentage,
    };
  }
}
