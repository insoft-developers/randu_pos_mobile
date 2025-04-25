// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeneralRequestModel _$GeneralRequestModelFromJson(Map<String, dynamic> json) {
  return _GeneralRequestModel.fromJson(json);
}

/// @nodoc
mixin _$GeneralRequestModel {
  String? get search => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_by')
  String? get groupBy => throw _privateConstructorUsedError;
  bool? get all => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get bulan => throw _privateConstructorUsedError;
  String? get tahun => throw _privateConstructorUsedError;
  @JsonKey(name: 'selected_range')
  String? get selectedRange => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_status')
  int? get transactionStatus => throw _privateConstructorUsedError;

  /// Serializes this GeneralRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeneralRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneralRequestModelCopyWith<GeneralRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralRequestModelCopyWith<$Res> {
  factory $GeneralRequestModelCopyWith(
          GeneralRequestModel value, $Res Function(GeneralRequestModel) then) =
      _$GeneralRequestModelCopyWithImpl<$Res, GeneralRequestModel>;
  @useResult
  $Res call(
      {String? search,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'group_by') String? groupBy,
      bool? all,
      int? page,
      String? date,
      String? bulan,
      String? tahun,
      @JsonKey(name: 'selected_range') String? selectedRange,
      String? endDate,
      String? startDate,
      @JsonKey(name: 'transaction_status') int? transactionStatus});
}

/// @nodoc
class _$GeneralRequestModelCopyWithImpl<$Res, $Val extends GeneralRequestModel>
    implements $GeneralRequestModelCopyWith<$Res> {
  _$GeneralRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneralRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? perPage = freezed,
    Object? groupBy = freezed,
    Object? all = freezed,
    Object? page = freezed,
    Object? date = freezed,
    Object? bulan = freezed,
    Object? tahun = freezed,
    Object? selectedRange = freezed,
    Object? endDate = freezed,
    Object? startDate = freezed,
    Object? transactionStatus = freezed,
  }) {
    return _then(_value.copyWith(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      groupBy: freezed == groupBy
          ? _value.groupBy
          : groupBy // ignore: cast_nullable_to_non_nullable
              as String?,
      all: freezed == all
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      bulan: freezed == bulan
          ? _value.bulan
          : bulan // ignore: cast_nullable_to_non_nullable
              as String?,
      tahun: freezed == tahun
          ? _value.tahun
          : tahun // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedRange: freezed == selectedRange
          ? _value.selectedRange
          : selectedRange // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionStatus: freezed == transactionStatus
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneralRequestModelImplCopyWith<$Res>
    implements $GeneralRequestModelCopyWith<$Res> {
  factory _$$GeneralRequestModelImplCopyWith(_$GeneralRequestModelImpl value,
          $Res Function(_$GeneralRequestModelImpl) then) =
      __$$GeneralRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? search,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'group_by') String? groupBy,
      bool? all,
      int? page,
      String? date,
      String? bulan,
      String? tahun,
      @JsonKey(name: 'selected_range') String? selectedRange,
      String? endDate,
      String? startDate,
      @JsonKey(name: 'transaction_status') int? transactionStatus});
}

