import 'package:json_annotation/json_annotation.dart';

part 'common_error_response.g.dart';

@JsonSerializable()
class CommonErrorResponse {
  @JsonKey(name: 'errors')
  CommonErrorMessage? errors;

  CommonErrorResponse({this.errors});

  factory CommonErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$CommonErrorResponseFromJson(json);
}

@JsonSerializable()
class CommonErrorMessage {
  @JsonKey(name: 'message')
  String? message;
  CommonErrorMessage({this.message});

  factory CommonErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$CommonErrorMessageFromJson(json);
}