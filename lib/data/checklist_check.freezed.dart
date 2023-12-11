// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_check.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChecklistCheck _$ChecklistCheckFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'regular':
      return ChecklistRegularCheck.fromJson(json);
    case 'withReference':
      return ChecklistWithReferenceCheck.fromJson(json);
    case 'linearityStep1':
      return ChecklistLinearityCheckStep1Check.fromJson(json);
    case 'linearityStep2':
      return ChecklistLinearityCheckStep2Check.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ChecklistCheck',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ChecklistCheck {
  bool get isChecked => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isChecked, String description) regular,
    required TResult Function(bool isChecked, String description,
            int referenceCount, Map<int, double> references)
        withReference,
    required TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)
        linearityStep1,
    required TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)
        linearityStep2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isChecked, String description)? regular,
    TResult? Function(bool isChecked, String description, int referenceCount,
            Map<int, double> references)?
        withReference,
    TResult? Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep1,
    TResult? Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isChecked, String description)? regular,
    TResult Function(bool isChecked, String description, int referenceCount,
            Map<int, double> references)?
        withReference,
    TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep1,
    TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep2,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChecklistRegularCheck value) regular,
    required TResult Function(ChecklistWithReferenceCheck value) withReference,
    required TResult Function(ChecklistLinearityCheckStep1Check value)
        linearityStep1,
    required TResult Function(ChecklistLinearityCheckStep2Check value)
        linearityStep2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChecklistRegularCheck value)? regular,
    TResult? Function(ChecklistWithReferenceCheck value)? withReference,
    TResult? Function(ChecklistLinearityCheckStep1Check value)? linearityStep1,
    TResult? Function(ChecklistLinearityCheckStep2Check value)? linearityStep2,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChecklistRegularCheck value)? regular,
    TResult Function(ChecklistWithReferenceCheck value)? withReference,
    TResult Function(ChecklistLinearityCheckStep1Check value)? linearityStep1,
    TResult Function(ChecklistLinearityCheckStep2Check value)? linearityStep2,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChecklistCheckCopyWith<ChecklistCheck> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistCheckCopyWith<$Res> {
  factory $ChecklistCheckCopyWith(
          ChecklistCheck value, $Res Function(ChecklistCheck) then) =
      _$ChecklistCheckCopyWithImpl<$Res, ChecklistCheck>;
  @useResult
  $Res call({bool isChecked});
}

