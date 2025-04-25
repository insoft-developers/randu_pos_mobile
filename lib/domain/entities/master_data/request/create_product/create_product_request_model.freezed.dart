// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateProductRequestModel _$CreateProductRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreateProductRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateProductRequestModel {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_ta')
  int get priceTa => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_mp')
  int get priceMp => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_cus')
  int get priceCus => throw _privateConstructorUsedError;
  String? get barcode => throw _privateConstructorUsedError;

  /// Serializes this CreateProductRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateProductRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateProductRequestModelCopyWith<CreateProductRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProductRequestModelCopyWith<$Res> {
  factory $CreateProductRequestModelCopyWith(CreateProductRequestModel value,
          $Res Function(CreateProductRequestModel) then) =
      _$CreateProductRequestModelCopyWithImpl<$Res, CreateProductRequestModel>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'category_id') int categoryId,
      String sku,
      int price,
      @JsonKey(name: 'price_ta') int priceTa,
      @JsonKey(name: 'price_mp') int priceMp,
      @JsonKey(name: 'price_cus') int priceCus,
      String? barcode});
}

/// @nodoc
class _$CreateProductRequestModelCopyWithImpl<$Res,
        $Val extends CreateProductRequestModel>
    implements $CreateProductRequestModelCopyWith<$Res> {
  _$CreateProductRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateProductRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? categoryId = null,
    Object? sku = null,
    Object? price = null,
    Object? priceTa = null,
    Object? priceMp = null,
    Object? priceCus = null,
    Object? barcode = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      priceTa: null == priceTa
          ? _value.priceTa
          : priceTa // ignore: cast_nullable_to_non_nullable
              as int,
      priceMp: null == priceMp
          ? _value.priceMp
          : priceMp // ignore: cast_nullable_to_non_nullable
              as int,
      priceCus: null == priceCus
          ? _value.priceCus
          : priceCus // ignore: cast_nullable_to_non_nullable
              as int,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateProductRequestModelImplCopyWith<$Res>
    implements $CreateProductRequestModelCopyWith<$Res> {
  factory _$$CreateProductRequestModelImplCopyWith(
          _$CreateProductRequestModelImpl value,
          $Res Function(_$CreateProductRequestModelImpl) then) =
      __$$CreateProductRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'category_id') int categoryId,
      String sku,
      int price,
      @JsonKey(name: 'price_ta') int priceTa,
      @JsonKey(name: 'price_mp') int priceMp,
      @JsonKey(name: 'price_cus') int priceCus,
      String? barcode});
}

/// @nodoc
class __$$CreateProductRequestModelImplCopyWithImpl<$Res>
    extends _$CreateProductRequestModelCopyWithImpl<$Res,
        _$CreateProductRequestModelImpl>
    implements _$$CreateProductRequestModelImplCopyWith<$Res> {
  __$$CreateProductRequestModelImplCopyWithImpl(
      _$CreateProductRequestModelImpl _value,
      $Res Function(_$CreateProductRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateProductRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? categoryId = null,
    Object? sku = null,
    Object? price = null,
    Object? priceTa = null,
    Object? priceMp = null,
    Object? priceCus = null,
    Object? barcode = freezed,
  }) {
    return _then(_$CreateProductRequestModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      priceTa: null == priceTa
          ? _value.priceTa
          : priceTa // ignore: cast_nullable_to_non_nullable
              as int,
      priceMp: null == priceMp
          ? _value.priceMp
          : priceMp // ignore: cast_nullable_to_non_nullable
              as int,
      priceCus: null == priceCus
          ? _value.priceCus
          : priceCus // ignore: cast_nullable_to_non_nullable
              as int,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateProductRequestModelImpl implements _CreateProductRequestModel {
  const _$CreateProductRequestModelImpl(
      {required this.name,
      @JsonKey(name: 'category_id') required this.categoryId,
      required this.sku,
      required this.price,
      @JsonKey(name: 'price_ta') required this.priceTa,
      @JsonKey(name: 'price_mp') required this.priceMp,
      @JsonKey(name: 'price_cus') required this.priceCus,
      this.barcode});

  factory _$CreateProductRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateProductRequestModelImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  final String sku;
  @override
  final int price;
  @override
  @JsonKey(name: 'price_ta')
  final int priceTa;
  @override
  @JsonKey(name: 'price_mp')
  final int priceMp;
  @override
  @JsonKey(name: 'price_cus')
  final int priceCus;
  @override
  final String? barcode;

  @override
  String toString() {
    return 'CreateProductRequestModel(name: $name, categoryId: $categoryId, sku: $sku, price: $price, priceTa: $priceTa, priceMp: $priceMp, priceCus: $priceCus, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateProductRequestModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceTa, priceTa) || other.priceTa == priceTa) &&
            (identical(other.priceMp, priceMp) || other.priceMp == priceMp) &&
            (identical(other.priceCus, priceCus) ||
                other.priceCus == priceCus) &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, categoryId, sku, price,
      priceTa, priceMp, priceCus, barcode);

  /// Create a copy of CreateProductRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateProductRequestModelImplCopyWith<_$CreateProductRequestModelImpl>
      get copyWith => __$$CreateProductRequestModelImplCopyWithImpl<
          _$CreateProductRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateProductRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CreateProductRequestModel implements CreateProductRequestModel {
  const factory _CreateProductRequestModel(
      {required final String name,
      @JsonKey(name: 'category_id') required final int categoryId,
      required final String sku,
      required final int price,
      @JsonKey(name: 'price_ta') required final int priceTa,
      @JsonKey(name: 'price_mp') required final int priceMp,
      @JsonKey(name: 'price_cus') required final int priceCus,
      final String? barcode}) = _$CreateProductRequestModelImpl;

  factory _CreateProductRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateProductRequestModelImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  String get sku;
  @override
  int get price;
  @override
  @JsonKey(name: 'price_ta')
  int get priceTa;
  @override
  @JsonKey(name: 'price_mp')
  int get priceMp;
  @override
  @JsonKey(name: 'price_cus')
  int get priceCus;
  @override
  String? get barcode;

  /// Create a copy of CreateProductRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateProductRequestModelImplCopyWith<_$CreateProductRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
