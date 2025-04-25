// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printer_service_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PrinterServiceState {
  ResponseState get connectBluetoothState => throw _privateConstructorUsedError;
  ResponseState get scanPrinterState => throw _privateConstructorUsedError;
  List<PrinterModel> get printerList => throw _privateConstructorUsedError;
  List<PrinterModel> get tempPrinterList => throw _privateConstructorUsedError;
  List<PrinterModel> get selectedPrinterList =>
      throw _privateConstructorUsedError;
  PrinterModel? get connectedPrinter => throw _privateConstructorUsedError;
  PaperSizeModel? get paperSizeSinglePrinter =>
      throw _privateConstructorUsedError;
  PrinterModeEnum get printerMode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool get isPrintAllProductChecker => throw _privateConstructorUsedError;

  /// Create a copy of PrinterServiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrinterServiceStateCopyWith<PrinterServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrinterServiceStateCopyWith<$Res> {
  factory $PrinterServiceStateCopyWith(
          PrinterServiceState value, $Res Function(PrinterServiceState) then) =
      _$PrinterServiceStateCopyWithImpl<$Res, PrinterServiceState>;
  @useResult
  $Res call(
      {ResponseState connectBluetoothState,
      ResponseState scanPrinterState,
      List<PrinterModel> printerList,
      List<PrinterModel> tempPrinterList,
      List<PrinterModel> selectedPrinterList,
      PrinterModel? connectedPrinter,
      PaperSizeModel? paperSizeSinglePrinter,
      PrinterModeEnum printerMode,
      String? message,
      bool isPrintAllProductChecker});

  $PrinterModelCopyWith<$Res>? get connectedPrinter;
  $PaperSizeModelCopyWith<$Res>? get paperSizeSinglePrinter;
}

/// @nodoc
class _$PrinterServiceStateCopyWithImpl<$Res, $Val extends PrinterServiceState>
    implements $PrinterServiceStateCopyWith<$Res> {
  _$PrinterServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrinterServiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectBluetoothState = null,
    Object? scanPrinterState = null,
    Object? printerList = null,
    Object? tempPrinterList = null,
    Object? selectedPrinterList = null,
    Object? connectedPrinter = freezed,
    Object? paperSizeSinglePrinter = freezed,
    Object? printerMode = null,
    Object? message = freezed,
    Object? isPrintAllProductChecker = null,
  }) {
    return _then(_value.copyWith(
      connectBluetoothState: null == connectBluetoothState
          ? _value.connectBluetoothState
          : connectBluetoothState // ignore: cast_nullable_to_non_nullable
              as ResponseState,
      scanPrinterState: null == scanPrinterState
          ? _value.scanPrinterState
          : scanPrinterState // ignore: cast_nullable_to_non_nullable
              as ResponseState,
      printerList: null == printerList
          ? _value.printerList
          : printerList // ignore: cast_nullable_to_non_nullable
              as List<PrinterModel>,
      tempPrinterList: null == tempPrinterList
          ? _value.tempPrinterList
          : tempPrinterList // ignore: cast_nullable_to_non_nullable
              as List<PrinterModel>,
      selectedPrinterList: null == selectedPrinterList
          ? _value.selectedPrinterList
          : selectedPrinterList // ignore: cast_nullable_to_non_nullable
              as List<PrinterModel>,
      connectedPrinter: freezed == connectedPrinter
          ? _value.connectedPrinter
          : connectedPrinter // ignore: cast_nullable_to_non_nullable
              as PrinterModel?,
      paperSizeSinglePrinter: freezed == paperSizeSinglePrinter
          ? _value.paperSizeSinglePrinter
          : paperSizeSinglePrinter // ignore: cast_nullable_to_non_nullable
              as PaperSizeModel?,
      printerMode: null == printerMode
          ? _value.printerMode
          : printerMode // ignore: cast_nullable_to_non_nullable
              as PrinterModeEnum,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrintAllProductChecker: null == isPrintAllProductChecker
          ? _value.isPrintAllProductChecker
          : isPrintAllProductChecker // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of PrinterServiceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrinterModelCopyWith<$Res>? get connectedPrinter {
    if (_value.connectedPrinter == null) {
      return null;
    }

    return $PrinterModelCopyWith<$Res>(_value.connectedPrinter!, (value) {
      return _then(_value.copyWith(connectedPrinter: value) as $Val);
    });
  }

  /// Create a copy of PrinterServiceState
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
abstract class _$$PrinterServiceStateImplCopyWith<$Res>
    implements $PrinterServiceStateCopyWith<$Res> {
  factory _$$PrinterServiceStateImplCopyWith(_$PrinterServiceStateImpl value,
          $Res Function(_$PrinterServiceStateImpl) then) =
      __$$PrinterServiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ResponseState connectBluetoothState,
      ResponseState scanPrinterState,
      List<PrinterModel> printerList,
      List<PrinterModel> tempPrinterList,
      List<PrinterModel> selectedPrinterList,
      PrinterModel? connectedPrinter,
      PaperSizeModel? paperSizeSinglePrinter,
      PrinterModeEnum printerMode,
      String? message,
      bool isPrintAllProductChecker});

  @override
  $PrinterModelCopyWith<$Res>? get connectedPrinter;
  @override
  $PaperSizeModelCopyWith<$Res>? get paperSizeSinglePrinter;
}

