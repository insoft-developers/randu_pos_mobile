// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_recap_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DailyRecapState {
  GeneralRequestModel? get request => throw _privateConstructorUsedError;
  List<DailyRecapModel>? get value => throw _privateConstructorUsedError;
  int? get lastPage => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  /// Create a copy of DailyRecapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyRecapStateCopyWith<DailyRecapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyRecapStateCopyWith<$Res> {
  factory $DailyRecapStateCopyWith(
          DailyRecapState value, $Res Function(DailyRecapState) then) =
      _$DailyRecapStateCopyWithImpl<$Res, DailyRecapState>;
  @useResult
  $Res call(
      {GeneralRequestModel? request,
      List<DailyRecapModel>? value,
      int? lastPage,
      DateTime? selectedDate,
      int page});

  $GeneralRequestModelCopyWith<$Res>? get request;
}

/// @nodoc
class _$DailyRecapStateCopyWithImpl<$Res, $Val extends DailyRecapState>
    implements $DailyRecapStateCopyWith<$Res> {
  _$DailyRecapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyRecapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = freezed,
    Object? value = freezed,
    Object? lastPage = freezed,
    Object? selectedDate = freezed,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GeneralRequestModel?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<DailyRecapModel>?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of DailyRecapState
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
abstract class _$$DailyRecapStateImplCopyWith<$Res>
    implements $DailyRecapStateCopyWith<$Res> {
  factory _$$DailyRecapStateImplCopyWith(_$DailyRecapStateImpl value,
          $Res Function(_$DailyRecapStateImpl) then) =
      __$$DailyRecapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GeneralRequestModel? request,
      List<DailyRecapModel>? value,
      int? lastPage,
      DateTime? selectedDate,
      int page});

  @override
  $GeneralRequestModelCopyWith<$Res>? get request;
}

/// @nodoc
class __$$DailyRecapStateImplCopyWithImpl<$Res>
    extends _$DailyRecapStateCopyWithImpl<$Res, _$DailyRecapStateImpl>
    implements _$$DailyRecapStateImplCopyWith<$Res> {
  __$$DailyRecapStateImplCopyWithImpl(
      _$DailyRecapStateImpl _value, $Res Function(_$DailyRecapStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyRecapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = freezed,
    Object? value = freezed,
    Object? lastPage = freezed,
    Object? selectedDate = freezed,
    Object? page = null,
  }) {
    return _then(_$DailyRecapStateImpl(
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as GeneralRequestModel?,
      value: freezed == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<DailyRecapModel>?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DailyRecapStateImpl extends _DailyRecapState {
  const _$DailyRecapStateImpl(
      {this.request,
      final List<DailyRecapModel>? value,
      this.lastPage,
      this.selectedDate,
      this.page = 1})
      : _value = value,
        super._();

  @override
  final GeneralRequestModel? request;
  final List<DailyRecapModel>? _value;
  @override
  List<DailyRecapModel>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? lastPage;
  @override
  final DateTime? selectedDate;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'DailyRecapState(request: $request, value: $value, lastPage: $lastPage, selectedDate: $selectedDate, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyRecapStateImpl &&
            (identical(other.request, request) || other.request == request) &&
            const DeepCollectionEquality().equals(other._value, _value) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      request,
      const DeepCollectionEquality().hash(_value),
      lastPage,
      selectedDate,
      page);

  /// Create a copy of DailyRecapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyRecapStateImplCopyWith<_$DailyRecapStateImpl> get copyWith =>
      __$$DailyRecapStateImplCopyWithImpl<_$DailyRecapStateImpl>(
          this, _$identity);
}

abstract class _DailyRecapState extends DailyRecapState {
  const factory _DailyRecapState(
      {final GeneralRequestModel? request,
      final List<DailyRecapModel>? value,
      final int? lastPage,
      final DateTime? selectedDate,
      final int page}) = _$DailyRecapStateImpl;
  const _DailyRecapState._() : super._();

  @override
  GeneralRequestModel? get request;
  @override
  List<DailyRecapModel>? get value;
  @override
  int? get lastPage;
  @override
  DateTime? get selectedDate;
  @override
  int get page;

  /// Create a copy of DailyRecapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyRecapStateImplCopyWith<_$DailyRecapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
