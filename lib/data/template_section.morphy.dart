// ignore_for_file: UNNECESSARY_CAST
// ignore_for_file: unused_element

part of 'template_section.dart';

// **************************************************************************
// Generator: MorphyGenerator<Morphy>
// **************************************************************************

///

@JsonSerializable(
  explicitToJson: true,
)
class TemplateSection extends $TemplateSection {
  final String title;
  final List<TemplateCheck> checks;

  ///
  TemplateSection({
    required this.title,
    required this.checks,
  });
  TemplateSection._({
    required this.title,
    required this.checks,
  });
  String toString() =>
      "(TemplateSection-title:${title.toString()}|checks:${checks.toString()})";
  int get hashCode => hashObjects([title.hashCode, checks.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateSection &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          (checks).equalUnorderedD(other.checks);
  TemplateSection copyWith_TemplateSection({
    Opt<String>? title,
    Opt<List<TemplateCheck>>? checks,
  }) {
    return TemplateSection._(
      title: title == null ? this.title as String : title.value as String,
      checks: checks == null
          ? this.checks as List<TemplateCheck>
          : checks.value as List<TemplateCheck>,
    );
  }

//$TemplateSection|[]|[title:String:null, checks:List<$TemplateCheck>:null]
//
  factory TemplateSection.fromJson(Map<String, dynamic> json) {
    if (json['_className_'] == "TemplateSection") {
      return _$TemplateSectionFromJson(
        json,
      );
    } else {
      throw UnsupportedError(
          "The _className_ '${json['_className_']}' is not supported by the TemplateSection.fromJson constructor.");
    }
  }

  // ignore: unused_field
  Map<Type, Object? Function(Never)> _fns = {};

  Map<String, dynamic> toJson_2([Map<Type, Object? Function(Never)>? fns]) {
    this._fns = fns ?? {};
    return toJson();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = _$TemplateSectionToJson(
      this,
    );
    // Adding custom key-value pair
    data['_className_'] = 'TemplateSection';

    return data;
  }
}

extension $TemplateSection_changeTo_E on $TemplateSection {}

enum TemplateSection$ { title, checks }
