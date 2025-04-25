// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_attendance_param_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AttendanceParamState {
  String? get type => throw _privateConstructorUsedError;
  ResponseState? get statePhoto => throw _privateConstructorUsedError;
  XFile? get attachment => throw _privateConstructorUsedError;
  ResponseState? get stateLocation => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceParamState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceParamStateCopyWith<AttendanceParamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceParamStateCopyWith<$Res> {
  factory $AttendanceParamStateCopyWith(AttendanceParamState value,
          $Res Function(AttendanceParamState) then) =
      _$AttendanceParamStateCopyWithImpl<$Res, AttendanceParamState>;
  @useResult
  $Res call(
      {String? type,
      ResponseState? statePhoto,
      XFile? attachment,
      ResponseState? stateLocation,
      String? location});
}

/// @nodoc
class _$AttendanceParamStateCopyWithImpl<$Res,
        $Val extends AttendanceParamState>
    implements $AttendanceParamStateCopyWith<$Res> {
  _$AttendanceParamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceParamState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? statePhoto = freezed,
    Object? attachment = freezed,
    Object? stateLocation = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      statePhoto: freezed == statePhoto
          ? _value.statePhoto
          : statePhoto // ignore: cast_nullable_to_non_nullable
              as ResponseState?,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as XFile?,
      stateLocation: freezed == stateLocation
          ? _value.stateLocation
          : stateLocation // ignore: cast_nullable_to_non_nullable
              as ResponseState?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceParamStateImplCopyWith<$Res>
    implements $AttendanceParamStateCopyWith<$Res> {
  factory _$$AttendanceParamStateImplCopyWith(_$AttendanceParamStateImpl value,
          $Res Function(_$AttendanceParamStateImpl) then) =
      __$$AttendanceParamStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      ResponseState? statePhoto,
      XFile? attachment,
      ResponseState? stateLocation,
      String? location});
}

/// @nodoc
class __$$AttendanceParamStateImplCopyWithImpl<$Res>
    extends _$AttendanceParamStateCopyWithImpl<$Res, _$AttendanceParamStateImpl>
    implements _$$AttendanceParamStateImplCopyWith<$Res> {
  __$$AttendanceParamStateImplCopyWithImpl(_$AttendanceParamStateImpl _value,
      $Res Function(_$AttendanceParamStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceParamState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? statePhoto = freezed,
    Object? attachment = freezed,
    Object? stateLocation = freezed,
    Object? location = freezed,
  }) {
    return _then(_$AttendanceParamStateImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      statePhoto: freezed == statePhoto
          ? _value.statePhoto
          : statePhoto // ignore: cast_nullable_to_non_nullable
              as ResponseState?,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as XFile?,
      stateLocation: freezed == stateLocation
          ? _value.stateLocation
          : stateLocation // ignore: cast_nullable_to_non_nullable
              as ResponseState?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AttendanceParamStateImpl implements _AttendanceParamState {
  const _$AttendanceParamStateImpl(
      {this.type,
      this.statePhoto,
      this.attachment,
      this.stateLocation,
      this.location});

  @override
  final String? type;
  @override
  final ResponseState? statePhoto;
  @override
  final XFile? attachment;
  @override
  final ResponseState? stateLocation;
  @override
  final String? location;

  @override
  String toString() {
    return 'AttendanceParamState(type: $type, statePhoto: $statePhoto, attachment: $attachment, stateLocation: $stateLocation, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceParamStateImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.statePhoto, statePhoto) ||
                other.statePhoto == statePhoto) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.stateLocation, stateLocation) ||
                other.stateLocation == stateLocation) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, type, statePhoto, attachment, stateLocation, location);

  /// Create a copy of AttendanceParamState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceParamStateImplCopyWith<_$AttendanceParamStateImpl>
      get copyWith =>
          __$$AttendanceParamStateImplCopyWithImpl<_$AttendanceParamStateImpl>(
              this, _$identity);
}

abstract class _AttendanceParamState implements AttendanceParamState {
  const factory _AttendanceParamState(
      {final String? type,
      final ResponseState? statePhoto,
      final XFile? attachment,
      final ResponseState? stateLocation,
      final String? location}) = _$AttendanceParamStateImpl;

  @override
  String? get type;
  @override
  ResponseState? get statePhoto;
  @override
  XFile? get attachment;
  @override
  ResponseState? get stateLocation;
  @override
  String? get location;

  /// Create a copy of AttendanceParamState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceParamStateImplCopyWith<_$AttendanceParamStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
