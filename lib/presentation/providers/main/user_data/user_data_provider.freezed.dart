// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserDataState {
  UserModel? get user => throw _privateConstructorUsedError;
  bool? get isCashierOpen => throw _privateConstructorUsedError;
  bool? get isPettyCashEnabled => throw _privateConstructorUsedError;

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataStateCopyWith<UserDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataStateCopyWith<$Res> {
  factory $UserDataStateCopyWith(
          UserDataState value, $Res Function(UserDataState) then) =
      _$UserDataStateCopyWithImpl<$Res, UserDataState>;
  @useResult
  $Res call({UserModel? user, bool? isCashierOpen, bool? isPettyCashEnabled});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserDataStateCopyWithImpl<$Res, $Val extends UserDataState>
    implements $UserDataStateCopyWith<$Res> {
  _$UserDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? isCashierOpen = freezed,
    Object? isPettyCashEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isCashierOpen: freezed == isCashierOpen
          ? _value.isCashierOpen
          : isCashierOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPettyCashEnabled: freezed == isPettyCashEnabled
          ? _value.isPettyCashEnabled
          : isPettyCashEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDataStateImplCopyWith<$Res>
    implements $UserDataStateCopyWith<$Res> {
  factory _$$UserDataStateImplCopyWith(
          _$UserDataStateImpl value, $Res Function(_$UserDataStateImpl) then) =
      __$$UserDataStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel? user, bool? isCashierOpen, bool? isPettyCashEnabled});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserDataStateImplCopyWithImpl<$Res>
    extends _$UserDataStateCopyWithImpl<$Res, _$UserDataStateImpl>
    implements _$$UserDataStateImplCopyWith<$Res> {
  __$$UserDataStateImplCopyWithImpl(
      _$UserDataStateImpl _value, $Res Function(_$UserDataStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? isCashierOpen = freezed,
    Object? isPettyCashEnabled = freezed,
  }) {
    return _then(_$UserDataStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isCashierOpen: freezed == isCashierOpen
          ? _value.isCashierOpen
          : isCashierOpen // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPettyCashEnabled: freezed == isPettyCashEnabled
          ? _value.isPettyCashEnabled
          : isPettyCashEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$UserDataStateImpl implements _UserDataState {
  const _$UserDataStateImpl(
      {this.user, this.isCashierOpen, this.isPettyCashEnabled});

  @override
  final UserModel? user;
  @override
  final bool? isCashierOpen;
  @override
  final bool? isPettyCashEnabled;

  @override
  String toString() {
    return 'UserDataState(user: $user, isCashierOpen: $isCashierOpen, isPettyCashEnabled: $isPettyCashEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isCashierOpen, isCashierOpen) ||
                other.isCashierOpen == isCashierOpen) &&
            (identical(other.isPettyCashEnabled, isPettyCashEnabled) ||
                other.isPettyCashEnabled == isPettyCashEnabled));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, isCashierOpen, isPettyCashEnabled);

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataStateImplCopyWith<_$UserDataStateImpl> get copyWith =>
      __$$UserDataStateImplCopyWithImpl<_$UserDataStateImpl>(this, _$identity);
}

abstract class _UserDataState implements UserDataState {
  const factory _UserDataState(
      {final UserModel? user,
      final bool? isCashierOpen,
      final bool? isPettyCashEnabled}) = _$UserDataStateImpl;

  @override
  UserModel? get user;
  @override
  bool? get isCashierOpen;
  @override
  bool? get isPettyCashEnabled;

  /// Create a copy of UserDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataStateImplCopyWith<_$UserDataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
