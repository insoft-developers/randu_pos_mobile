// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductsRequestModel _$ProductsRequestModelFromJson(Map<String, dynamic> json) {
  return _ProductsRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ProductsRequestModel {
  String? get search => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_by')
  String? get groupBy => throw _privateConstructorUsedError;
  bool? get all => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;

  /// Serializes this ProductsRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsRequestModelCopyWith<ProductsRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsRequestModelCopyWith<$Res> {
  factory $ProductsRequestModelCopyWith(ProductsRequestModel value,
          $Res Function(ProductsRequestModel) then) =
      _$ProductsRequestModelCopyWithImpl<$Res, ProductsRequestModel>;
  @useResult
  $Res call(
      {String? search,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'page') int? page,
      @JsonKey(name: 'group_by') String? groupBy,
      bool? all,
      @JsonKey(name: 'category_id') int? categoryId});
}

/// @nodoc
class _$ProductsRequestModelCopyWithImpl<$Res,
        $Val extends ProductsRequestModel>
    implements $ProductsRequestModelCopyWith<$Res> {
  _$ProductsRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? perPage = freezed,
    Object? page = freezed,
    Object? groupBy = freezed,
    Object? all = freezed,
    Object? categoryId = freezed,
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
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      groupBy: freezed == groupBy
          ? _value.groupBy
          : groupBy // ignore: cast_nullable_to_non_nullable
              as String?,
      all: freezed == all
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as bool?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsRequestModelImplCopyWith<$Res>
    implements $ProductsRequestModelCopyWith<$Res> {
  factory _$$ProductsRequestModelImplCopyWith(_$ProductsRequestModelImpl value,
          $Res Function(_$ProductsRequestModelImpl) then) =
      __$$ProductsRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? search,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'page') int? page,
      @JsonKey(name: 'group_by') String? groupBy,
      bool? all,
      @JsonKey(name: 'category_id') int? categoryId});
}

/// @nodoc
class __$$ProductsRequestModelImplCopyWithImpl<$Res>
    extends _$ProductsRequestModelCopyWithImpl<$Res, _$ProductsRequestModelImpl>
    implements _$$ProductsRequestModelImplCopyWith<$Res> {
  __$$ProductsRequestModelImplCopyWithImpl(_$ProductsRequestModelImpl _value,
      $Res Function(_$ProductsRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? perPage = freezed,
    Object? page = freezed,
    Object? groupBy = freezed,
    Object? all = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_$ProductsRequestModelImpl(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      groupBy: freezed == groupBy
          ? _value.groupBy
          : groupBy // ignore: cast_nullable_to_non_nullable
              as String?,
      all: freezed == all
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as bool?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsRequestModelImpl implements _ProductsRequestModel {
  const _$ProductsRequestModelImpl(
      {this.search,
      @JsonKey(name: 'per_page') this.perPage,
      @JsonKey(name: 'page') this.page,
      @JsonKey(name: 'group_by') this.groupBy,
      this.all,
      @JsonKey(name: 'category_id') this.categoryId});

  factory _$ProductsRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsRequestModelImplFromJson(json);

  @override
  final String? search;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  @JsonKey(name: 'page')
  final int? page;
  @override
  @JsonKey(name: 'group_by')
  final String? groupBy;
  @override
  final bool? all;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;

  @override
  String toString() {
    return 'ProductsRequestModel(search: $search, perPage: $perPage, page: $page, groupBy: $groupBy, all: $all, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsRequestModelImpl &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.groupBy, groupBy) || other.groupBy == groupBy) &&
            (identical(other.all, all) || other.all == all) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, search, perPage, page, groupBy, all, categoryId);

  /// Create a copy of ProductsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsRequestModelImplCopyWith<_$ProductsRequestModelImpl>
      get copyWith =>
          __$$ProductsRequestModelImplCopyWithImpl<_$ProductsRequestModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ProductsRequestModel implements ProductsRequestModel {
  const factory _ProductsRequestModel(
          {final String? search,
          @JsonKey(name: 'per_page') final int? perPage,
          @JsonKey(name: 'page') final int? page,
          @JsonKey(name: 'group_by') final String? groupBy,
          final bool? all,
          @JsonKey(name: 'category_id') final int? categoryId}) =
      _$ProductsRequestModelImpl;

  factory _ProductsRequestModel.fromJson(Map<String, dynamic> json) =
      _$ProductsRequestModelImpl.fromJson;

  @override
  String? get search;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(name: 'page')
  int? get page;
  @override
  @JsonKey(name: 'group_by')
  String? get groupBy;
  @override
  bool? get all;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;

  /// Create a copy of ProductsRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsRequestModelImplCopyWith<_$ProductsRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
