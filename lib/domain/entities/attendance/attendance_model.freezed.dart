// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) {
  return _AttendanceModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clock_in')
  String? get clockIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'attachment_clock_in')
  String? get attachmentClockIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_clock_in')
  String? get locationClockIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'clock_out')
  String? get clockOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'attachment_clock_out')
  String? get attachmentClockOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_clock_out')
  dynamic get locationClockOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_toko')
  String? get namaToko => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_staff')
  String? get namaStaff => throw _privateConstructorUsedError;
  @JsonKey(name: 'jam_kerja')
  String? get jamKerja => throw _privateConstructorUsedError;
  @JsonKey(name: 'hari_libur')
  String? get hariLibur => throw _privateConstructorUsedError;
  @JsonKey(name: 'mulai_kerja')
  DateTime? get mulaiKerja => throw _privateConstructorUsedError;
  @JsonKey(name: 'range_clock_in')
  int? get rangeClockIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'range_clock_out')
  int? get rangeClockOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'note_clock_in')
  String? get noteClockIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'note_clock_out')
  String? get noteClockOut => throw _privateConstructorUsedError;

  /// Serializes this AttendanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceModelCopyWith<AttendanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceModelCopyWith<$Res> {
  factory $AttendanceModelCopyWith(
          AttendanceModel value, $Res Function(AttendanceModel) then) =
      _$AttendanceModelCopyWithImpl<$Res, AttendanceModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'clock_in') String? clockIn,
      @JsonKey(name: 'attachment_clock_in') String? attachmentClockIn,
      @JsonKey(name: 'location_clock_in') String? locationClockIn,
      @JsonKey(name: 'clock_out') String? clockOut,
      @JsonKey(name: 'attachment_clock_out') String? attachmentClockOut,
      @JsonKey(name: 'location_clock_out') dynamic locationClockOut,
      @JsonKey(name: 'nama_toko') String? namaToko,
      @JsonKey(name: 'nama_staff') String? namaStaff,
      @JsonKey(name: 'jam_kerja') String? jamKerja,
      @JsonKey(name: 'hari_libur') String? hariLibur,
      @JsonKey(name: 'mulai_kerja') DateTime? mulaiKerja,
      @JsonKey(name: 'range_clock_in') int? rangeClockIn,
      @JsonKey(name: 'range_clock_out') int? rangeClockOut,
      @JsonKey(name: 'note_clock_in') String? noteClockIn,
      @JsonKey(name: 'note_clock_out') String? noteClockOut});
}

