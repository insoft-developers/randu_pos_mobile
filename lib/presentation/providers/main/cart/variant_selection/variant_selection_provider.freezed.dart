// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variant_selection_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VariantSelectionState {
  List<VariantModel> get selectedSinglePickVariants =>
      throw _privateConstructorUsedError;
  Map<VariantModel, int> get multiPickQuantities =>
      throw _privateConstructorUsedError;
  ProductModel get product => throw _privateConstructorUsedError;
  int get productQuantity => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  Map<int, String> get variantComments => throw _privateConstructorUsedError;

  /// Create a copy of VariantSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VariantSelectionStateCopyWith<VariantSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantSelectionStateCopyWith<$Res> {
  factory $VariantSelectionStateCopyWith(VariantSelectionState value,
          $Res Function(VariantSelectionState) then) =
      _$VariantSelectionStateCopyWithImpl<$Res, VariantSelectionState>;
  @useResult
  $Res call(
      {List<VariantModel> selectedSinglePickVariants,
      Map<VariantModel, int> multiPickQuantities,
      ProductModel product,
      int productQuantity,
      String note,
      Map<int, String> variantComments});

  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$VariantSelectionStateCopyWithImpl<$Res,
        $Val extends VariantSelectionState>
    implements $VariantSelectionStateCopyWith<$Res> {
  _$VariantSelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VariantSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSinglePickVariants = null,
    Object? multiPickQuantities = null,
    Object? product = null,
    Object? productQuantity = null,
    Object? note = null,
    Object? variantComments = null,
  }) {
    return _then(_value.copyWith(
      selectedSinglePickVariants: null == selectedSinglePickVariants
          ? _value.selectedSinglePickVariants
          : selectedSinglePickVariants // ignore: cast_nullable_to_non_nullable
              as List<VariantModel>,
      multiPickQuantities: null == multiPickQuantities
          ? _value.multiPickQuantities
          : multiPickQuantities // ignore: cast_nullable_to_non_nullable
              as Map<VariantModel, int>,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      productQuantity: null == productQuantity
          ? _value.productQuantity
          : productQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      variantComments: null == variantComments
          ? _value.variantComments
          : variantComments // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ) as $Val);
  }

  /// Create a copy of VariantSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VariantSelectionStateImplCopyWith<$Res>
    implements $VariantSelectionStateCopyWith<$Res> {
  factory _$$VariantSelectionStateImplCopyWith(
          _$VariantSelectionStateImpl value,
          $Res Function(_$VariantSelectionStateImpl) then) =
      __$$VariantSelectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<VariantModel> selectedSinglePickVariants,
      Map<VariantModel, int> multiPickQuantities,
      ProductModel product,
      int productQuantity,
      String note,
      Map<int, String> variantComments});

  @override
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$VariantSelectionStateImplCopyWithImpl<$Res>
    extends _$VariantSelectionStateCopyWithImpl<$Res,
        _$VariantSelectionStateImpl>
    implements _$$VariantSelectionStateImplCopyWith<$Res> {
  __$$VariantSelectionStateImplCopyWithImpl(_$VariantSelectionStateImpl _value,
      $Res Function(_$VariantSelectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VariantSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSinglePickVariants = null,
    Object? multiPickQuantities = null,
    Object? product = null,
    Object? productQuantity = null,
    Object? note = null,
    Object? variantComments = null,
  }) {
    return _then(_$VariantSelectionStateImpl(
      selectedSinglePickVariants: null == selectedSinglePickVariants
          ? _value._selectedSinglePickVariants
          : selectedSinglePickVariants // ignore: cast_nullable_to_non_nullable
              as List<VariantModel>,
      multiPickQuantities: null == multiPickQuantities
          ? _value._multiPickQuantities
          : multiPickQuantities // ignore: cast_nullable_to_non_nullable
              as Map<VariantModel, int>,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      productQuantity: null == productQuantity
          ? _value.productQuantity
          : productQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      variantComments: null == variantComments
          ? _value._variantComments
          : variantComments // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ));
  }
}

/// @nodoc

class _$VariantSelectionStateImpl implements _VariantSelectionState {
  const _$VariantSelectionStateImpl(
      {required final List<VariantModel> selectedSinglePickVariants,
      required final Map<VariantModel, int> multiPickQuantities,
      required this.product,
      this.productQuantity = 1,
      this.note = '',
      final Map<int, String> variantComments = const {}})
      : _selectedSinglePickVariants = selectedSinglePickVariants,
        _multiPickQuantities = multiPickQuantities,
        _variantComments = variantComments;

  final List<VariantModel> _selectedSinglePickVariants;
  @override
  List<VariantModel> get selectedSinglePickVariants {
    if (_selectedSinglePickVariants is EqualUnmodifiableListView)
      return _selectedSinglePickVariants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedSinglePickVariants);
  }

  final Map<VariantModel, int> _multiPickQuantities;
  @override
  Map<VariantModel, int> get multiPickQuantities {
    if (_multiPickQuantities is EqualUnmodifiableMapView)
      return _multiPickQuantities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_multiPickQuantities);
  }

  @override
  final ProductModel product;
  @override
  @JsonKey()
  final int productQuantity;
  @override
  @JsonKey()
  final String note;
  final Map<int, String> _variantComments;
  @override
  @JsonKey()
  Map<int, String> get variantComments {
    if (_variantComments is EqualUnmodifiableMapView) return _variantComments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_variantComments);
  }

  @override
  String toString() {
    return 'VariantSelectionState(selectedSinglePickVariants: $selectedSinglePickVariants, multiPickQuantities: $multiPickQuantities, product: $product, productQuantity: $productQuantity, note: $note, variantComments: $variantComments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantSelectionStateImpl &&
            const DeepCollectionEquality().equals(
                other._selectedSinglePickVariants,
                _selectedSinglePickVariants) &&
            const DeepCollectionEquality()
                .equals(other._multiPickQuantities, _multiPickQuantities) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productQuantity, productQuantity) ||
                other.productQuantity == productQuantity) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality()
                .equals(other._variantComments, _variantComments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedSinglePickVariants),
      const DeepCollectionEquality().hash(_multiPickQuantities),
      product,
      productQuantity,
      note,
      const DeepCollectionEquality().hash(_variantComments));

  /// Create a copy of VariantSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantSelectionStateImplCopyWith<_$VariantSelectionStateImpl>
      get copyWith => __$$VariantSelectionStateImplCopyWithImpl<
          _$VariantSelectionStateImpl>(this, _$identity);
}

abstract class _VariantSelectionState implements VariantSelectionState {
  const factory _VariantSelectionState(
      {required final List<VariantModel> selectedSinglePickVariants,
      required final Map<VariantModel, int> multiPickQuantities,
      required final ProductModel product,
      final int productQuantity,
      final String note,
      final Map<int, String> variantComments}) = _$VariantSelectionStateImpl;

  @override
  List<VariantModel> get selectedSinglePickVariants;
  @override
  Map<VariantModel, int> get multiPickQuantities;
  @override
  ProductModel get product;
  @override
  int get productQuantity;
  @override
  String get note;
  @override
  Map<int, String> get variantComments;

  /// Create a copy of VariantSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VariantSelectionStateImplCopyWith<_$VariantSelectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
