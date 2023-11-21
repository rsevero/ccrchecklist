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
  set title(String value) => throw _privateConstructorUsedError;
  List<TemplateCheck> get checks => throw _privateConstructorUsedError;
  set checks(List<TemplateCheck> value) => throw _privateConstructorUsedError;
  Template get parent => throw _privateConstructorUsedError;
  set parent(Template value) => throw _privateConstructorUsedError;

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
  $Res call({String title, List<TemplateCheck> checks, Template parent});

  $TemplateCopyWith<$Res> get parent;
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
    Object? parent = null,
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
      parent: null == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as Template,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemplateCopyWith<$Res> get parent {
    return $TemplateCopyWith<$Res>(_value.parent, (value) {
      return _then(_value.copyWith(parent: value) as $Val);
    });
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
  $Res call({String title, List<TemplateCheck> checks, Template parent});

  @override
  $TemplateCopyWith<$Res> get parent;
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
    Object? parent = null,
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
      parent: null == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as Template,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateSectionImpl extends _TemplateSection
    with DiagnosticableTreeMixin {
  _$TemplateSectionImpl(
      {required this.title, required this.checks, required this.parent})
      : super._();

  factory _$TemplateSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateSectionImplFromJson(json);

  @override
  String title;
  @override
  List<TemplateCheck> checks;
  @override
  Template parent;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemplateSection(title: $title, checks: $checks, parent: $parent)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TemplateSection'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('checks', checks))
      ..add(DiagnosticsProperty('parent', parent));
  }

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

abstract class _TemplateSection extends TemplateSection {
  factory _TemplateSection(
      {required String title,
      required List<TemplateCheck> checks,
      required Template parent}) = _$TemplateSectionImpl;
  _TemplateSection._() : super._();

  factory _TemplateSection.fromJson(Map<String, dynamic> json) =
      _$TemplateSectionImpl.fromJson;

  @override
  String get title;
  set title(String value);
  @override
  List<TemplateCheck> get checks;
  set checks(List<TemplateCheck> value);
  @override
  Template get parent;
  set parent(Template value);
  @override
  @JsonKey(ignore: true)
  _$$TemplateSectionImplCopyWith<_$TemplateSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
