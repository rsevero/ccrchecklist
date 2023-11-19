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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TemplateRegularCheck _$TemplateRegularCheckFromJson(Map<String, dynamic> json) {
  return _RegularCheck.fromJson(json);
}

/// @nodoc
mixin _$TemplateRegularCheck {
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;
  bool get checked => throw _privateConstructorUsedError;
  set checked(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateRegularCheckCopyWith<TemplateRegularCheck> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateRegularCheckCopyWith<$Res> {
  factory $TemplateRegularCheckCopyWith(TemplateRegularCheck value,
          $Res Function(TemplateRegularCheck) then) =
      _$TemplateRegularCheckCopyWithImpl<$Res, TemplateRegularCheck>;
  @useResult
  $Res call({String description, bool checked});
}

/// @nodoc
class _$TemplateRegularCheckCopyWithImpl<$Res,
        $Val extends TemplateRegularCheck>
    implements $TemplateRegularCheckCopyWith<$Res> {
  _$TemplateRegularCheckCopyWithImpl(this._value, this._then);

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
abstract class _$$RegularCheckImplCopyWith<$Res>
    implements $TemplateRegularCheckCopyWith<$Res> {
  factory _$$RegularCheckImplCopyWith(
          _$RegularCheckImpl value, $Res Function(_$RegularCheckImpl) then) =
      __$$RegularCheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, bool checked});
}

/// @nodoc
class __$$RegularCheckImplCopyWithImpl<$Res>
    extends _$TemplateRegularCheckCopyWithImpl<$Res, _$RegularCheckImpl>
    implements _$$RegularCheckImplCopyWith<$Res> {
  __$$RegularCheckImplCopyWithImpl(
      _$RegularCheckImpl _value, $Res Function(_$RegularCheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? checked = null,
  }) {
    return _then(_$RegularCheckImpl(
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
class _$RegularCheckImpl with DiagnosticableTreeMixin implements _RegularCheck {
  _$RegularCheckImpl({required this.description, required this.checked});

  factory _$RegularCheckImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegularCheckImplFromJson(json);

  @override
  String description;
  @override
  bool checked;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemplateRegularCheck(description: $description, checked: $checked)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TemplateRegularCheck'))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('checked', checked));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegularCheckImplCopyWith<_$RegularCheckImpl> get copyWith =>
      __$$RegularCheckImplCopyWithImpl<_$RegularCheckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegularCheckImplToJson(
      this,
    );
  }
}

abstract class _RegularCheck implements TemplateRegularCheck {
  factory _RegularCheck({required String description, required bool checked}) =
      _$RegularCheckImpl;

  factory _RegularCheck.fromJson(Map<String, dynamic> json) =
      _$RegularCheckImpl.fromJson;

  @override
  String get description;
  set description(String value);
  @override
  bool get checked;
  set checked(bool value);
  @override
  @JsonKey(ignore: true)
  _$$RegularCheckImplCopyWith<_$RegularCheckImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TemplateWithReferenceCheck _$TemplateWithReferenceCheckFromJson(
    Map<String, dynamic> json) {
  return _TemplateWithReferenceCheck.fromJson(json);
}

/// @nodoc
mixin _$TemplateWithReferenceCheck {
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;
  bool get checked => throw _privateConstructorUsedError;
  set checked(bool value) => throw _privateConstructorUsedError;
  String get referenceDescription => throw _privateConstructorUsedError;
  set referenceDescription(String value) => throw _privateConstructorUsedError;
  double get reference1 => throw _privateConstructorUsedError;
  set reference1(double value) => throw _privateConstructorUsedError;
  double get reference2 => throw _privateConstructorUsedError;
  set reference2(double value) => throw _privateConstructorUsedError;
  double get reference3 => throw _privateConstructorUsedError;
  set reference3(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateWithReferenceCheckCopyWith<TemplateWithReferenceCheck>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateWithReferenceCheckCopyWith<$Res> {
  factory $TemplateWithReferenceCheckCopyWith(TemplateWithReferenceCheck value,
          $Res Function(TemplateWithReferenceCheck) then) =
      _$TemplateWithReferenceCheckCopyWithImpl<$Res,
          TemplateWithReferenceCheck>;
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
class _$TemplateWithReferenceCheckCopyWithImpl<$Res,
        $Val extends TemplateWithReferenceCheck>
    implements $TemplateWithReferenceCheckCopyWith<$Res> {
  _$TemplateWithReferenceCheckCopyWithImpl(this._value, this._then);

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
abstract class _$$TemplateWithReferenceCheckImplCopyWith<$Res>
    implements $TemplateWithReferenceCheckCopyWith<$Res> {
  factory _$$TemplateWithReferenceCheckImplCopyWith(
          _$TemplateWithReferenceCheckImpl value,
          $Res Function(_$TemplateWithReferenceCheckImpl) then) =
      __$$TemplateWithReferenceCheckImplCopyWithImpl<$Res>;
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
class __$$TemplateWithReferenceCheckImplCopyWithImpl<$Res>
    extends _$TemplateWithReferenceCheckCopyWithImpl<$Res,
        _$TemplateWithReferenceCheckImpl>
    implements _$$TemplateWithReferenceCheckImplCopyWith<$Res> {
  __$$TemplateWithReferenceCheckImplCopyWithImpl(
      _$TemplateWithReferenceCheckImpl _value,
      $Res Function(_$TemplateWithReferenceCheckImpl) _then)
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
    return _then(_$TemplateWithReferenceCheckImpl(
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
class _$TemplateWithReferenceCheckImpl
    with DiagnosticableTreeMixin
    implements _TemplateWithReferenceCheck {
  _$TemplateWithReferenceCheckImpl(
      {required this.description,
      required this.checked,
      required this.referenceDescription,
      required this.reference1,
      required this.reference2,
      required this.reference3});

  factory _$TemplateWithReferenceCheckImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TemplateWithReferenceCheckImplFromJson(json);

  @override
  String description;
  @override
  bool checked;
  @override
  String referenceDescription;
  @override
  double reference1;
  @override
  double reference2;
  @override
  double reference3;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemplateWithReferenceCheck(description: $description, checked: $checked, referenceDescription: $referenceDescription, reference1: $reference1, reference2: $reference2, reference3: $reference3)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TemplateWithReferenceCheck'))
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
  _$$TemplateWithReferenceCheckImplCopyWith<_$TemplateWithReferenceCheckImpl>
      get copyWith => __$$TemplateWithReferenceCheckImplCopyWithImpl<
          _$TemplateWithReferenceCheckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateWithReferenceCheckImplToJson(
      this,
    );
  }
}

abstract class _TemplateWithReferenceCheck
    implements TemplateWithReferenceCheck {
  factory _TemplateWithReferenceCheck(
      {required String description,
      required bool checked,
      required String referenceDescription,
      required double reference1,
      required double reference2,
      required double reference3}) = _$TemplateWithReferenceCheckImpl;

  factory _TemplateWithReferenceCheck.fromJson(Map<String, dynamic> json) =
      _$TemplateWithReferenceCheckImpl.fromJson;

  @override
  String get description;
  set description(String value);
  @override
  bool get checked;
  set checked(bool value);
  @override
  String get referenceDescription;
  set referenceDescription(String value);
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
  _$$TemplateWithReferenceCheckImplCopyWith<_$TemplateWithReferenceCheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TemplateLinearityCheckStep1Check _$TemplateLinearityCheckStep1CheckFromJson(
    Map<String, dynamic> json) {
  return _TemplateLinearityCheckStep1Check.fromJson(json);
}

/// @nodoc
mixin _$TemplateLinearityCheckStep1Check {
  double get reference1 => throw _privateConstructorUsedError;
  set reference1(double value) => throw _privateConstructorUsedError;
  double get reference2 => throw _privateConstructorUsedError;
  set reference2(double value) => throw _privateConstructorUsedError;
  double get reference3 => throw _privateConstructorUsedError;
  set reference3(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateLinearityCheckStep1CheckCopyWith<TemplateLinearityCheckStep1Check>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateLinearityCheckStep1CheckCopyWith<$Res> {
  factory $TemplateLinearityCheckStep1CheckCopyWith(
          TemplateLinearityCheckStep1Check value,
          $Res Function(TemplateLinearityCheckStep1Check) then) =
      _$TemplateLinearityCheckStep1CheckCopyWithImpl<$Res,
          TemplateLinearityCheckStep1Check>;
  @useResult
  $Res call({double reference1, double reference2, double reference3});
}

/// @nodoc
class _$TemplateLinearityCheckStep1CheckCopyWithImpl<$Res,
        $Val extends TemplateLinearityCheckStep1Check>
    implements $TemplateLinearityCheckStep1CheckCopyWith<$Res> {
  _$TemplateLinearityCheckStep1CheckCopyWithImpl(this._value, this._then);

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
abstract class _$$TemplateLinearityCheckStep1CheckImplCopyWith<$Res>
    implements $TemplateLinearityCheckStep1CheckCopyWith<$Res> {
  factory _$$TemplateLinearityCheckStep1CheckImplCopyWith(
          _$TemplateLinearityCheckStep1CheckImpl value,
          $Res Function(_$TemplateLinearityCheckStep1CheckImpl) then) =
      __$$TemplateLinearityCheckStep1CheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double reference1, double reference2, double reference3});
}

/// @nodoc
class __$$TemplateLinearityCheckStep1CheckImplCopyWithImpl<$Res>
    extends _$TemplateLinearityCheckStep1CheckCopyWithImpl<$Res,
        _$TemplateLinearityCheckStep1CheckImpl>
    implements _$$TemplateLinearityCheckStep1CheckImplCopyWith<$Res> {
  __$$TemplateLinearityCheckStep1CheckImplCopyWithImpl(
      _$TemplateLinearityCheckStep1CheckImpl _value,
      $Res Function(_$TemplateLinearityCheckStep1CheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference1 = null,
    Object? reference2 = null,
    Object? reference3 = null,
  }) {
    return _then(_$TemplateLinearityCheckStep1CheckImpl(
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
class _$TemplateLinearityCheckStep1CheckImpl
    with DiagnosticableTreeMixin
    implements _TemplateLinearityCheckStep1Check {
  _$TemplateLinearityCheckStep1CheckImpl(
      {required this.reference1,
      required this.reference2,
      required this.reference3});

  factory _$TemplateLinearityCheckStep1CheckImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TemplateLinearityCheckStep1CheckImplFromJson(json);

  @override
  double reference1;
  @override
  double reference2;
  @override
  double reference3;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemplateLinearityCheckStep1Check(reference1: $reference1, reference2: $reference2, reference3: $reference3)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TemplateLinearityCheckStep1Check'))
      ..add(DiagnosticsProperty('reference1', reference1))
      ..add(DiagnosticsProperty('reference2', reference2))
      ..add(DiagnosticsProperty('reference3', reference3));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateLinearityCheckStep1CheckImplCopyWith<
          _$TemplateLinearityCheckStep1CheckImpl>
      get copyWith => __$$TemplateLinearityCheckStep1CheckImplCopyWithImpl<
          _$TemplateLinearityCheckStep1CheckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateLinearityCheckStep1CheckImplToJson(
      this,
    );
  }
}

abstract class _TemplateLinearityCheckStep1Check
    implements TemplateLinearityCheckStep1Check {
  factory _TemplateLinearityCheckStep1Check(
      {required double reference1,
      required double reference2,
      required double reference3}) = _$TemplateLinearityCheckStep1CheckImpl;

  factory _TemplateLinearityCheckStep1Check.fromJson(
          Map<String, dynamic> json) =
      _$TemplateLinearityCheckStep1CheckImpl.fromJson;

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
  _$$TemplateLinearityCheckStep1CheckImplCopyWith<
          _$TemplateLinearityCheckStep1CheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TemplateLinearityCheckStep2Check _$TemplateLinearityCheckStep2CheckFromJson(
    Map<String, dynamic> json) {
  return _TemplateLinearityCheckStep2Check.fromJson(json);
}

/// @nodoc
mixin _$TemplateLinearityCheckStep2Check {
  double get reference1 => throw _privateConstructorUsedError;
  set reference1(double value) => throw _privateConstructorUsedError;
  double get reference2 => throw _privateConstructorUsedError;
  set reference2(double value) => throw _privateConstructorUsedError;
  double get reference3 => throw _privateConstructorUsedError;
  set reference3(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateLinearityCheckStep2CheckCopyWith<TemplateLinearityCheckStep2Check>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateLinearityCheckStep2CheckCopyWith<$Res> {
  factory $TemplateLinearityCheckStep2CheckCopyWith(
          TemplateLinearityCheckStep2Check value,
          $Res Function(TemplateLinearityCheckStep2Check) then) =
      _$TemplateLinearityCheckStep2CheckCopyWithImpl<$Res,
          TemplateLinearityCheckStep2Check>;
  @useResult
  $Res call({double reference1, double reference2, double reference3});
}

/// @nodoc
class _$TemplateLinearityCheckStep2CheckCopyWithImpl<$Res,
        $Val extends TemplateLinearityCheckStep2Check>
    implements $TemplateLinearityCheckStep2CheckCopyWith<$Res> {
  _$TemplateLinearityCheckStep2CheckCopyWithImpl(this._value, this._then);

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
abstract class _$$TemplateLinearityCheckStep2CheckImplCopyWith<$Res>
    implements $TemplateLinearityCheckStep2CheckCopyWith<$Res> {
  factory _$$TemplateLinearityCheckStep2CheckImplCopyWith(
          _$TemplateLinearityCheckStep2CheckImpl value,
          $Res Function(_$TemplateLinearityCheckStep2CheckImpl) then) =
      __$$TemplateLinearityCheckStep2CheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double reference1, double reference2, double reference3});
}

/// @nodoc
class __$$TemplateLinearityCheckStep2CheckImplCopyWithImpl<$Res>
    extends _$TemplateLinearityCheckStep2CheckCopyWithImpl<$Res,
        _$TemplateLinearityCheckStep2CheckImpl>
    implements _$$TemplateLinearityCheckStep2CheckImplCopyWith<$Res> {
  __$$TemplateLinearityCheckStep2CheckImplCopyWithImpl(
      _$TemplateLinearityCheckStep2CheckImpl _value,
      $Res Function(_$TemplateLinearityCheckStep2CheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference1 = null,
    Object? reference2 = null,
    Object? reference3 = null,
  }) {
    return _then(_$TemplateLinearityCheckStep2CheckImpl(
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
class _$TemplateLinearityCheckStep2CheckImpl
    with DiagnosticableTreeMixin
    implements _TemplateLinearityCheckStep2Check {
  _$TemplateLinearityCheckStep2CheckImpl(
      {required this.reference1,
      required this.reference2,
      required this.reference3});

  factory _$TemplateLinearityCheckStep2CheckImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TemplateLinearityCheckStep2CheckImplFromJson(json);

  @override
  double reference1;
  @override
  double reference2;
  @override
  double reference3;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TemplateLinearityCheckStep2Check(reference1: $reference1, reference2: $reference2, reference3: $reference3)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TemplateLinearityCheckStep2Check'))
      ..add(DiagnosticsProperty('reference1', reference1))
      ..add(DiagnosticsProperty('reference2', reference2))
      ..add(DiagnosticsProperty('reference3', reference3));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateLinearityCheckStep2CheckImplCopyWith<
          _$TemplateLinearityCheckStep2CheckImpl>
      get copyWith => __$$TemplateLinearityCheckStep2CheckImplCopyWithImpl<
          _$TemplateLinearityCheckStep2CheckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateLinearityCheckStep2CheckImplToJson(
      this,
    );
  }
}

abstract class _TemplateLinearityCheckStep2Check
    implements TemplateLinearityCheckStep2Check {
  factory _TemplateLinearityCheckStep2Check(
      {required double reference1,
      required double reference2,
      required double reference3}) = _$TemplateLinearityCheckStep2CheckImpl;

  factory _TemplateLinearityCheckStep2Check.fromJson(
          Map<String, dynamic> json) =
      _$TemplateLinearityCheckStep2CheckImpl.fromJson;

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
  _$$TemplateLinearityCheckStep2CheckImplCopyWith<
          _$TemplateLinearityCheckStep2CheckImpl>
      get copyWith => throw _privateConstructorUsedError;
}
