// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Template _$TemplateFromJson(Map<String, dynamic> json) {
  return _Template.fromJson(json);
}

/// @nodoc
mixin _$Template {
  String get rebreatherManufacturer => throw _privateConstructorUsedError;
  String get rebreatherModel => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<TemplateSection> get sections => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateCopyWith<Template> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateCopyWith<$Res> {
  factory $TemplateCopyWith(Template value, $Res Function(Template) then) =
      _$TemplateCopyWithImpl<$Res, Template>;
  @useResult
  $Res call(
      {String rebreatherManufacturer,
      String rebreatherModel,
      String title,
      String description,
      List<TemplateSection> sections,
      String filename});
}

/// @nodoc
class _$TemplateCopyWithImpl<$Res, $Val extends Template>
    implements $TemplateCopyWith<$Res> {
  _$TemplateCopyWithImpl(this._value, this._then);

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
    Object? sections = null,
    Object? filename = null,
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
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<TemplateSection>,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateImplCopyWith<$Res>
    implements $TemplateCopyWith<$Res> {
  factory _$$TemplateImplCopyWith(
          _$TemplateImpl value, $Res Function(_$TemplateImpl) then) =
      __$$TemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String rebreatherManufacturer,
      String rebreatherModel,
      String title,
      String description,
      List<TemplateSection> sections,
      String filename});
}

/// @nodoc
class __$$TemplateImplCopyWithImpl<$Res>
    extends _$TemplateCopyWithImpl<$Res, _$TemplateImpl>
    implements _$$TemplateImplCopyWith<$Res> {
  __$$TemplateImplCopyWithImpl(
      _$TemplateImpl _value, $Res Function(_$TemplateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rebreatherManufacturer = null,
    Object? rebreatherModel = null,
    Object? title = null,
    Object? description = null,
    Object? sections = null,
    Object? filename = null,
  }) {
    return _then(_$TemplateImpl(
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
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<TemplateSection>,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TemplateImpl implements _Template {
  _$TemplateImpl(
      {required this.rebreatherManufacturer,
      required this.rebreatherModel,
      required this.title,
      required this.description,
      required this.sections,
      this.filename = ''});

  factory _$TemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateImplFromJson(json);

  @override
  final String rebreatherManufacturer;
  @override
  final String rebreatherModel;
  @override
  final String title;
  @override
  final String description;
  @override
  final List<TemplateSection> sections;
  @override
  @JsonKey()
  final String filename;

  @override
  String toString() {
    return 'Template(rebreatherManufacturer: $rebreatherManufacturer, rebreatherModel: $rebreatherModel, title: $title, description: $description, sections: $sections, filename: $filename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateImpl &&
            (identical(other.rebreatherManufacturer, rebreatherManufacturer) ||
                other.rebreatherManufacturer == rebreatherManufacturer) &&
            (identical(other.rebreatherModel, rebreatherModel) ||
                other.rebreatherModel == rebreatherModel) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.sections, sections) &&
            (identical(other.filename, filename) ||
                other.filename == filename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      rebreatherManufacturer,
      rebreatherModel,
      title,
      description,
      const DeepCollectionEquality().hash(sections),
      filename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateImplCopyWith<_$TemplateImpl> get copyWith =>
      __$$TemplateImplCopyWithImpl<_$TemplateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateImplToJson(
      this,
    );
  }
}

abstract class _Template implements Template {
  factory _Template(
      {required final String rebreatherManufacturer,
      required final String rebreatherModel,
      required final String title,
      required final String description,
      required final List<TemplateSection> sections,
      final String filename}) = _$TemplateImpl;

  factory _Template.fromJson(Map<String, dynamic> json) =
      _$TemplateImpl.fromJson;

  @override
  String get rebreatherManufacturer;
  @override
  String get rebreatherModel;
  @override
  String get title;
  @override
  String get description;
  @override
  List<TemplateSection> get sections;
  @override
  String get filename;
  @override
  @JsonKey(ignore: true)
  _$$TemplateImplCopyWith<_$TemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
