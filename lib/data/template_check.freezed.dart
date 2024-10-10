// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_check.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TemplateCheck _$TemplateCheckFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'regular':
      return TemplateRegularCheck.fromJson(json);
    case 'linearityStep1':
      return TemplateLinearityStep1Check.fromJson(json);
    case 'linearityStep2':
      return TemplateLinearityStep2Check.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TemplateCheck',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TemplateCheck {
  String get description => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description, int secondsTimer,
            String observation, List<RegularCheckReference> references)
        regular,
    required TResult Function(String description, int referenceCount)
        linearityStep1,
    required TResult Function(String description) linearityStep2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description, int secondsTimer, String observation,
            List<RegularCheckReference> references)?
        regular,
    TResult? Function(String description, int referenceCount)? linearityStep1,
    TResult? Function(String description)? linearityStep2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description, int secondsTimer, String observation,
            List<RegularCheckReference> references)?
        regular,
    TResult Function(String description, int referenceCount)? linearityStep1,
    TResult Function(String description)? linearityStep2,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TemplateRegularCheck value) regular,
    required TResult Function(TemplateLinearityStep1Check value) linearityStep1,
    required TResult Function(TemplateLinearityStep2Check value) linearityStep2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TemplateRegularCheck value)? regular,
    TResult? Function(TemplateLinearityStep1Check value)? linearityStep1,
    TResult? Function(TemplateLinearityStep2Check value)? linearityStep2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TemplateRegularCheck value)? regular,
    TResult Function(TemplateLinearityStep1Check value)? linearityStep1,
    TResult Function(TemplateLinearityStep2Check value)? linearityStep2,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this TemplateCheck to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TemplateCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TemplateCheckCopyWith<TemplateCheck> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateCheckCopyWith<$Res> {
  factory $TemplateCheckCopyWith(
          TemplateCheck value, $Res Function(TemplateCheck) then) =
      _$TemplateCheckCopyWithImpl<$Res, TemplateCheck>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class _$TemplateCheckCopyWithImpl<$Res, $Val extends TemplateCheck>
    implements $TemplateCheckCopyWith<$Res> {
  _$TemplateCheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TemplateCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateRegularCheckImplCopyWith<$Res>
    implements $TemplateCheckCopyWith<$Res> {
  factory _$$TemplateRegularCheckImplCopyWith(_$TemplateRegularCheckImpl value,
          $Res Function(_$TemplateRegularCheckImpl) then) =
      __$$TemplateRegularCheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      int secondsTimer,
      String observation,
      List<RegularCheckReference> references});
}

