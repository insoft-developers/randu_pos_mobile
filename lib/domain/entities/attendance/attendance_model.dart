// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_model.freezed.dart';
part 'attendance_model.g.dart';

AttendanceModel attendanceModelFromJson(String str) =>
    AttendanceModel.fromJson(json.decode(str));

String attendanceModelToJson(AttendanceModel data) =>
    json.encode(data.toJson());

@freezed
class AttendanceModel with _$AttendanceModel {
  const AttendanceModel._();
  const factory AttendanceModel({
    @JsonKey(name: 'id') int? id,
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
    @JsonKey(name: 'note_clock_out') String? noteClockOut,
  }) = _AttendanceModel;

  bool get haveBeenIn => clockIn != null && clockIn!.isNotEmpty;
  bool get haveBeenOut => clockOut != null && clockOut!.isNotEmpty;
  bool get haveBeenCompleted => haveBeenIn && haveBeenOut;
  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);
}