/// @nodoc
class _$ChecklistCheckCopyWithImpl<$Res, $Val extends ChecklistCheck>
    implements $ChecklistCheckCopyWith<$Res> {
  _$ChecklistCheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChecked = null,
  }) {
    return _then(_value.copyWith(
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecklistRegularCheckImplCopyWith<$Res>
    implements $ChecklistCheckCopyWith<$Res> {
  factory _$$ChecklistRegularCheckImplCopyWith(
          _$ChecklistRegularCheckImpl value,
          $Res Function(_$ChecklistRegularCheckImpl) then) =
      __$$ChecklistRegularCheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isChecked, String description});
}

/// @nodoc
class __$$ChecklistRegularCheckImplCopyWithImpl<$Res>
    extends _$ChecklistCheckCopyWithImpl<$Res, _$ChecklistRegularCheckImpl>
    implements _$$ChecklistRegularCheckImplCopyWith<$Res> {
  __$$ChecklistRegularCheckImplCopyWithImpl(_$ChecklistRegularCheckImpl _value,
      $Res Function(_$ChecklistRegularCheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChecked = null,
    Object? description = null,
  }) {
    return _then(_$ChecklistRegularCheckImpl(
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecklistRegularCheckImpl extends ChecklistRegularCheck
    with DiagnosticableTreeMixin {
  _$ChecklistRegularCheckImpl(
      {required this.isChecked, required this.description, final String? $type})
      : $type = $type ?? 'regular',
        super._();

  factory _$ChecklistRegularCheckImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecklistRegularCheckImplFromJson(json);

  @override
  final bool isChecked;
  @override
  final String description;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChecklistCheck.regular(isChecked: $isChecked, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChecklistCheck.regular'))
      ..add(DiagnosticsProperty('isChecked', isChecked))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistRegularCheckImpl &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isChecked, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistRegularCheckImplCopyWith<_$ChecklistRegularCheckImpl>
      get copyWith => __$$ChecklistRegularCheckImplCopyWithImpl<
          _$ChecklistRegularCheckImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isChecked, String description) regular,
    required TResult Function(bool isChecked, String description,
            int referenceCount, Map<int, double> references)
        withReference,
    required TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)
        linearityStep1,
    required TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)
        linearityStep2,
  }) {
    return regular(isChecked, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isChecked, String description)? regular,
    TResult? Function(bool isChecked, String description, int referenceCount,
            Map<int, double> references)?
        withReference,
    TResult? Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep1,
    TResult? Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep2,
  }) {
    return regular?.call(isChecked, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isChecked, String description)? regular,
    TResult Function(bool isChecked, String description, int referenceCount,
            Map<int, double> references)?
        withReference,
    TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep1,
    TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep2,
    required TResult orElse(),
  }) {
    if (regular != null) {
      return regular(isChecked, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChecklistRegularCheck value) regular,
    required TResult Function(ChecklistWithReferenceCheck value) withReference,
    required TResult Function(ChecklistLinearityCheckStep1Check value)
        linearityStep1,
    required TResult Function(ChecklistLinearityCheckStep2Check value)
        linearityStep2,
  }) {
    return regular(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChecklistRegularCheck value)? regular,
    TResult? Function(ChecklistWithReferenceCheck value)? withReference,
    TResult? Function(ChecklistLinearityCheckStep1Check value)? linearityStep1,
    TResult? Function(ChecklistLinearityCheckStep2Check value)? linearityStep2,
  }) {
    return regular?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChecklistRegularCheck value)? regular,
    TResult Function(ChecklistWithReferenceCheck value)? withReference,
    TResult Function(ChecklistLinearityCheckStep1Check value)? linearityStep1,
    TResult Function(ChecklistLinearityCheckStep2Check value)? linearityStep2,
    required TResult orElse(),
  }) {
    if (regular != null) {
      return regular(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecklistRegularCheckImplToJson(
      this,
    );
  }
}

abstract class ChecklistRegularCheck extends ChecklistCheck {
  factory ChecklistRegularCheck(
      {required final bool isChecked,
      required final String description}) = _$ChecklistRegularCheckImpl;
  ChecklistRegularCheck._() : super._();

  factory ChecklistRegularCheck.fromJson(Map<String, dynamic> json) =
      _$ChecklistRegularCheckImpl.fromJson;

  @override
  bool get isChecked;
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$ChecklistRegularCheckImplCopyWith<_$ChecklistRegularCheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChecklistWithReferenceCheckImplCopyWith<$Res>
    implements $ChecklistCheckCopyWith<$Res> {
  factory _$$ChecklistWithReferenceCheckImplCopyWith(
          _$ChecklistWithReferenceCheckImpl value,
          $Res Function(_$ChecklistWithReferenceCheckImpl) then) =
      __$$ChecklistWithReferenceCheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isChecked,
      String description,
      int referenceCount,
      Map<int, double> references});
}

