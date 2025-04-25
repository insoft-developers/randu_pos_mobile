import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_response.freezed.dart';
part 'general_response.g.dart';

@Freezed(genericArgumentFactories: true)
class GeneralResponse<T> with _$GeneralResponse<T> {
  const factory GeneralResponse({
    required bool status,
    String? message,
    T? data,
  }) = _GeneralResponse<T>;

  factory GeneralResponse.fromJsonWithData(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    // Extract the data field and use fromJsonT to parse it if present
    final data = json['data'] != null ? fromJsonT(json['data']) : null;
    return GeneralResponse<T>(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: data,
    );
  }

  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralResponseFromJson(json, (value) => value as T);
}
