// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMethodModel _$PaymentMethodModelFromJson(Map<String, dynamic> json) {
  return _PaymentMethodModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'method')
  String? get method => throw _privateConstructorUsedError;
  @JsonKey(name: 'selected')
  bool? get selected => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<BankModel>? get bankModel => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodModelCopyWith<PaymentMethodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodModelCopyWith<$Res> {
  factory $PaymentMethodModelCopyWith(
          PaymentMethodModel value, $Res Function(PaymentMethodModel) then) =
      _$PaymentMethodModelCopyWithImpl<$Res, PaymentMethodModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'method') String? method,
      @JsonKey(name: 'selected') bool? selected,
      String? code,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'items') List<BankModel>? bankModel});
}

/// @nodoc
class _$PaymentMethodModelCopyWithImpl<$Res, $Val extends PaymentMethodModel>
    implements $PaymentMethodModelCopyWith<$Res> {
  _$PaymentMethodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? method = freezed,
    Object? selected = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? bankModel = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      bankModel: freezed == bankModel
          ? _value.bankModel
          : bankModel // ignore: cast_nullable_to_non_nullable
              as List<BankModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodModelImplCopyWith<$Res>
    implements $PaymentMethodModelCopyWith<$Res> {
  factory _$$PaymentMethodModelImplCopyWith(_$PaymentMethodModelImpl value,
          $Res Function(_$PaymentMethodModelImpl) then) =
      __$$PaymentMethodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'method') String? method,
      @JsonKey(name: 'selected') bool? selected,
      String? code,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'items') List<BankModel>? bankModel});
}

/// @nodoc
class __$$PaymentMethodModelImplCopyWithImpl<$Res>
    extends _$PaymentMethodModelCopyWithImpl<$Res, _$PaymentMethodModelImpl>
    implements _$$PaymentMethodModelImplCopyWith<$Res> {
  __$$PaymentMethodModelImplCopyWithImpl(_$PaymentMethodModelImpl _value,
      $Res Function(_$PaymentMethodModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? method = freezed,
    Object? selected = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? bankModel = freezed,
  }) {
    return _then(_$PaymentMethodModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      bankModel: freezed == bankModel
          ? _value._bankModel
          : bankModel // ignore: cast_nullable_to_non_nullable
              as List<BankModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 11, adapterName: 'PaymentMethodModelAdapter')
class _$PaymentMethodModelImpl implements _PaymentMethodModel {
  const _$PaymentMethodModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'method') this.method,
      @JsonKey(name: 'selected') this.selected,
      this.code,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'items') final List<BankModel>? bankModel})
      : _bankModel = bankModel;

  factory _$PaymentMethodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'method')
  final String? method;
  @override
  @JsonKey(name: 'selected')
  final bool? selected;
  @override
  final String? code;
  @override
  @JsonKey(name: 'description')
  final String? description;
  final List<BankModel>? _bankModel;
  @override
  @JsonKey(name: 'items')
  List<BankModel>? get bankModel {
    final value = _bankModel;
    if (value == null) return null;
    if (_bankModel is EqualUnmodifiableListView) return _bankModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaymentMethodModel(id: $id, method: $method, selected: $selected, code: $code, description: $description, bankModel: $bankModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._bankModel, _bankModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, method, selected, code,
      description, const DeepCollectionEquality().hash(_bankModel));

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodModelImplCopyWith<_$PaymentMethodModelImpl> get copyWith =>
      __$$PaymentMethodModelImplCopyWithImpl<_$PaymentMethodModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodModel implements PaymentMethodModel {
  const factory _PaymentMethodModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'method') final String? method,
          @JsonKey(name: 'selected') final bool? selected,
          final String? code,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'items') final List<BankModel>? bankModel}) =
      _$PaymentMethodModelImpl;

  factory _PaymentMethodModel.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'method')
  String? get method;
  @override
  @JsonKey(name: 'selected')
  bool? get selected;
  @override
  String? get code;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'items')
  List<BankModel>? get bankModel;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodModelImplCopyWith<_$PaymentMethodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BankModel _$BankModelFromJson(Map<String, dynamic> json) {
  return _BankModel.fromJson(json);
}

