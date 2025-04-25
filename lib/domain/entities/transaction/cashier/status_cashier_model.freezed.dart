// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_cashier_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatusCashierModel _$StatusCashierModelFromJson(Map<String, dynamic> json) {
  return _StatusCashierModel.fromJson(json);
}

/// @nodoc
mixin _$StatusCashierModel {
  @JsonKey(name: 'status_cashier')
  String? get statusCashier => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_cashier_at')
  DateTime? get openCashierAt => throw _privateConstructorUsedError;

  /// Serializes this StatusCashierModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatusCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusCashierModelCopyWith<StatusCashierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCashierModelCopyWith<$Res> {
  factory $StatusCashierModelCopyWith(
          StatusCashierModel value, $Res Function(StatusCashierModel) then) =
      _$StatusCashierModelCopyWithImpl<$Res, StatusCashierModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status_cashier') String? statusCashier,
      @JsonKey(name: 'open_cashier_at') DateTime? openCashierAt});
}

/// @nodoc
class _$StatusCashierModelCopyWithImpl<$Res, $Val extends StatusCashierModel>
    implements $StatusCashierModelCopyWith<$Res> {
  _$StatusCashierModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCashier = freezed,
    Object? openCashierAt = freezed,
  }) {
    return _then(_value.copyWith(
      statusCashier: freezed == statusCashier
          ? _value.statusCashier
          : statusCashier // ignore: cast_nullable_to_non_nullable
              as String?,
      openCashierAt: freezed == openCashierAt
          ? _value.openCashierAt
          : openCashierAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusCashierModelImplCopyWith<$Res>
    implements $StatusCashierModelCopyWith<$Res> {
  factory _$$StatusCashierModelImplCopyWith(_$StatusCashierModelImpl value,
          $Res Function(_$StatusCashierModelImpl) then) =
      __$$StatusCashierModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status_cashier') String? statusCashier,
      @JsonKey(name: 'open_cashier_at') DateTime? openCashierAt});
}

/// @nodoc
class __$$StatusCashierModelImplCopyWithImpl<$Res>
    extends _$StatusCashierModelCopyWithImpl<$Res, _$StatusCashierModelImpl>
    implements _$$StatusCashierModelImplCopyWith<$Res> {
  __$$StatusCashierModelImplCopyWithImpl(_$StatusCashierModelImpl _value,
      $Res Function(_$StatusCashierModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatusCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCashier = freezed,
    Object? openCashierAt = freezed,
  }) {
    return _then(_$StatusCashierModelImpl(
      statusCashier: freezed == statusCashier
          ? _value.statusCashier
          : statusCashier // ignore: cast_nullable_to_non_nullable
              as String?,
      openCashierAt: freezed == openCashierAt
          ? _value.openCashierAt
          : openCashierAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusCashierModelImpl implements _StatusCashierModel {
  const _$StatusCashierModelImpl(
      {@JsonKey(name: 'status_cashier') this.statusCashier,
      @JsonKey(name: 'open_cashier_at') this.openCashierAt});

  factory _$StatusCashierModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusCashierModelImplFromJson(json);

  @override
  @JsonKey(name: 'status_cashier')
  final String? statusCashier;
  @override
  @JsonKey(name: 'open_cashier_at')
  final DateTime? openCashierAt;

  @override
  String toString() {
    return 'StatusCashierModel(statusCashier: $statusCashier, openCashierAt: $openCashierAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusCashierModelImpl &&
            (identical(other.statusCashier, statusCashier) ||
                other.statusCashier == statusCashier) &&
            (identical(other.openCashierAt, openCashierAt) ||
                other.openCashierAt == openCashierAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCashier, openCashierAt);

  /// Create a copy of StatusCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusCashierModelImplCopyWith<_$StatusCashierModelImpl> get copyWith =>
      __$$StatusCashierModelImplCopyWithImpl<_$StatusCashierModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusCashierModelImplToJson(
      this,
    );
  }
}

abstract class _StatusCashierModel implements StatusCashierModel {
  const factory _StatusCashierModel(
          {@JsonKey(name: 'status_cashier') final String? statusCashier,
          @JsonKey(name: 'open_cashier_at') final DateTime? openCashierAt}) =
      _$StatusCashierModelImpl;

  factory _StatusCashierModel.fromJson(Map<String, dynamic> json) =
      _$StatusCashierModelImpl.fromJson;

  @override
  @JsonKey(name: 'status_cashier')
  String? get statusCashier;
  @override
  @JsonKey(name: 'open_cashier_at')
  DateTime? get openCashierAt;

  /// Create a copy of StatusCashierModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusCashierModelImplCopyWith<_$StatusCashierModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