/// @nodoc
class __$$PrinterServiceStateImplCopyWithImpl<$Res>
    extends _$PrinterServiceStateCopyWithImpl<$Res, _$PrinterServiceStateImpl>
    implements _$$PrinterServiceStateImplCopyWith<$Res> {
  __$$PrinterServiceStateImplCopyWithImpl(_$PrinterServiceStateImpl _value,
      $Res Function(_$PrinterServiceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrinterServiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectBluetoothState = null,
    Object? scanPrinterState = null,
    Object? printerList = null,
    Object? tempPrinterList = null,
    Object? selectedPrinterList = null,
    Object? connectedPrinter = freezed,
    Object? paperSizeSinglePrinter = freezed,
    Object? printerMode = null,
    Object? message = freezed,
    Object? isPrintAllProductChecker = null,
  }) {
    return _then(_$PrinterServiceStateImpl(
      connectBluetoothState: null == connectBluetoothState
          ? _value.connectBluetoothState
          : connectBluetoothState // ignore: cast_nullable_to_non_nullable
              as ResponseState,
      scanPrinterState: null == scanPrinterState
          ? _value.scanPrinterState
          : scanPrinterState // ignore: cast_nullable_to_non_nullable
              as ResponseState,
      printerList: null == printerList
          ? _value.printerList
          : printerList // ignore: cast_nullable_to_non_nullable
              as List<PrinterModel>,
      tempPrinterList: null == tempPrinterList
          ? _value.tempPrinterList
          : tempPrinterList // ignore: cast_nullable_to_non_nullable
              as List<PrinterModel>,
      selectedPrinterList: null == selectedPrinterList
          ? _value.selectedPrinterList
          : selectedPrinterList // ignore: cast_nullable_to_non_nullable
              as List<PrinterModel>,
      connectedPrinter: freezed == connectedPrinter
          ? _value.connectedPrinter
          : connectedPrinter // ignore: cast_nullable_to_non_nullable
              as PrinterModel?,
      paperSizeSinglePrinter: freezed == paperSizeSinglePrinter
          ? _value.paperSizeSinglePrinter
          : paperSizeSinglePrinter // ignore: cast_nullable_to_non_nullable
              as PaperSizeModel?,
      printerMode: null == printerMode
          ? _value.printerMode
          : printerMode // ignore: cast_nullable_to_non_nullable
              as PrinterModeEnum,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrintAllProductChecker: null == isPrintAllProductChecker
          ? _value.isPrintAllProductChecker
          : isPrintAllProductChecker // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PrinterServiceStateImpl
    with DiagnosticableTreeMixin
    implements _PrinterServiceState {
  const _$PrinterServiceStateImpl(
      {this.connectBluetoothState = ResponseState.empty,
      this.scanPrinterState = ResponseState.empty,
      this.printerList = const [],
      this.tempPrinterList = const [],
      this.selectedPrinterList = const [],
      this.connectedPrinter,
      this.paperSizeSinglePrinter,
      this.printerMode = PrinterModeEnum.single,
      this.message,
      this.isPrintAllProductChecker = false});

  @override
  @JsonKey()
  final ResponseState connectBluetoothState;
  @override
  @JsonKey()
  final ResponseState scanPrinterState;
  @override
  @JsonKey()
  final List<PrinterModel> printerList;
  @override
  @JsonKey()
  final List<PrinterModel> tempPrinterList;
  @override
  @JsonKey()
  final List<PrinterModel> selectedPrinterList;
  @override
  final PrinterModel? connectedPrinter;
  @override
  final PaperSizeModel? paperSizeSinglePrinter;
  @override
  @JsonKey()
  final PrinterModeEnum printerMode;
  @override
  final String? message;
  @override
  @JsonKey()
  final bool isPrintAllProductChecker;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrinterServiceState(connectBluetoothState: $connectBluetoothState, scanPrinterState: $scanPrinterState, printerList: $printerList, tempPrinterList: $tempPrinterList, selectedPrinterList: $selectedPrinterList, connectedPrinter: $connectedPrinter, paperSizeSinglePrinter: $paperSizeSinglePrinter, printerMode: $printerMode, message: $message, isPrintAllProductChecker: $isPrintAllProductChecker)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrinterServiceState'))
      ..add(DiagnosticsProperty('connectBluetoothState', connectBluetoothState))
      ..add(DiagnosticsProperty('scanPrinterState', scanPrinterState))
      ..add(DiagnosticsProperty('printerList', printerList))
      ..add(DiagnosticsProperty('tempPrinterList', tempPrinterList))
      ..add(DiagnosticsProperty('selectedPrinterList', selectedPrinterList))
      ..add(DiagnosticsProperty('connectedPrinter', connectedPrinter))
      ..add(
          DiagnosticsProperty('paperSizeSinglePrinter', paperSizeSinglePrinter))
      ..add(DiagnosticsProperty('printerMode', printerMode))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty(
          'isPrintAllProductChecker', isPrintAllProductChecker));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrinterServiceStateImpl &&
            (identical(other.connectBluetoothState, connectBluetoothState) ||
                other.connectBluetoothState == connectBluetoothState) &&
            (identical(other.scanPrinterState, scanPrinterState) ||
                other.scanPrinterState == scanPrinterState) &&
            const DeepCollectionEquality()
                .equals(other.printerList, printerList) &&
            const DeepCollectionEquality()
                .equals(other.tempPrinterList, tempPrinterList) &&
            const DeepCollectionEquality()
                .equals(other.selectedPrinterList, selectedPrinterList) &&
            (identical(other.connectedPrinter, connectedPrinter) ||
                other.connectedPrinter == connectedPrinter) &&
            (identical(other.paperSizeSinglePrinter, paperSizeSinglePrinter) ||
                other.paperSizeSinglePrinter == paperSizeSinglePrinter) &&
            (identical(other.printerMode, printerMode) ||
                other.printerMode == printerMode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(
                    other.isPrintAllProductChecker, isPrintAllProductChecker) ||
                other.isPrintAllProductChecker == isPrintAllProductChecker));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      connectBluetoothState,
      scanPrinterState,
      const DeepCollectionEquality().hash(printerList),
      const DeepCollectionEquality().hash(tempPrinterList),
      const DeepCollectionEquality().hash(selectedPrinterList),
      connectedPrinter,
      paperSizeSinglePrinter,
      printerMode,
      message,
      isPrintAllProductChecker);

  /// Create a copy of PrinterServiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrinterServiceStateImplCopyWith<_$PrinterServiceStateImpl> get copyWith =>
      __$$PrinterServiceStateImplCopyWithImpl<_$PrinterServiceStateImpl>(
          this, _$identity);
}

abstract class _PrinterServiceState implements PrinterServiceState {
  const factory _PrinterServiceState(
      {final ResponseState connectBluetoothState,
      final ResponseState scanPrinterState,
      final List<PrinterModel> printerList,
      final List<PrinterModel> tempPrinterList,
      final List<PrinterModel> selectedPrinterList,
      final PrinterModel? connectedPrinter,
      final PaperSizeModel? paperSizeSinglePrinter,
      final PrinterModeEnum printerMode,
      final String? message,
      final bool isPrintAllProductChecker}) = _$PrinterServiceStateImpl;

  @override
  ResponseState get connectBluetoothState;
  @override
  ResponseState get scanPrinterState;
  @override
  List<PrinterModel> get printerList;
  @override
  List<PrinterModel> get tempPrinterList;
  @override
  List<PrinterModel> get selectedPrinterList;
  @override
  PrinterModel? get connectedPrinter;
  @override
  PaperSizeModel? get paperSizeSinglePrinter;
  @override
  PrinterModeEnum get printerMode;
  @override
  String? get message;
  @override
  bool get isPrintAllProductChecker;

  /// Create a copy of PrinterServiceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrinterServiceStateImplCopyWith<_$PrinterServiceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
