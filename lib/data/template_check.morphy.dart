// ignore_for_file: UNNECESSARY_CAST
// ignore_for_file: unused_element

part of 'template_check.dart';

// **************************************************************************
// Generator: MorphyGenerator<Morphy>
// **************************************************************************

///

@JsonSerializable(
  explicitToJson: true,
)
class TemplateCheck extends $TemplateCheck {
  final String type;

  ///
  TemplateCheck({
    required this.type,
  });
  TemplateCheck._({
    required this.type,
  });
  String toString() => "(TemplateCheck-type:${type.toString()})";
  int get hashCode => hashObjects([type.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateCheck &&
          runtimeType == other.runtimeType &&
          type == other.type;
  TemplateCheck copyWith_TemplateCheck({
    Opt<String>? type,
  }) {
    return TemplateCheck._(
      type: type == null ? this.type as String : type.value as String,
    );
  }

//$TemplateCheck|[]|[type:String:null]
//
  factory TemplateCheck.fromJson(Map<String, dynamic> json) {
    if (json['_className_'] == "TemplateCheck") {
      return _$TemplateCheckFromJson(
        json,
      );
    } else {
      throw UnsupportedError(
          "The _className_ '${json['_className_']}' is not supported by the TemplateCheck.fromJson constructor.");
    }
  }

  // ignore: unused_field
  Map<Type, Object? Function(Never)> _fns = {};

  Map<String, dynamic> toJson_2([Map<Type, Object? Function(Never)>? fns]) {
    this._fns = fns ?? {};
    return toJson();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = _$TemplateCheckToJson(
      this,
    );
    // Adding custom key-value pair
    data['_className_'] = 'TemplateCheck';

    return data;
  }
}

extension $TemplateCheck_changeTo_E on $TemplateCheck {}

enum TemplateCheck$ { type }

///
///implements [$TemplateCheck]
///

///

@JsonSerializable(
  explicitToJson: true,
)
class TemplateRegularCheck extends $TemplateRegularCheck
    implements TemplateCheck {
  final String description;
  final String type;

  ///
  ///implements [$TemplateCheck]
  ///

  ///
  TemplateRegularCheck({
    required this.description,
    required this.type,
  });
  TemplateRegularCheck._({
    required this.description,
    required this.type,
  });
  String toString() =>
      "(TemplateRegularCheck-description:${description.toString()}|type:${type.toString()})";
  int get hashCode => hashObjects([description.hashCode, type.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateRegularCheck &&
          runtimeType == other.runtimeType &&
          description == other.description &&
          type == other.type;
  TemplateRegularCheck copyWith_TemplateCheck({
    Opt<String>? type,
  }) {
    return TemplateRegularCheck._(
      type: type == null ? this.type as String : type.value as String,
      description: (this as TemplateRegularCheck).description,
    );
  }

  TemplateRegularCheck copyWith_TemplateRegularCheck({
    Opt<String>? description,
    Opt<String>? type,
  }) {
    return TemplateRegularCheck._(
      description: description == null
          ? this.description as String
          : description.value as String,
      type: type == null ? this.type as String : type.value as String,
    );
  }

//$TemplateCheck|[]|[type:String:$TemplateCheck]$TemplateRegularCheck|[]|[description:String:null, type:String:null]
//
  factory TemplateRegularCheck.fromJson(Map<String, dynamic> json) {
    if (json['_className_'] == "TemplateRegularCheck") {
      return _$TemplateRegularCheckFromJson(
        json,
      );
    } else {
      throw UnsupportedError(
          "The _className_ '${json['_className_']}' is not supported by the TemplateRegularCheck.fromJson constructor.");
    }
  }

  // ignore: unused_field
  Map<Type, Object? Function(Never)> _fns = {};

  Map<String, dynamic> toJson_2([Map<Type, Object? Function(Never)>? fns]) {
    this._fns = fns ?? {};
    return toJson();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = _$TemplateRegularCheckToJson(
      this,
    );
    // Adding custom key-value pair
    data['_className_'] = 'TemplateRegularCheck';

    return data;
  }
}

extension $TemplateRegularCheck_changeTo_E on $TemplateRegularCheck {}

enum TemplateRegularCheck$ { description, type }

///
///implements [$TemplateCheck]
///

///

@JsonSerializable(
  explicitToJson: true,
)
class TemplateWithReferenceCheck extends $TemplateWithReferenceCheck
    implements TemplateCheck {
  final String description;
  final String referenceDescription;
  final String type;

  ///
  ///implements [$TemplateCheck]
  ///

  ///
  TemplateWithReferenceCheck({
    required this.description,
    required this.referenceDescription,
    required this.type,
  });
  TemplateWithReferenceCheck._({
    required this.description,
    required this.referenceDescription,
    required this.type,
  });
  String toString() =>
      "(TemplateWithReferenceCheck-description:${description.toString()}|referenceDescription:${referenceDescription.toString()}|type:${type.toString()})";
  int get hashCode => hashObjects(
      [description.hashCode, referenceDescription.hashCode, type.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateWithReferenceCheck &&
          runtimeType == other.runtimeType &&
          description == other.description &&
          referenceDescription == other.referenceDescription &&
          type == other.type;
  TemplateWithReferenceCheck copyWith_TemplateCheck({
    Opt<String>? type,
  }) {
    return TemplateWithReferenceCheck._(
      type: type == null ? this.type as String : type.value as String,
      description: (this as TemplateWithReferenceCheck).description,
      referenceDescription:
          (this as TemplateWithReferenceCheck).referenceDescription,
    );
  }

  TemplateWithReferenceCheck copyWith_TemplateWithReferenceCheck({
    Opt<String>? description,
    Opt<String>? referenceDescription,
    Opt<String>? type,
  }) {
    return TemplateWithReferenceCheck._(
      description: description == null
          ? this.description as String
          : description.value as String,
      referenceDescription: referenceDescription == null
          ? this.referenceDescription as String
          : referenceDescription.value as String,
      type: type == null ? this.type as String : type.value as String,
    );
  }

//$TemplateCheck|[]|[type:String:$TemplateCheck]$TemplateWithReferenceCheck|[]|[description:String:null, referenceDescription:String:null, type:String:null]
//
  factory TemplateWithReferenceCheck.fromJson(Map<String, dynamic> json) {
    if (json['_className_'] == "TemplateWithReferenceCheck") {
      return _$TemplateWithReferenceCheckFromJson(
        json,
      );
    } else {
      throw UnsupportedError(
          "The _className_ '${json['_className_']}' is not supported by the TemplateWithReferenceCheck.fromJson constructor.");
    }
  }

  // ignore: unused_field
  Map<Type, Object? Function(Never)> _fns = {};

  Map<String, dynamic> toJson_2([Map<Type, Object? Function(Never)>? fns]) {
    this._fns = fns ?? {};
    return toJson();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = _$TemplateWithReferenceCheckToJson(
      this,
    );
    // Adding custom key-value pair
    data['_className_'] = 'TemplateWithReferenceCheck';

    return data;
  }
}

extension $TemplateWithReferenceCheck_changeTo_E
    on $TemplateWithReferenceCheck {}

enum TemplateWithReferenceCheck$ { description, referenceDescription, type }

///
///implements [$TemplateCheck]
///

///

@JsonSerializable(
  explicitToJson: true,
)
class TemplateLinearityCheckStep1Check extends $TemplateLinearityCheckStep1Check
    implements TemplateCheck {
  final String type;

  ///
  ///implements [$TemplateCheck]
  ///

  ///
  TemplateLinearityCheckStep1Check({
    required this.type,
  });
  TemplateLinearityCheckStep1Check._({
    required this.type,
  });
  String toString() =>
      "(TemplateLinearityCheckStep1Check-type:${type.toString()})";
  int get hashCode => hashObjects([type.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateLinearityCheckStep1Check &&
          runtimeType == other.runtimeType &&
          type == other.type;
  TemplateLinearityCheckStep1Check copyWith_TemplateCheck({
    Opt<String>? type,
  }) {
    return TemplateLinearityCheckStep1Check._(
      type: type == null ? this.type as String : type.value as String,
    );
  }

  TemplateLinearityCheckStep1Check copyWith_TemplateLinearityCheckStep1Check({
    Opt<String>? type,
  }) {
    return TemplateLinearityCheckStep1Check._(
      type: type == null ? this.type as String : type.value as String,
    );
  }

//$TemplateCheck|[]|[type:String:$TemplateCheck]$TemplateLinearityCheckStep1Check|[]|[type:String:null]
//
  factory TemplateLinearityCheckStep1Check.fromJson(Map<String, dynamic> json) {
    if (json['_className_'] == "TemplateLinearityCheckStep1Check") {
      return _$TemplateLinearityCheckStep1CheckFromJson(
        json,
      );
    } else {
      throw UnsupportedError(
          "The _className_ '${json['_className_']}' is not supported by the TemplateLinearityCheckStep1Check.fromJson constructor.");
    }
  }

  // ignore: unused_field
  Map<Type, Object? Function(Never)> _fns = {};

  Map<String, dynamic> toJson_2([Map<Type, Object? Function(Never)>? fns]) {
    this._fns = fns ?? {};
    return toJson();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = _$TemplateLinearityCheckStep1CheckToJson(
      this,
    );
    // Adding custom key-value pair
    data['_className_'] = 'TemplateLinearityCheckStep1Check';

    return data;
  }
}

extension $TemplateLinearityCheckStep1Check_changeTo_E
    on $TemplateLinearityCheckStep1Check {}

enum TemplateLinearityCheckStep1Check$ { type }

///
///implements [$TemplateCheck]
///

///

@JsonSerializable(
  explicitToJson: true,
)
class TemplateLinearityCheckStep2Check extends $TemplateLinearityCheckStep2Check
    implements TemplateCheck {
  final String type;

  ///
  ///implements [$TemplateCheck]
  ///

  ///
  TemplateLinearityCheckStep2Check({
    required this.type,
  });
  TemplateLinearityCheckStep2Check._({
    required this.type,
  });
  String toString() =>
      "(TemplateLinearityCheckStep2Check-type:${type.toString()})";
  int get hashCode => hashObjects([type.hashCode]);
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateLinearityCheckStep2Check &&
          runtimeType == other.runtimeType &&
          type == other.type;
  TemplateLinearityCheckStep2Check copyWith_TemplateCheck({
    Opt<String>? type,
  }) {
    return TemplateLinearityCheckStep2Check._(
      type: type == null ? this.type as String : type.value as String,
    );
  }

  TemplateLinearityCheckStep2Check copyWith_TemplateLinearityCheckStep2Check({
    Opt<String>? type,
  }) {
    return TemplateLinearityCheckStep2Check._(
      type: type == null ? this.type as String : type.value as String,
    );
  }

//$TemplateCheck|[]|[type:String:$TemplateCheck]$TemplateLinearityCheckStep2Check|[]|[type:String:null]
//
  factory TemplateLinearityCheckStep2Check.fromJson(Map<String, dynamic> json) {
    if (json['_className_'] == "TemplateLinearityCheckStep2Check") {
      return _$TemplateLinearityCheckStep2CheckFromJson(
        json,
      );
    } else {
      throw UnsupportedError(
          "The _className_ '${json['_className_']}' is not supported by the TemplateLinearityCheckStep2Check.fromJson constructor.");
    }
  }

  // ignore: unused_field
  Map<Type, Object? Function(Never)> _fns = {};

  Map<String, dynamic> toJson_2([Map<Type, Object? Function(Never)>? fns]) {
    this._fns = fns ?? {};
    return toJson();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = _$TemplateLinearityCheckStep2CheckToJson(
      this,
    );
    // Adding custom key-value pair
    data['_className_'] = 'TemplateLinearityCheckStep2Check';

    return data;
  }
}

extension $TemplateLinearityCheckStep2Check_changeTo_E
    on $TemplateLinearityCheckStep2Check {}

enum TemplateLinearityCheckStep2Check$ { type }
