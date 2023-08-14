import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: 'success')
  int? success;

  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'user_id')
  int? userId;

  AuthResponse({this.success, this.token, this.userId});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
