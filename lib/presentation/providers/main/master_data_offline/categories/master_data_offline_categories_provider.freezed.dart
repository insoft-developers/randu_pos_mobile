// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_data_offline_categories_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MasterDataOfflineCategoriesState {
  List<CategoryModel>? get values => throw _privateConstructorUsedError;
  String? get saveMessage => throw _privateConstructorUsedError;

  /// Create a copy of MasterDataOfflineCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MasterDataOfflineCategoriesStateCopyWith<MasterDataOfflineCategoriesState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterDataOfflineCategoriesStateCopyWith<$Res> {
  factory $MasterDataOfflineCategoriesStateCopyWith(
          MasterDataOfflineCategoriesState value,
          $Res Function(MasterDataOfflineCategoriesState) then) =
      _$MasterDataOfflineCategoriesStateCopyWithImpl<$Res,
          MasterDataOfflineCategoriesState>;
  @useResult
  $Res call({List<CategoryModel>? values, String? saveMessage});
}

/// @nodoc
class _$MasterDataOfflineCategoriesStateCopyWithImpl<$Res,
        $Val extends MasterDataOfflineCategoriesState>
    implements $MasterDataOfflineCategoriesStateCopyWith<$Res> {
  _$MasterDataOfflineCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MasterDataOfflineCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = freezed,
    Object? saveMessage = freezed,
  }) {
    return _then(_value.copyWith(
      values: freezed == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      saveMessage: freezed == saveMessage
          ? _value.saveMessage
          : saveMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasterDataOfflineCategoriesStateImplCopyWith<$Res>
    implements $MasterDataOfflineCategoriesStateCopyWith<$Res> {
  factory _$$MasterDataOfflineCategoriesStateImplCopyWith(
          _$MasterDataOfflineCategoriesStateImpl value,
          $Res Function(_$MasterDataOfflineCategoriesStateImpl) then) =
      __$$MasterDataOfflineCategoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryModel>? values, String? saveMessage});
}

/// @nodoc
class __$$MasterDataOfflineCategoriesStateImplCopyWithImpl<$Res>
    extends _$MasterDataOfflineCategoriesStateCopyWithImpl<$Res,
        _$MasterDataOfflineCategoriesStateImpl>
    implements _$$MasterDataOfflineCategoriesStateImplCopyWith<$Res> {
  __$$MasterDataOfflineCategoriesStateImplCopyWithImpl(
      _$MasterDataOfflineCategoriesStateImpl _value,
      $Res Function(_$MasterDataOfflineCategoriesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MasterDataOfflineCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = freezed,
    Object? saveMessage = freezed,
  }) {
    return _then(_$MasterDataOfflineCategoriesStateImpl(
      values: freezed == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
      saveMessage: freezed == saveMessage
          ? _value.saveMessage
          : saveMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MasterDataOfflineCategoriesStateImpl
    implements _MasterDataOfflineCategoriesState {
  const _$MasterDataOfflineCategoriesStateImpl(
      {final List<CategoryModel>? values, this.saveMessage})
      : _values = values;

  final List<CategoryModel>? _values;
  @override
  List<CategoryModel>? get values {
    final value = _values;
    if (value == null) return null;
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? saveMessage;

  @override
  String toString() {
    return 'MasterDataOfflineCategoriesState(values: $values, saveMessage: $saveMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterDataOfflineCategoriesStateImpl &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.saveMessage, saveMessage) ||
                other.saveMessage == saveMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_values), saveMessage);

  /// Create a copy of MasterDataOfflineCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterDataOfflineCategoriesStateImplCopyWith<
          _$MasterDataOfflineCategoriesStateImpl>
      get copyWith => __$$MasterDataOfflineCategoriesStateImplCopyWithImpl<
          _$MasterDataOfflineCategoriesStateImpl>(this, _$identity);
}

abstract class _MasterDataOfflineCategoriesState
    implements MasterDataOfflineCategoriesState {
  const factory _MasterDataOfflineCategoriesState(
      {final List<CategoryModel>? values,
      final String? saveMessage}) = _$MasterDataOfflineCategoriesStateImpl;

  @override
  List<CategoryModel>? get values;
  @override
  String? get saveMessage;

  /// Create a copy of MasterDataOfflineCategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MasterDataOfflineCategoriesStateImplCopyWith<
          _$MasterDataOfflineCategoriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
