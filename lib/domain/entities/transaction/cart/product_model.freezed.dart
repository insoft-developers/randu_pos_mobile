// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get code => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get sku => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(5)
  int? get price => throw _privateConstructorUsedError;
  @HiveField(6)
  int? get cost => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get unit => throw _privateConstructorUsedError;
  @HiveField(8)
  int? get quantity => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'stock_alert')
  int? get stockAlert => throw _privateConstructorUsedError;
  @HiveField(10)
  int? get sell => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get created => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @HiveField(13)
  @JsonKey(name: 'is_variant')
  int? get isVariant => throw _privateConstructorUsedError;
  @HiveField(14)
  @JsonKey(name: 'is_manufactured')
  int? get isManufactured => throw _privateConstructorUsedError;
  @HiveField(15)
  @JsonKey(name: 'buffered_stock')
  int? get bufferedStock => throw _privateConstructorUsedError;
  @HiveField(16)
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  @HiveField(17)
  @JsonKey(name: 'variant_groups')
  List<String>? get variantGroups => throw _privateConstructorUsedError;
  @HiveField(18)
  List<VariantModel>? get variant => throw _privateConstructorUsedError;
  @HiveField(19)
  String? get note => throw _privateConstructorUsedError;
  @HiveField(20)
  @JsonKey(name: 'price_ta')
  int? get priceTakeAway => throw _privateConstructorUsedError;
  @HiveField(21)
  @JsonKey(name: 'price_mp')
  int? get priceMarketPlace => throw _privateConstructorUsedError;
  @HiveField(22)
  @JsonKey(name: 'price_cus')
  int? get priceCustom => throw _privateConstructorUsedError;
  @HiveField(23)
  @JsonKey(name: 'price_type')
  String? get priceType => throw _privateConstructorUsedError;
  @HiveField(24)
  @JsonKey(name: 'barcode', includeIfNull: false)
  String? get barcode => throw _privateConstructorUsedError;
  @HiveField(25)
  @JsonKey(name: 'is_editable')
  int? get isEditable => throw _privateConstructorUsedError;
  @HiveField(26)
  int? get priceEdit => throw _privateConstructorUsedError;
  @HiveField(27)
  bool? get isPrinted => throw _privateConstructorUsedError;
  @HiveField(28)
  List<ProductModel> get productForChecker =>
      throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) @JsonKey(name: 'category_id') int? categoryId,
      @HiveField(2) String? code,
      @HiveField(3) String? sku,
      @HiveField(4) String? name,
      @HiveField(5) int? price,
      @HiveField(6) int? cost,
      @HiveField(7) String? unit,
      @HiveField(8) int? quantity,
      @HiveField(9) @JsonKey(name: 'stock_alert') int? stockAlert,
      @HiveField(10) int? sell,
      @HiveField(11) String? created,
      @HiveField(12) @JsonKey(name: 'user_id') int? userId,
      @HiveField(13) @JsonKey(name: 'is_variant') int? isVariant,
      @HiveField(14) @JsonKey(name: 'is_manufactured') int? isManufactured,
      @HiveField(15) @JsonKey(name: 'buffered_stock') int? bufferedStock,
      @HiveField(16) @JsonKey(name: 'category_name') String? categoryName,
      @HiveField(17)
      @JsonKey(name: 'variant_groups')
      List<String>? variantGroups,
      @HiveField(18) List<VariantModel>? variant,
      @HiveField(19) String? note,
      @HiveField(20) @JsonKey(name: 'price_ta') int? priceTakeAway,
      @HiveField(21) @JsonKey(name: 'price_mp') int? priceMarketPlace,
      @HiveField(22) @JsonKey(name: 'price_cus') int? priceCustom,
      @HiveField(23) @JsonKey(name: 'price_type') String? priceType,
      @HiveField(24)
      @JsonKey(name: 'barcode', includeIfNull: false)
      String? barcode,
      @HiveField(25) @JsonKey(name: 'is_editable') int? isEditable,
      @HiveField(26) int? priceEdit,
      @HiveField(27) bool? isPrinted,
      @HiveField(28) List<ProductModel> productForChecker});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = freezed,
    Object? code = freezed,
    Object? sku = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? cost = freezed,
    Object? unit = freezed,
    Object? quantity = freezed,
    Object? stockAlert = freezed,
    Object? sell = freezed,
    Object? created = freezed,
    Object? userId = freezed,
    Object? isVariant = freezed,
    Object? isManufactured = freezed,
    Object? bufferedStock = freezed,
    Object? categoryName = freezed,
    Object? variantGroups = freezed,
    Object? variant = freezed,
    Object? note = freezed,
    Object? priceTakeAway = freezed,
    Object? priceMarketPlace = freezed,
    Object? priceCustom = freezed,
    Object? priceType = freezed,
    Object? barcode = freezed,
    Object? isEditable = freezed,
    Object? priceEdit = freezed,
    Object? isPrinted = freezed,
    Object? productForChecker = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      stockAlert: freezed == stockAlert
          ? _value.stockAlert
          : stockAlert // ignore: cast_nullable_to_non_nullable
              as int?,
      sell: freezed == sell
          ? _value.sell
          : sell // ignore: cast_nullable_to_non_nullable
              as int?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      isVariant: freezed == isVariant
          ? _value.isVariant
          : isVariant // ignore: cast_nullable_to_non_nullable
              as int?,
      isManufactured: freezed == isManufactured
          ? _value.isManufactured
          : isManufactured // ignore: cast_nullable_to_non_nullable
              as int?,
      bufferedStock: freezed == bufferedStock
          ? _value.bufferedStock
          : bufferedStock // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      variantGroups: freezed == variantGroups
          ? _value.variantGroups
          : variantGroups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as List<VariantModel>?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      priceTakeAway: freezed == priceTakeAway
          ? _value.priceTakeAway
          : priceTakeAway // ignore: cast_nullable_to_non_nullable
              as int?,
      priceMarketPlace: freezed == priceMarketPlace
          ? _value.priceMarketPlace
          : priceMarketPlace // ignore: cast_nullable_to_non_nullable
              as int?,
      priceCustom: freezed == priceCustom
          ? _value.priceCustom
          : priceCustom // ignore: cast_nullable_to_non_nullable
              as int?,
      priceType: freezed == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      isEditable: freezed == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as int?,
      priceEdit: freezed == priceEdit
          ? _value.priceEdit
          : priceEdit // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrinted: freezed == isPrinted
          ? _value.isPrinted
          : isPrinted // ignore: cast_nullable_to_non_nullable
              as bool?,
      productForChecker: null == productForChecker
          ? _value.productForChecker
          : productForChecker // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) @JsonKey(name: 'category_id') int? categoryId,
      @HiveField(2) String? code,
      @HiveField(3) String? sku,
      @HiveField(4) String? name,
      @HiveField(5) int? price,
      @HiveField(6) int? cost,
      @HiveField(7) String? unit,
      @HiveField(8) int? quantity,
      @HiveField(9) @JsonKey(name: 'stock_alert') int? stockAlert,
      @HiveField(10) int? sell,
      @HiveField(11) String? created,
      @HiveField(12) @JsonKey(name: 'user_id') int? userId,
      @HiveField(13) @JsonKey(name: 'is_variant') int? isVariant,
      @HiveField(14) @JsonKey(name: 'is_manufactured') int? isManufactured,
      @HiveField(15) @JsonKey(name: 'buffered_stock') int? bufferedStock,
      @HiveField(16) @JsonKey(name: 'category_name') String? categoryName,
      @HiveField(17)
      @JsonKey(name: 'variant_groups')
      List<String>? variantGroups,
      @HiveField(18) List<VariantModel>? variant,
      @HiveField(19) String? note,
      @HiveField(20) @JsonKey(name: 'price_ta') int? priceTakeAway,
      @HiveField(21) @JsonKey(name: 'price_mp') int? priceMarketPlace,
      @HiveField(22) @JsonKey(name: 'price_cus') int? priceCustom,
      @HiveField(23) @JsonKey(name: 'price_type') String? priceType,
      @HiveField(24)
      @JsonKey(name: 'barcode', includeIfNull: false)
      String? barcode,
      @HiveField(25) @JsonKey(name: 'is_editable') int? isEditable,
      @HiveField(26) int? priceEdit,
      @HiveField(27) bool? isPrinted,
      @HiveField(28) List<ProductModel> productForChecker});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = freezed,
    Object? code = freezed,
    Object? sku = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? cost = freezed,
    Object? unit = freezed,
    Object? quantity = freezed,
    Object? stockAlert = freezed,
    Object? sell = freezed,
    Object? created = freezed,
    Object? userId = freezed,
    Object? isVariant = freezed,
    Object? isManufactured = freezed,
    Object? bufferedStock = freezed,
    Object? categoryName = freezed,
    Object? variantGroups = freezed,
    Object? variant = freezed,
    Object? note = freezed,
    Object? priceTakeAway = freezed,
    Object? priceMarketPlace = freezed,
    Object? priceCustom = freezed,
    Object? priceType = freezed,
    Object? barcode = freezed,
    Object? isEditable = freezed,
    Object? priceEdit = freezed,
    Object? isPrinted = freezed,
    Object? productForChecker = null,
  }) {
    return _then(_$ProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      stockAlert: freezed == stockAlert
          ? _value.stockAlert
          : stockAlert // ignore: cast_nullable_to_non_nullable
              as int?,
      sell: freezed == sell
          ? _value.sell
          : sell // ignore: cast_nullable_to_non_nullable
              as int?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      isVariant: freezed == isVariant
          ? _value.isVariant
          : isVariant // ignore: cast_nullable_to_non_nullable
              as int?,
      isManufactured: freezed == isManufactured
          ? _value.isManufactured
          : isManufactured // ignore: cast_nullable_to_non_nullable
              as int?,
      bufferedStock: freezed == bufferedStock
          ? _value.bufferedStock
          : bufferedStock // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      variantGroups: freezed == variantGroups
          ? _value._variantGroups
          : variantGroups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      variant: freezed == variant
          ? _value._variant
          : variant // ignore: cast_nullable_to_non_nullable
              as List<VariantModel>?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      priceTakeAway: freezed == priceTakeAway
          ? _value.priceTakeAway
          : priceTakeAway // ignore: cast_nullable_to_non_nullable
              as int?,
      priceMarketPlace: freezed == priceMarketPlace
          ? _value.priceMarketPlace
          : priceMarketPlace // ignore: cast_nullable_to_non_nullable
              as int?,
      priceCustom: freezed == priceCustom
          ? _value.priceCustom
          : priceCustom // ignore: cast_nullable_to_non_nullable
              as int?,
      priceType: freezed == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      isEditable: freezed == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as int?,
      priceEdit: freezed == priceEdit
          ? _value.priceEdit
          : priceEdit // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrinted: freezed == isPrinted
          ? _value.isPrinted
          : isPrinted // ignore: cast_nullable_to_non_nullable
              as bool?,
      productForChecker: null == productForChecker
          ? _value._productForChecker
          : productForChecker // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 3, adapterName: 'ProductModelAdapter')
class _$ProductModelImpl extends _ProductModel with DiagnosticableTreeMixin {
  const _$ProductModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) @JsonKey(name: 'category_id') this.categoryId,
      @HiveField(2) this.code,
      @HiveField(3) this.sku,
      @HiveField(4) this.name,
      @HiveField(5) this.price,
      @HiveField(6) this.cost,
      @HiveField(7) this.unit,
      @HiveField(8) this.quantity,
      @HiveField(9) @JsonKey(name: 'stock_alert') this.stockAlert,
      @HiveField(10) this.sell,
      @HiveField(11) this.created,
      @HiveField(12) @JsonKey(name: 'user_id') this.userId,
      @HiveField(13) @JsonKey(name: 'is_variant') this.isVariant,
      @HiveField(14) @JsonKey(name: 'is_manufactured') this.isManufactured,
      @HiveField(15) @JsonKey(name: 'buffered_stock') this.bufferedStock,
      @HiveField(16) @JsonKey(name: 'category_name') this.categoryName,
      @HiveField(17)
      @JsonKey(name: 'variant_groups')
      final List<String>? variantGroups,
      @HiveField(18) final List<VariantModel>? variant,
      @HiveField(19) this.note,
      @HiveField(20) @JsonKey(name: 'price_ta') this.priceTakeAway,
      @HiveField(21) @JsonKey(name: 'price_mp') this.priceMarketPlace,
      @HiveField(22) @JsonKey(name: 'price_cus') this.priceCustom,
      @HiveField(23) @JsonKey(name: 'price_type') this.priceType,
      @HiveField(24)
      @JsonKey(name: 'barcode', includeIfNull: false)
      this.barcode,
      @HiveField(25) @JsonKey(name: 'is_editable') this.isEditable,
      @HiveField(26) this.priceEdit,
      @HiveField(27) this.isPrinted,
      @HiveField(28) final List<ProductModel> productForChecker = const []})
      : _variantGroups = variantGroups,
        _variant = variant,
        _productForChecker = productForChecker,
        super._();

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @HiveField(2)
  final String? code;
  @override
  @HiveField(3)
  final String? sku;
  @override
  @HiveField(4)
  final String? name;
  @override
  @HiveField(5)
  final int? price;
  @override
  @HiveField(6)
  final int? cost;
  @override
  @HiveField(7)
  final String? unit;
  @override
  @HiveField(8)
  final int? quantity;
  @override
  @HiveField(9)
  @JsonKey(name: 'stock_alert')
  final int? stockAlert;
  @override
  @HiveField(10)
  final int? sell;
  @override
  @HiveField(11)
  final String? created;
  @override
  @HiveField(12)
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @HiveField(13)
  @JsonKey(name: 'is_variant')
  final int? isVariant;
  @override
  @HiveField(14)
  @JsonKey(name: 'is_manufactured')
  final int? isManufactured;
  @override
  @HiveField(15)
  @JsonKey(name: 'buffered_stock')
  final int? bufferedStock;
  @override
  @HiveField(16)
  @JsonKey(name: 'category_name')
  final String? categoryName;
  final List<String>? _variantGroups;
  @override
  @HiveField(17)
  @JsonKey(name: 'variant_groups')
  List<String>? get variantGroups {
    final value = _variantGroups;
    if (value == null) return null;
    if (_variantGroups is EqualUnmodifiableListView) return _variantGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<VariantModel>? _variant;
  @override
  @HiveField(18)
  List<VariantModel>? get variant {
    final value = _variant;
    if (value == null) return null;
    if (_variant is EqualUnmodifiableListView) return _variant;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(19)
  final String? note;
  @override
  @HiveField(20)
  @JsonKey(name: 'price_ta')
  final int? priceTakeAway;
  @override
  @HiveField(21)
  @JsonKey(name: 'price_mp')
  final int? priceMarketPlace;
  @override
  @HiveField(22)
  @JsonKey(name: 'price_cus')
  final int? priceCustom;
  @override
  @HiveField(23)
  @JsonKey(name: 'price_type')
  final String? priceType;
  @override
  @HiveField(24)
  @JsonKey(name: 'barcode', includeIfNull: false)
  final String? barcode;
  @override
  @HiveField(25)
  @JsonKey(name: 'is_editable')
  final int? isEditable;
  @override
  @HiveField(26)
  final int? priceEdit;
  @override
  @HiveField(27)
  final bool? isPrinted;
  final List<ProductModel> _productForChecker;
  @override
  @JsonKey()
  @HiveField(28)
  List<ProductModel> get productForChecker {
    if (_productForChecker is EqualUnmodifiableListView)
      return _productForChecker;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productForChecker);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductModel(id: $id, categoryId: $categoryId, code: $code, sku: $sku, name: $name, price: $price, cost: $cost, unit: $unit, quantity: $quantity, stockAlert: $stockAlert, sell: $sell, created: $created, userId: $userId, isVariant: $isVariant, isManufactured: $isManufactured, bufferedStock: $bufferedStock, categoryName: $categoryName, variantGroups: $variantGroups, variant: $variant, note: $note, priceTakeAway: $priceTakeAway, priceMarketPlace: $priceMarketPlace, priceCustom: $priceCustom, priceType: $priceType, barcode: $barcode, isEditable: $isEditable, priceEdit: $priceEdit, isPrinted: $isPrinted, productForChecker: $productForChecker)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('sku', sku))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('cost', cost))
      ..add(DiagnosticsProperty('unit', unit))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('stockAlert', stockAlert))
      ..add(DiagnosticsProperty('sell', sell))
      ..add(DiagnosticsProperty('created', created))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('isVariant', isVariant))
      ..add(DiagnosticsProperty('isManufactured', isManufactured))
      ..add(DiagnosticsProperty('bufferedStock', bufferedStock))
      ..add(DiagnosticsProperty('categoryName', categoryName))
      ..add(DiagnosticsProperty('variantGroups', variantGroups))
      ..add(DiagnosticsProperty('variant', variant))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('priceTakeAway', priceTakeAway))
      ..add(DiagnosticsProperty('priceMarketPlace', priceMarketPlace))
      ..add(DiagnosticsProperty('priceCustom', priceCustom))
      ..add(DiagnosticsProperty('priceType', priceType))
      ..add(DiagnosticsProperty('barcode', barcode))
      ..add(DiagnosticsProperty('isEditable', isEditable))
      ..add(DiagnosticsProperty('priceEdit', priceEdit))
      ..add(DiagnosticsProperty('isPrinted', isPrinted))
      ..add(DiagnosticsProperty('productForChecker', productForChecker));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.stockAlert, stockAlert) ||
                other.stockAlert == stockAlert) &&
            (identical(other.sell, sell) || other.sell == sell) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isVariant, isVariant) ||
                other.isVariant == isVariant) &&
            (identical(other.isManufactured, isManufactured) ||
                other.isManufactured == isManufactured) &&
            (identical(other.bufferedStock, bufferedStock) ||
                other.bufferedStock == bufferedStock) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            const DeepCollectionEquality()
                .equals(other._variantGroups, _variantGroups) &&
            const DeepCollectionEquality().equals(other._variant, _variant) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.priceTakeAway, priceTakeAway) ||
                other.priceTakeAway == priceTakeAway) &&
            (identical(other.priceMarketPlace, priceMarketPlace) ||
                other.priceMarketPlace == priceMarketPlace) &&
            (identical(other.priceCustom, priceCustom) ||
                other.priceCustom == priceCustom) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.isEditable, isEditable) ||
                other.isEditable == isEditable) &&
            (identical(other.priceEdit, priceEdit) ||
                other.priceEdit == priceEdit) &&
            (identical(other.isPrinted, isPrinted) ||
                other.isPrinted == isPrinted) &&
            const DeepCollectionEquality()
                .equals(other._productForChecker, _productForChecker));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        categoryId,
        code,
        sku,
        name,
        price,
        cost,
        unit,
        quantity,
        stockAlert,
        sell,
        created,
        userId,
        isVariant,
        isManufactured,
        bufferedStock,
        categoryName,
        const DeepCollectionEquality().hash(_variantGroups),
        const DeepCollectionEquality().hash(_variant),
        note,
        priceTakeAway,
        priceMarketPlace,
        priceCustom,
        priceType,
        barcode,
        isEditable,
        priceEdit,
        isPrinted,
        const DeepCollectionEquality().hash(_productForChecker)
      ]);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel extends ProductModel {
  const factory _ProductModel(
      {@HiveField(0) required final int id,
      @HiveField(1) @JsonKey(name: 'category_id') final int? categoryId,
      @HiveField(2) final String? code,
      @HiveField(3) final String? sku,
      @HiveField(4) final String? name,
      @HiveField(5) final int? price,
      @HiveField(6) final int? cost,
      @HiveField(7) final String? unit,
      @HiveField(8) final int? quantity,
      @HiveField(9) @JsonKey(name: 'stock_alert') final int? stockAlert,
      @HiveField(10) final int? sell,
      @HiveField(11) final String? created,
      @HiveField(12) @JsonKey(name: 'user_id') final int? userId,
      @HiveField(13) @JsonKey(name: 'is_variant') final int? isVariant,
      @HiveField(14)
      @JsonKey(name: 'is_manufactured')
      final int? isManufactured,
      @HiveField(15) @JsonKey(name: 'buffered_stock') final int? bufferedStock,
      @HiveField(16) @JsonKey(name: 'category_name') final String? categoryName,
      @HiveField(17)
      @JsonKey(name: 'variant_groups')
      final List<String>? variantGroups,
      @HiveField(18) final List<VariantModel>? variant,
      @HiveField(19) final String? note,
      @HiveField(20) @JsonKey(name: 'price_ta') final int? priceTakeAway,
      @HiveField(21) @JsonKey(name: 'price_mp') final int? priceMarketPlace,
      @HiveField(22) @JsonKey(name: 'price_cus') final int? priceCustom,
      @HiveField(23) @JsonKey(name: 'price_type') final String? priceType,
      @HiveField(24)
      @JsonKey(name: 'barcode', includeIfNull: false)
      final String? barcode,
      @HiveField(25) @JsonKey(name: 'is_editable') final int? isEditable,
      @HiveField(26) final int? priceEdit,
      @HiveField(27) final bool? isPrinted,
      @HiveField(28)
      final List<ProductModel> productForChecker}) = _$ProductModelImpl;
  const _ProductModel._() : super._();

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @HiveField(2)
  String? get code;
  @override
  @HiveField(3)
  String? get sku;
  @override
  @HiveField(4)
  String? get name;
  @override
  @HiveField(5)
  int? get price;
  @override
  @HiveField(6)
  int? get cost;
  @override
  @HiveField(7)
  String? get unit;
  @override
  @HiveField(8)
  int? get quantity;
  @override
  @HiveField(9)
  @JsonKey(name: 'stock_alert')
  int? get stockAlert;
  @override
  @HiveField(10)
  int? get sell;
  @override
  @HiveField(11)
  String? get created;
  @override
  @HiveField(12)
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @HiveField(13)
  @JsonKey(name: 'is_variant')
  int? get isVariant;
  @override
  @HiveField(14)
  @JsonKey(name: 'is_manufactured')
  int? get isManufactured;
  @override
  @HiveField(15)
  @JsonKey(name: 'buffered_stock')
  int? get bufferedStock;
  @override
  @HiveField(16)
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @HiveField(17)
  @JsonKey(name: 'variant_groups')
  List<String>? get variantGroups;
  @override
  @HiveField(18)
  List<VariantModel>? get variant;
  @override
  @HiveField(19)
  String? get note;
  @override
  @HiveField(20)
  @JsonKey(name: 'price_ta')
  int? get priceTakeAway;
  @override
  @HiveField(21)
  @JsonKey(name: 'price_mp')
  int? get priceMarketPlace;
  @override
  @HiveField(22)
  @JsonKey(name: 'price_cus')
  int? get priceCustom;
  @override
  @HiveField(23)
  @JsonKey(name: 'price_type')
  String? get priceType;
  @override
  @HiveField(24)
  @JsonKey(name: 'barcode', includeIfNull: false)
  String? get barcode;
  @override
  @HiveField(25)
  @JsonKey(name: 'is_editable')
  int? get isEditable;
  @override
  @HiveField(26)
  int? get priceEdit;
  @override
  @HiveField(27)
  bool? get isPrinted;
  @override
  @HiveField(28)
  List<ProductModel> get productForChecker;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VariantModel _$VariantModelFromJson(Map<String, dynamic> json) {
  return _VariantModel.fromJson(json);
}

/// @nodoc
mixin _$VariantModel {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'varian_group')
  String? get varianGroup => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'varian_name')
  String? get varianName => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get sku => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'varian_price')
  @IntOrStringConverter()
  int? get varianPrice => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'single_pick')
  int? get singlePick => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'max_quantity')
  int? get maxQuantity => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'price_ta')
  int? get priceTakeAway => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'price_mp')
  int? get priceMarketPlace => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: 'price_cus')
  int? get priceCustom => throw _privateConstructorUsedError;

  /// Serializes this VariantModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VariantModelCopyWith<VariantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantModelCopyWith<$Res> {
  factory $VariantModelCopyWith(
          VariantModel value, $Res Function(VariantModel) then) =
      _$VariantModelCopyWithImpl<$Res, VariantModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) @JsonKey(name: 'product_id') int? productId,
      @HiveField(2) @JsonKey(name: 'varian_group') String? varianGroup,
      @HiveField(3) @JsonKey(name: 'varian_name') String? varianName,
      @HiveField(4) String? sku,
      @HiveField(5)
      @JsonKey(name: 'varian_price')
      @IntOrStringConverter()
      int? varianPrice,
      @HiveField(6) @JsonKey(name: 'single_pick') int? singlePick,
      @HiveField(7) @JsonKey(name: 'max_quantity') int? maxQuantity,
      @HiveField(8) @JsonKey(name: 'quantity') int? quantity,
      @HiveField(9) @JsonKey(name: 'note') String? note,
      @HiveField(10) @JsonKey(name: 'price_ta') int? priceTakeAway,
      @HiveField(11) @JsonKey(name: 'price_mp') int? priceMarketPlace,
      @HiveField(12) @JsonKey(name: 'price_cus') int? priceCustom});
}