/// @nodoc
class __$$TemplateRegularCheckImplCopyWithImpl<$Res>
    extends _$TemplateCheckCopyWithImpl<$Res, _$TemplateRegularCheckImpl>
    implements _$$TemplateRegularCheckImplCopyWith<$Res> {
  __$$TemplateRegularCheckImplCopyWithImpl(_$TemplateRegularCheckImpl _value,
      $Res Function(_$TemplateRegularCheckImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? secondsTimer = null,
    Object? observation = null,
    Object? references = null,
  }) {
    return _then(_$TemplateRegularCheckImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      secondsTimer: null == secondsTimer
          ? _value.secondsTimer
          : secondsTimer // ignore: cast_nullable_to_non_nullable
              as int,
      observation: null == observation
          ? _value.observation
          : observation // ignore: cast_nullable_to_non_nullable
              as String,
      references: null == references
          ? _value.references
          : references // ignore: cast_nullable_to_non_nullable
              as List<RegularCheckReference>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateRegularCheckImpl extends TemplateRegularCheck
    with DiagnosticableTreeMixin {
  _$TemplateRegularCheckImpl(
      {required this.description,
      required this.secondsTimer,
      required this.observation,
      required this.references,
      final String? $type})
      : $type = $type ?? 'regular',
        super._();

  factory _$TemplateRegularCheckImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateRegularCheckImplFromJson(json);

  @override
  final String description;
  @override
  final int secondsTimer;
  @override
  final String observation;
  @override
  final List<RegularCheckReference> references;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemplateCheck.regular(description: $description, secondsTimer: $secondsTimer, observation: $observation, references: $references)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TemplateCheck.regular'))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('secondsTimer', secondsTimer))
      ..add(DiagnosticsProperty('observation', observation))
      ..add(DiagnosticsProperty('references', references));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateRegularCheckImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.secondsTimer, secondsTimer) ||
                other.secondsTimer == secondsTimer) &&
            (identical(other.observation, observation) ||
                other.observation == observation) &&
            const DeepCollectionEquality()
                .equals(other.references, references));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, secondsTimer,
      observation, const DeepCollectionEquality().hash(references));

  /// Create a copy of TemplateCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateRegularCheckImplCopyWith<_$TemplateRegularCheckImpl>
      get copyWith =>
          __$$TemplateRegularCheckImplCopyWithImpl<_$TemplateRegularCheckImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description, int secondsTimer,
            String observation, List<RegularCheckReference> references)
        regular,
    required TResult Function(String description, int referenceCount)
        linearityStep1,
    required TResult Function(String description) linearityStep2,
  }) {
    return regular(description, secondsTimer, observation, references);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description, int secondsTimer, String observation,
            List<RegularCheckReference> references)?
        regular,
    TResult? Function(String description, int referenceCount)? linearityStep1,
    TResult? Function(String description)? linearityStep2,
  }) {
    return regular?.call(description, secondsTimer, observation, references);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description, int secondsTimer, String observation,
            List<RegularCheckReference> references)?
        regular,
    TResult Function(String description, int referenceCount)? linearityStep1,
    TResult Function(String description)? linearityStep2,
    required TResult orElse(),
  }) {
    if (regular != null) {
      return regular(description, secondsTimer, observation, references);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TemplateRegularCheck value) regular,
    required TResult Function(TemplateLinearityStep1Check value) linearityStep1,
    required TResult Function(TemplateLinearityStep2Check value) linearityStep2,
  }) {
    return regular(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TemplateRegularCheck value)? regular,
    TResult? Function(TemplateLinearityStep1Check value)? linearityStep1,
    TResult? Function(TemplateLinearityStep2Check value)? linearityStep2,
  }) {
    return regular?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TemplateRegularCheck value)? regular,
    TResult Function(TemplateLinearityStep1Check value)? linearityStep1,
    TResult Function(TemplateLinearityStep2Check value)? linearityStep2,
    required TResult orElse(),
  }) {
    if (regular != null) {
      return regular(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateRegularCheckImplToJson(
      this,
    );
  }
}

abstract class TemplateRegularCheck extends TemplateCheck {
  factory TemplateRegularCheck(
          {required final String description,
          required final int secondsTimer,
          required final String observation,
          required final List<RegularCheckReference> references}) =
      _$TemplateRegularCheckImpl;
  TemplateRegularCheck._() : super._();

  factory TemplateRegularCheck.fromJson(Map<String, dynamic> json) =
      _$TemplateRegularCheckImpl.fromJson;

  @override
  String get description;
  int get secondsTimer;
  String get observation;
  List<RegularCheckReference> get references;

  /// Create a copy of TemplateCheck
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateRegularCheckImplCopyWith<_$TemplateRegularCheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TemplateLinearityStep1CheckImplCopyWith<$Res>
    implements $TemplateCheckCopyWith<$Res> {
  factory _$$TemplateLinearityStep1CheckImplCopyWith(
          _$TemplateLinearityStep1CheckImpl value,
          $Res Function(_$TemplateLinearityStep1CheckImpl) then) =
      __$$TemplateLinearityStep1CheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, int referenceCount});
}

