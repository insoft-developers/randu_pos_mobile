// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_selection_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentMethodSelectionState {
  PaymentMethodModel? get paymentMethod => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  double get totalPaid => throw _privateConstructorUsedError;
  List<BankModel> get subPaymentMethod => throw _privateConstructorUsedError;
  List<BankModel> get subSubPaymentMethod => throw _privateConstructorUsedError;
  BankModel? get selectedSubPaymentMethod => throw _privateConstructorUsedError;
  BankModel? get selectedSubSubPaymentMethod =>
      throw _privateConstructorUsedError;
  bool get isManualInput => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodSelectionStateCopyWith<PaymentMethodSelectionState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodSelectionStateCopyWith<$Res> {
  factory $PaymentMethodSelectionStateCopyWith(
          PaymentMethodSelectionState value,
          $Res Function(PaymentMethodSelectionState) then) =
      _$PaymentMethodSelectionStateCopyWithImpl<$Res,
          PaymentMethodSelectionState>;
  @useResult
  $Res call(
      {PaymentMethodModel? paymentMethod,
      double totalPrice,
      double totalPaid,
      List<BankModel> subPaymentMethod,
      List<BankModel> subSubPaymentMethod,
      BankModel? selectedSubPaymentMethod,
      BankModel? selectedSubSubPaymentMethod,
      bool isManualInput});

  $PaymentMethodModelCopyWith<$Res>? get paymentMethod;
  $BankModelCopyWith<$Res>? get selectedSubPaymentMethod;
  $BankModelCopyWith<$Res>? get selectedSubSubPaymentMethod;
}

