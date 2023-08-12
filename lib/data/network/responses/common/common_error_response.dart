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
  @JsonKey(name: 'detail')
  DetailErrorMessage? detailErrorMessage;
  CommonErrorMessage({this.message,this.detailErrorMessage});

  factory CommonErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$CommonErrorMessageFromJson(json);
}

@JsonSerializable()
class DetailErrorMessage{
  @JsonKey(name: 'price')
  String? price;
  @JsonKey(name: 'date')
  String? date;
  DetailErrorMessage({this.price,this.date});

  factory DetailErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$DetailErrorMessageFromJson(json);
}
