// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceModelImpl _$$AttendanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceModelImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      clockIn: json['clock_in'] as String?,
      attachmentClockIn: json['attachment_clock_in'] as String?,
      locationClockIn: json['location_clock_in'] as String?,
      clockOut: json['clock_out'] as String?,
      attachmentClockOut: json['attachment_clock_out'] as String?,
      locationClockOut: json['location_clock_out'],
      namaToko: json['nama_toko'] as String?,
      namaStaff: json['nama_staff'] as String?,
      jamKerja: json['jam_kerja'] as String?,
      hariLibur: json['hari_libur'] as String?,
      mulaiKerja: json['mulai_kerja'] == null
          ? null
          : DateTime.parse(json['mulai_kerja'] as String),
      rangeClockIn: (json['range_clock_in'] as num?)?.toInt(),
      rangeClockOut: (json['range_clock_out'] as num?)?.toInt(),
      noteClockIn: json['note_clock_in'] as String?,
      noteClockOut: json['note_clock_out'] as String?,
    );

Map<String, dynamic> _$$AttendanceModelImplToJson(
        _$AttendanceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'clock_in': instance.clockIn,
      'attachment_clock_in': instance.attachmentClockIn,
      'location_clock_in': instance.locationClockIn,
      'clock_out': instance.clockOut,
      'attachment_clock_out': instance.attachmentClockOut,
      'location_clock_out': instance.locationClockOut,
      'nama_toko': instance.namaToko,
      'nama_staff': instance.namaStaff,
      'jam_kerja': instance.jamKerja,
      'hari_libur': instance.hariLibur,
      'mulai_kerja': instance.mulaiKerja?.toIso8601String(),
      'range_clock_in': instance.rangeClockIn,
      'range_clock_out': instance.rangeClockOut,
      'note_clock_in': instance.noteClockIn,
      'note_clock_out': instance.noteClockOut,
    };
