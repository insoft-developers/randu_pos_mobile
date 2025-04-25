// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_tables_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetTableState {
  List<TableModel>? get tables => throw _privateConstructorUsedError;
  TableModel? get chosenTable => throw _privateConstructorUsedError;
  SaleTypeEnum get saleType => throw _privateConstructorUsedError;

  /// Create a copy of GetTableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetTableStateCopyWith<GetTableState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTableStateCopyWith<$Res> {
  factory $GetTableStateCopyWith(
          GetTableState value, $Res Function(GetTableState) then) =
      _$GetTableStateCopyWithImpl<$Res, GetTableState>;
  @useResult
  $Res call(
      {List<TableModel>? tables,
      TableModel? chosenTable,
      SaleTypeEnum saleType});

  $TableModelCopyWith<$Res>? get chosenTable;
}

/// @nodoc
class _$GetTableStateCopyWithImpl<$Res, $Val extends GetTableState>
    implements $GetTableStateCopyWith<$Res> {
  _$GetTableStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetTableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tables = freezed,
    Object? chosenTable = freezed,
    Object? saleType = null,
  }) {
    return _then(_value.copyWith(
      tables: freezed == tables
          ? _value.tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<TableModel>?,
      chosenTable: freezed == chosenTable
          ? _value.chosenTable
          : chosenTable // ignore: cast_nullable_to_non_nullable
              as TableModel?,
      saleType: null == saleType
          ? _value.saleType
          : saleType // ignore: cast_nullable_to_non_nullable
              as SaleTypeEnum,
    ) as $Val);
  }

  /// Create a copy of GetTableState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableModelCopyWith<$Res>? get chosenTable {
    if (_value.chosenTable == null) {
      return null;
    }

    return $TableModelCopyWith<$Res>(_value.chosenTable!, (value) {
      return _then(_value.copyWith(chosenTable: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetTableStateImplCopyWith<$Res>
    implements $GetTableStateCopyWith<$Res> {
  factory _$$GetTableStateImplCopyWith(
          _$GetTableStateImpl value, $Res Function(_$GetTableStateImpl) then) =
      __$$GetTableStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TableModel>? tables,
      TableModel? chosenTable,
      SaleTypeEnum saleType});

  @override
  $TableModelCopyWith<$Res>? get chosenTable;
}

/// @nodoc
class __$$GetTableStateImplCopyWithImpl<$Res>
    extends _$GetTableStateCopyWithImpl<$Res, _$GetTableStateImpl>
    implements _$$GetTableStateImplCopyWith<$Res> {
  __$$GetTableStateImplCopyWithImpl(
      _$GetTableStateImpl _value, $Res Function(_$GetTableStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTableState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tables = freezed,
    Object? chosenTable = freezed,
    Object? saleType = null,
  }) {
    return _then(_$GetTableStateImpl(
      tables: freezed == tables
          ? _value._tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<TableModel>?,
      chosenTable: freezed == chosenTable
          ? _value.chosenTable
          : chosenTable // ignore: cast_nullable_to_non_nullable
              as TableModel?,
      saleType: null == saleType
          ? _value.saleType
          : saleType // ignore: cast_nullable_to_non_nullable
              as SaleTypeEnum,
    ));
  }
}

/// @nodoc

class _$GetTableStateImpl extends _GetTableState {
  const _$GetTableStateImpl(
      {final List<TableModel>? tables,
      this.chosenTable,
      this.saleType = SaleTypeEnum.dineIn})
      : _tables = tables,
        super._();

  final List<TableModel>? _tables;
  @override
  List<TableModel>? get tables {
    final value = _tables;
    if (value == null) return null;
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TableModel? chosenTable;
  @override
  @JsonKey()
  final SaleTypeEnum saleType;

  @override
  String toString() {
    return 'GetTableState(tables: $tables, chosenTable: $chosenTable, saleType: $saleType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTableStateImpl &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            (identical(other.chosenTable, chosenTable) ||
                other.chosenTable == chosenTable) &&
            (identical(other.saleType, saleType) ||
                other.saleType == saleType));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_tables), chosenTable, saleType);

  /// Create a copy of GetTableState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTableStateImplCopyWith<_$GetTableStateImpl> get copyWith =>
      __$$GetTableStateImplCopyWithImpl<_$GetTableStateImpl>(this, _$identity);
}

abstract class _GetTableState extends GetTableState {
  const factory _GetTableState(
      {final List<TableModel>? tables,
      final TableModel? chosenTable,
      final SaleTypeEnum saleType}) = _$GetTableStateImpl;
  const _GetTableState._() : super._();

  @override
  List<TableModel>? get tables;
  @override
  TableModel? get chosenTable;
  @override
  SaleTypeEnum get saleType;

  /// Create a copy of GetTableState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTableStateImplCopyWith<_$GetTableStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