/// @nodoc
class _$VariantModelCopyWithImpl<$Res, $Val extends VariantModel>
    implements $VariantModelCopyWith<$Res> {
  _$VariantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? varianGroup = freezed,
    Object? varianName = freezed,
    Object? sku = freezed,
    Object? varianPrice = freezed,
    Object? singlePick = freezed,
    Object? maxQuantity = freezed,
    Object? quantity = freezed,
    Object? note = freezed,
    Object? priceTakeAway = freezed,
    Object? priceMarketPlace = freezed,
    Object? priceCustom = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      varianGroup: freezed == varianGroup
          ? _value.varianGroup
          : varianGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      varianName: freezed == varianName
          ? _value.varianName
          : varianName // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      varianPrice: freezed == varianPrice
          ? _value.varianPrice
          : varianPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      singlePick: freezed == singlePick
          ? _value.singlePick
          : singlePick // ignore: cast_nullable_to_non_nullable
              as int?,
      maxQuantity: freezed == maxQuantity
          ? _value.maxQuantity
          : maxQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      priceTakeAway: freezed == priceTakeAway
          ? _value.priceTakeAway
          : priceTakeAway // ignore: cast_nullable_to_non_nullable
              as int?,
      priceMarketPlace: freezed == priceMarketPlace
          ? _value.priceMarketPlace
          : priceMarketPlace // ignore: cast_nullable_to_non_nullable
              as int?,
      priceCustom: freezed == priceCustom
          ? _value.priceCustom
          : priceCustom // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariantModelImplCopyWith<$Res>
    implements $VariantModelCopyWith<$Res> {
  factory _$$VariantModelImplCopyWith(
          _$VariantModelImpl value, $Res Function(_$VariantModelImpl) then) =
      __$$VariantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) @JsonKey(name: 'product_id') int? productId,
      @HiveField(2) @JsonKey(name: 'varian_group') String? varianGroup,
      @HiveField(3) @JsonKey(name: 'varian_name') String? varianName,
      @HiveField(4) String? sku,
      @HiveField(5)
      @JsonKey(name: 'varian_price')
      @IntOrStringConverter()
      int? varianPrice,
      @HiveField(6) @JsonKey(name: 'single_pick') int? singlePick,
      @HiveField(7) @JsonKey(name: 'max_quantity') int? maxQuantity,
      @HiveField(8) @JsonKey(name: 'quantity') int? quantity,
      @HiveField(9) @JsonKey(name: 'note') String? note,
      @HiveField(10) @JsonKey(name: 'price_ta') int? priceTakeAway,
      @HiveField(11) @JsonKey(name: 'price_mp') int? priceMarketPlace,
      @HiveField(12) @JsonKey(name: 'price_cus') int? priceCustom});
}