/// @nodoc
class __$$ChecklistWithReferenceCheckImplCopyWithImpl<$Res>
    extends _$ChecklistCheckCopyWithImpl<$Res,
        _$ChecklistWithReferenceCheckImpl>
    implements _$$ChecklistWithReferenceCheckImplCopyWith<$Res> {
  __$$ChecklistWithReferenceCheckImplCopyWithImpl(
      _$ChecklistWithReferenceCheckImpl _value,
      $Res Function(_$ChecklistWithReferenceCheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChecked = null,
    Object? description = null,
    Object? referenceCount = null,
    Object? references = null,
  }) {
    return _then(_$ChecklistWithReferenceCheckImpl(
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      referenceCount: null == referenceCount
          ? _value.referenceCount
          : referenceCount // ignore: cast_nullable_to_non_nullable
              as int,
      references: null == references
          ? _value.references
          : references // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecklistWithReferenceCheckImpl extends ChecklistWithReferenceCheck
    with DiagnosticableTreeMixin {
  _$ChecklistWithReferenceCheckImpl(
      {required this.isChecked,
      required this.description,
      required this.referenceCount,
      required this.references,
      final String? $type})
      : $type = $type ?? 'withReference',
        super._();

  factory _$ChecklistWithReferenceCheckImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChecklistWithReferenceCheckImplFromJson(json);

  @override
  final bool isChecked;
  @override
  final String description;
  @override
  final int referenceCount;
  @override
  final Map<int, double> references;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChecklistCheck.withReference(isChecked: $isChecked, description: $description, referenceCount: $referenceCount, references: $references)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChecklistCheck.withReference'))
      ..add(DiagnosticsProperty('isChecked', isChecked))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('referenceCount', referenceCount))
      ..add(DiagnosticsProperty('references', references));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistWithReferenceCheckImpl &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.referenceCount, referenceCount) ||
                other.referenceCount == referenceCount) &&
            const DeepCollectionEquality()
                .equals(other.references, references));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isChecked, description,
      referenceCount, const DeepCollectionEquality().hash(references));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistWithReferenceCheckImplCopyWith<_$ChecklistWithReferenceCheckImpl>
      get copyWith => __$$ChecklistWithReferenceCheckImplCopyWithImpl<
          _$ChecklistWithReferenceCheckImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isChecked, String description) regular,
    required TResult Function(bool isChecked, String description,
            int referenceCount, Map<int, double> references)
        withReference,
    required TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)
        linearityStep1,
    required TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)
        linearityStep2,
  }) {
    return withReference(isChecked, description, referenceCount, references);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isChecked, String description)? regular,
    TResult? Function(bool isChecked, String description, int referenceCount,
            Map<int, double> references)?
        withReference,
    TResult? Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep1,
    TResult? Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep2,
  }) {
    return withReference?.call(
        isChecked, description, referenceCount, references);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isChecked, String description)? regular,
    TResult Function(bool isChecked, String description, int referenceCount,
            Map<int, double> references)?
        withReference,
    TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep1,
    TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep2,
    required TResult orElse(),
  }) {
    if (withReference != null) {
      return withReference(isChecked, description, referenceCount, references);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChecklistRegularCheck value) regular,
    required TResult Function(ChecklistWithReferenceCheck value) withReference,
    required TResult Function(ChecklistLinearityCheckStep1Check value)
        linearityStep1,
    required TResult Function(ChecklistLinearityCheckStep2Check value)
        linearityStep2,
  }) {
    return withReference(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChecklistRegularCheck value)? regular,
    TResult? Function(ChecklistWithReferenceCheck value)? withReference,
    TResult? Function(ChecklistLinearityCheckStep1Check value)? linearityStep1,
    TResult? Function(ChecklistLinearityCheckStep2Check value)? linearityStep2,
  }) {
    return withReference?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChecklistRegularCheck value)? regular,
    TResult Function(ChecklistWithReferenceCheck value)? withReference,
    TResult Function(ChecklistLinearityCheckStep1Check value)? linearityStep1,
    TResult Function(ChecklistLinearityCheckStep2Check value)? linearityStep2,
    required TResult orElse(),
  }) {
    if (withReference != null) {
      return withReference(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecklistWithReferenceCheckImplToJson(
      this,
    );
  }
}

abstract class ChecklistWithReferenceCheck extends ChecklistCheck {
  factory ChecklistWithReferenceCheck(
          {required final bool isChecked,
          required final String description,
          required final int referenceCount,
          required final Map<int, double> references}) =
      _$ChecklistWithReferenceCheckImpl;
  ChecklistWithReferenceCheck._() : super._();

  factory ChecklistWithReferenceCheck.fromJson(Map<String, dynamic> json) =
      _$ChecklistWithReferenceCheckImpl.fromJson;

  @override
  bool get isChecked;
  String get description;
  int get referenceCount;
  Map<int, double> get references;
  @override
  @JsonKey(ignore: true)
  _$$ChecklistWithReferenceCheckImplCopyWith<_$ChecklistWithReferenceCheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChecklistLinearityCheckStep1CheckImplCopyWith<$Res>
    implements $ChecklistCheckCopyWith<$Res> {
  factory _$$ChecklistLinearityCheckStep1CheckImplCopyWith(
          _$ChecklistLinearityCheckStep1CheckImpl value,
          $Res Function(_$ChecklistLinearityCheckStep1CheckImpl) then) =
      __$$ChecklistLinearityCheckStep1CheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isChecked, int referenceCount, Map<int, double> references});
}