/// @nodoc
mixin _$BankModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag')
  List<FlagModel>? get flagModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'method')
  String? get method => throw _privateConstructorUsedError;
  @JsonKey(name: 'selected')
  bool? get selected => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankOwner')
  String? get bankOwner => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankAccountNumber')
  String? get bankAccountNumber => throw _privateConstructorUsedError;

  /// Serializes this BankModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankModelCopyWith<BankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankModelCopyWith<$Res> {
  factory $BankModelCopyWith(BankModel value, $Res Function(BankModel) then) =
      _$BankModelCopyWithImpl<$Res, BankModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'flag') List<FlagModel>? flagModel,
      @JsonKey(name: 'method') String? method,
      @JsonKey(name: 'selected') bool? selected,
      @JsonKey(name: 'bankOwner') String? bankOwner,
      @JsonKey(name: 'bankAccountNumber') String? bankAccountNumber});
}

/// @nodoc
class _$BankModelCopyWithImpl<$Res, $Val extends BankModel>
    implements $BankModelCopyWith<$Res> {
  _$BankModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? flagModel = freezed,
    Object? method = freezed,
    Object? selected = freezed,
    Object? bankOwner = freezed,
    Object? bankAccountNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      flagModel: freezed == flagModel
          ? _value.flagModel
          : flagModel // ignore: cast_nullable_to_non_nullable
              as List<FlagModel>?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool?,
      bankOwner: freezed == bankOwner
          ? _value.bankOwner
          : bankOwner // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankModelImplCopyWith<$Res>
    implements $BankModelCopyWith<$Res> {
  factory _$$BankModelImplCopyWith(
          _$BankModelImpl value, $Res Function(_$BankModelImpl) then) =
      __$$BankModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'flag') List<FlagModel>? flagModel,
      @JsonKey(name: 'method') String? method,
      @JsonKey(name: 'selected') bool? selected,
      @JsonKey(name: 'bankOwner') String? bankOwner,
      @JsonKey(name: 'bankAccountNumber') String? bankAccountNumber});
}

/// @nodoc
class __$$BankModelImplCopyWithImpl<$Res>
    extends _$BankModelCopyWithImpl<$Res, _$BankModelImpl>
    implements _$$BankModelImplCopyWith<$Res> {
  __$$BankModelImplCopyWithImpl(
      _$BankModelImpl _value, $Res Function(_$BankModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? flagModel = freezed,
    Object? method = freezed,
    Object? selected = freezed,
    Object? bankOwner = freezed,
    Object? bankAccountNumber = freezed,
  }) {
    return _then(_$BankModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      flagModel: freezed == flagModel
          ? _value._flagModel
          : flagModel // ignore: cast_nullable_to_non_nullable
              as List<FlagModel>?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool?,
      bankOwner: freezed == bankOwner
          ? _value.bankOwner
          : bankOwner // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 12, adapterName: 'BankModelAdapter')
class _$BankModelImpl implements _BankModel {
  const _$BankModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'flag') final List<FlagModel>? flagModel,
      @JsonKey(name: 'method') this.method,
      @JsonKey(name: 'selected') this.selected,
      @JsonKey(name: 'bankOwner') this.bankOwner,
      @JsonKey(name: 'bankAccountNumber') this.bankAccountNumber})
      : _flagModel = flagModel;

  factory _$BankModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'code')
  final String? code;
  final List<FlagModel>? _flagModel;
  @override
  @JsonKey(name: 'flag')
  List<FlagModel>? get flagModel {
    final value = _flagModel;
    if (value == null) return null;
    if (_flagModel is EqualUnmodifiableListView) return _flagModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'method')
  final String? method;
  @override
  @JsonKey(name: 'selected')
  final bool? selected;
  @override
  @JsonKey(name: 'bankOwner')
  final String? bankOwner;
  @override
  @JsonKey(name: 'bankAccountNumber')
  final String? bankAccountNumber;

  @override
  String toString() {
    return 'BankModel(id: $id, code: $code, flagModel: $flagModel, method: $method, selected: $selected, bankOwner: $bankOwner, bankAccountNumber: $bankAccountNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality()
                .equals(other._flagModel, _flagModel) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.bankOwner, bankOwner) ||
                other.bankOwner == bankOwner) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      const DeepCollectionEquality().hash(_flagModel),
      method,
      selected,
      bankOwner,
      bankAccountNumber);

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankModelImplCopyWith<_$BankModelImpl> get copyWith =>
      __$$BankModelImplCopyWithImpl<_$BankModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankModelImplToJson(
      this,
    );
  }
}

