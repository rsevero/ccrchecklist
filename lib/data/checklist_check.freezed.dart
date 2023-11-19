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

ChecklistRegularCheck _$ChecklistRegularCheckFromJson(
    Map<String, dynamic> json) {
  return _ChecklistRegularCheck.fromJson(json);
}

/// @nodoc
mixin _$ChecklistRegularCheck {
  String get description => throw _privateConstructorUsedError;
  bool get checked => throw _privateConstructorUsedError;
  set checked(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChecklistRegularCheckCopyWith<ChecklistRegularCheck> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistRegularCheckCopyWith<$Res> {
  factory $ChecklistRegularCheckCopyWith(ChecklistRegularCheck value,
          $Res Function(ChecklistRegularCheck) then) =
      _$ChecklistRegularCheckCopyWithImpl<$Res, ChecklistRegularCheck>;
  @useResult
  $Res call({String description, bool checked});
}

/// @nodoc
class _$ChecklistRegularCheckCopyWithImpl<$Res,
        $Val extends ChecklistRegularCheck>
    implements $ChecklistRegularCheckCopyWith<$Res> {
  _$ChecklistRegularCheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? checked = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecklistRegularCheckImplCopyWith<$Res>
    implements $ChecklistRegularCheckCopyWith<$Res> {
  factory _$$ChecklistRegularCheckImplCopyWith(
          _$ChecklistRegularCheckImpl value,
          $Res Function(_$ChecklistRegularCheckImpl) then) =
      __$$ChecklistRegularCheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, bool checked});
}

/// @nodoc
class __$$ChecklistRegularCheckImplCopyWithImpl<$Res>
    extends _$ChecklistRegularCheckCopyWithImpl<$Res,
        _$ChecklistRegularCheckImpl>
    implements _$$ChecklistRegularCheckImplCopyWith<$Res> {
  __$$ChecklistRegularCheckImplCopyWithImpl(_$ChecklistRegularCheckImpl _value,
      $Res Function(_$ChecklistRegularCheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? checked = null,
  }) {
    return _then(_$ChecklistRegularCheckImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecklistRegularCheckImpl
    with DiagnosticableTreeMixin
    implements _ChecklistRegularCheck {
  _$ChecklistRegularCheckImpl(
      {required this.description, required this.checked});

  factory _$ChecklistRegularCheckImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecklistRegularCheckImplFromJson(json);

  @override
  final String description;
  @override
  bool checked;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChecklistRegularCheck(description: $description, checked: $checked)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChecklistRegularCheck'))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('checked', checked));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistRegularCheckImplCopyWith<_$ChecklistRegularCheckImpl>
      get copyWith => __$$ChecklistRegularCheckImplCopyWithImpl<
          _$ChecklistRegularCheckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecklistRegularCheckImplToJson(
      this,
    );
  }
}

abstract class _ChecklistRegularCheck implements ChecklistRegularCheck {
  factory _ChecklistRegularCheck(
      {required final String description,
      required bool checked}) = _$ChecklistRegularCheckImpl;

  factory _ChecklistRegularCheck.fromJson(Map<String, dynamic> json) =
      _$ChecklistRegularCheckImpl.fromJson;

  @override
  String get description;
  @override
  bool get checked;
  set checked(bool value);
  @override
  @JsonKey(ignore: true)
  _$$ChecklistRegularCheckImplCopyWith<_$ChecklistRegularCheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChecklistWithReferenceCheck _$ChecklistWithReferenceCheckFromJson(
    Map<String, dynamic> json) {
  return _ChecklistWithReferenceCheck.fromJson(json);
}

/// @nodoc
mixin _$ChecklistWithReferenceCheck {
  String get description => throw _privateConstructorUsedError;
  bool get checked => throw _privateConstructorUsedError;
  set checked(bool value) => throw _privateConstructorUsedError;
  String get referenceDescription => throw _privateConstructorUsedError;
  double get reference1 => throw _privateConstructorUsedError;
  set reference1(double value) => throw _privateConstructorUsedError;
  double get reference2 => throw _privateConstructorUsedError;
  set reference2(double value) => throw _privateConstructorUsedError;
  double get reference3 => throw _privateConstructorUsedError;
  set reference3(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChecklistWithReferenceCheckCopyWith<ChecklistWithReferenceCheck>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistWithReferenceCheckCopyWith<$Res> {
  factory $ChecklistWithReferenceCheckCopyWith(
          ChecklistWithReferenceCheck value,
          $Res Function(ChecklistWithReferenceCheck) then) =
      _$ChecklistWithReferenceCheckCopyWithImpl<$Res,
          ChecklistWithReferenceCheck>;
  @useResult
  $Res call(
      {String description,
      bool checked,
      String referenceDescription,
      double reference1,
      double reference2,
      double reference3});
}

/// @nodoc
class _$ChecklistWithReferenceCheckCopyWithImpl<$Res,
        $Val extends ChecklistWithReferenceCheck>
    implements $ChecklistWithReferenceCheckCopyWith<$Res> {
  _$ChecklistWithReferenceCheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? checked = null,
    Object? referenceDescription = null,
    Object? reference1 = null,
    Object? reference2 = null,
    Object? reference3 = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      referenceDescription: null == referenceDescription
          ? _value.referenceDescription
          : referenceDescription // ignore: cast_nullable_to_non_nullable
              as String,
      reference1: null == reference1
          ? _value.reference1
          : reference1 // ignore: cast_nullable_to_non_nullable
              as double,
      reference2: null == reference2
          ? _value.reference2
          : reference2 // ignore: cast_nullable_to_non_nullable
              as double,
      reference3: null == reference3
          ? _value.reference3
          : reference3 // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecklistWithReferenceCheckImplCopyWith<$Res>
    implements $ChecklistWithReferenceCheckCopyWith<$Res> {
  factory _$$ChecklistWithReferenceCheckImplCopyWith(
          _$ChecklistWithReferenceCheckImpl value,
          $Res Function(_$ChecklistWithReferenceCheckImpl) then) =
      __$$ChecklistWithReferenceCheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      bool checked,
      String referenceDescription,
      double reference1,
      double reference2,
      double reference3});
}

/// @nodoc
class __$$ChecklistWithReferenceCheckImplCopyWithImpl<$Res>
    extends _$ChecklistWithReferenceCheckCopyWithImpl<$Res,
        _$ChecklistWithReferenceCheckImpl>
    implements _$$ChecklistWithReferenceCheckImplCopyWith<$Res> {
  __$$ChecklistWithReferenceCheckImplCopyWithImpl(
      _$ChecklistWithReferenceCheckImpl _value,
      $Res Function(_$ChecklistWithReferenceCheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? checked = null,
    Object? referenceDescription = null,
    Object? reference1 = null,
    Object? reference2 = null,
    Object? reference3 = null,
  }) {
    return _then(_$ChecklistWithReferenceCheckImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      referenceDescription: null == referenceDescription
          ? _value.referenceDescription
          : referenceDescription // ignore: cast_nullable_to_non_nullable
              as String,
      reference1: null == reference1
          ? _value.reference1
          : reference1 // ignore: cast_nullable_to_non_nullable
              as double,
      reference2: null == reference2
          ? _value.reference2
          : reference2 // ignore: cast_nullable_to_non_nullable
              as double,
      reference3: null == reference3
          ? _value.reference3
          : reference3 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecklistWithReferenceCheckImpl
    with DiagnosticableTreeMixin
    implements _ChecklistWithReferenceCheck {
  _$ChecklistWithReferenceCheckImpl(
      {required this.description,
      required this.checked,
      required this.referenceDescription,
      required this.reference1,
      required this.reference2,
      required this.reference3});

  factory _$ChecklistWithReferenceCheckImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChecklistWithReferenceCheckImplFromJson(json);

  @override
  final String description;
  @override
  bool checked;
  @override
  final String referenceDescription;
  @override
  double reference1;
  @override
  double reference2;
  @override
  double reference3;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChecklistWithReferenceCheck(description: $description, checked: $checked, referenceDescription: $referenceDescription, reference1: $reference1, reference2: $reference2, reference3: $reference3)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChecklistWithReferenceCheck'))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('checked', checked))
      ..add(DiagnosticsProperty('referenceDescription', referenceDescription))
      ..add(DiagnosticsProperty('reference1', reference1))
      ..add(DiagnosticsProperty('reference2', reference2))
      ..add(DiagnosticsProperty('reference3', reference3));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistWithReferenceCheckImplCopyWith<_$ChecklistWithReferenceCheckImpl>
      get copyWith => __$$ChecklistWithReferenceCheckImplCopyWithImpl<
          _$ChecklistWithReferenceCheckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecklistWithReferenceCheckImplToJson(
      this,
    );
  }
}

abstract class _ChecklistWithReferenceCheck
    implements ChecklistWithReferenceCheck {
  factory _ChecklistWithReferenceCheck(
      {required final String description,
      required bool checked,
      required final String referenceDescription,
      required double reference1,
      required double reference2,
      required double reference3}) = _$ChecklistWithReferenceCheckImpl;

  factory _ChecklistWithReferenceCheck.fromJson(Map<String, dynamic> json) =
      _$ChecklistWithReferenceCheckImpl.fromJson;

  @override
  String get description;
  @override
  bool get checked;
  set checked(bool value);
  @override
  String get referenceDescription;
  @override
  double get reference1;
  set reference1(double value);
  @override
  double get reference2;
  set reference2(double value);
  @override
  double get reference3;
  set reference3(double value);
  @override
  @JsonKey(ignore: true)
  _$$ChecklistWithReferenceCheckImplCopyWith<_$ChecklistWithReferenceCheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChecklistLinearityCheckStep1Check _$ChecklistLinearityCheckStep1CheckFromJson(
    Map<String, dynamic> json) {
  return _ChecklistLinearityCheckStep1Check.fromJson(json);
}

/// @nodoc
mixin _$ChecklistLinearityCheckStep1Check {
  double get reference1 => throw _privateConstructorUsedError;
  set reference1(double value) => throw _privateConstructorUsedError;
  double get reference2 => throw _privateConstructorUsedError;
  set reference2(double value) => throw _privateConstructorUsedError;
  double get reference3 => throw _privateConstructorUsedError;
  set reference3(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChecklistLinearityCheckStep1CheckCopyWith<ChecklistLinearityCheckStep1Check>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistLinearityCheckStep1CheckCopyWith<$Res> {
  factory $ChecklistLinearityCheckStep1CheckCopyWith(
          ChecklistLinearityCheckStep1Check value,
          $Res Function(ChecklistLinearityCheckStep1Check) then) =
      _$ChecklistLinearityCheckStep1CheckCopyWithImpl<$Res,
          ChecklistLinearityCheckStep1Check>;
  @useResult
  $Res call({double reference1, double reference2, double reference3});
}

/// @nodoc
class _$ChecklistLinearityCheckStep1CheckCopyWithImpl<$Res,
        $Val extends ChecklistLinearityCheckStep1Check>
    implements $ChecklistLinearityCheckStep1CheckCopyWith<$Res> {
  _$ChecklistLinearityCheckStep1CheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference1 = null,
    Object? reference2 = null,
    Object? reference3 = null,
  }) {
    return _then(_value.copyWith(
      reference1: null == reference1
          ? _value.reference1
          : reference1 // ignore: cast_nullable_to_non_nullable
              as double,
      reference2: null == reference2
          ? _value.reference2
          : reference2 // ignore: cast_nullable_to_non_nullable
              as double,
      reference3: null == reference3
          ? _value.reference3
          : reference3 // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecklistLinearityCheckStep1CheckImplCopyWith<$Res>
    implements $ChecklistLinearityCheckStep1CheckCopyWith<$Res> {
  factory _$$ChecklistLinearityCheckStep1CheckImplCopyWith(
          _$ChecklistLinearityCheckStep1CheckImpl value,
          $Res Function(_$ChecklistLinearityCheckStep1CheckImpl) then) =
      __$$ChecklistLinearityCheckStep1CheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double reference1, double reference2, double reference3});
}

/// @nodoc
class __$$ChecklistLinearityCheckStep1CheckImplCopyWithImpl<$Res>
    extends _$ChecklistLinearityCheckStep1CheckCopyWithImpl<$Res,
        _$ChecklistLinearityCheckStep1CheckImpl>
    implements _$$ChecklistLinearityCheckStep1CheckImplCopyWith<$Res> {
  __$$ChecklistLinearityCheckStep1CheckImplCopyWithImpl(
      _$ChecklistLinearityCheckStep1CheckImpl _value,
      $Res Function(_$ChecklistLinearityCheckStep1CheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference1 = null,
    Object? reference2 = null,
    Object? reference3 = null,
  }) {
    return _then(_$ChecklistLinearityCheckStep1CheckImpl(
      reference1: null == reference1
          ? _value.reference1
          : reference1 // ignore: cast_nullable_to_non_nullable
              as double,
      reference2: null == reference2
          ? _value.reference2
          : reference2 // ignore: cast_nullable_to_non_nullable
              as double,
      reference3: null == reference3
          ? _value.reference3
          : reference3 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecklistLinearityCheckStep1CheckImpl
    with DiagnosticableTreeMixin
    implements _ChecklistLinearityCheckStep1Check {
  _$ChecklistLinearityCheckStep1CheckImpl(
      {required this.reference1,
      required this.reference2,
      required this.reference3});

  factory _$ChecklistLinearityCheckStep1CheckImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChecklistLinearityCheckStep1CheckImplFromJson(json);

  @override
  double reference1;
  @override
  double reference2;
  @override
  double reference3;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChecklistLinearityCheckStep1Check(reference1: $reference1, reference2: $reference2, reference3: $reference3)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChecklistLinearityCheckStep1Check'))
      ..add(DiagnosticsProperty('reference1', reference1))
      ..add(DiagnosticsProperty('reference2', reference2))
      ..add(DiagnosticsProperty('reference3', reference3));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistLinearityCheckStep1CheckImplCopyWith<
          _$ChecklistLinearityCheckStep1CheckImpl>
      get copyWith => __$$ChecklistLinearityCheckStep1CheckImplCopyWithImpl<
          _$ChecklistLinearityCheckStep1CheckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecklistLinearityCheckStep1CheckImplToJson(
      this,
    );
  }
}

abstract class _ChecklistLinearityCheckStep1Check
    implements ChecklistLinearityCheckStep1Check {
  factory _ChecklistLinearityCheckStep1Check(
      {required double reference1,
      required double reference2,
      required double reference3}) = _$ChecklistLinearityCheckStep1CheckImpl;

  factory _ChecklistLinearityCheckStep1Check.fromJson(
          Map<String, dynamic> json) =
      _$ChecklistLinearityCheckStep1CheckImpl.fromJson;

  @override
  double get reference1;
  set reference1(double value);
  @override
  double get reference2;
  set reference2(double value);
  @override
  double get reference3;
  set reference3(double value);
  @override
  @JsonKey(ignore: true)
  _$$ChecklistLinearityCheckStep1CheckImplCopyWith<
          _$ChecklistLinearityCheckStep1CheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChecklistLinearityCheckStep2Check _$ChecklistLinearityCheckStep2CheckFromJson(
    Map<String, dynamic> json) {
  return _ChecklistLinearityCheckStep2Check.fromJson(json);
}

/// @nodoc
mixin _$ChecklistLinearityCheckStep2Check {
  double get reference1 => throw _privateConstructorUsedError;
  set reference1(double value) => throw _privateConstructorUsedError;
  double get reference2 => throw _privateConstructorUsedError;
  set reference2(double value) => throw _privateConstructorUsedError;
  double get reference3 => throw _privateConstructorUsedError;
  set reference3(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChecklistLinearityCheckStep2CheckCopyWith<ChecklistLinearityCheckStep2Check>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistLinearityCheckStep2CheckCopyWith<$Res> {
  factory $ChecklistLinearityCheckStep2CheckCopyWith(
          ChecklistLinearityCheckStep2Check value,
          $Res Function(ChecklistLinearityCheckStep2Check) then) =
      _$ChecklistLinearityCheckStep2CheckCopyWithImpl<$Res,
          ChecklistLinearityCheckStep2Check>;
  @useResult
  $Res call({double reference1, double reference2, double reference3});
}

/// @nodoc
class _$ChecklistLinearityCheckStep2CheckCopyWithImpl<$Res,
        $Val extends ChecklistLinearityCheckStep2Check>
    implements $ChecklistLinearityCheckStep2CheckCopyWith<$Res> {
  _$ChecklistLinearityCheckStep2CheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference1 = null,
    Object? reference2 = null,
    Object? reference3 = null,
  }) {
    return _then(_value.copyWith(
      reference1: null == reference1
          ? _value.reference1
          : reference1 // ignore: cast_nullable_to_non_nullable
              as double,
      reference2: null == reference2
          ? _value.reference2
          : reference2 // ignore: cast_nullable_to_non_nullable
              as double,
      reference3: null == reference3
          ? _value.reference3
          : reference3 // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecklistLinearityCheckStep2CheckImplCopyWith<$Res>
    implements $ChecklistLinearityCheckStep2CheckCopyWith<$Res> {
  factory _$$ChecklistLinearityCheckStep2CheckImplCopyWith(
          _$ChecklistLinearityCheckStep2CheckImpl value,
          $Res Function(_$ChecklistLinearityCheckStep2CheckImpl) then) =
      __$$ChecklistLinearityCheckStep2CheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double reference1, double reference2, double reference3});
}

/// @nodoc
class __$$ChecklistLinearityCheckStep2CheckImplCopyWithImpl<$Res>
    extends _$ChecklistLinearityCheckStep2CheckCopyWithImpl<$Res,
        _$ChecklistLinearityCheckStep2CheckImpl>
    implements _$$ChecklistLinearityCheckStep2CheckImplCopyWith<$Res> {
  __$$ChecklistLinearityCheckStep2CheckImplCopyWithImpl(
      _$ChecklistLinearityCheckStep2CheckImpl _value,
      $Res Function(_$ChecklistLinearityCheckStep2CheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference1 = null,
    Object? reference2 = null,
    Object? reference3 = null,
  }) {
    return _then(_$ChecklistLinearityCheckStep2CheckImpl(
      reference1: null == reference1
          ? _value.reference1
          : reference1 // ignore: cast_nullable_to_non_nullable
              as double,
      reference2: null == reference2
          ? _value.reference2
          : reference2 // ignore: cast_nullable_to_non_nullable
              as double,
      reference3: null == reference3
          ? _value.reference3
          : reference3 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecklistLinearityCheckStep2CheckImpl
    with DiagnosticableTreeMixin
    implements _ChecklistLinearityCheckStep2Check {
  _$ChecklistLinearityCheckStep2CheckImpl(
      {required this.reference1,
      required this.reference2,
      required this.reference3});

  factory _$ChecklistLinearityCheckStep2CheckImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChecklistLinearityCheckStep2CheckImplFromJson(json);

  @override
  double reference1;
  @override
  double reference2;
  @override
  double reference3;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChecklistLinearityCheckStep2Check(reference1: $reference1, reference2: $reference2, reference3: $reference3)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChecklistLinearityCheckStep2Check'))
      ..add(DiagnosticsProperty('reference1', reference1))
      ..add(DiagnosticsProperty('reference2', reference2))
      ..add(DiagnosticsProperty('reference3', reference3));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecklistLinearityCheckStep2CheckImplCopyWith<
          _$ChecklistLinearityCheckStep2CheckImpl>
      get copyWith => __$$ChecklistLinearityCheckStep2CheckImplCopyWithImpl<
          _$ChecklistLinearityCheckStep2CheckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecklistLinearityCheckStep2CheckImplToJson(
      this,
    );
  }
}

abstract class _ChecklistLinearityCheckStep2Check
    implements ChecklistLinearityCheckStep2Check {
  factory _ChecklistLinearityCheckStep2Check(
      {required double reference1,
      required double reference2,
      required double reference3}) = _$ChecklistLinearityCheckStep2CheckImpl;

  factory _ChecklistLinearityCheckStep2Check.fromJson(
          Map<String, dynamic> json) =
      _$ChecklistLinearityCheckStep2CheckImpl.fromJson;

  @override
  double get reference1;
  set reference1(double value);
  @override
  double get reference2;
  set reference2(double value);
  @override
  double get reference3;
  set reference3(double value);
  @override
  @JsonKey(ignore: true)
  _$$ChecklistLinearityCheckStep2CheckImplCopyWith<
          _$ChecklistLinearityCheckStep2CheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}
