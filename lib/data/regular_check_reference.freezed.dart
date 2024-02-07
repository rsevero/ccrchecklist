// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'regular_check_reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegularCheckReference _$RegularCheckReferenceFromJson(
    Map<String, dynamic> json) {
  return _RegularCheckReference.fromJson(json);
}

/// @nodoc
mixin _$RegularCheckReference {
  double? get value => throw _privateConstructorUsedError;
  String? get prefix => throw _privateConstructorUsedError;
  String? get suffix => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegularCheckReferenceCopyWith<RegularCheckReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegularCheckReferenceCopyWith<$Res> {
  factory $RegularCheckReferenceCopyWith(RegularCheckReference value,
          $Res Function(RegularCheckReference) then) =
      _$RegularCheckReferenceCopyWithImpl<$Res, RegularCheckReference>;
  @useResult
  $Res call({double? value, String? prefix, String? suffix});
}

/// @nodoc
class _$RegularCheckReferenceCopyWithImpl<$Res,
        $Val extends RegularCheckReference>
    implements $RegularCheckReferenceCopyWith<$Res> {
  _$RegularCheckReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      prefix: freezed == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegularCheckReferenceImplCopyWith<$Res>
    implements $RegularCheckReferenceCopyWith<$Res> {
  factory _$$RegularCheckReferenceImplCopyWith(
          _$RegularCheckReferenceImpl value,
          $Res Function(_$RegularCheckReferenceImpl) then) =
      __$$RegularCheckReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? value, String? prefix, String? suffix});
}

/// @nodoc
class __$$RegularCheckReferenceImplCopyWithImpl<$Res>
    extends _$RegularCheckReferenceCopyWithImpl<$Res,
        _$RegularCheckReferenceImpl>
    implements _$$RegularCheckReferenceImplCopyWith<$Res> {
  __$$RegularCheckReferenceImplCopyWithImpl(_$RegularCheckReferenceImpl _value,
      $Res Function(_$RegularCheckReferenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
  }) {
    return _then(_$RegularCheckReferenceImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      prefix: freezed == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegularCheckReferenceImpl
    with DiagnosticableTreeMixin
    implements _RegularCheckReference {
  _$RegularCheckReferenceImpl({this.value, this.prefix, this.suffix});

  factory _$RegularCheckReferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegularCheckReferenceImplFromJson(json);

  @override
  final double? value;
  @override
  final String? prefix;
  @override
  final String? suffix;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegularCheckReference(value: $value, prefix: $prefix, suffix: $suffix)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegularCheckReference'))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('prefix', prefix))
      ..add(DiagnosticsProperty('suffix', suffix));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegularCheckReferenceImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.suffix, suffix) || other.suffix == suffix));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, prefix, suffix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegularCheckReferenceImplCopyWith<_$RegularCheckReferenceImpl>
      get copyWith => __$$RegularCheckReferenceImplCopyWithImpl<
          _$RegularCheckReferenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegularCheckReferenceImplToJson(
      this,
    );
  }
}

abstract class _RegularCheckReference implements RegularCheckReference {
  factory _RegularCheckReference(
      {final double? value,
      final String? prefix,
      final String? suffix}) = _$RegularCheckReferenceImpl;

  factory _RegularCheckReference.fromJson(Map<String, dynamic> json) =
      _$RegularCheckReferenceImpl.fromJson;

  @override
  double? get value;
  @override
  String? get prefix;
  @override
  String? get suffix;
  @override
  @JsonKey(ignore: true)
  _$$RegularCheckReferenceImplCopyWith<_$RegularCheckReferenceImpl>
      get copyWith => throw _privateConstructorUsedError;
}
