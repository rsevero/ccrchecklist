import 'package:ccr_checklist/data/checklist_section.dart';
import 'package:ccr_checklist/store/observablelist_json_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'checklist_editor_store.g.dart';

@JsonSerializable(explicitToJson: true)
class ChecklistEditorStore extends _ChecklistEditorStoreBaseToJson
    with _$ChecklistEditorStore {
  ChecklistEditorStore();

  factory ChecklistEditorStore.fromJson(Map<String, dynamic> json) =>
      _$ChecklistEditorStoreFromJson(json);

  Map<String, dynamic> toJson() => _$ChecklistEditorStoreToJson(this);
}

abstract class _ChecklistEditorStoreBaseToJson with Store {
  final _undoRedoClass = 'ChecklistEditorStore';

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  String _title = '';

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  String _description = '';

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  String _diverName = '';

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  DateTime _date = DateTime.now();

  @readonly
  @JsonKey(
      includeFromJson: true,
      includeToJson: true,
      fromJson: ObservableListJsonConverter.obsvbLstOfChecklistSectionFromJson,
      toJson: ObservableListJsonConverter.obsvbLstOfChecklistSectionToJson)
  ObservableList<ChecklistSection> _sections =
      ObservableList<ChecklistSection>();

  @readonly
  bool _canUndo = false;

  @readonly
  bool _canRedo = false;

  @readonly
  String _undoDescription = '';

  @readonly
  String _redoDescription = '';

  void _saveSnapshot(String operation) {
    // final snapshot =
    //     _$ChecklistEditorStoreFromJson(this as ChecklistEditorStore);
    // final undoRedoStatus =
    //     undoRedoStorage.addUndo(_undoRedoClass, operation, snapshot);

    // _canUndo = undoRedoStatus.canUndo;
    // _canRedo = undoRedoStatus.canRedo;
    // _undoDescription = undoRedoStatus.undoDescription;
    // _redoDescription = undoRedoStatus.redoDescription;
  }

  @action
  void setTitle(String value) {
    _title = value;
    _saveSnapshot('Set title');
  }

  @action
  void setDescription(String value) {
    _description = value;
    _saveSnapshot('Set description');
  }

  @action
  void setDiverName(String value) {
    _diverName = value;
    _saveSnapshot('Set diver name');
  }

  @action
  void setDate(DateTime value) {
    _date = value;
    _saveSnapshot('Set date');
  }
}
