// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discounts_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiscountsRequestModel _$DiscountsRequestModelFromJson(
    Map<String, dynamic> json) {
  return _DiscountsRequestModel.fromJson(json);
}

/// @nodoc
mixin _$DiscountsRequestModel {
  String? get search => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  String? get groupBy => throw _privateConstructorUsedError;
  bool? get all => throw _privateConstructorUsedError;

  /// Serializes this DiscountsRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscountsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountsRequestModelCopyWith<DiscountsRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountsRequestModelCopyWith<$Res> {
  factory $DiscountsRequestModelCopyWith(DiscountsRequestModel value,
          $Res Function(DiscountsRequestModel) then) =
      _$DiscountsRequestModelCopyWithImpl<$Res, DiscountsRequestModel>;
  @useResult
  $Res call({String? search, int? perPage, String? groupBy, bool? all});
}

/// @nodoc
class _$DiscountsRequestModelCopyWithImpl<$Res,
        $Val extends DiscountsRequestModel>
    implements $DiscountsRequestModelCopyWith<$Res> {
  _$DiscountsRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscountsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? perPage = freezed,
    Object? groupBy = freezed,
    Object? all = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscountsRequestModelImplCopyWith<$Res>
    implements $DiscountsRequestModelCopyWith<$Res> {
  factory _$$DiscountsRequestModelImplCopyWith(
          _$DiscountsRequestModelImpl value,
          $Res Function(_$DiscountsRequestModelImpl) then) =
      __$$DiscountsRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? search, int? perPage, String? groupBy, bool? all});
}

/// @nodoc
class __$$DiscountsRequestModelImplCopyWithImpl<$Res>
    extends _$DiscountsRequestModelCopyWithImpl<$Res,
        _$DiscountsRequestModelImpl>
    implements _$$DiscountsRequestModelImplCopyWith<$Res> {
  __$$DiscountsRequestModelImplCopyWithImpl(_$DiscountsRequestModelImpl _value,
      $Res Function(_$DiscountsRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiscountsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? perPage = freezed,
    Object? groupBy = freezed,
    Object? all = freezed,
  }) {
    return _then(_$DiscountsRequestModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountsRequestModelImpl implements _DiscountsRequestModel {
  const _$DiscountsRequestModelImpl(
      {this.search, this.perPage, this.groupBy, this.all});

  factory _$DiscountsRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountsRequestModelImplFromJson(json);

  @override
  final String? search;
  @override
  final int? perPage;
  @override
  final String? groupBy;
  @override
  final bool? all;

  @override
  String toString() {
    return 'DiscountsRequestModel(search: $search, perPage: $perPage, groupBy: $groupBy, all: $all)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountsRequestModelImpl &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.groupBy, groupBy) || other.groupBy == groupBy) &&
            (identical(other.all, all) || other.all == all));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, search, perPage, groupBy, all);

  /// Create a copy of DiscountsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountsRequestModelImplCopyWith<_$DiscountsRequestModelImpl>
      get copyWith => __$$DiscountsRequestModelImplCopyWithImpl<
          _$DiscountsRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountsRequestModelImplToJson(
      this,
    );
  }
}

abstract class _DiscountsRequestModel implements DiscountsRequestModel {
  const factory _DiscountsRequestModel(
      {final String? search,
      final int? perPage,
      final String? groupBy,
      final bool? all}) = _$DiscountsRequestModelImpl;

  factory _DiscountsRequestModel.fromJson(Map<String, dynamic> json) =
      _$DiscountsRequestModelImpl.fromJson;

  @override
  String? get search;
  @override
  int? get perPage;
  @override
  String? get groupBy;
  @override
  bool? get all;

  /// Create a copy of DiscountsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountsRequestModelImplCopyWith<_$DiscountsRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
