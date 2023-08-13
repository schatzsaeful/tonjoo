import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'username')
  String? username;

  @JsonKey(name: 'last_name')
  String? lastName;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'gender')
  String? gender;

  @JsonKey(name: 'avatar')
  String? avatar;

  UserResponse({this.id, this.username, this.lastName, this.email, this.gender, this.avatar});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
