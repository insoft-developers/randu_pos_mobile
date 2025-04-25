// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printer_single_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PrinterSingleState {
  PrinterModel? get selectedSinglePrinter => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of PrinterSingleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrinterSingleStateCopyWith<PrinterSingleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrinterSingleStateCopyWith<$Res> {
  factory $PrinterSingleStateCopyWith(
          PrinterSingleState value, $Res Function(PrinterSingleState) then) =
      _$PrinterSingleStateCopyWithImpl<$Res, PrinterSingleState>;
  @useResult
  $Res call({PrinterModel? selectedSinglePrinter, String? message});

  $PrinterModelCopyWith<$Res>? get selectedSinglePrinter;
}

/// @nodoc
class _$PrinterSingleStateCopyWithImpl<$Res, $Val extends PrinterSingleState>
    implements $PrinterSingleStateCopyWith<$Res> {
  _$PrinterSingleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrinterSingleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSinglePrinter = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      selectedSinglePrinter: freezed == selectedSinglePrinter
          ? _value.selectedSinglePrinter
          : selectedSinglePrinter // ignore: cast_nullable_to_non_nullable
              as PrinterModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PrinterSingleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrinterModelCopyWith<$Res>? get selectedSinglePrinter {
    if (_value.selectedSinglePrinter == null) {
      return null;
    }

    return $PrinterModelCopyWith<$Res>(_value.selectedSinglePrinter!, (value) {
      return _then(_value.copyWith(selectedSinglePrinter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrinterSingleStateImplCopyWith<$Res>
    implements $PrinterSingleStateCopyWith<$Res> {
  factory _$$PrinterSingleStateImplCopyWith(_$PrinterSingleStateImpl value,
          $Res Function(_$PrinterSingleStateImpl) then) =
      __$$PrinterSingleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PrinterModel? selectedSinglePrinter, String? message});

  @override
  $PrinterModelCopyWith<$Res>? get selectedSinglePrinter;
}

/// @nodoc
class __$$PrinterSingleStateImplCopyWithImpl<$Res>
    extends _$PrinterSingleStateCopyWithImpl<$Res, _$PrinterSingleStateImpl>
    implements _$$PrinterSingleStateImplCopyWith<$Res> {
  __$$PrinterSingleStateImplCopyWithImpl(_$PrinterSingleStateImpl _value,
      $Res Function(_$PrinterSingleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrinterSingleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSinglePrinter = freezed,
    Object? message = freezed,
  }) {
    return _then(_$PrinterSingleStateImpl(
      selectedSinglePrinter: freezed == selectedSinglePrinter
          ? _value.selectedSinglePrinter
          : selectedSinglePrinter // ignore: cast_nullable_to_non_nullable
              as PrinterModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PrinterSingleStateImpl implements _PrinterSingleState {
  const _$PrinterSingleStateImpl({this.selectedSinglePrinter, this.message});

  @override
  final PrinterModel? selectedSinglePrinter;
  @override
  final String? message;

  @override
  String toString() {
    return 'PrinterSingleState(selectedSinglePrinter: $selectedSinglePrinter, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrinterSingleStateImpl &&
            (identical(other.selectedSinglePrinter, selectedSinglePrinter) ||
                other.selectedSinglePrinter == selectedSinglePrinter) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedSinglePrinter, message);

  /// Create a copy of PrinterSingleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrinterSingleStateImplCopyWith<_$PrinterSingleStateImpl> get copyWith =>
      __$$PrinterSingleStateImplCopyWithImpl<_$PrinterSingleStateImpl>(
          this, _$identity);
}

abstract class _PrinterSingleState implements PrinterSingleState {
  const factory _PrinterSingleState(
      {final PrinterModel? selectedSinglePrinter,
      final String? message}) = _$PrinterSingleStateImpl;

  @override
  PrinterModel? get selectedSinglePrinter;
  @override
  String? get message;

  /// Create a copy of PrinterSingleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrinterSingleStateImplCopyWith<_$PrinterSingleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
