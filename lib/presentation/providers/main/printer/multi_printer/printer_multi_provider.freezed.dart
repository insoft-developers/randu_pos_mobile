// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printer_multi_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PrinterMultiState {
  ResponseState get stateScanning => throw _privateConstructorUsedError;
  List<PrinterFolder>? get printerFolders => throw _privateConstructorUsedError;
  PaperSizeModel? get paperSizeSinglePrinter =>
      throw _privateConstructorUsedError; // for individual printer
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of PrinterMultiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrinterMultiStateCopyWith<PrinterMultiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrinterMultiStateCopyWith<$Res> {
  factory $PrinterMultiStateCopyWith(
          PrinterMultiState value, $Res Function(PrinterMultiState) then) =
      _$PrinterMultiStateCopyWithImpl<$Res, PrinterMultiState>;
  @useResult
  $Res call(
      {ResponseState stateScanning,
      List<PrinterFolder>? printerFolders,
      PaperSizeModel? paperSizeSinglePrinter,
      String? message});

  $PaperSizeModelCopyWith<$Res>? get paperSizeSinglePrinter;
}

/// @nodoc
class _$PrinterMultiStateCopyWithImpl<$Res, $Val extends PrinterMultiState>
    implements $PrinterMultiStateCopyWith<$Res> {
  _$PrinterMultiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrinterMultiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateScanning = null,
    Object? printerFolders = freezed,
    Object? paperSizeSinglePrinter = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      stateScanning: null == stateScanning
          ? _value.stateScanning
          : stateScanning // ignore: cast_nullable_to_non_nullable
              as ResponseState,
      printerFolders: freezed == printerFolders
          ? _value.printerFolders
          : printerFolders // ignore: cast_nullable_to_non_nullable
              as List<PrinterFolder>?,
      paperSizeSinglePrinter: freezed == paperSizeSinglePrinter
          ? _value.paperSizeSinglePrinter
          : paperSizeSinglePrinter // ignore: cast_nullable_to_non_nullable
              as PaperSizeModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PrinterMultiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaperSizeModelCopyWith<$Res>? get paperSizeSinglePrinter {
    if (_value.paperSizeSinglePrinter == null) {
      return null;
    }

    return $PaperSizeModelCopyWith<$Res>(_value.paperSizeSinglePrinter!,
        (value) {
      return _then(_value.copyWith(paperSizeSinglePrinter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrinterMultiStateImplCopyWith<$Res>
    implements $PrinterMultiStateCopyWith<$Res> {
  factory _$$PrinterMultiStateImplCopyWith(_$PrinterMultiStateImpl value,
          $Res Function(_$PrinterMultiStateImpl) then) =
      __$$PrinterMultiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseState stateScanning,
      List<PrinterFolder>? printerFolders,
      PaperSizeModel? paperSizeSinglePrinter,
      String? message});

  @override
  $PaperSizeModelCopyWith<$Res>? get paperSizeSinglePrinter;
}

/// @nodoc
class __$$PrinterMultiStateImplCopyWithImpl<$Res>
    extends _$PrinterMultiStateCopyWithImpl<$Res, _$PrinterMultiStateImpl>
    implements _$$PrinterMultiStateImplCopyWith<$Res> {
  __$$PrinterMultiStateImplCopyWithImpl(_$PrinterMultiStateImpl _value,
      $Res Function(_$PrinterMultiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrinterMultiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateScanning = null,
    Object? printerFolders = freezed,
    Object? paperSizeSinglePrinter = freezed,
    Object? message = freezed,
  }) {
    return _then(_$PrinterMultiStateImpl(
      stateScanning: null == stateScanning
          ? _value.stateScanning
          : stateScanning // ignore: cast_nullable_to_non_nullable
              as ResponseState,
      printerFolders: freezed == printerFolders
          ? _value._printerFolders
          : printerFolders // ignore: cast_nullable_to_non_nullable
              as List<PrinterFolder>?,
      paperSizeSinglePrinter: freezed == paperSizeSinglePrinter
          ? _value.paperSizeSinglePrinter
          : paperSizeSinglePrinter // ignore: cast_nullable_to_non_nullable
              as PaperSizeModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PrinterMultiStateImpl
    with DiagnosticableTreeMixin
    implements _PrinterMultiState {
  const _$PrinterMultiStateImpl(
      {this.stateScanning = ResponseState.empty,
      final List<PrinterFolder>? printerFolders,
      this.paperSizeSinglePrinter,
      this.message})
      : _printerFolders = printerFolders;

  @override
  @JsonKey()
  final ResponseState stateScanning;
  final List<PrinterFolder>? _printerFolders;
  @override
  List<PrinterFolder>? get printerFolders {
    final value = _printerFolders;
    if (value == null) return null;
    if (_printerFolders is EqualUnmodifiableListView) return _printerFolders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PaperSizeModel? paperSizeSinglePrinter;
// for individual printer
  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrinterMultiState(stateScanning: $stateScanning, printerFolders: $printerFolders, paperSizeSinglePrinter: $paperSizeSinglePrinter, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrinterMultiState'))
      ..add(DiagnosticsProperty('stateScanning', stateScanning))
      ..add(DiagnosticsProperty('printerFolders', printerFolders))
      ..add(
          DiagnosticsProperty('paperSizeSinglePrinter', paperSizeSinglePrinter))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrinterMultiStateImpl &&
            (identical(other.stateScanning, stateScanning) ||
                other.stateScanning == stateScanning) &&
            const DeepCollectionEquality()
                .equals(other._printerFolders, _printerFolders) &&
            (identical(other.paperSizeSinglePrinter, paperSizeSinglePrinter) ||
                other.paperSizeSinglePrinter == paperSizeSinglePrinter) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stateScanning,
      const DeepCollectionEquality().hash(_printerFolders),
      paperSizeSinglePrinter,
      message);

  /// Create a copy of PrinterMultiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrinterMultiStateImplCopyWith<_$PrinterMultiStateImpl> get copyWith =>
      __$$PrinterMultiStateImplCopyWithImpl<_$PrinterMultiStateImpl>(
          this, _$identity);
}

abstract class _PrinterMultiState implements PrinterMultiState {
  const factory _PrinterMultiState(
      {final ResponseState stateScanning,
      final List<PrinterFolder>? printerFolders,
      final PaperSizeModel? paperSizeSinglePrinter,
      final String? message}) = _$PrinterMultiStateImpl;

  @override
  ResponseState get stateScanning;
  @override
  List<PrinterFolder>? get printerFolders;
  @override
  PaperSizeModel? get paperSizeSinglePrinter; // for individual printer
  @override
  String? get message;

  /// Create a copy of PrinterMultiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrinterMultiStateImplCopyWith<_$PrinterMultiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