/// @nodoc
class _$AttendanceModelCopyWithImpl<$Res, $Val extends AttendanceModel>
    implements $AttendanceModelCopyWith<$Res> {
  _$AttendanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? clockIn = freezed,
    Object? attachmentClockIn = freezed,
    Object? locationClockIn = freezed,
    Object? clockOut = freezed,
    Object? attachmentClockOut = freezed,
    Object? locationClockOut = freezed,
    Object? namaToko = freezed,
    Object? namaStaff = freezed,
    Object? jamKerja = freezed,
    Object? hariLibur = freezed,
    Object? mulaiKerja = freezed,
    Object? rangeClockIn = freezed,
    Object? rangeClockOut = freezed,
    Object? noteClockIn = freezed,
    Object? noteClockOut = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      clockIn: freezed == clockIn
          ? _value.clockIn
          : clockIn // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentClockIn: freezed == attachmentClockIn
          ? _value.attachmentClockIn
          : attachmentClockIn // ignore: cast_nullable_to_non_nullable
              as String?,
      locationClockIn: freezed == locationClockIn
          ? _value.locationClockIn
          : locationClockIn // ignore: cast_nullable_to_non_nullable
              as String?,
      clockOut: freezed == clockOut
          ? _value.clockOut
          : clockOut // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentClockOut: freezed == attachmentClockOut
          ? _value.attachmentClockOut
          : attachmentClockOut // ignore: cast_nullable_to_non_nullable
              as String?,
      locationClockOut: freezed == locationClockOut
          ? _value.locationClockOut
          : locationClockOut // ignore: cast_nullable_to_non_nullable
              as dynamic,
      namaToko: freezed == namaToko
          ? _value.namaToko
          : namaToko // ignore: cast_nullable_to_non_nullable
              as String?,
      namaStaff: freezed == namaStaff
          ? _value.namaStaff
          : namaStaff // ignore: cast_nullable_to_non_nullable
              as String?,
      jamKerja: freezed == jamKerja
          ? _value.jamKerja
          : jamKerja // ignore: cast_nullable_to_non_nullable
              as String?,
      hariLibur: freezed == hariLibur
          ? _value.hariLibur
          : hariLibur // ignore: cast_nullable_to_non_nullable
              as String?,
      mulaiKerja: freezed == mulaiKerja
          ? _value.mulaiKerja
          : mulaiKerja // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rangeClockIn: freezed == rangeClockIn
          ? _value.rangeClockIn
          : rangeClockIn // ignore: cast_nullable_to_non_nullable
              as int?,
      rangeClockOut: freezed == rangeClockOut
          ? _value.rangeClockOut
          : rangeClockOut // ignore: cast_nullable_to_non_nullable
              as int?,
      noteClockIn: freezed == noteClockIn
          ? _value.noteClockIn
          : noteClockIn // ignore: cast_nullable_to_non_nullable
              as String?,
      noteClockOut: freezed == noteClockOut
          ? _value.noteClockOut
          : noteClockOut // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceModelImplCopyWith<$Res>
    implements $AttendanceModelCopyWith<$Res> {
  factory _$$AttendanceModelImplCopyWith(_$AttendanceModelImpl value,
          $Res Function(_$AttendanceModelImpl) then) =
      __$$AttendanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'clock_in') String? clockIn,
      @JsonKey(name: 'attachment_clock_in') String? attachmentClockIn,
      @JsonKey(name: 'location_clock_in') String? locationClockIn,
      @JsonKey(name: 'clock_out') String? clockOut,
      @JsonKey(name: 'attachment_clock_out') String? attachmentClockOut,
      @JsonKey(name: 'location_clock_out') dynamic locationClockOut,
      @JsonKey(name: 'nama_toko') String? namaToko,
      @JsonKey(name: 'nama_staff') String? namaStaff,
      @JsonKey(name: 'jam_kerja') String? jamKerja,
      @JsonKey(name: 'hari_libur') String? hariLibur,
      @JsonKey(name: 'mulai_kerja') DateTime? mulaiKerja,
      @JsonKey(name: 'range_clock_in') int? rangeClockIn,
      @JsonKey(name: 'range_clock_out') int? rangeClockOut,
      @JsonKey(name: 'note_clock_in') String? noteClockIn,
      @JsonKey(name: 'note_clock_out') String? noteClockOut});
}