/// @nodoc
class _$PaymentMethodSelectionStateCopyWithImpl<$Res,
        $Val extends PaymentMethodSelectionState>
    implements $PaymentMethodSelectionStateCopyWith<$Res> {
  _$PaymentMethodSelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethod = freezed,
    Object? totalPrice = null,
    Object? totalPaid = null,
    Object? subPaymentMethod = null,
    Object? subSubPaymentMethod = null,
    Object? selectedSubPaymentMethod = freezed,
    Object? selectedSubSubPaymentMethod = freezed,
    Object? isManualInput = null,
  }) {
    return _then(_value.copyWith(
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodModel?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPaid: null == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double,
      subPaymentMethod: null == subPaymentMethod
          ? _value.subPaymentMethod
          : subPaymentMethod // ignore: cast_nullable_to_non_nullable
              as List<BankModel>,
      subSubPaymentMethod: null == subSubPaymentMethod
          ? _value.subSubPaymentMethod
          : subSubPaymentMethod // ignore: cast_nullable_to_non_nullable
              as List<BankModel>,
      selectedSubPaymentMethod: freezed == selectedSubPaymentMethod
          ? _value.selectedSubPaymentMethod
          : selectedSubPaymentMethod // ignore: cast_nullable_to_non_nullable
              as BankModel?,
      selectedSubSubPaymentMethod: freezed == selectedSubSubPaymentMethod
          ? _value.selectedSubSubPaymentMethod
          : selectedSubSubPaymentMethod // ignore: cast_nullable_to_non_nullable
              as BankModel?,
      isManualInput: null == isManualInput
          ? _value.isManualInput
          : isManualInput // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of PaymentMethodSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodModelCopyWith<$Res>? get paymentMethod {
    if (_value.paymentMethod == null) {
      return null;
    }

    return $PaymentMethodModelCopyWith<$Res>(_value.paymentMethod!, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }

  /// Create a copy of PaymentMethodSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BankModelCopyWith<$Res>? get selectedSubPaymentMethod {
    if (_value.selectedSubPaymentMethod == null) {
      return null;
    }

    return $BankModelCopyWith<$Res>(_value.selectedSubPaymentMethod!, (value) {
      return _then(_value.copyWith(selectedSubPaymentMethod: value) as $Val);
    });
  }

  /// Create a copy of PaymentMethodSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BankModelCopyWith<$Res>? get selectedSubSubPaymentMethod {
    if (_value.selectedSubSubPaymentMethod == null) {
      return null;
    }

    return $BankModelCopyWith<$Res>(_value.selectedSubSubPaymentMethod!,
        (value) {
      return _then(_value.copyWith(selectedSubSubPaymentMethod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentMethodSelectionStateImplCopyWith<$Res>
    implements $PaymentMethodSelectionStateCopyWith<$Res> {
  factory _$$PaymentMethodSelectionStateImplCopyWith(
          _$PaymentMethodSelectionStateImpl value,
          $Res Function(_$PaymentMethodSelectionStateImpl) then) =
      __$$PaymentMethodSelectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentMethodModel? paymentMethod,
      double totalPrice,
      double totalPaid,
      List<BankModel> subPaymentMethod,
      List<BankModel> subSubPaymentMethod,
      BankModel? selectedSubPaymentMethod,
      BankModel? selectedSubSubPaymentMethod,
      bool isManualInput});

  @override
  $PaymentMethodModelCopyWith<$Res>? get paymentMethod;
  @override
  $BankModelCopyWith<$Res>? get selectedSubPaymentMethod;
  @override
  $BankModelCopyWith<$Res>? get selectedSubSubPaymentMethod;
}

/// @nodoc
class __$$PaymentMethodSelectionStateImplCopyWithImpl<$Res>
    extends _$PaymentMethodSelectionStateCopyWithImpl<$Res,
        _$PaymentMethodSelectionStateImpl>
    implements _$$PaymentMethodSelectionStateImplCopyWith<$Res> {
  __$$PaymentMethodSelectionStateImplCopyWithImpl(
      _$PaymentMethodSelectionStateImpl _value,
      $Res Function(_$PaymentMethodSelectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethodSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethod = freezed,
    Object? totalPrice = null,
    Object? totalPaid = null,
    Object? subPaymentMethod = null,
    Object? subSubPaymentMethod = null,
    Object? selectedSubPaymentMethod = freezed,
    Object? selectedSubSubPaymentMethod = freezed,
    Object? isManualInput = null,
  }) {
    return _then(_$PaymentMethodSelectionStateImpl(
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodModel?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPaid: null == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as double,
      subPaymentMethod: null == subPaymentMethod
          ? _value._subPaymentMethod
          : subPaymentMethod // ignore: cast_nullable_to_non_nullable
              as List<BankModel>,
      subSubPaymentMethod: null == subSubPaymentMethod
          ? _value._subSubPaymentMethod
          : subSubPaymentMethod // ignore: cast_nullable_to_non_nullable
              as List<BankModel>,
      selectedSubPaymentMethod: freezed == selectedSubPaymentMethod
          ? _value.selectedSubPaymentMethod
          : selectedSubPaymentMethod // ignore: cast_nullable_to_non_nullable
              as BankModel?,
      selectedSubSubPaymentMethod: freezed == selectedSubSubPaymentMethod
          ? _value.selectedSubSubPaymentMethod
          : selectedSubSubPaymentMethod // ignore: cast_nullable_to_non_nullable
              as BankModel?,
      isManualInput: null == isManualInput
          ? _value.isManualInput
          : isManualInput // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PaymentMethodSelectionStateImpl extends _PaymentMethodSelectionState {
  const _$PaymentMethodSelectionStateImpl(
      {this.paymentMethod,
      this.totalPrice = 0,
      this.totalPaid = 0,
      final List<BankModel> subPaymentMethod = const [],
      final List<BankModel> subSubPaymentMethod = const [],
      this.selectedSubPaymentMethod,
      this.selectedSubSubPaymentMethod,
      this.isManualInput = false})
      : _subPaymentMethod = subPaymentMethod,
        _subSubPaymentMethod = subSubPaymentMethod,
        super._();

  @override
  final PaymentMethodModel? paymentMethod;
  @override
  @JsonKey()
  final double totalPrice;
  @override
  @JsonKey()
  final double totalPaid;
  final List<BankModel> _subPaymentMethod;
  @override
  @JsonKey()
  List<BankModel> get subPaymentMethod {
    if (_subPaymentMethod is EqualUnmodifiableListView)
      return _subPaymentMethod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subPaymentMethod);
  }

  final List<BankModel> _subSubPaymentMethod;
  @override
  @JsonKey()
  List<BankModel> get subSubPaymentMethod {
    if (_subSubPaymentMethod is EqualUnmodifiableListView)
      return _subSubPaymentMethod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subSubPaymentMethod);
  }

  @override
  final BankModel? selectedSubPaymentMethod;
  @override
  final BankModel? selectedSubSubPaymentMethod;
  @override
  @JsonKey()
  final bool isManualInput;

  @override
  String toString() {
    return 'PaymentMethodSelectionState(paymentMethod: $paymentMethod, totalPrice: $totalPrice, totalPaid: $totalPaid, subPaymentMethod: $subPaymentMethod, subSubPaymentMethod: $subSubPaymentMethod, selectedSubPaymentMethod: $selectedSubPaymentMethod, selectedSubSubPaymentMethod: $selectedSubSubPaymentMethod, isManualInput: $isManualInput)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodSelectionStateImpl &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            const DeepCollectionEquality()
                .equals(other._subPaymentMethod, _subPaymentMethod) &&
            const DeepCollectionEquality()
                .equals(other._subSubPaymentMethod, _subSubPaymentMethod) &&
            (identical(
                    other.selectedSubPaymentMethod, selectedSubPaymentMethod) ||
                other.selectedSubPaymentMethod == selectedSubPaymentMethod) &&
            (identical(other.selectedSubSubPaymentMethod,
                    selectedSubSubPaymentMethod) ||
                other.selectedSubSubPaymentMethod ==
                    selectedSubSubPaymentMethod) &&
            (identical(other.isManualInput, isManualInput) ||
                other.isManualInput == isManualInput));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentMethod,
      totalPrice,
      totalPaid,
      const DeepCollectionEquality().hash(_subPaymentMethod),
      const DeepCollectionEquality().hash(_subSubPaymentMethod),
      selectedSubPaymentMethod,
      selectedSubSubPaymentMethod,
      isManualInput);

  /// Create a copy of PaymentMethodSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodSelectionStateImplCopyWith<_$PaymentMethodSelectionStateImpl>
      get copyWith => __$$PaymentMethodSelectionStateImplCopyWithImpl<
          _$PaymentMethodSelectionStateImpl>(this, _$identity);
}

abstract class _PaymentMethodSelectionState
    extends PaymentMethodSelectionState {
  const factory _PaymentMethodSelectionState(
      {final PaymentMethodModel? paymentMethod,
      final double totalPrice,
      final double totalPaid,
      final List<BankModel> subPaymentMethod,
      final List<BankModel> subSubPaymentMethod,
      final BankModel? selectedSubPaymentMethod,
      final BankModel? selectedSubSubPaymentMethod,
      final bool isManualInput}) = _$PaymentMethodSelectionStateImpl;
  const _PaymentMethodSelectionState._() : super._();

  @override
  PaymentMethodModel? get paymentMethod;
  @override
  double get totalPrice;
  @override
  double get totalPaid;
  @override
  List<BankModel> get subPaymentMethod;
  @override
  List<BankModel> get subSubPaymentMethod;
  @override
  BankModel? get selectedSubPaymentMethod;
  @override
  BankModel? get selectedSubSubPaymentMethod;
  @override
  bool get isManualInput;

  /// Create a copy of PaymentMethodSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodSelectionStateImplCopyWith<_$PaymentMethodSelectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