/// @nodoc
class __$$TemplateLinearityStep1CheckImplCopyWithImpl<$Res>
    extends _$TemplateCheckCopyWithImpl<$Res, _$TemplateLinearityStep1CheckImpl>
    implements _$$TemplateLinearityStep1CheckImplCopyWith<$Res> {
  __$$TemplateLinearityStep1CheckImplCopyWithImpl(
      _$TemplateLinearityStep1CheckImpl _value,
      $Res Function(_$TemplateLinearityStep1CheckImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? referenceCount = null,
  }) {
    return _then(_$TemplateLinearityStep1CheckImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      referenceCount: null == referenceCount
          ? _value.referenceCount
          : referenceCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateLinearityStep1CheckImpl extends TemplateLinearityStep1Check
    with DiagnosticableTreeMixin {
  _$TemplateLinearityStep1CheckImpl(
      {required this.description,
      required this.referenceCount,
      final String? $type})
      : $type = $type ?? 'linearityStep1',
        super._();

  factory _$TemplateLinearityStep1CheckImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TemplateLinearityStep1CheckImplFromJson(json);

  @override
  final String description;
  @override
  final int referenceCount;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemplateCheck.linearityStep1(description: $description, referenceCount: $referenceCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TemplateCheck.linearityStep1'))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('referenceCount', referenceCount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateLinearityStep1CheckImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.referenceCount, referenceCount) ||
                other.referenceCount == referenceCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, referenceCount);

  /// Create a copy of TemplateCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateLinearityStep1CheckImplCopyWith<_$TemplateLinearityStep1CheckImpl>
      get copyWith => __$$TemplateLinearityStep1CheckImplCopyWithImpl<
          _$TemplateLinearityStep1CheckImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description, int secondsTimer,
            String observation, List<RegularCheckReference> references)
        regular,
    required TResult Function(String description, int referenceCount)
        linearityStep1,
    required TResult Function(String description) linearityStep2,
  }) {
    return linearityStep1(description, referenceCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description, int secondsTimer, String observation,
            List<RegularCheckReference> references)?
        regular,
    TResult? Function(String description, int referenceCount)? linearityStep1,
    TResult? Function(String description)? linearityStep2,
  }) {
    return linearityStep1?.call(description, referenceCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description, int secondsTimer, String observation,
            List<RegularCheckReference> references)?
        regular,
    TResult Function(String description, int referenceCount)? linearityStep1,
    TResult Function(String description)? linearityStep2,
    required TResult orElse(),
  }) {
    if (linearityStep1 != null) {
      return linearityStep1(description, referenceCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TemplateRegularCheck value) regular,
    required TResult Function(TemplateLinearityStep1Check value) linearityStep1,
    required TResult Function(TemplateLinearityStep2Check value) linearityStep2,
  }) {
    return linearityStep1(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TemplateRegularCheck value)? regular,
    TResult? Function(TemplateLinearityStep1Check value)? linearityStep1,
    TResult? Function(TemplateLinearityStep2Check value)? linearityStep2,
  }) {
    return linearityStep1?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TemplateRegularCheck value)? regular,
    TResult Function(TemplateLinearityStep1Check value)? linearityStep1,
    TResult Function(TemplateLinearityStep2Check value)? linearityStep2,
    required TResult orElse(),
  }) {
    if (linearityStep1 != null) {
      return linearityStep1(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateLinearityStep1CheckImplToJson(
      this,
    );
  }
}

abstract class TemplateLinearityStep1Check extends TemplateCheck {
  factory TemplateLinearityStep1Check(
      {required final String description,
      required final int referenceCount}) = _$TemplateLinearityStep1CheckImpl;
  TemplateLinearityStep1Check._() : super._();

  factory TemplateLinearityStep1Check.fromJson(Map<String, dynamic> json) =
      _$TemplateLinearityStep1CheckImpl.fromJson;

  @override
  String get description;
  int get referenceCount;

  /// Create a copy of TemplateCheck
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateLinearityStep1CheckImplCopyWith<_$TemplateLinearityStep1CheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TemplateLinearityStep2CheckImplCopyWith<$Res>
    implements $TemplateCheckCopyWith<$Res> {
  factory _$$TemplateLinearityStep2CheckImplCopyWith(
          _$TemplateLinearityStep2CheckImpl value,
          $Res Function(_$TemplateLinearityStep2CheckImpl) then) =
      __$$TemplateLinearityStep2CheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$TemplateLinearityStep2CheckImplCopyWithImpl<$Res>
    extends _$TemplateCheckCopyWithImpl<$Res, _$TemplateLinearityStep2CheckImpl>
    implements _$$TemplateLinearityStep2CheckImplCopyWith<$Res> {
  __$$TemplateLinearityStep2CheckImplCopyWithImpl(
      _$TemplateLinearityStep2CheckImpl _value,
      $Res Function(_$TemplateLinearityStep2CheckImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$TemplateLinearityStep2CheckImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateLinearityStep2CheckImpl extends TemplateLinearityStep2Check
    with DiagnosticableTreeMixin {
  _$TemplateLinearityStep2CheckImpl(
      {required this.description, final String? $type})
      : $type = $type ?? 'linearityStep2',
        super._();

  factory _$TemplateLinearityStep2CheckImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TemplateLinearityStep2CheckImplFromJson(json);

  @override
  final String description;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemplateCheck.linearityStep2(description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TemplateCheck.linearityStep2'))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateLinearityStep2CheckImpl &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description);

  /// Create a copy of TemplateCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateLinearityStep2CheckImplCopyWith<_$TemplateLinearityStep2CheckImpl>
      get copyWith => __$$TemplateLinearityStep2CheckImplCopyWithImpl<
          _$TemplateLinearityStep2CheckImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description, int secondsTimer,
            String observation, List<RegularCheckReference> references)
        regular,
    required TResult Function(String description, int referenceCount)
        linearityStep1,
    required TResult Function(String description) linearityStep2,
  }) {
    return linearityStep2(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description, int secondsTimer, String observation,
            List<RegularCheckReference> references)?
        regular,
    TResult? Function(String description, int referenceCount)? linearityStep1,
    TResult? Function(String description)? linearityStep2,
  }) {
    return linearityStep2?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description, int secondsTimer, String observation,
            List<RegularCheckReference> references)?
        regular,
    TResult Function(String description, int referenceCount)? linearityStep1,
    TResult Function(String description)? linearityStep2,
    required TResult orElse(),
  }) {
    if (linearityStep2 != null) {
      return linearityStep2(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TemplateRegularCheck value) regular,
    required TResult Function(TemplateLinearityStep1Check value) linearityStep1,
    required TResult Function(TemplateLinearityStep2Check value) linearityStep2,
  }) {
    return linearityStep2(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TemplateRegularCheck value)? regular,
    TResult? Function(TemplateLinearityStep1Check value)? linearityStep1,
    TResult? Function(TemplateLinearityStep2Check value)? linearityStep2,
  }) {
    return linearityStep2?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TemplateRegularCheck value)? regular,
    TResult Function(TemplateLinearityStep1Check value)? linearityStep1,
    TResult Function(TemplateLinearityStep2Check value)? linearityStep2,
    required TResult orElse(),
  }) {
    if (linearityStep2 != null) {
      return linearityStep2(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateLinearityStep2CheckImplToJson(
      this,
    );
  }
}

abstract class TemplateLinearityStep2Check extends TemplateCheck {
  factory TemplateLinearityStep2Check({required final String description}) =
      _$TemplateLinearityStep2CheckImpl;
  TemplateLinearityStep2Check._() : super._();

  factory TemplateLinearityStep2Check.fromJson(Map<String, dynamic> json) =
      _$TemplateLinearityStep2CheckImpl.fromJson;

  @override
  String get description;

  /// Create a copy of TemplateCheck
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateLinearityStep2CheckImplCopyWith<_$TemplateLinearityStep2CheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}