/// @nodoc
class __$$ChecklistLinearityCheckStep1CheckImplCopyWithImpl<$Res>
    extends _$ChecklistCheckCopyWithImpl<$Res,
        _$ChecklistLinearityCheckStep1CheckImpl>
    implements _$$ChecklistLinearityCheckStep1CheckImplCopyWith<$Res> {
  __$$ChecklistLinearityCheckStep1CheckImplCopyWithImpl(
      _$ChecklistLinearityCheckStep1CheckImpl _value,
      $Res Function(_$ChecklistLinearityCheckStep1CheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChecked = null,
    Object? referenceCount = null,
    Object? references = null,
  }) {
    return _then(_$ChecklistLinearityCheckStep1CheckImpl(
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      referenceCount: null == referenceCount
          ? _value.referenceCount
          : referenceCount // ignore: cast_nullable_to_non_nullable
              as int,
      references: null == references
          ? _value.references
          : references // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecklistLinearityCheckStep1CheckImpl
    extends ChecklistLinearityCheckStep1Check with DiagnosticableTreeMixin {
  _$ChecklistLinearityCheckStep1CheckImpl(
      {required this.isChecked,
      required this.referenceCount,
      required this.references,
      final String? $type})
      : $type = $type ?? 'linearityStep1',
        super._();

  factory _$ChecklistLinearityCheckStep1CheckImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChecklistLinearityCheckStep1CheckImplFromJson(json);

  @override
  final bool isChecked;
  @override
  final int referenceCount;
  @override
  final Map<int, double> references;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChecklistCheck.linearityStep1(isChecked: $isChecked, referenceCount: $referenceCount, references: $references)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChecklistCheck.linearityStep1'))
      ..add(DiagnosticsProperty('isChecked', isChecked))
      ..add(DiagnosticsProperty('referenceCount', referenceCount))
      ..add(DiagnosticsProperty('references', references));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistLinearityCheckStep1CheckImpl &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.referenceCount, referenceCount) ||
                other.referenceCount == referenceCount) &&
            const DeepCollectionEquality()
                .equals(other.references, references));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isChecked, referenceCount,
      const DeepCollectionEquality().hash(references));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistLinearityCheckStep1CheckImplCopyWith<
          _$ChecklistLinearityCheckStep1CheckImpl>
      get copyWith => __$$ChecklistLinearityCheckStep1CheckImplCopyWithImpl<
          _$ChecklistLinearityCheckStep1CheckImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isChecked, String description) regular,
    required TResult Function(bool isChecked, String description,
            int referenceCount, Map<int, double> references)
        withReference,
    required TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)
        linearityStep1,
    required TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)
        linearityStep2,
  }) {
    return linearityStep1(isChecked, referenceCount, references);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isChecked, String description)? regular,
    TResult? Function(bool isChecked, String description, int referenceCount,
            Map<int, double> references)?
        withReference,
    TResult? Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep1,
    TResult? Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep2,
  }) {
    return linearityStep1?.call(isChecked, referenceCount, references);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isChecked, String description)? regular,
    TResult Function(bool isChecked, String description, int referenceCount,
            Map<int, double> references)?
        withReference,
    TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep1,
    TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep2,
    required TResult orElse(),
  }) {
    if (linearityStep1 != null) {
      return linearityStep1(isChecked, referenceCount, references);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChecklistRegularCheck value) regular,
    required TResult Function(ChecklistWithReferenceCheck value) withReference,
    required TResult Function(ChecklistLinearityCheckStep1Check value)
        linearityStep1,
    required TResult Function(ChecklistLinearityCheckStep2Check value)
        linearityStep2,
  }) {
    return linearityStep1(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChecklistRegularCheck value)? regular,
    TResult? Function(ChecklistWithReferenceCheck value)? withReference,
    TResult? Function(ChecklistLinearityCheckStep1Check value)? linearityStep1,
    TResult? Function(ChecklistLinearityCheckStep2Check value)? linearityStep2,
  }) {
    return linearityStep1?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChecklistRegularCheck value)? regular,
    TResult Function(ChecklistWithReferenceCheck value)? withReference,
    TResult Function(ChecklistLinearityCheckStep1Check value)? linearityStep1,
    TResult Function(ChecklistLinearityCheckStep2Check value)? linearityStep2,
    required TResult orElse(),
  }) {
    if (linearityStep1 != null) {
      return linearityStep1(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecklistLinearityCheckStep1CheckImplToJson(
      this,
    );
  }
}

abstract class ChecklistLinearityCheckStep1Check extends ChecklistCheck {
  factory ChecklistLinearityCheckStep1Check(
          {required final bool isChecked,
          required final int referenceCount,
          required final Map<int, double> references}) =
      _$ChecklistLinearityCheckStep1CheckImpl;
  ChecklistLinearityCheckStep1Check._() : super._();

  factory ChecklistLinearityCheckStep1Check.fromJson(
          Map<String, dynamic> json) =
      _$ChecklistLinearityCheckStep1CheckImpl.fromJson;

  @override
  bool get isChecked;
  int get referenceCount;
  Map<int, double> get references;
  @override
  @JsonKey(ignore: true)
  _$$ChecklistLinearityCheckStep1CheckImplCopyWith<
          _$ChecklistLinearityCheckStep1CheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChecklistLinearityCheckStep2CheckImplCopyWith<$Res>
    implements $ChecklistCheckCopyWith<$Res> {
  factory _$$ChecklistLinearityCheckStep2CheckImplCopyWith(
          _$ChecklistLinearityCheckStep2CheckImpl value,
          $Res Function(_$ChecklistLinearityCheckStep2CheckImpl) then) =
      __$$ChecklistLinearityCheckStep2CheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isChecked, int referenceCount, Map<int, double> references});
}