/// @nodoc
class __$$VariantModelImplCopyWithImpl<$Res>
    extends _$VariantModelCopyWithImpl<$Res, _$VariantModelImpl>
    implements _$$VariantModelImplCopyWith<$Res> {
  __$$VariantModelImplCopyWithImpl(
      _$VariantModelImpl _value, $Res Function(_$VariantModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productId = freezed,
    Object? varianGroup = freezed,
    Object? varianName = freezed,
    Object? sku = freezed,
    Object? varianPrice = freezed,
    Object? singlePick = freezed,
    Object? maxQuantity = freezed,
    Object? quantity = freezed,
    Object? note = freezed,
    Object? priceTakeAway = freezed,
    Object? priceMarketPlace = freezed,
    Object? priceCustom = freezed,
  }) {
    return _then(_$VariantModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      varianGroup: freezed == varianGroup
          ? _value.varianGroup
          : varianGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      varianName: freezed == varianName
          ? _value.varianName
          : varianName // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      varianPrice: freezed == varianPrice
          ? _value.varianPrice
          : varianPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      singlePick: freezed == singlePick
          ? _value.singlePick
          : singlePick // ignore: cast_nullable_to_non_nullable
              as int?,
      maxQuantity: freezed == maxQuantity
          ? _value.maxQuantity
          : maxQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      priceTakeAway: freezed == priceTakeAway
          ? _value.priceTakeAway
          : priceTakeAway // ignore: cast_nullable_to_non_nullable
              as int?,
      priceMarketPlace: freezed == priceMarketPlace
          ? _value.priceMarketPlace
          : priceMarketPlace // ignore: cast_nullable_to_non_nullable
              as int?,
      priceCustom: freezed == priceCustom
          ? _value.priceCustom
          : priceCustom // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 4, adapterName: 'VariantModelAdapter')
class _$VariantModelImpl extends _VariantModel with DiagnosticableTreeMixin {
  const _$VariantModelImpl(
      {@HiveField(0) this.id,
      @HiveField(1) @JsonKey(name: 'product_id') this.productId,
      @HiveField(2) @JsonKey(name: 'varian_group') this.varianGroup,
      @HiveField(3) @JsonKey(name: 'varian_name') this.varianName,
      @HiveField(4) this.sku,
      @HiveField(5)
      @JsonKey(name: 'varian_price')
      @IntOrStringConverter()
      this.varianPrice,
      @HiveField(6) @JsonKey(name: 'single_pick') this.singlePick,
      @HiveField(7) @JsonKey(name: 'max_quantity') this.maxQuantity,
      @HiveField(8) @JsonKey(name: 'quantity') this.quantity,
      @HiveField(9) @JsonKey(name: 'note') this.note,
      @HiveField(10) @JsonKey(name: 'price_ta') this.priceTakeAway,
      @HiveField(11) @JsonKey(name: 'price_mp') this.priceMarketPlace,
      @HiveField(12) @JsonKey(name: 'price_cus') this.priceCustom})
      : super._();

  factory _$VariantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariantModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  @JsonKey(name: 'product_id')
  final int? productId;
  @override
  @HiveField(2)
  @JsonKey(name: 'varian_group')
  final String? varianGroup;
  @override
  @HiveField(3)
  @JsonKey(name: 'varian_name')
  final String? varianName;
  @override
  @HiveField(4)
  final String? sku;
  @override
  @HiveField(5)
  @JsonKey(name: 'varian_price')
  @IntOrStringConverter()
  final int? varianPrice;
  @override
  @HiveField(6)
  @JsonKey(name: 'single_pick')
  final int? singlePick;
  @override
  @HiveField(7)
  @JsonKey(name: 'max_quantity')
  final int? maxQuantity;
  @override
  @HiveField(8)
  @JsonKey(name: 'quantity')
  final int? quantity;
  @override
  @HiveField(9)
  @JsonKey(name: 'note')
  final String? note;
  @override
  @HiveField(10)
  @JsonKey(name: 'price_ta')
  final int? priceTakeAway;
  @override
  @HiveField(11)
  @JsonKey(name: 'price_mp')
  final int? priceMarketPlace;
  @override
  @HiveField(12)
  @JsonKey(name: 'price_cus')
  final int? priceCustom;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VariantModel(id: $id, productId: $productId, varianGroup: $varianGroup, varianName: $varianName, sku: $sku, varianPrice: $varianPrice, singlePick: $singlePick, maxQuantity: $maxQuantity, quantity: $quantity, note: $note, priceTakeAway: $priceTakeAway, priceMarketPlace: $priceMarketPlace, priceCustom: $priceCustom)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VariantModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('productId', productId))
      ..add(DiagnosticsProperty('varianGroup', varianGroup))
      ..add(DiagnosticsProperty('varianName', varianName))
      ..add(DiagnosticsProperty('sku', sku))
      ..add(DiagnosticsProperty('varianPrice', varianPrice))
      ..add(DiagnosticsProperty('singlePick', singlePick))
      ..add(DiagnosticsProperty('maxQuantity', maxQuantity))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('priceTakeAway', priceTakeAway))
      ..add(DiagnosticsProperty('priceMarketPlace', priceMarketPlace))
      ..add(DiagnosticsProperty('priceCustom', priceCustom));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.varianGroup, varianGroup) ||
                other.varianGroup == varianGroup) &&
            (identical(other.varianName, varianName) ||
                other.varianName == varianName) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.varianPrice, varianPrice) ||
                other.varianPrice == varianPrice) &&
            (identical(other.singlePick, singlePick) ||
                other.singlePick == singlePick) &&
            (identical(other.maxQuantity, maxQuantity) ||
                other.maxQuantity == maxQuantity) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.priceTakeAway, priceTakeAway) ||
                other.priceTakeAway == priceTakeAway) &&
            (identical(other.priceMarketPlace, priceMarketPlace) ||
                other.priceMarketPlace == priceMarketPlace) &&
            (identical(other.priceCustom, priceCustom) ||
                other.priceCustom == priceCustom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      productId,
      varianGroup,
      varianName,
      sku,
      varianPrice,
      singlePick,
      maxQuantity,
      quantity,
      note,
      priceTakeAway,
      priceMarketPlace,
      priceCustom);

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantModelImplCopyWith<_$VariantModelImpl> get copyWith =>
      __$$VariantModelImplCopyWithImpl<_$VariantModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariantModelImplToJson(
      this,
    );
  }
}

