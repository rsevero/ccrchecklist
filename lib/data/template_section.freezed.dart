// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TemplateSection _$TemplateSectionFromJson(Map<String, dynamic> json) {
  return _TemplateSection.fromJson(json);
}

/// @nodoc
mixin _$TemplateSection {
  String get title => throw _privateConstructorUsedError;
  List<TemplateCheck> get checks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateSectionCopyWith<TemplateSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateSectionCopyWith<$Res> {
  factory $TemplateSectionCopyWith(
          TemplateSection value, $Res Function(TemplateSection) then) =
      _$TemplateSectionCopyWithImpl<$Res, TemplateSection>;
  @useResult
  $Res call({String title, List<TemplateCheck> checks});
}

/// @nodoc
class _$TemplateSectionCopyWithImpl<$Res, $Val extends TemplateSection>
    implements $TemplateSectionCopyWith<$Res> {
  _$TemplateSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? checks = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      checks: null == checks
          ? _value.checks
          : checks // ignore: cast_nullable_to_non_nullable
              as List<TemplateCheck>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateSectionImplCopyWith<$Res>
    implements $TemplateSectionCopyWith<$Res> {
  factory _$$TemplateSectionImplCopyWith(_$TemplateSectionImpl value,
          $Res Function(_$TemplateSectionImpl) then) =
      __$$TemplateSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<TemplateCheck> checks});
}

/// @nodoc
class __$$TemplateSectionImplCopyWithImpl<$Res>
    extends _$TemplateSectionCopyWithImpl<$Res, _$TemplateSectionImpl>
    implements _$$TemplateSectionImplCopyWith<$Res> {
  __$$TemplateSectionImplCopyWithImpl(
      _$TemplateSectionImpl _value, $Res Function(_$TemplateSectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? checks = null,
  }) {
    return _then(_$TemplateSectionImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      checks: null == checks
          ? _value.checks
          : checks // ignore: cast_nullable_to_non_nullable
              as List<TemplateCheck>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateSectionImpl implements _TemplateSection {
  _$TemplateSectionImpl({required this.title, required this.checks});

  factory _$TemplateSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateSectionImplFromJson(json);

  @override
  final String title;
  @override
  final List<TemplateCheck> checks;

  @override
  String toString() {
    return 'TemplateSection(title: $title, checks: $checks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateSectionImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.checks, checks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(checks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateSectionImplCopyWith<_$TemplateSectionImpl> get copyWith =>
      __$$TemplateSectionImplCopyWithImpl<_$TemplateSectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateSectionImplToJson(
      this,
    );
  }
}

abstract class _TemplateSection implements TemplateSection {
  factory _TemplateSection(
      {required final String title,
      required final List<TemplateCheck> checks}) = _$TemplateSectionImpl;

  factory _TemplateSection.fromJson(Map<String, dynamic> json) =
      _$TemplateSectionImpl.fromJson;

  @override
  String get title;
  @override
  List<TemplateCheck> get checks;
  @override
  @JsonKey(ignore: true)
  _$$TemplateSectionImplCopyWith<_$TemplateSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
