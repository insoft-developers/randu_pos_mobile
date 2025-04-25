// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeneralResponse<T> _$GeneralResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _GeneralResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$GeneralResponse<T> {
  bool get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  /// Serializes this GeneralResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of GeneralResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneralResponseCopyWith<T, GeneralResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralResponseCopyWith<T, $Res> {
  factory $GeneralResponseCopyWith(
          GeneralResponse<T> value, $Res Function(GeneralResponse<T>) then) =
      _$GeneralResponseCopyWithImpl<T, $Res, GeneralResponse<T>>;
  @useResult
  $Res call({bool status, String? message, T? data});
}

/// @nodoc
class _$GeneralResponseCopyWithImpl<T, $Res, $Val extends GeneralResponse<T>>
    implements $GeneralResponseCopyWith<T, $Res> {
  _$GeneralResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneralResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneralResponseImplCopyWith<T, $Res>
    implements $GeneralResponseCopyWith<T, $Res> {
  factory _$$GeneralResponseImplCopyWith(_$GeneralResponseImpl<T> value,
          $Res Function(_$GeneralResponseImpl<T>) then) =
      __$$GeneralResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool status, String? message, T? data});
}

/// @nodoc
class __$$GeneralResponseImplCopyWithImpl<T, $Res>
    extends _$GeneralResponseCopyWithImpl<T, $Res, _$GeneralResponseImpl<T>>
    implements _$$GeneralResponseImplCopyWith<T, $Res> {
  __$$GeneralResponseImplCopyWithImpl(_$GeneralResponseImpl<T> _value,
      $Res Function(_$GeneralResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of GeneralResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GeneralResponseImpl<T>(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$GeneralResponseImpl<T> implements _GeneralResponse<T> {
  const _$GeneralResponseImpl({required this.status, this.message, this.data});

  factory _$GeneralResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$GeneralResponseImplFromJson(json, fromJsonT);

  @override
  final bool status;
  @override
  final String? message;
  @override
  final T? data;

  @override
  String toString() {
    return 'GeneralResponse<$T>(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralResponseImpl<T> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(data));

  /// Create a copy of GeneralResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralResponseImplCopyWith<T, _$GeneralResponseImpl<T>> get copyWith =>
      __$$GeneralResponseImplCopyWithImpl<T, _$GeneralResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$GeneralResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _GeneralResponse<T> implements GeneralResponse<T> {
  const factory _GeneralResponse(
      {required final bool status,
      final String? message,
      final T? data}) = _$GeneralResponseImpl<T>;

  factory _GeneralResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$GeneralResponseImpl<T>.fromJson;

  @override
  bool get status;
  @override
  String? get message;
  @override
  T? get data;

  /// Create a copy of GeneralResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralResponseImplCopyWith<T, _$GeneralResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