abstract class _VariantModel extends VariantModel {
  const factory _VariantModel(
      {@HiveField(0) final int? id,
      @HiveField(1) @JsonKey(name: 'product_id') final int? productId,
      @HiveField(2) @JsonKey(name: 'varian_group') final String? varianGroup,
      @HiveField(3) @JsonKey(name: 'varian_name') final String? varianName,
      @HiveField(4) final String? sku,
      @HiveField(5)
      @JsonKey(name: 'varian_price')
      @IntOrStringConverter()
      final int? varianPrice,
      @HiveField(6) @JsonKey(name: 'single_pick') final int? singlePick,
      @HiveField(7) @JsonKey(name: 'max_quantity') final int? maxQuantity,
      @HiveField(8) @JsonKey(name: 'quantity') final int? quantity,
      @HiveField(9) @JsonKey(name: 'note') final String? note,
      @HiveField(10) @JsonKey(name: 'price_ta') final int? priceTakeAway,
      @HiveField(11) @JsonKey(name: 'price_mp') final int? priceMarketPlace,
      @HiveField(12)
      @JsonKey(name: 'price_cus')
      final int? priceCustom}) = _$VariantModelImpl;
  const _VariantModel._() : super._();

  factory _VariantModel.fromJson(Map<String, dynamic> json) =
      _$VariantModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'product_id')
  int? get productId;
  @override
  @HiveField(2)
  @JsonKey(name: 'varian_group')
  String? get varianGroup;
  @override
  @HiveField(3)
  @JsonKey(name: 'varian_name')
  String? get varianName;
  @override
  @HiveField(4)
  String? get sku;
  @override
  @HiveField(5)
  @JsonKey(name: 'varian_price')
  @IntOrStringConverter()
  int? get varianPrice;
  @override
  @HiveField(6)
  @JsonKey(name: 'single_pick')
  int? get singlePick;
  @override
  @HiveField(7)
  @JsonKey(name: 'max_quantity')
  int? get maxQuantity;
  @override
  @HiveField(8)
  @JsonKey(name: 'quantity')
  int? get quantity;
  @override
  @HiveField(9)
  @JsonKey(name: 'note')
  String? get note;
  @override
  @HiveField(10)
  @JsonKey(name: 'price_ta')
  int? get priceTakeAway;
  @override
  @HiveField(11)
  @JsonKey(name: 'price_mp')
  int? get priceMarketPlace;
  @override
  @HiveField(12)
  @JsonKey(name: 'price_cus')
  int? get priceCustom;

  /// Create a copy of VariantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VariantModelImplCopyWith<_$VariantModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
