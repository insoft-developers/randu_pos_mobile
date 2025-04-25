// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PageState {
  int get page => throw _privateConstructorUsedError;
  bool get isDrawerOpen => throw _privateConstructorUsedError;
  bool get isCompleteCartInfo => throw _privateConstructorUsedError;

  /// Create a copy of PageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageStateCopyWith<PageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageStateCopyWith<$Res> {
  factory $PageStateCopyWith(PageState value, $Res Function(PageState) then) =
      _$PageStateCopyWithImpl<$Res, PageState>;
  @useResult
  $Res call({int page, bool isDrawerOpen, bool isCompleteCartInfo});
}

/// @nodoc
class _$PageStateCopyWithImpl<$Res, $Val extends PageState>
    implements $PageStateCopyWith<$Res> {
  _$PageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? isDrawerOpen = null,
    Object? isCompleteCartInfo = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isDrawerOpen: null == isDrawerOpen
          ? _value.isDrawerOpen
          : isDrawerOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleteCartInfo: null == isCompleteCartInfo
          ? _value.isCompleteCartInfo
          : isCompleteCartInfo // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageStateImplCopyWith<$Res>
    implements $PageStateCopyWith<$Res> {
  factory _$$PageStateImplCopyWith(
          _$PageStateImpl value, $Res Function(_$PageStateImpl) then) =
      __$$PageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, bool isDrawerOpen, bool isCompleteCartInfo});
}

/// @nodoc
class __$$PageStateImplCopyWithImpl<$Res>
    extends _$PageStateCopyWithImpl<$Res, _$PageStateImpl>
    implements _$$PageStateImplCopyWith<$Res> {
  __$$PageStateImplCopyWithImpl(
      _$PageStateImpl _value, $Res Function(_$PageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? isDrawerOpen = null,
    Object? isCompleteCartInfo = null,
  }) {
    return _then(_$PageStateImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isDrawerOpen: null == isDrawerOpen
          ? _value.isDrawerOpen
          : isDrawerOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleteCartInfo: null == isCompleteCartInfo
          ? _value.isCompleteCartInfo
          : isCompleteCartInfo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PageStateImpl implements _PageState {
  const _$PageStateImpl(
      {required this.page,
      required this.isDrawerOpen,
      required this.isCompleteCartInfo});

  @override
  final int page;
  @override
  final bool isDrawerOpen;
  @override
  final bool isCompleteCartInfo;

  @override
  String toString() {
    return 'PageState(page: $page, isDrawerOpen: $isDrawerOpen, isCompleteCartInfo: $isCompleteCartInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageStateImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isDrawerOpen, isDrawerOpen) ||
                other.isDrawerOpen == isDrawerOpen) &&
            (identical(other.isCompleteCartInfo, isCompleteCartInfo) ||
                other.isCompleteCartInfo == isCompleteCartInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, page, isDrawerOpen, isCompleteCartInfo);

  /// Create a copy of PageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageStateImplCopyWith<_$PageStateImpl> get copyWith =>
      __$$PageStateImplCopyWithImpl<_$PageStateImpl>(this, _$identity);
}

abstract class _PageState implements PageState {
  const factory _PageState(
      {required final int page,
      required final bool isDrawerOpen,
      required final bool isCompleteCartInfo}) = _$PageStateImpl;

  @override
  int get page;
  @override
  bool get isDrawerOpen;
  @override
  bool get isCompleteCartInfo;

  /// Create a copy of PageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageStateImplCopyWith<_$PageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
