import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_file.freezed.dart';
part 'template_file.g.dart';

@freezed
class TemplateFile with _$TemplateFile {
  @JsonSerializable(explicitToJson: true)
  factory TemplateFile({
    required String path,
    required String rebreatherManufacturer,
    required String rebreatherModel,
    required String title,
    required String description,
    required bool isAsset,
  }) = _TemplateFile;

  factory TemplateFile.fromJson(Map<String, dynamic> json) =>
      _$TemplateFileFromJson(json);
}
