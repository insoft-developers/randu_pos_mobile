import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class AttendanceParam {
  final String? type;
  final XFile? attachment;
  final String? location;

  AttendanceParam({
    this.type,
    this.attachment,
    this.location,
  });

  /// Generates a copy of the current instance with the option to modify fields.
  AttendanceParam copyWith({
    String? type,
    XFile? attachment,
    String? location,
  }) {
    return AttendanceParam(
      type: type ?? this.type,
      attachment: attachment ?? this.attachment,
      location: location ?? this.location,
    );
  }

  /// Converts the object to a FormData map for file upload.
  Future<FormData> toFormData() async {
    Map<String, dynamic> map = {
      'type': type,
      'location': location,
    };

    if (attachment != null) {
      map['attachment'] = await MultipartFile.fromFile(
        attachment!.path,
        filename: attachment!.name,
      );
    }

    return FormData.fromMap(map);
  }

  /// Creates an instance from a JSON map.
  factory AttendanceParam.fromJson(Map<String, dynamic> json) {
    return AttendanceParam(
      type: json['type'] as String?,
      attachment: json['attachment'] != null ? XFile(json['attachment']) : null,
      location: json['location'] as String?,
    );
  }
}