/// @nodoc
class __$$AttendanceModelImplCopyWithImpl<$Res>
    extends _$AttendanceModelCopyWithImpl<$Res, _$AttendanceModelImpl>
    implements _$$AttendanceModelImplCopyWith<$Res> {
  __$$AttendanceModelImplCopyWithImpl(
      _$AttendanceModelImpl _value, $Res Function(_$AttendanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? clockIn = freezed,
    Object? attachmentClockIn = freezed,
    Object? locationClockIn = freezed,
    Object? clockOut = freezed,
    Object? attachmentClockOut = freezed,
    Object? locationClockOut = freezed,
    Object? namaToko = freezed,
    Object? namaStaff = freezed,
    Object? jamKerja = freezed,
    Object? hariLibur = freezed,
    Object? mulaiKerja = freezed,
    Object? rangeClockIn = freezed,
    Object? rangeClockOut = freezed,
    Object? noteClockIn = freezed,
    Object? noteClockOut = freezed,
  }) {
    return _then(_$AttendanceModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      clockIn: freezed == clockIn
          ? _value.clockIn
          : clockIn // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentClockIn: freezed == attachmentClockIn
          ? _value.attachmentClockIn
          : attachmentClockIn // ignore: cast_nullable_to_non_nullable
              as String?,
      locationClockIn: freezed == locationClockIn
          ? _value.locationClockIn
          : locationClockIn // ignore: cast_nullable_to_non_nullable
              as String?,
      clockOut: freezed == clockOut
          ? _value.clockOut
          : clockOut // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentClockOut: freezed == attachmentClockOut
          ? _value.attachmentClockOut
          : attachmentClockOut // ignore: cast_nullable_to_non_nullable
              as String?,
      locationClockOut: freezed == locationClockOut
          ? _value.locationClockOut
          : locationClockOut // ignore: cast_nullable_to_non_nullable
              as dynamic,
      namaToko: freezed == namaToko
          ? _value.namaToko
          : namaToko // ignore: cast_nullable_to_non_nullable
              as String?,
      namaStaff: freezed == namaStaff
          ? _value.namaStaff
          : namaStaff // ignore: cast_nullable_to_non_nullable
              as String?,
      jamKerja: freezed == jamKerja
          ? _value.jamKerja
          : jamKerja // ignore: cast_nullable_to_non_nullable
              as String?,
      hariLibur: freezed == hariLibur
          ? _value.hariLibur
          : hariLibur // ignore: cast_nullable_to_non_nullable
              as String?,
      mulaiKerja: freezed == mulaiKerja
          ? _value.mulaiKerja
          : mulaiKerja // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rangeClockIn: freezed == rangeClockIn
          ? _value.rangeClockIn
          : rangeClockIn // ignore: cast_nullable_to_non_nullable
              as int?,
      rangeClockOut: freezed == rangeClockOut
          ? _value.rangeClockOut
          : rangeClockOut // ignore: cast_nullable_to_non_nullable
              as int?,
      noteClockIn: freezed == noteClockIn
          ? _value.noteClockIn
          : noteClockIn // ignore: cast_nullable_to_non_nullable
              as String?,
      noteClockOut: freezed == noteClockOut
          ? _value.noteClockOut
          : noteClockOut // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceModelImpl extends _AttendanceModel {
  const _$AttendanceModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'clock_in') this.clockIn,
      @JsonKey(name: 'attachment_clock_in') this.attachmentClockIn,
      @JsonKey(name: 'location_clock_in') this.locationClockIn,
      @JsonKey(name: 'clock_out') this.clockOut,
      @JsonKey(name: 'attachment_clock_out') this.attachmentClockOut,
      @JsonKey(name: 'location_clock_out') this.locationClockOut,
      @JsonKey(name: 'nama_toko') this.namaToko,
      @JsonKey(name: 'nama_staff') this.namaStaff,
      @JsonKey(name: 'jam_kerja') this.jamKerja,
      @JsonKey(name: 'hari_libur') this.hariLibur,
      @JsonKey(name: 'mulai_kerja') this.mulaiKerja,
      @JsonKey(name: 'range_clock_in') this.rangeClockIn,
      @JsonKey(name: 'range_clock_out') this.rangeClockOut,
      @JsonKey(name: 'note_clock_in') this.noteClockIn,
      @JsonKey(name: 'note_clock_out') this.noteClockOut})
      : super._();

  factory _$AttendanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'clock_in')
  final String? clockIn;
  @override
  @JsonKey(name: 'attachment_clock_in')
  final String? attachmentClockIn;
  @override
  @JsonKey(name: 'location_clock_in')
  final String? locationClockIn;
  @override
  @JsonKey(name: 'clock_out')
  final String? clockOut;
  @override
  @JsonKey(name: 'attachment_clock_out')
  final String? attachmentClockOut;
  @override
  @JsonKey(name: 'location_clock_out')
  final dynamic locationClockOut;
  @override
  @JsonKey(name: 'nama_toko')
  final String? namaToko;
  @override
  @JsonKey(name: 'nama_staff')
  final String? namaStaff;
  @override
  @JsonKey(name: 'jam_kerja')
  final String? jamKerja;
  @override
  @JsonKey(name: 'hari_libur')
  final String? hariLibur;
  @override
  @JsonKey(name: 'mulai_kerja')
  final DateTime? mulaiKerja;
  @override
  @JsonKey(name: 'range_clock_in')
  final int? rangeClockIn;
  @override
  @JsonKey(name: 'range_clock_out')
  final int? rangeClockOut;
  @override
  @JsonKey(name: 'note_clock_in')
  final String? noteClockIn;
  @override
  @JsonKey(name: 'note_clock_out')
  final String? noteClockOut;

  @override
  String toString() {
    return 'AttendanceModel(id: $id, userId: $userId, clockIn: $clockIn, attachmentClockIn: $attachmentClockIn, locationClockIn: $locationClockIn, clockOut: $clockOut, attachmentClockOut: $attachmentClockOut, locationClockOut: $locationClockOut, namaToko: $namaToko, namaStaff: $namaStaff, jamKerja: $jamKerja, hariLibur: $hariLibur, mulaiKerja: $mulaiKerja, rangeClockIn: $rangeClockIn, rangeClockOut: $rangeClockOut, noteClockIn: $noteClockIn, noteClockOut: $noteClockOut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.clockIn, clockIn) || other.clockIn == clockIn) &&
            (identical(other.attachmentClockIn, attachmentClockIn) ||
                other.attachmentClockIn == attachmentClockIn) &&
            (identical(other.locationClockIn, locationClockIn) ||
                other.locationClockIn == locationClockIn) &&
            (identical(other.clockOut, clockOut) ||
                other.clockOut == clockOut) &&
            (identical(other.attachmentClockOut, attachmentClockOut) ||
                other.attachmentClockOut == attachmentClockOut) &&
            const DeepCollectionEquality()
                .equals(other.locationClockOut, locationClockOut) &&
            (identical(other.namaToko, namaToko) ||
                other.namaToko == namaToko) &&
            (identical(other.namaStaff, namaStaff) ||
                other.namaStaff == namaStaff) &&
            (identical(other.jamKerja, jamKerja) ||
                other.jamKerja == jamKerja) &&
            (identical(other.hariLibur, hariLibur) ||
                other.hariLibur == hariLibur) &&
            (identical(other.mulaiKerja, mulaiKerja) ||
                other.mulaiKerja == mulaiKerja) &&
            (identical(other.rangeClockIn, rangeClockIn) ||
                other.rangeClockIn == rangeClockIn) &&
            (identical(other.rangeClockOut, rangeClockOut) ||
                other.rangeClockOut == rangeClockOut) &&
            (identical(other.noteClockIn, noteClockIn) ||
                other.noteClockIn == noteClockIn) &&
            (identical(other.noteClockOut, noteClockOut) ||
                other.noteClockOut == noteClockOut));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      clockIn,
      attachmentClockIn,
      locationClockIn,
      clockOut,
      attachmentClockOut,
      const DeepCollectionEquality().hash(locationClockOut),
      namaToko,
      namaStaff,
      jamKerja,
      hariLibur,
      mulaiKerja,
      rangeClockIn,
      rangeClockOut,
      noteClockIn,
      noteClockOut);

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceModelImplCopyWith<_$AttendanceModelImpl> get copyWith =>
      __$$AttendanceModelImplCopyWithImpl<_$AttendanceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceModelImplToJson(
      this,
    );
  }
}