/// @nodoc
class __$$GeneralRequestModelImplCopyWithImpl<$Res>
    extends _$GeneralRequestModelCopyWithImpl<$Res, _$GeneralRequestModelImpl>
    implements _$$GeneralRequestModelImplCopyWith<$Res> {
  __$$GeneralRequestModelImplCopyWithImpl(_$GeneralRequestModelImpl _value,
      $Res Function(_$GeneralRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneralRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? perPage = freezed,
    Object? groupBy = freezed,
    Object? all = freezed,
    Object? page = freezed,
    Object? date = freezed,
    Object? bulan = freezed,
    Object? tahun = freezed,
    Object? selectedRange = freezed,
    Object? endDate = freezed,
    Object? startDate = freezed,
    Object? transactionStatus = freezed,
  }) {
    return _then(_$GeneralRequestModelImpl(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      groupBy: freezed == groupBy
          ? _value.groupBy
          : groupBy // ignore: cast_nullable_to_non_nullable
              as String?,
      all: freezed == all
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      bulan: freezed == bulan
          ? _value.bulan
          : bulan // ignore: cast_nullable_to_non_nullable
              as String?,
      tahun: freezed == tahun
          ? _value.tahun
          : tahun // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedRange: freezed == selectedRange
          ? _value.selectedRange
          : selectedRange // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionStatus: freezed == transactionStatus
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$GeneralRequestModelImpl implements _GeneralRequestModel {
  const _$GeneralRequestModelImpl(
      {this.search,
      @JsonKey(name: 'per_page') this.perPage,
      @JsonKey(name: 'group_by') this.groupBy,
      this.all,
      this.page,
      this.date,
      this.bulan,
      this.tahun,
      @JsonKey(name: 'selected_range') this.selectedRange,
      this.endDate,
      this.startDate,
      @JsonKey(name: 'transaction_status') this.transactionStatus});

  factory _$GeneralRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneralRequestModelImplFromJson(json);

  @override
  final String? search;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  @JsonKey(name: 'group_by')
  final String? groupBy;
  @override
  final bool? all;
  @override
  final int? page;
  @override
  final String? date;
  @override
  final String? bulan;
  @override
  final String? tahun;
  @override
  @JsonKey(name: 'selected_range')
  final String? selectedRange;
  @override
  final String? endDate;
  @override
  final String? startDate;
  @override
  @JsonKey(name: 'transaction_status')
  final int? transactionStatus;

  @override
  String toString() {
    return 'GeneralRequestModel(search: $search, perPage: $perPage, groupBy: $groupBy, all: $all, page: $page, date: $date, bulan: $bulan, tahun: $tahun, selectedRange: $selectedRange, endDate: $endDate, startDate: $startDate, transactionStatus: $transactionStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralRequestModelImpl &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.groupBy, groupBy) || other.groupBy == groupBy) &&
            (identical(other.all, all) || other.all == all) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.bulan, bulan) || other.bulan == bulan) &&
            (identical(other.tahun, tahun) || other.tahun == tahun) &&
            (identical(other.selectedRange, selectedRange) ||
                other.selectedRange == selectedRange) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.transactionStatus, transactionStatus) ||
                other.transactionStatus == transactionStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      search,
      perPage,
      groupBy,
      all,
      page,
      date,
      bulan,
      tahun,
      selectedRange,
      endDate,
      startDate,
      transactionStatus);

  /// Create a copy of GeneralRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralRequestModelImplCopyWith<_$GeneralRequestModelImpl> get copyWith =>
      __$$GeneralRequestModelImplCopyWithImpl<_$GeneralRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralRequestModelImplToJson(
      this,
    );
  }
}

abstract class _GeneralRequestModel implements GeneralRequestModel {
  const factory _GeneralRequestModel(
          {final String? search,
          @JsonKey(name: 'per_page') final int? perPage,
          @JsonKey(name: 'group_by') final String? groupBy,
          final bool? all,
          final int? page,
          final String? date,
          final String? bulan,
          final String? tahun,
          @JsonKey(name: 'selected_range') final String? selectedRange,
          final String? endDate,
          final String? startDate,
          @JsonKey(name: 'transaction_status') final int? transactionStatus}) =
      _$GeneralRequestModelImpl;

  factory _GeneralRequestModel.fromJson(Map<String, dynamic> json) =
      _$GeneralRequestModelImpl.fromJson;

  @override
  String? get search;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(name: 'group_by')
  String? get groupBy;
  @override
  bool? get all;
  @override
  int? get page;
  @override
  String? get date;
  @override
  String? get bulan;
  @override
  String? get tahun;
  @override
  @JsonKey(name: 'selected_range')
  String? get selectedRange;
  @override
  String? get endDate;
  @override
  String? get startDate;
  @override
  @JsonKey(name: 'transaction_status')
  int? get transactionStatus;

  /// Create a copy of GeneralRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralRequestModelImplCopyWith<_$GeneralRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
