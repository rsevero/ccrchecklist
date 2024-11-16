import 'package:ccrchecklist/data/checklist_check.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_section.freezed.dart';
part 'checklist_section.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ChecklistSection with _$ChecklistSection {
  @JsonSerializable(explicitToJson: true)
  factory ChecklistSection({
    required String title,
    required List<ChecklistCheck> checks,
  }) = _ChecklistSection;

  factory ChecklistSection.fromJson(Map<String, dynamic> json) =>
      _$ChecklistSectionFromJson(json);
}