abstract class _BankModel implements BankModel {
  const factory _BankModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'code') final String? code,
      @JsonKey(name: 'flag') final List<FlagModel>? flagModel,
      @JsonKey(name: 'method') final String? method,
      @JsonKey(name: 'selected') final bool? selected,
      @JsonKey(name: 'bankOwner') final String? bankOwner,
      @JsonKey(name: 'bankAccountNumber')
      final String? bankAccountNumber}) = _$BankModelImpl;

  factory _BankModel.fromJson(Map<String, dynamic> json) =
      _$BankModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'code')
  String? get code;
  @override
  @JsonKey(name: 'flag')
  List<FlagModel>? get flagModel;
  @override
  @JsonKey(name: 'method')
  String? get method;
  @override
  @JsonKey(name: 'selected')
  bool? get selected;
  @override
  @JsonKey(name: 'bankOwner')
  String? get bankOwner;
  @override
  @JsonKey(name: 'bankAccountNumber')
  String? get bankAccountNumber;

  /// Create a copy of BankModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankModelImplCopyWith<_$BankModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlagModel _$FlagModelFromJson(Map<String, dynamic> json) {
  return _FlagModel.fromJson(json);
}

/// @nodoc
mixin _$FlagModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'group')
  String? get group => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'flag')
  String? get flag => throw _privateConstructorUsedError;

  /// Serializes this FlagModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlagModelCopyWith<FlagModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlagModelCopyWith<$Res> {
  factory $FlagModelCopyWith(FlagModel value, $Res Function(FlagModel) then) =
      _$FlagModelCopyWithImpl<$Res, FlagModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'group') String? group,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'flag') String? flag});
}

/// @nodoc
class _$FlagModelCopyWithImpl<$Res, $Val extends FlagModel>
    implements $FlagModelCopyWith<$Res> {
  _$FlagModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? group = freezed,
    Object? paymentMethod = freezed,
    Object? flag = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlagModelImplCopyWith<$Res>
    implements $FlagModelCopyWith<$Res> {
  factory _$$FlagModelImplCopyWith(
          _$FlagModelImpl value, $Res Function(_$FlagModelImpl) then) =
      __$$FlagModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'group') String? group,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      @JsonKey(name: 'flag') String? flag});
}

/// @nodoc
class __$$FlagModelImplCopyWithImpl<$Res>
    extends _$FlagModelCopyWithImpl<$Res, _$FlagModelImpl>
    implements _$$FlagModelImplCopyWith<$Res> {
  __$$FlagModelImplCopyWithImpl(
      _$FlagModelImpl _value, $Res Function(_$FlagModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? group = freezed,
    Object? paymentMethod = freezed,
    Object? flag = freezed,
  }) {
    return _then(_$FlagModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      flag: freezed == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 13, adapterName: 'FlagModelAdapter')
class _$FlagModelImpl implements _FlagModel {
  const _$FlagModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'group') this.group,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      @JsonKey(name: 'flag') this.flag});

  factory _$FlagModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlagModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'group')
  final String? group;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  @JsonKey(name: 'flag')
  final String? flag;

  @override
  String toString() {
    return 'FlagModel(id: $id, userId: $userId, group: $group, paymentMethod: $paymentMethod, flag: $flag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlagModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, group, paymentMethod, flag);

  /// Create a copy of FlagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlagModelImplCopyWith<_$FlagModelImpl> get copyWith =>
      __$$FlagModelImplCopyWithImpl<_$FlagModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlagModelImplToJson(
      this,
    );
  }
}

abstract class _FlagModel implements FlagModel {
  const factory _FlagModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'group') final String? group,
      @JsonKey(name: 'payment_method') final String? paymentMethod,
      @JsonKey(name: 'flag') final String? flag}) = _$FlagModelImpl;

  factory _FlagModel.fromJson(Map<String, dynamic> json) =
      _$FlagModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'group')
  String? get group;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @override
  @JsonKey(name: 'flag')
  String? get flag;

  /// Create a copy of FlagModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlagModelImplCopyWith<_$FlagModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
