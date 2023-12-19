// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_editor_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateEditorStore _$TemplateEditorStoreFromJson(Map<String, dynamic> json) =>
    TemplateEditorStore()
      .._currentTemplate =
          Template.fromJson(json['_currentTemplate'] as Map<String, dynamic>)
      .._sections =
          ObservableListJsonConverter.obsvbLstOfTemplateSectionFromJson(
              json['_sections'] as List<TemplateSection>)
      .._selectedSection = TemplateSection.fromJson(
          json['_selectedSection'] as Map<String, dynamic>)
      .._checks =
          ObservableListJsonConverter.obsvbLstOfObsvbLstOfTemplateCheckFromJson(
              json['_checks'] as List<List<TemplateCheck>>)
      .._selectedSectionIndex = json['_selectedSectionIndex'] as int
      .._hasLinearityStep1 = json['_hasLinearityStep1'] as bool
      .._hasLinearityStep2 = json['_hasLinearityStep2'] as bool;

Map<String, dynamic> _$TemplateEditorStoreToJson(
        TemplateEditorStore instance) =>
    <String, dynamic>{
      '_currentTemplate': instance._currentTemplate.toJson(),
      '_sections': ObservableListJsonConverter.obsvbLstOfTemplateSectionToJson(
          instance._sections),
      '_selectedSection': instance._selectedSection.toJson(),
      '_checks':
          ObservableListJsonConverter.obsvbLstOfObsvbLstOfTemplateCheckToJson(
              instance._checks),
      '_selectedSectionIndex': instance._selectedSectionIndex,
      '_hasLinearityStep1': instance._hasLinearityStep1,
      '_hasLinearityStep2': instance._hasLinearityStep2,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TemplateEditorStore on _TemplateEditorStoreBaseToJson, Store {
  Computed<bool>? _$enableCheckCreationComputed;

  @override
  bool get enableCheckCreation => (_$enableCheckCreationComputed ??=
          Computed<bool>(() => super.enableCheckCreation,
              name: '_TemplateEditorStoreBaseToJson.enableCheckCreation'))
      .value;
  Computed<bool>? _$enableLinearityStep2CreationComputed;

  @override
  bool get enableLinearityStep2Creation =>
      (_$enableLinearityStep2CreationComputed ??= Computed<bool>(
              () => super.enableLinearityStep2Creation,
              name:
                  '_TemplateEditorStoreBaseToJson.enableLinearityStep2Creation'))
          .value;
  Computed<bool>? _$enableLinearityStep1CreationComputed;

  @override
  bool get enableLinearityStep1Creation =>
      (_$enableLinearityStep1CreationComputed ??= Computed<bool>(
              () => super.enableLinearityStep1Creation,
              name:
                  '_TemplateEditorStoreBaseToJson.enableLinearityStep1Creation'))
          .value;

  late final _$_currentTemplateAtom = Atom(
      name: '_TemplateEditorStoreBaseToJson._currentTemplate',
      context: context);

  Template get currentTemplate {
    _$_currentTemplateAtom.reportRead();
    return super._currentTemplate;
  }

  @override
  Template get _currentTemplate => currentTemplate;

  @override
  set _currentTemplate(Template value) {
    _$_currentTemplateAtom.reportWrite(value, super._currentTemplate, () {
      super._currentTemplate = value;
    });
  }

  late final _$_sectionsAtom =
      Atom(name: '_TemplateEditorStoreBaseToJson._sections', context: context);

  ObservableList<TemplateSection> get sections {
    _$_sectionsAtom.reportRead();
    return super._sections;
  }

  @override
  ObservableList<TemplateSection> get _sections => sections;

  @override
  set _sections(ObservableList<TemplateSection> value) {
    _$_sectionsAtom.reportWrite(value, super._sections, () {
      super._sections = value;
    });
  }

  late final _$_selectedSectionAtom = Atom(
      name: '_TemplateEditorStoreBaseToJson._selectedSection',
      context: context);

  TemplateSection get selectedSection {
    _$_selectedSectionAtom.reportRead();
    return super._selectedSection;
  }

  @override
  TemplateSection get _selectedSection => selectedSection;

  @override
  set _selectedSection(TemplateSection value) {
    _$_selectedSectionAtom.reportWrite(value, super._selectedSection, () {
      super._selectedSection = value;
    });
  }

  late final _$_checksAtom =
      Atom(name: '_TemplateEditorStoreBaseToJson._checks', context: context);

  ObservableList<ObservableList<TemplateCheck>> get checks {
    _$_checksAtom.reportRead();
    return super._checks;
  }

  @override
  ObservableList<ObservableList<TemplateCheck>> get _checks => checks;

  @override
  set _checks(ObservableList<ObservableList<TemplateCheck>> value) {
    _$_checksAtom.reportWrite(value, super._checks, () {
      super._checks = value;
    });
  }

  late final _$_selectedSectionIndexAtom = Atom(
      name: '_TemplateEditorStoreBaseToJson._selectedSectionIndex',
      context: context);

  int get selectedSectionIndex {
    _$_selectedSectionIndexAtom.reportRead();
    return super._selectedSectionIndex;
  }

  @override
  int get _selectedSectionIndex => selectedSectionIndex;

  @override
  set _selectedSectionIndex(int value) {
    _$_selectedSectionIndexAtom.reportWrite(value, super._selectedSectionIndex,
        () {
      super._selectedSectionIndex = value;
    });
  }

  late final _$_hasLinearityStep1Atom = Atom(
      name: '_TemplateEditorStoreBaseToJson._hasLinearityStep1',
      context: context);

  bool get hasLinearityStep1 {
    _$_hasLinearityStep1Atom.reportRead();
    return super._hasLinearityStep1;
  }

  @override
  bool get _hasLinearityStep1 => hasLinearityStep1;

  @override
  set _hasLinearityStep1(bool value) {
    _$_hasLinearityStep1Atom.reportWrite(value, super._hasLinearityStep1, () {
      super._hasLinearityStep1 = value;
    });
  }

  late final _$_hasLinearityStep2Atom = Atom(
      name: '_TemplateEditorStoreBaseToJson._hasLinearityStep2',
      context: context);

  bool get hasLinearityStep2 {
    _$_hasLinearityStep2Atom.reportRead();
    return super._hasLinearityStep2;
  }

  @override
  bool get _hasLinearityStep2 => hasLinearityStep2;

  @override
  set _hasLinearityStep2(bool value) {
    _$_hasLinearityStep2Atom.reportWrite(value, super._hasLinearityStep2, () {
      super._hasLinearityStep2 = value;
    });
  }

  late final _$_canUndoAtom =
      Atom(name: '_TemplateEditorStoreBaseToJson._canUndo', context: context);

  bool get canUndo {
    _$_canUndoAtom.reportRead();
    return super._canUndo;
  }

  @override
  bool get _canUndo => canUndo;

  @override
  set _canUndo(bool value) {
    _$_canUndoAtom.reportWrite(value, super._canUndo, () {
      super._canUndo = value;
    });
  }

  late final _$_canRedoAtom =
      Atom(name: '_TemplateEditorStoreBaseToJson._canRedo', context: context);

  bool get canRedo {
    _$_canRedoAtom.reportRead();
    return super._canRedo;
  }

  @override
  bool get _canRedo => canRedo;

  @override
  set _canRedo(bool value) {
    _$_canRedoAtom.reportWrite(value, super._canRedo, () {
      super._canRedo = value;
    });
  }

  late final _$_undoDescriptionAtom = Atom(
      name: '_TemplateEditorStoreBaseToJson._undoDescription',
      context: context);

  String get undoDescription {
    _$_undoDescriptionAtom.reportRead();
    return super._undoDescription;
  }

  @override
  String get _undoDescription => undoDescription;

  @override
  set _undoDescription(String value) {
    _$_undoDescriptionAtom.reportWrite(value, super._undoDescription, () {
      super._undoDescription = value;
    });
  }

  late final _$_redoDescriptionAtom = Atom(
      name: '_TemplateEditorStoreBaseToJson._redoDescription',
      context: context);

  String get redoDescription {
    _$_redoDescriptionAtom.reportRead();
    return super._redoDescription;
  }

  @override
  String get _redoDescription => redoDescription;

  @override
  set _redoDescription(String value) {
    _$_redoDescriptionAtom.reportWrite(value, super._redoDescription, () {
      super._redoDescription = value;
    });
  }

  late final _$_TemplateEditorStoreBaseToJsonActionController =
      ActionController(
          name: '_TemplateEditorStoreBaseToJson', context: context);

  @override
  void undo() {
    final _$actionInfo = _$_TemplateEditorStoreBaseToJsonActionController
        .startAction(name: '_TemplateEditorStoreBaseToJson.undo');
    try {
      return super.undo();
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void redo() {
    final _$actionInfo = _$_TemplateEditorStoreBaseToJsonActionController
        .startAction(name: '_TemplateEditorStoreBaseToJson.redo');
    try {
      return super.redo();
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addLinearityStep2Check() {
    final _$actionInfo =
        _$_TemplateEditorStoreBaseToJsonActionController.startAction(
            name: '_TemplateEditorStoreBaseToJson.addLinearityStep2Check');
    try {
      return super.addLinearityStep2Check();
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addLinearityStep1Check({required int referenceCount}) {
    final _$actionInfo =
        _$_TemplateEditorStoreBaseToJsonActionController.startAction(
            name: '_TemplateEditorStoreBaseToJson.addLinearityStep1Check');
    try {
      return super.addLinearityStep1Check(referenceCount: referenceCount);
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addRegularCheck(
      {required String description,
      required int secondsTimer,
      required int referenceCount}) {
    final _$actionInfo = _$_TemplateEditorStoreBaseToJsonActionController
        .startAction(name: '_TemplateEditorStoreBaseToJson.addRegularCheck');
    try {
      return super.addRegularCheck(
          description: description,
          secondsTimer: secondsTimer,
          referenceCount: referenceCount);
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSection({required String title}) {
    final _$actionInfo = _$_TemplateEditorStoreBaseToJsonActionController
        .startAction(name: '_TemplateEditorStoreBaseToJson.addSection');
    try {
      return super.addSection(title: title);
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentTemplate(Template template) {
    final _$actionInfo = _$_TemplateEditorStoreBaseToJsonActionController
        .startAction(name: '_TemplateEditorStoreBaseToJson.setCurrentTemplate');
    try {
      return super.setCurrentTemplate(template);
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void moveCheckToAnotherSection(
      int currentSectionIndex, int checkIndex, int newSectionIndex) {
    final _$actionInfo =
        _$_TemplateEditorStoreBaseToJsonActionController.startAction(
            name: '_TemplateEditorStoreBaseToJson.moveCheckToAnotherSection');
    try {
      return super.moveCheckToAnotherSection(
          currentSectionIndex, checkIndex, newSectionIndex);
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRegularCheck(int sectionIndex, int checkIndex,
      {String? description, int? timerDuration, int? referenceCount}) {
    final _$actionInfo = _$_TemplateEditorStoreBaseToJsonActionController
        .startAction(name: '_TemplateEditorStoreBaseToJson.updateRegularCheck');
    try {
      return super.updateRegularCheck(sectionIndex, checkIndex,
          description: description,
          timerDuration: timerDuration,
          referenceCount: referenceCount);
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLinearityStep1Check(
      int sectionIndex, int checkIndex, int referenceCount) {
    final _$actionInfo =
        _$_TemplateEditorStoreBaseToJsonActionController.startAction(
            name: '_TemplateEditorStoreBaseToJson.updateLinearityStep1Check');
    try {
      return super
          .updateLinearityStep1Check(sectionIndex, checkIndex, referenceCount);
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void moveSection(int oldSectionIndex, int newSectionIndex) {
    final _$actionInfo = _$_TemplateEditorStoreBaseToJsonActionController
        .startAction(name: '_TemplateEditorStoreBaseToJson.moveSection');
    try {
      return super.moveSection(oldSectionIndex, newSectionIndex);
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTemplate(
      {String? rebreatherManufacturer,
      String? rebreatherModel,
      String? title,
      String? description,
      String? filename}) {
    final _$actionInfo = _$_TemplateEditorStoreBaseToJsonActionController
        .startAction(name: '_TemplateEditorStoreBaseToJson.updateTemplate');
    try {
      return super.updateTemplate(
          rebreatherManufacturer: rebreatherManufacturer,
          rebreatherModel: rebreatherModel,
          title: title,
          description: description,
          filename: filename);
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSectionTitle(int sectionIndex, String newTitle) {
    final _$actionInfo = _$_TemplateEditorStoreBaseToJsonActionController
        .startAction(name: '_TemplateEditorStoreBaseToJson.updateSectionTitle');
    try {
      return super.updateSectionTitle(sectionIndex, newTitle);
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteSection(int index) {
    final _$actionInfo = _$_TemplateEditorStoreBaseToJsonActionController
        .startAction(name: '_TemplateEditorStoreBaseToJson.deleteSection');
    try {
      return super.deleteSection(index);
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteCheck(int sectionIndex, int index) {
    final _$actionInfo = _$_TemplateEditorStoreBaseToJsonActionController
        .startAction(name: '_TemplateEditorStoreBaseToJson.deleteCheck');
    try {
      return super.deleteCheck(sectionIndex, index);
    } finally {
      _$_TemplateEditorStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enableCheckCreation: ${enableCheckCreation},
enableLinearityStep2Creation: ${enableLinearityStep2Creation},
enableLinearityStep1Creation: ${enableLinearityStep1Creation}
    ''';
  }
}
