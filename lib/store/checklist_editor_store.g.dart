// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_editor_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChecklistEditorStore _$ChecklistEditorStoreFromJson(
        Map<String, dynamic> json) =>
    ChecklistEditorStore()
      .._rebreatherManufacturer = json['_rebreatherManufacturer'] as String
      .._rebreatherModel = json['_rebreatherModel'] as String
      .._title = json['_title'] as String
      .._description = json['_description'] as String
      .._diverName = json['_diverName'] as String
      .._date = DateTime.parse(json['_date'] as String)
      .._lastChange = DateTime.parse(json['_lastChange'] as String)
      .._sections =
          ObservableListJsonConverter.obsvbLstOfChecklistSectionFromJson(
              json['_sections'] as List<ChecklistSection>)
      .._checks = ObservableListJsonConverter
          .obsvbLstOfObsvbLstOfChecklistCheckFromJson(
              json['_checks'] as List<List<ChecklistCheck>>);

Map<String, dynamic> _$ChecklistEditorStoreToJson(
        ChecklistEditorStore instance) =>
    <String, dynamic>{
      '_rebreatherManufacturer': instance._rebreatherManufacturer,
      '_rebreatherModel': instance._rebreatherModel,
      '_title': instance._title,
      '_description': instance._description,
      '_diverName': instance._diverName,
      '_date': instance._date.toIso8601String(),
      '_lastChange': instance._lastChange.toIso8601String(),
      '_sections': ObservableListJsonConverter.obsvbLstOfChecklistSectionToJson(
          instance._sections),
      '_checks':
          ObservableListJsonConverter.obsvbLstOfObsvbLstOfChecklistCheckToJson(
              instance._checks),
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChecklistEditorStore on _ChecklistEditorStoreBaseToJson, Store {
  late final _$_rebreatherManufacturerAtom = Atom(
      name: '_ChecklistEditorStoreBaseToJson._rebreatherManufacturer',
      context: context);

  String get rebreatherManufacturer {
    _$_rebreatherManufacturerAtom.reportRead();
    return super._rebreatherManufacturer;
  }

  @override
  String get _rebreatherManufacturer => rebreatherManufacturer;

  @override
  set _rebreatherManufacturer(String value) {
    _$_rebreatherManufacturerAtom
        .reportWrite(value, super._rebreatherManufacturer, () {
      super._rebreatherManufacturer = value;
    });
  }

  late final _$_rebreatherModelAtom = Atom(
      name: '_ChecklistEditorStoreBaseToJson._rebreatherModel',
      context: context);

  String get rebreatherModel {
    _$_rebreatherModelAtom.reportRead();
    return super._rebreatherModel;
  }

  @override
  String get _rebreatherModel => rebreatherModel;

  @override
  set _rebreatherModel(String value) {
    _$_rebreatherModelAtom.reportWrite(value, super._rebreatherModel, () {
      super._rebreatherModel = value;
    });
  }

  late final _$_titleAtom =
      Atom(name: '_ChecklistEditorStoreBaseToJson._title', context: context);

  String get title {
    _$_titleAtom.reportRead();
    return super._title;
  }

  @override
  String get _title => title;

  @override
  set _title(String value) {
    _$_titleAtom.reportWrite(value, super._title, () {
      super._title = value;
    });
  }

  late final _$_descriptionAtom = Atom(
      name: '_ChecklistEditorStoreBaseToJson._description', context: context);

  String get description {
    _$_descriptionAtom.reportRead();
    return super._description;
  }

  @override
  String get _description => description;

  @override
  set _description(String value) {
    _$_descriptionAtom.reportWrite(value, super._description, () {
      super._description = value;
    });
  }

  late final _$_diverNameAtom = Atom(
      name: '_ChecklistEditorStoreBaseToJson._diverName', context: context);

  String get diverName {
    _$_diverNameAtom.reportRead();
    return super._diverName;
  }

  @override
  String get _diverName => diverName;

  @override
  set _diverName(String value) {
    _$_diverNameAtom.reportWrite(value, super._diverName, () {
      super._diverName = value;
    });
  }

  late final _$_dateAtom =
      Atom(name: '_ChecklistEditorStoreBaseToJson._date', context: context);

  DateTime get date {
    _$_dateAtom.reportRead();
    return super._date;
  }

  @override
  DateTime get _date => date;

  @override
  set _date(DateTime value) {
    _$_dateAtom.reportWrite(value, super._date, () {
      super._date = value;
    });
  }

  late final _$_lastChangeAtom = Atom(
      name: '_ChecklistEditorStoreBaseToJson._lastChange', context: context);

  DateTime get lastChange {
    _$_lastChangeAtom.reportRead();
    return super._lastChange;
  }

  @override
  DateTime get _lastChange => lastChange;

  @override
  set _lastChange(DateTime value) {
    _$_lastChangeAtom.reportWrite(value, super._lastChange, () {
      super._lastChange = value;
    });
  }

  late final _$_sectionsAtom =
      Atom(name: '_ChecklistEditorStoreBaseToJson._sections', context: context);

  ObservableList<ChecklistSection> get sections {
    _$_sectionsAtom.reportRead();
    return super._sections;
  }

  @override
  ObservableList<ChecklistSection> get _sections => sections;

  @override
  set _sections(ObservableList<ChecklistSection> value) {
    _$_sectionsAtom.reportWrite(value, super._sections, () {
      super._sections = value;
    });
  }

  late final _$_checksAtom =
      Atom(name: '_ChecklistEditorStoreBaseToJson._checks', context: context);

  ObservableList<ObservableList<ChecklistCheck>> get checks {
    _$_checksAtom.reportRead();
    return super._checks;
  }

  @override
  ObservableList<ObservableList<ChecklistCheck>> get _checks => checks;

  @override
  set _checks(ObservableList<ObservableList<ChecklistCheck>> value) {
    _$_checksAtom.reportWrite(value, super._checks, () {
      super._checks = value;
    });
  }

  late final _$_linearityWorksheetAtom = Atom(
      name: '_ChecklistEditorStoreBaseToJson._linearityWorksheet',
      context: context);

  ObservableList<LinearityRow> get linearityWorksheet {
    _$_linearityWorksheetAtom.reportRead();
    return super._linearityWorksheet;
  }

  @override
  ObservableList<LinearityRow> get _linearityWorksheet => linearityWorksheet;

  @override
  set _linearityWorksheet(ObservableList<LinearityRow> value) {
    _$_linearityWorksheetAtom.reportWrite(value, super._linearityWorksheet, () {
      super._linearityWorksheet = value;
    });
  }

  late final _$_linearityCheckReferenceCountAtom = Atom(
      name: '_ChecklistEditorStoreBaseToJson._linearityCheckReferenceCount',
      context: context);

  int get linearityCheckReferenceCount {
    _$_linearityCheckReferenceCountAtom.reportRead();
    return super._linearityCheckReferenceCount;
  }

  @override
  int get _linearityCheckReferenceCount => linearityCheckReferenceCount;

  @override
  set _linearityCheckReferenceCount(int value) {
    _$_linearityCheckReferenceCountAtom
        .reportWrite(value, super._linearityCheckReferenceCount, () {
      super._linearityCheckReferenceCount = value;
    });
  }

  late final _$_checksOkAtom =
      Atom(name: '_ChecklistEditorStoreBaseToJson._checksOk', context: context);

  ObservableList<ObservableList<bool>> get checksOk {
    _$_checksOkAtom.reportRead();
    return super._checksOk;
  }

  @override
  ObservableList<ObservableList<bool>> get _checksOk => checksOk;

  @override
  set _checksOk(ObservableList<ObservableList<bool>> value) {
    _$_checksOkAtom.reportWrite(value, super._checksOk, () {
      super._checksOk = value;
    });
  }

  late final _$_emptyReferencesAtom = Atom(
      name: '_ChecklistEditorStoreBaseToJson._emptyReferences',
      context: context);

  ObservableList<ObservableList<int>> get emptyReferences {
    _$_emptyReferencesAtom.reportRead();
    return super._emptyReferences;
  }

  @override
  ObservableList<ObservableList<int>> get _emptyReferences => emptyReferences;

  @override
  set _emptyReferences(ObservableList<ObservableList<int>> value) {
    _$_emptyReferencesAtom.reportWrite(value, super._emptyReferences, () {
      super._emptyReferences = value;
    });
  }

  late final _$_sectionsOkAtom = Atom(
      name: '_ChecklistEditorStoreBaseToJson._sectionsOk', context: context);

  ObservableList<bool> get sectionsOk {
    _$_sectionsOkAtom.reportRead();
    return super._sectionsOk;
  }

  @override
  ObservableList<bool> get _sectionsOk => sectionsOk;

  @override
  set _sectionsOk(ObservableList<bool> value) {
    _$_sectionsOkAtom.reportWrite(value, super._sectionsOk, () {
      super._sectionsOk = value;
    });
  }

  late final _$_previousSectionsOkAtom = Atom(
      name: '_ChecklistEditorStoreBaseToJson._previousSectionsOk',
      context: context);

  ObservableList<bool> get previousSectionsOk {
    _$_previousSectionsOkAtom.reportRead();
    return super._previousSectionsOk;
  }

  @override
  ObservableList<bool> get _previousSectionsOk => previousSectionsOk;

  @override
  set _previousSectionsOk(ObservableList<bool> value) {
    _$_previousSectionsOkAtom.reportWrite(value, super._previousSectionsOk, () {
      super._previousSectionsOk = value;
    });
  }

  late final _$_higherSectionEditedAtom = Atom(
      name: '_ChecklistEditorStoreBaseToJson._higherSectionEdited',
      context: context);

  int get higherSectionEdited {
    _$_higherSectionEditedAtom.reportRead();
    return super._higherSectionEdited;
  }

  @override
  int get _higherSectionEdited => higherSectionEdited;

  @override
  set _higherSectionEdited(int value) {
    _$_higherSectionEditedAtom.reportWrite(value, super._higherSectionEdited,
        () {
      super._higherSectionEdited = value;
    });
  }

  late final _$_checklistChangedAtom = Atom(
      name: '_ChecklistEditorStoreBaseToJson._checklistChanged',
      context: context);

  bool get checklistChanged {
    _$_checklistChangedAtom.reportRead();
    return super._checklistChanged;
  }

  @override
  bool get _checklistChanged => checklistChanged;

  @override
  set _checklistChanged(bool value) {
    _$_checklistChangedAtom.reportWrite(value, super._checklistChanged, () {
      super._checklistChanged = value;
    });
  }

  late final _$loadFromTemplateAsyncAction = AsyncAction(
      '_ChecklistEditorStoreBaseToJson.loadFromTemplate',
      context: context);

  @override
  Future<bool> loadFromTemplate(BuildContext context, Template template) {
    return _$loadFromTemplateAsyncAction
        .run(() => super.loadFromTemplate(context, template));
  }

  late final _$resetChecklistAsyncAction = AsyncAction(
      '_ChecklistEditorStoreBaseToJson.resetChecklist',
      context: context);

  @override
  Future<bool> resetChecklist(BuildContext context) {
    return _$resetChecklistAsyncAction.run(() => super.resetChecklist(context));
  }

  late final _$_ChecklistEditorStoreBaseToJsonActionController =
      ActionController(
          name: '_ChecklistEditorStoreBaseToJson', context: context);

  @override
  void setCheckIsChecked(int sectionIndex, int checkIndex, bool value) {
    final _$actionInfo = _$_ChecklistEditorStoreBaseToJsonActionController
        .startAction(name: '_ChecklistEditorStoreBaseToJson.setCheckIsChecked');
    try {
      return super.setCheckIsChecked(sectionIndex, checkIndex, value);
    } finally {
      _$_ChecklistEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLinearityMV(int referenceIndex, double value) {
    final _$actionInfo = _$_ChecklistEditorStoreBaseToJsonActionController
        .startAction(name: '_ChecklistEditorStoreBaseToJson.updateLinearityMV');
    try {
      return super.updateLinearityMV(referenceIndex, value);
    } finally {
      _$_ChecklistEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLinearityActual(int referenceIndex, double value) {
    final _$actionInfo =
        _$_ChecklistEditorStoreBaseToJsonActionController.startAction(
            name: '_ChecklistEditorStoreBaseToJson.updateLinearityActual');
    try {
      return super.updateLinearityActual(referenceIndex, value);
    } finally {
      _$_ChecklistEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckReferenceValue(
      int sectionIndex, int checkIndex, int refIndex, double? newValue) {
    final _$actionInfo =
        _$_ChecklistEditorStoreBaseToJsonActionController.startAction(
            name: '_ChecklistEditorStoreBaseToJson.setCheckReferenceValue');
    try {
      return super
          .setCheckReferenceValue(sectionIndex, checkIndex, refIndex, newValue);
    } finally {
      _$_ChecklistEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_ChecklistEditorStoreBaseToJsonActionController
        .startAction(name: '_ChecklistEditorStoreBaseToJson.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_ChecklistEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_ChecklistEditorStoreBaseToJsonActionController
        .startAction(name: '_ChecklistEditorStoreBaseToJson.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_ChecklistEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDiverName(String value) {
    final _$actionInfo = _$_ChecklistEditorStoreBaseToJsonActionController
        .startAction(name: '_ChecklistEditorStoreBaseToJson.setDiverName');
    try {
      return super.setDiverName(value);
    } finally {
      _$_ChecklistEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime value) {
    final _$actionInfo = _$_ChecklistEditorStoreBaseToJsonActionController
        .startAction(name: '_ChecklistEditorStoreBaseToJson.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_ChecklistEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
