// ignore_for_file: UNNECESSARY_CAST
// ignore_for_file: unused_element

part of 'template.dart';

// **************************************************************************
// Generator: MorphyGenerator<Morphy>
// **************************************************************************

///

@JsonSerializable(
  explicitToJson: true,
)
class Template extends $Template {
  final String rebreatherModel;
  final String title;
  final String description;
  final List<TemplateSection> sections;

  ///
  Template({
    required this.rebreatherModel,
    required this.title,
    required this.description,
    required this.sections,
  });
  Template._({
    required this.rebreatherModel,
    required this.title,
    required this.description,
    required this.sections,
  });
  String toString() =>
      "(Template-rebreatherModel:${rebreatherModel.toString()}|title:${title.toString()}|description:${description.toString()}|sections:${sections.toString()})";
  int get hashCode => hashObjects([
        rebreatherModel.hashCode,
        title.hashCode,
        description.hashCode,
        sections.hashCode
      ]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Template &&
          runtimeType == other.runtimeType &&
          rebreatherModel == other.rebreatherModel &&
          title == other.title &&
          description == other.description &&
          (sections).equalUnorderedD(other.sections);
  Template copyWith_Template({
    Opt<String>? rebreatherModel,
    Opt<String>? title,
    Opt<String>? description,
    Opt<List<TemplateSection>>? sections,
  }) {
    return Template._(
      rebreatherModel: rebreatherModel == null
          ? this.rebreatherModel as String
          : rebreatherModel.value as String,
      title: title == null ? this.title as String : title.value as String,
      description: description == null
          ? this.description as String
          : description.value as String,
      sections: sections == null
          ? this.sections as List<TemplateSection>
          : sections.value as List<TemplateSection>,
    );
  }

//$Template|[]|[rebreatherModel:String:null, title:String:null, description:String:null, sections:List<$TemplateSection>:null]
//
  factory Template.fromJson(Map<String, dynamic> json) {
    if (json['_className_'] == "Template") {
      return _$TemplateFromJson(
        json,
      );
    } else {
      throw UnsupportedError(
          "The _className_ '${json['_className_']}' is not supported by the Template.fromJson constructor.");
    }
  }

  // ignore: unused_field
  Map<Type, Object? Function(Never)> _fns = {};

  Map<String, dynamic> toJson_2([Map<Type, Object? Function(Never)>? fns]) {
    this._fns = fns ?? {};
    return toJson();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = _$TemplateToJson(
      this,
    );
    // Adding custom key-value pair
    data['_className_'] = 'Template';

    return data;
  }
}

extension $Template_changeTo_E on $Template {}

enum Template$ { rebreatherModel, title, description, sections }
