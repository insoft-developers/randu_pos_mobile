// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_customer_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetCustomerRequestModel _$GetCustomerRequestModelFromJson(
    Map<String, dynamic> json) {
  return _GetCustomerRequestModel.fromJson(json);
}

/// @nodoc
mixin _$GetCustomerRequestModel {
  @JsonKey(name: 'search')
  String? get search => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit')
  int? get limit => throw _privateConstructorUsedError;

  /// Serializes this GetCustomerRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetCustomerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetCustomerRequestModelCopyWith<GetCustomerRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCustomerRequestModelCopyWith<$Res> {
  factory $GetCustomerRequestModelCopyWith(GetCustomerRequestModel value,
          $Res Function(GetCustomerRequestModel) then) =
      _$GetCustomerRequestModelCopyWithImpl<$Res, GetCustomerRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'search') String? search,
      @JsonKey(name: 'page') int? page,
      @JsonKey(name: 'limit') int? limit});
}

/// @nodoc
class _$GetCustomerRequestModelCopyWithImpl<$Res,
        $Val extends GetCustomerRequestModel>
    implements $GetCustomerRequestModelCopyWith<$Res> {
  _$GetCustomerRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetCustomerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCustomerRequestModelImplCopyWith<$Res>
    implements $GetCustomerRequestModelCopyWith<$Res> {
  factory _$$GetCustomerRequestModelImplCopyWith(
          _$GetCustomerRequestModelImpl value,
          $Res Function(_$GetCustomerRequestModelImpl) then) =
      __$$GetCustomerRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'search') String? search,
      @JsonKey(name: 'page') int? page,
      @JsonKey(name: 'limit') int? limit});
}

/// @nodoc
class __$$GetCustomerRequestModelImplCopyWithImpl<$Res>
    extends _$GetCustomerRequestModelCopyWithImpl<$Res,
        _$GetCustomerRequestModelImpl>
    implements _$$GetCustomerRequestModelImplCopyWith<$Res> {
  __$$GetCustomerRequestModelImplCopyWithImpl(
      _$GetCustomerRequestModelImpl _value,
      $Res Function(_$GetCustomerRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetCustomerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$GetCustomerRequestModelImpl(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCustomerRequestModelImpl implements _GetCustomerRequestModel {
  const _$GetCustomerRequestModelImpl(
      {@JsonKey(name: 'search') this.search,
      @JsonKey(name: 'page') this.page,
      @JsonKey(name: 'limit') this.limit});

  factory _$GetCustomerRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCustomerRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'search')
  final String? search;
  @override
  @JsonKey(name: 'page')
  final int? page;
  @override
  @JsonKey(name: 'limit')
  final int? limit;

  @override
  String toString() {
    return 'GetCustomerRequestModel(search: $search, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCustomerRequestModelImpl &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, search, page, limit);

  /// Create a copy of GetCustomerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCustomerRequestModelImplCopyWith<_$GetCustomerRequestModelImpl>
      get copyWith => __$$GetCustomerRequestModelImplCopyWithImpl<
          _$GetCustomerRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCustomerRequestModelImplToJson(
      this,
    );
  }
}

abstract class _GetCustomerRequestModel implements GetCustomerRequestModel {
  const factory _GetCustomerRequestModel(
          {@JsonKey(name: 'search') final String? search,
          @JsonKey(name: 'page') final int? page,
          @JsonKey(name: 'limit') final int? limit}) =
      _$GetCustomerRequestModelImpl;

  factory _GetCustomerRequestModel.fromJson(Map<String, dynamic> json) =
      _$GetCustomerRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'search')
  String? get search;
  @override
  @JsonKey(name: 'page')
  int? get page;
  @override
  @JsonKey(name: 'limit')
  int? get limit;

  /// Create a copy of GetCustomerRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCustomerRequestModelImplCopyWith<_$GetCustomerRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
