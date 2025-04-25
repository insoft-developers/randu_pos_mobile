// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrinterModel _$PrinterModelFromJson(Map<String, dynamic> json) {
  return _PrinterModel.fromJson(json);
}

/// @nodoc
mixin _$PrinterModel {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get macAddress => throw _privateConstructorUsedError;
  int? get deviceId => throw _privateConstructorUsedError;
  int? get vendorId => throw _privateConstructorUsedError;
  int? get productId => throw _privateConstructorUsedError;
  @HiveField(3)
  int get type => throw _privateConstructorUsedError;
  @HiveField(4)
  PaperSizeModel? get paperSize => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this PrinterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrinterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrinterModelCopyWith<PrinterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrinterModelCopyWith<$Res> {
  factory $PrinterModelCopyWith(
          PrinterModel value, $Res Function(PrinterModel) then) =
      _$PrinterModelCopyWithImpl<$Res, PrinterModel>;
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String name,
      @HiveField(2) String macAddress,
      int? deviceId,
      int? vendorId,
      int? productId,
      @HiveField(3) int type,
      @HiveField(4) PaperSizeModel? paperSize,
      @HiveField(5) bool isSelected});

  $PaperSizeModelCopyWith<$Res>? get paperSize;
}

/// @nodoc
class _$PrinterModelCopyWithImpl<$Res, $Val extends PrinterModel>
    implements $PrinterModelCopyWith<$Res> {
  _$PrinterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrinterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? macAddress = null,
    Object? deviceId = freezed,
    Object? vendorId = freezed,
    Object? productId = freezed,
    Object? type = null,
    Object? paperSize = freezed,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      paperSize: freezed == paperSize
          ? _value.paperSize
          : paperSize // ignore: cast_nullable_to_non_nullable
              as PaperSizeModel?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of PrinterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaperSizeModelCopyWith<$Res>? get paperSize {
    if (_value.paperSize == null) {
      return null;
    }

    return $PaperSizeModelCopyWith<$Res>(_value.paperSize!, (value) {
      return _then(_value.copyWith(paperSize: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrinterModelImplCopyWith<$Res>
    implements $PrinterModelCopyWith<$Res> {
  factory _$$PrinterModelImplCopyWith(
          _$PrinterModelImpl value, $Res Function(_$PrinterModelImpl) then) =
      __$$PrinterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String name,
      @HiveField(2) String macAddress,
      int? deviceId,
      int? vendorId,
      int? productId,
      @HiveField(3) int type,
      @HiveField(4) PaperSizeModel? paperSize,
      @HiveField(5) bool isSelected});

  @override
  $PaperSizeModelCopyWith<$Res>? get paperSize;
}

/// @nodoc
class __$$PrinterModelImplCopyWithImpl<$Res>
    extends _$PrinterModelCopyWithImpl<$Res, _$PrinterModelImpl>
    implements _$$PrinterModelImplCopyWith<$Res> {
  __$$PrinterModelImplCopyWithImpl(
      _$PrinterModelImpl _value, $Res Function(_$PrinterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrinterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? macAddress = null,
    Object? deviceId = freezed,
    Object? vendorId = freezed,
    Object? productId = freezed,
    Object? type = null,
    Object? paperSize = freezed,
    Object? isSelected = null,
  }) {
    return _then(_$PrinterModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: null == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorId: freezed == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      paperSize: freezed == paperSize
          ? _value.paperSize
          : paperSize // ignore: cast_nullable_to_non_nullable
              as PaperSizeModel?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 17, adapterName: 'PrinterModelAdapter')
class _$PrinterModelImpl implements _PrinterModel {
  const _$PrinterModelImpl(
      {@HiveField(0) this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.macAddress,
      this.deviceId,
      this.vendorId,
      this.productId,
      @HiveField(3) this.type = 0,
      @HiveField(4) this.paperSize,
      @HiveField(5) this.isSelected = false});

  factory _$PrinterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrinterModelImplFromJson(json);

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String macAddress;
  @override
  final int? deviceId;
  @override
  final int? vendorId;
  @override
  final int? productId;
  @override
  @JsonKey()
  @HiveField(3)
  final int type;
  @override
  @HiveField(4)
  final PaperSizeModel? paperSize;
  @override
  @JsonKey()
  @HiveField(5)
  final bool isSelected;

  @override
  String toString() {
    return 'PrinterModel(id: $id, name: $name, macAddress: $macAddress, deviceId: $deviceId, vendorId: $vendorId, productId: $productId, type: $type, paperSize: $paperSize, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrinterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.paperSize, paperSize) ||
                other.paperSize == paperSize) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, macAddress, deviceId,
      vendorId, productId, type, paperSize, isSelected);

  /// Create a copy of PrinterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrinterModelImplCopyWith<_$PrinterModelImpl> get copyWith =>
      __$$PrinterModelImplCopyWithImpl<_$PrinterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrinterModelImplToJson(
      this,
    );
  }
}

abstract class _PrinterModel implements PrinterModel {
  const factory _PrinterModel(
      {@HiveField(0) final String? id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String macAddress,
      final int? deviceId,
      final int? vendorId,
      final int? productId,
      @HiveField(3) final int type,
      @HiveField(4) final PaperSizeModel? paperSize,
      @HiveField(5) final bool isSelected}) = _$PrinterModelImpl;

  factory _PrinterModel.fromJson(Map<String, dynamic> json) =
      _$PrinterModelImpl.fromJson;

  @override
  @HiveField(0)
  String? get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get macAddress;
  @override
  int? get deviceId;
  @override
  int? get vendorId;
  @override
  int? get productId;
  @override
  @HiveField(3)
  int get type;
  @override
  @HiveField(4)
  PaperSizeModel? get paperSize;
  @override
  @HiveField(5)
  bool get isSelected;

  /// Create a copy of PrinterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrinterModelImplCopyWith<_$PrinterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