abstract class _AttendanceModel extends AttendanceModel {
  const factory _AttendanceModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'clock_in') final String? clockIn,
      @JsonKey(name: 'attachment_clock_in') final String? attachmentClockIn,
      @JsonKey(name: 'location_clock_in') final String? locationClockIn,
      @JsonKey(name: 'clock_out') final String? clockOut,
      @JsonKey(name: 'attachment_clock_out') final String? attachmentClockOut,
      @JsonKey(name: 'location_clock_out') final dynamic locationClockOut,
      @JsonKey(name: 'nama_toko') final String? namaToko,
      @JsonKey(name: 'nama_staff') final String? namaStaff,
      @JsonKey(name: 'jam_kerja') final String? jamKerja,
      @JsonKey(name: 'hari_libur') final String? hariLibur,
      @JsonKey(name: 'mulai_kerja') final DateTime? mulaiKerja,
      @JsonKey(name: 'range_clock_in') final int? rangeClockIn,
      @JsonKey(name: 'range_clock_out') final int? rangeClockOut,
      @JsonKey(name: 'note_clock_in') final String? noteClockIn,
      @JsonKey(name: 'note_clock_out')
      final String? noteClockOut}) = _$AttendanceModelImpl;
  const _AttendanceModel._() : super._();

  factory _AttendanceModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'clock_in')
  String? get clockIn;
  @override
  @JsonKey(name: 'attachment_clock_in')
  String? get attachmentClockIn;
  @override
  @JsonKey(name: 'location_clock_in')
  String? get locationClockIn;
  @override
  @JsonKey(name: 'clock_out')
  String? get clockOut;
  @override
  @JsonKey(name: 'attachment_clock_out')
  String? get attachmentClockOut;
  @override
  @JsonKey(name: 'location_clock_out')
  dynamic get locationClockOut;
  @override
  @JsonKey(name: 'nama_toko')
  String? get namaToko;
  @override
  @JsonKey(name: 'nama_staff')
  String? get namaStaff;
  @override
  @JsonKey(name: 'jam_kerja')
  String? get jamKerja;
  @override
  @JsonKey(name: 'hari_libur')
  String? get hariLibur;
  @override
  @JsonKey(name: 'mulai_kerja')
  DateTime? get mulaiKerja;
  @override
  @JsonKey(name: 'range_clock_in')
  int? get rangeClockIn;
  @override
  @JsonKey(name: 'range_clock_out')
  int? get rangeClockOut;
  @override
  @JsonKey(name: 'note_clock_in')
  String? get noteClockIn;
  @override
  @JsonKey(name: 'note_clock_out')
  String? get noteClockOut;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceModelImplCopyWith<_$AttendanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
