// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonErrorResponse _$CommonErrorResponseFromJson(Map<String, dynamic> json) =>
    CommonErrorResponse(
      errors: json['errors'] == null
          ? null
          : CommonErrorMessage.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommonErrorResponseToJson(
        CommonErrorResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };

CommonErrorMessage _$CommonErrorMessageFromJson(Map<String, dynamic> json) =>
    CommonErrorMessage(
      message: json['message'] as String?,
      detailErrorMessage: json['detail'] == null
          ? null
          : DetailErrorMessage.fromJson(json['detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommonErrorMessageToJson(CommonErrorMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'detail': instance.detailErrorMessage,
    };

DetailErrorMessage _$DetailErrorMessageFromJson(Map<String, dynamic> json) =>
    DetailErrorMessage(
      price: json['price'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$DetailErrorMessageToJson(DetailErrorMessage instance) =>
    <String, dynamic>{
      'price': instance.price,
      'date': instance.date,
    };