/// @nodoc
class __$$ChecklistLinearityCheckStep2CheckImplCopyWithImpl<$Res>
    extends _$ChecklistCheckCopyWithImpl<$Res,
        _$ChecklistLinearityCheckStep2CheckImpl>
    implements _$$ChecklistLinearityCheckStep2CheckImplCopyWith<$Res> {
  __$$ChecklistLinearityCheckStep2CheckImplCopyWithImpl(
      _$ChecklistLinearityCheckStep2CheckImpl _value,
      $Res Function(_$ChecklistLinearityCheckStep2CheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChecked = null,
    Object? referenceCount = null,
    Object? references = null,
  }) {
    return _then(_$ChecklistLinearityCheckStep2CheckImpl(
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      referenceCount: null == referenceCount
          ? _value.referenceCount
          : referenceCount // ignore: cast_nullable_to_non_nullable
              as int,
      references: null == references
          ? _value.references
          : references // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecklistLinearityCheckStep2CheckImpl
    extends ChecklistLinearityCheckStep2Check with DiagnosticableTreeMixin {
  _$ChecklistLinearityCheckStep2CheckImpl(
      {required this.isChecked,
      required this.referenceCount,
      required this.references,
      final String? $type})
      : $type = $type ?? 'linearityStep2',
        super._();

  factory _$ChecklistLinearityCheckStep2CheckImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChecklistLinearityCheckStep2CheckImplFromJson(json);

  @override
  final bool isChecked;
  @override
  final int referenceCount;
  @override
  final Map<int, double> references;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChecklistCheck.linearityStep2(isChecked: $isChecked, referenceCount: $referenceCount, references: $references)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChecklistCheck.linearityStep2'))
      ..add(DiagnosticsProperty('isChecked', isChecked))
      ..add(DiagnosticsProperty('referenceCount', referenceCount))
      ..add(DiagnosticsProperty('references', references));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecklistLinearityCheckStep2CheckImpl &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.referenceCount, referenceCount) ||
                other.referenceCount == referenceCount) &&
            const DeepCollectionEquality()
                .equals(other.references, references));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isChecked, referenceCount,
      const DeepCollectionEquality().hash(references));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistLinearityCheckStep2CheckImplCopyWith<
          _$ChecklistLinearityCheckStep2CheckImpl>
      get copyWith => __$$ChecklistLinearityCheckStep2CheckImplCopyWithImpl<
          _$ChecklistLinearityCheckStep2CheckImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isChecked, String description) regular,
    required TResult Function(bool isChecked, String description,
            int referenceCount, Map<int, double> references)
        withReference,
    required TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)
        linearityStep1,
    required TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)
        linearityStep2,
  }) {
    return linearityStep2(isChecked, referenceCount, references);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isChecked, String description)? regular,
    TResult? Function(bool isChecked, String description, int referenceCount,
            Map<int, double> references)?
        withReference,
    TResult? Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep1,
    TResult? Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep2,
  }) {
    return linearityStep2?.call(isChecked, referenceCount, references);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isChecked, String description)? regular,
    TResult Function(bool isChecked, String description, int referenceCount,
            Map<int, double> references)?
        withReference,
    TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep1,
    TResult Function(
            bool isChecked, int referenceCount, Map<int, double> references)?
        linearityStep2,
    required TResult orElse(),
  }) {
    if (linearityStep2 != null) {
      return linearityStep2(isChecked, referenceCount, references);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChecklistRegularCheck value) regular,
    required TResult Function(ChecklistWithReferenceCheck value) withReference,
    required TResult Function(ChecklistLinearityCheckStep1Check value)
        linearityStep1,
    required TResult Function(ChecklistLinearityCheckStep2Check value)
        linearityStep2,
  }) {
    return linearityStep2(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChecklistRegularCheck value)? regular,
    TResult? Function(ChecklistWithReferenceCheck value)? withReference,
    TResult? Function(ChecklistLinearityCheckStep1Check value)? linearityStep1,
    TResult? Function(ChecklistLinearityCheckStep2Check value)? linearityStep2,
  }) {
    return linearityStep2?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChecklistRegularCheck value)? regular,
    TResult Function(ChecklistWithReferenceCheck value)? withReference,
    TResult Function(ChecklistLinearityCheckStep1Check value)? linearityStep1,
    TResult Function(ChecklistLinearityCheckStep2Check value)? linearityStep2,
    required TResult orElse(),
  }) {
    if (linearityStep2 != null) {
      return linearityStep2(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecklistLinearityCheckStep2CheckImplToJson(
      this,
    );
  }
}

abstract class ChecklistLinearityCheckStep2Check extends ChecklistCheck {
  factory ChecklistLinearityCheckStep2Check(
          {required final bool isChecked,
          required final int referenceCount,
          required final Map<int, double> references}) =
      _$ChecklistLinearityCheckStep2CheckImpl;
  ChecklistLinearityCheckStep2Check._() : super._();

  factory ChecklistLinearityCheckStep2Check.fromJson(
          Map<String, dynamic> json) =
      _$ChecklistLinearityCheckStep2CheckImpl.fromJson;

  @override
  bool get isChecked;
  int get referenceCount;
  Map<int, double> get references;
  @override
  @JsonKey(ignore: true)
  _$$ChecklistLinearityCheckStep2CheckImplCopyWith<
          _$ChecklistLinearityCheckStep2CheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}
