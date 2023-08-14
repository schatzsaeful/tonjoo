import 'package:json_annotation/json_annotation.dart';

part 'auth_request.g.dart';

@JsonSerializable()
class AuthRequest {
  @JsonKey(name: 'username')
  String? username;

  @JsonKey(name: 'password')
  String? password;

  AuthRequest({this.username, this.password});

  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
