// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_management_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionManagementState {
  List<TransactionManagementModel>? get value =>
      throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;
  int get page =>
      throw _privateConstructorUsedError; // @Default(0) int totalData,
  int get totalShowed => throw _privateConstructorUsedError;
  int? get transactionStatus => throw _privateConstructorUsedError;
  String? get selectedDateLabel => throw _privateConstructorUsedError;
  String? get selectedRange => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  GeneralRequestModel get request => throw _privateConstructorUsedError;

  /// Create a copy of TransactionManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionManagementStateCopyWith<TransactionManagementState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionManagementStateCopyWith<$Res> {
  factory $TransactionManagementStateCopyWith(TransactionManagementState value,
          $Res Function(TransactionManagementState) then) =
      _$TransactionManagementStateCopyWithImpl<$Res,
          TransactionManagementState>;
  @useResult
  $Res call(
      {List<TransactionManagementModel>? value,
      int lastPage,
      int page,
      int totalShowed,
      int? transactionStatus,
      String? selectedDateLabel,
      String? selectedRange,
      String? startDate,
      String? endDate,
      GeneralRequestModel request});

  $GeneralRequestModelCopyWith<$Res> get request;
}

/// @nodoc
class _$TransactionManagementStateCopyWithImpl<$Res,
        $Val extends TransactionManagementState>
    implements $TransactionManagementStateCopyWith<$Res> {
  _$TransactionManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? lastPage = null,
    Object? page = null,
    Object? totalShowed = null,
    Object? transactionStatus = freezed,
    Object? selectedDateLabel = freezed,
    Object? selectedRange = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? request = null,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<TransactionManagementModel>?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalShowed: null == totalShowed
          ? _value.totalShowed
          : totalShowed // ignore: cast_nullable_to_non_nullable
              as int,
      transactionStatus: freezed == transactionStatus
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedDateLabel: freezed == selectedDateLabel
          ? _value.selectedDateLabel
          : selectedDateLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedRange: freezed == selectedRange
          ? _value.selectedRange
          : selectedRange // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GeneralRequestModel,
    ) as $Val);
  }

  /// Create a copy of TransactionManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneralRequestModelCopyWith<$Res> get request {
    return $GeneralRequestModelCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionManagementStateImplCopyWith<$Res>
    implements $TransactionManagementStateCopyWith<$Res> {
  factory _$$TransactionManagementStateImplCopyWith(
          _$TransactionManagementStateImpl value,
          $Res Function(_$TransactionManagementStateImpl) then) =
      __$$TransactionManagementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionManagementModel>? value,
      int lastPage,
      int page,
      int totalShowed,
      int? transactionStatus,
      String? selectedDateLabel,
      String? selectedRange,
      String? startDate,
      String? endDate,
      GeneralRequestModel request});

  @override
  $GeneralRequestModelCopyWith<$Res> get request;
}

/// @nodoc
class __$$TransactionManagementStateImplCopyWithImpl<$Res>
    extends _$TransactionManagementStateCopyWithImpl<$Res,
        _$TransactionManagementStateImpl>
    implements _$$TransactionManagementStateImplCopyWith<$Res> {
  __$$TransactionManagementStateImplCopyWithImpl(
      _$TransactionManagementStateImpl _value,
      $Res Function(_$TransactionManagementStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? lastPage = null,
    Object? page = null,
    Object? totalShowed = null,
    Object? transactionStatus = freezed,
    Object? selectedDateLabel = freezed,
    Object? selectedRange = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? request = null,
  }) {
    return _then(_$TransactionManagementStateImpl(
      value: freezed == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<TransactionManagementModel>?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalShowed: null == totalShowed
          ? _value.totalShowed
          : totalShowed // ignore: cast_nullable_to_non_nullable
              as int,
      transactionStatus: freezed == transactionStatus
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedDateLabel: freezed == selectedDateLabel
          ? _value.selectedDateLabel
          : selectedDateLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedRange: freezed == selectedRange
          ? _value.selectedRange
          : selectedRange // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GeneralRequestModel,
    ));
  }
}

/// @nodoc

class _$TransactionManagementStateImpl extends _TransactionManagementState {
  const _$TransactionManagementStateImpl(
      {final List<TransactionManagementModel>? value,
      this.lastPage = 1,
      this.page = 1,
      this.totalShowed = 0,
      this.transactionStatus,
      this.selectedDateLabel,
      this.selectedRange,
      this.startDate,
      this.endDate,
      this.request = const GeneralRequestModel()})
      : _value = value,
        super._();

  final List<TransactionManagementModel>? _value;
  @override
  List<TransactionManagementModel>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int lastPage;
  @override
  @JsonKey()
  final int page;
// @Default(0) int totalData,
  @override
  @JsonKey()
  final int totalShowed;
  @override
  final int? transactionStatus;
  @override
  final String? selectedDateLabel;
  @override
  final String? selectedRange;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  @JsonKey()
  final GeneralRequestModel request;

  @override
  String toString() {
    return 'TransactionManagementState(value: $value, lastPage: $lastPage, page: $page, totalShowed: $totalShowed, transactionStatus: $transactionStatus, selectedDateLabel: $selectedDateLabel, selectedRange: $selectedRange, startDate: $startDate, endDate: $endDate, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionManagementStateImpl &&
            const DeepCollectionEquality().equals(other._value, _value) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalShowed, totalShowed) ||
                other.totalShowed == totalShowed) &&
            (identical(other.transactionStatus, transactionStatus) ||
                other.transactionStatus == transactionStatus) &&
            (identical(other.selectedDateLabel, selectedDateLabel) ||
                other.selectedDateLabel == selectedDateLabel) &&
            (identical(other.selectedRange, selectedRange) ||
                other.selectedRange == selectedRange) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_value),
      lastPage,
      page,
      totalShowed,
      transactionStatus,
      selectedDateLabel,
      selectedRange,
      startDate,
      endDate,
      request);

  /// Create a copy of TransactionManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionManagementStateImplCopyWith<_$TransactionManagementStateImpl>
      get copyWith => __$$TransactionManagementStateImplCopyWithImpl<
          _$TransactionManagementStateImpl>(this, _$identity);
}

abstract class _TransactionManagementState extends TransactionManagementState {
  const factory _TransactionManagementState(
      {final List<TransactionManagementModel>? value,
      final int lastPage,
      final int page,
      final int totalShowed,
      final int? transactionStatus,
      final String? selectedDateLabel,
      final String? selectedRange,
      final String? startDate,
      final String? endDate,
      final GeneralRequestModel request}) = _$TransactionManagementStateImpl;
  const _TransactionManagementState._() : super._();

  @override
  List<TransactionManagementModel>? get value;
  @override
  int get lastPage;
  @override
  int get page; // @Default(0) int totalData,
  @override
  int get totalShowed;
  @override
  int? get transactionStatus;
  @override
  String? get selectedDateLabel;
  @override
  String? get selectedRange;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  GeneralRequestModel get request;

  /// Create a copy of TransactionManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionManagementStateImplCopyWith<_$TransactionManagementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
