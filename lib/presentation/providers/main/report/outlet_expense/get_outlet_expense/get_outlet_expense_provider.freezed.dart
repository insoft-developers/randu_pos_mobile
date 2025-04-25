// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_outlet_expense_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetOutletExpenseState {
  GeneralRequestModel? get request => throw _privateConstructorUsedError;
  List<OutletExpenseModel>? get value => throw _privateConstructorUsedError;
  int? get lastPage => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  String? get selectedMonth => throw _privateConstructorUsedError;
  String? get selectedYear => throw _privateConstructorUsedError;

  /// Create a copy of GetOutletExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetOutletExpenseStateCopyWith<GetOutletExpenseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOutletExpenseStateCopyWith<$Res> {
  factory $GetOutletExpenseStateCopyWith(GetOutletExpenseState value,
          $Res Function(GetOutletExpenseState) then) =
      _$GetOutletExpenseStateCopyWithImpl<$Res, GetOutletExpenseState>;
  @useResult
  $Res call(
      {GeneralRequestModel? request,
      List<OutletExpenseModel>? value,
      int? lastPage,
      int page,
      String? selectedMonth,
      String? selectedYear});

  $GeneralRequestModelCopyWith<$Res>? get request;
}

/// @nodoc
class _$GetOutletExpenseStateCopyWithImpl<$Res,
        $Val extends GetOutletExpenseState>
    implements $GetOutletExpenseStateCopyWith<$Res> {
  _$GetOutletExpenseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetOutletExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = freezed,
    Object? value = freezed,
    Object? lastPage = freezed,
    Object? page = null,
    Object? selectedMonth = freezed,
    Object? selectedYear = freezed,
  }) {
    return _then(_value.copyWith(
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GeneralRequestModel?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<OutletExpenseModel>?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      selectedMonth: freezed == selectedMonth
          ? _value.selectedMonth
          : selectedMonth // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedYear: freezed == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of GetOutletExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneralRequestModelCopyWith<$Res>? get request {
    if (_value.request == null) {
      return null;
    }

    return $GeneralRequestModelCopyWith<$Res>(_value.request!, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetOutletExpenseStateImplCopyWith<$Res>
    implements $GetOutletExpenseStateCopyWith<$Res> {
  factory _$$GetOutletExpenseStateImplCopyWith(
          _$GetOutletExpenseStateImpl value,
          $Res Function(_$GetOutletExpenseStateImpl) then) =
      __$$GetOutletExpenseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GeneralRequestModel? request,
      List<OutletExpenseModel>? value,
      int? lastPage,
      int page,
      String? selectedMonth,
      String? selectedYear});

  @override
  $GeneralRequestModelCopyWith<$Res>? get request;
}

/// @nodoc
class __$$GetOutletExpenseStateImplCopyWithImpl<$Res>
    extends _$GetOutletExpenseStateCopyWithImpl<$Res,
        _$GetOutletExpenseStateImpl>
    implements _$$GetOutletExpenseStateImplCopyWith<$Res> {
  __$$GetOutletExpenseStateImplCopyWithImpl(_$GetOutletExpenseStateImpl _value,
      $Res Function(_$GetOutletExpenseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetOutletExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = freezed,
    Object? value = freezed,
    Object? lastPage = freezed,
    Object? page = null,
    Object? selectedMonth = freezed,
    Object? selectedYear = freezed,
  }) {
    return _then(_$GetOutletExpenseStateImpl(
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GeneralRequestModel?,
      value: freezed == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<OutletExpenseModel>?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      selectedMonth: freezed == selectedMonth
          ? _value.selectedMonth
          : selectedMonth // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedYear: freezed == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetOutletExpenseStateImpl extends _GetOutletExpenseState {
  const _$GetOutletExpenseStateImpl(
      {this.request,
      final List<OutletExpenseModel>? value,
      this.lastPage,
      this.page = 1,
      this.selectedMonth,
      this.selectedYear})
      : _value = value,
        super._();

  @override
  final GeneralRequestModel? request;
  final List<OutletExpenseModel>? _value;
  @override
  List<OutletExpenseModel>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? lastPage;
  @override
  @JsonKey()
  final int page;
  @override
  final String? selectedMonth;
  @override
  final String? selectedYear;

  @override
  String toString() {
    return 'GetOutletExpenseState(request: $request, value: $value, lastPage: $lastPage, page: $page, selectedMonth: $selectedMonth, selectedYear: $selectedYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOutletExpenseStateImpl &&
            (identical(other.request, request) || other.request == request) &&
            const DeepCollectionEquality().equals(other._value, _value) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.selectedMonth, selectedMonth) ||
                other.selectedMonth == selectedMonth) &&
            (identical(other.selectedYear, selectedYear) ||
                other.selectedYear == selectedYear));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      request,
      const DeepCollectionEquality().hash(_value),
      lastPage,
      page,
      selectedMonth,
      selectedYear);

  /// Create a copy of GetOutletExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOutletExpenseStateImplCopyWith<_$GetOutletExpenseStateImpl>
      get copyWith => __$$GetOutletExpenseStateImplCopyWithImpl<
          _$GetOutletExpenseStateImpl>(this, _$identity);
}

abstract class _GetOutletExpenseState extends GetOutletExpenseState {
  const factory _GetOutletExpenseState(
      {final GeneralRequestModel? request,
      final List<OutletExpenseModel>? value,
      final int? lastPage,
      final int page,
      final String? selectedMonth,
      final String? selectedYear}) = _$GetOutletExpenseStateImpl;
  const _GetOutletExpenseState._() : super._();

  @override
  GeneralRequestModel? get request;
  @override
  List<OutletExpenseModel>? get value;
  @override
  int? get lastPage;
  @override
  int get page;
  @override
  String? get selectedMonth;
  @override
  String? get selectedYear;

  /// Create a copy of GetOutletExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetOutletExpenseStateImplCopyWith<_$GetOutletExpenseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
