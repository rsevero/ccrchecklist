// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Checklist _$ChecklistFromJson(Map<String, dynamic> json) {
  return _Checklist.fromJson(json);
}

/// @nodoc
mixin _$Checklist {
  String get rebreatherManufacturer => throw _privateConstructorUsedError;
  String get rebreatherModel => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get diverName => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<ChecklistSection> get sections => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChecklistCopyWith<Checklist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistCopyWith<$Res> {
  factory $ChecklistCopyWith(Checklist value, $Res Function(Checklist) then) =
      _$ChecklistCopyWithImpl<$Res, Checklist>;
  @useResult
  $Res call(
      {String rebreatherManufacturer,
      String rebreatherModel,
      String title,
      String description,
      String diverName,
      DateTime date,
      List<ChecklistSection> sections});
}

/// @nodoc
class _$ChecklistCopyWithImpl<$Res, $Val extends Checklist>
    implements $ChecklistCopyWith<$Res> {
  _$ChecklistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rebreatherManufacturer = null,
    Object? rebreatherModel = null,
    Object? title = null,
    Object? description = null,
    Object? diverName = null,
    Object? date = null,
    Object? sections = null,
  }) {
    return _then(_value.copyWith(
      rebreatherManufacturer: null == rebreatherManufacturer
          ? _value.rebreatherManufacturer
          : rebreatherManufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      rebreatherModel: null == rebreatherModel
          ? _value.rebreatherModel
          : rebreatherModel // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      diverName: null == diverName
          ? _value.diverName
          : diverName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<ChecklistSection>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecklistImplCopyWith<$Res>
    implements $ChecklistCopyWith<$Res> {
  factory _$$ChecklistImplCopyWith(
          _$ChecklistImpl value, $Res Function(_$ChecklistImpl) then) =
      __$$ChecklistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String rebreatherManufacturer,
      String rebreatherModel,
      String title,
      String description,
      String diverName,
      DateTime date,
      List<ChecklistSection> sections});
}

/// @nodoc
class __$$ChecklistImplCopyWithImpl<$Res>
    extends _$ChecklistCopyWithImpl<$Res, _$ChecklistImpl>
    implements _$$ChecklistImplCopyWith<$Res> {
  __$$ChecklistImplCopyWithImpl(
      _$ChecklistImpl _value, $Res Function(_$ChecklistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rebreatherManufacturer = null,
    Object? rebreatherModel = null,
    Object? title = null,
    Object? description = null,
    Object? diverName = null,
    Object? date = null,
    Object? sections = null,
  }) {
    return _then(_$ChecklistImpl(
      rebreatherManufacturer: null == rebreatherManufacturer
          ? _value.rebreatherManufacturer
          : rebreatherManufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      rebreatherModel: null == rebreatherModel
          ? _value.rebreatherModel
          : rebreatherModel // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      diverName: null == diverName
          ? _value.diverName
          : diverName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<ChecklistSection>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ChecklistImpl with DiagnosticableTreeMixin implements _Checklist {
  _$ChecklistImpl(
      {required this.rebreatherManufacturer,
      required this.rebreatherModel,
      required this.title,
      required this.description,
      required this.diverName,
      required this.date,
      required this.sections});

  factory _$ChecklistImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecklistImplFromJson(json);

  @override
  final String rebreatherManufacturer;
  @override
  final String rebreatherModel;
  @override
  final String title;
  @override
  final String description;
  @override
  final String diverName;
  @override
  final DateTime date;
  @override
  final List<ChecklistSection> sections;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Checklist(rebreatherManufacturer: $rebreatherManufacturer, rebreatherModel: $rebreatherModel, title: $title, description: $description, diverName: $diverName, date: $date, sections: $sections)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Checklist'))
      ..add(
          DiagnosticsProperty('rebreatherManufacturer', rebreatherManufacturer))
      ..add(DiagnosticsProperty('rebreatherModel', rebreatherModel))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('diverName', diverName))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('sections', sections));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistImpl &&
            (identical(other.rebreatherManufacturer, rebreatherManufacturer) ||
                other.rebreatherManufacturer == rebreatherManufacturer) &&
            (identical(other.rebreatherModel, rebreatherModel) ||
                other.rebreatherModel == rebreatherModel) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.diverName, diverName) ||
                other.diverName == diverName) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other.sections, sections));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      rebreatherManufacturer,
      rebreatherModel,
      title,
      description,
      diverName,
      date,
      const DeepCollectionEquality().hash(sections));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistImplCopyWith<_$ChecklistImpl> get copyWith =>
      __$$ChecklistImplCopyWithImpl<_$ChecklistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecklistImplToJson(
      this,
    );
  }
}

abstract class _Checklist implements Checklist {
  factory _Checklist(
      {required final String rebreatherManufacturer,
      required final String rebreatherModel,
      required final String title,
      required final String description,
      required final String diverName,
      required final DateTime date,
      required final List<ChecklistSection> sections}) = _$ChecklistImpl;

  factory _Checklist.fromJson(Map<String, dynamic> json) =
      _$ChecklistImpl.fromJson;

  @override
  String get rebreatherManufacturer;
  @override
  String get rebreatherModel;
  @override
  String get title;
  @override
  String get description;
  @override
  String get diverName;
  @override
  DateTime get date;
  @override
  List<ChecklistSection> get sections;
  @override
  @JsonKey(ignore: true)
  _$$ChecklistImplCopyWith<_$ChecklistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
