// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printer_folder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrinterFolder _$PrinterFolderFromJson(Map<String, dynamic> json) {
  return _PrinterFolder.fromJson(json);
}

/// @nodoc
mixin _$PrinterFolder {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  List<PrinterModel> get printer => throw _privateConstructorUsedError;
  @HiveField(3)
  String get typeString => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get isReceipt => throw _privateConstructorUsedError;

  /// Serializes this PrinterFolder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrinterFolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrinterFolderCopyWith<PrinterFolder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrinterFolderCopyWith<$Res> {
  factory $PrinterFolderCopyWith(
          PrinterFolder value, $Res Function(PrinterFolder) then) =
      _$PrinterFolderCopyWithImpl<$Res, PrinterFolder>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) List<PrinterModel> printer,
      @HiveField(3) String typeString,
      @HiveField(4) bool isReceipt});
}

/// @nodoc
class _$PrinterFolderCopyWithImpl<$Res, $Val extends PrinterFolder>
    implements $PrinterFolderCopyWith<$Res> {
  _$PrinterFolderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrinterFolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? printer = null,
    Object? typeString = null,
    Object? isReceipt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      printer: null == printer
          ? _value.printer
          : printer // ignore: cast_nullable_to_non_nullable
              as List<PrinterModel>,
      typeString: null == typeString
          ? _value.typeString
          : typeString // ignore: cast_nullable_to_non_nullable
              as String,
      isReceipt: null == isReceipt
          ? _value.isReceipt
          : isReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrinterFolderImplCopyWith<$Res>
    implements $PrinterFolderCopyWith<$Res> {
  factory _$$PrinterFolderImplCopyWith(
          _$PrinterFolderImpl value, $Res Function(_$PrinterFolderImpl) then) =
      __$$PrinterFolderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) List<PrinterModel> printer,
      @HiveField(3) String typeString,
      @HiveField(4) bool isReceipt});
}

/// @nodoc
class __$$PrinterFolderImplCopyWithImpl<$Res>
    extends _$PrinterFolderCopyWithImpl<$Res, _$PrinterFolderImpl>
    implements _$$PrinterFolderImplCopyWith<$Res> {
  __$$PrinterFolderImplCopyWithImpl(
      _$PrinterFolderImpl _value, $Res Function(_$PrinterFolderImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrinterFolder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? printer = null,
    Object? typeString = null,
    Object? isReceipt = null,
  }) {
    return _then(_$PrinterFolderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      printer: null == printer
          ? _value.printer
          : printer // ignore: cast_nullable_to_non_nullable
              as List<PrinterModel>,
      typeString: null == typeString
          ? _value.typeString
          : typeString // ignore: cast_nullable_to_non_nullable
              as String,
      isReceipt: null == isReceipt
          ? _value.isReceipt
          : isReceipt // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 18, adapterName: 'PrinterFolderAdapter')
class _$PrinterFolderImpl implements _PrinterFolder {
  const _$PrinterFolderImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.printer,
      @HiveField(3) required this.typeString,
      @HiveField(4) required this.isReceipt});

  factory _$PrinterFolderImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrinterFolderImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final List<PrinterModel> printer;
  @override
  @HiveField(3)
  final String typeString;
  @override
  @HiveField(4)
  final bool isReceipt;

  @override
  String toString() {
    return 'PrinterFolder(id: $id, name: $name, printer: $printer, typeString: $typeString, isReceipt: $isReceipt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrinterFolderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.printer, printer) &&
            (identical(other.typeString, typeString) ||
                other.typeString == typeString) &&
            (identical(other.isReceipt, isReceipt) ||
                other.isReceipt == isReceipt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(printer), typeString, isReceipt);

  /// Create a copy of PrinterFolder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrinterFolderImplCopyWith<_$PrinterFolderImpl> get copyWith =>
      __$$PrinterFolderImplCopyWithImpl<_$PrinterFolderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrinterFolderImplToJson(
      this,
    );
  }
}

abstract class _PrinterFolder implements PrinterFolder {
  const factory _PrinterFolder(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final List<PrinterModel> printer,
      @HiveField(3) required final String typeString,
      @HiveField(4) required final bool isReceipt}) = _$PrinterFolderImpl;

  factory _PrinterFolder.fromJson(Map<String, dynamic> json) =
      _$PrinterFolderImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  List<PrinterModel> get printer;
  @override
  @HiveField(3)
  String get typeString;
  @override
  @HiveField(4)
  bool get isReceipt;

  /// Create a copy of PrinterFolder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrinterFolderImplCopyWith<_$PrinterFolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
