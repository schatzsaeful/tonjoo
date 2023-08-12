import 'package:json_annotation/json_annotation.dart';

part 'base_id_response.g.dart';

/// Base Id, response wrapper
///
/// {
///   "id": <string>,
///   "data": <T>
/// }
@JsonSerializable(genericArgumentFactories: true)
class BaseIdResponse<T> {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'data')
  T? data;

  BaseIdResponse({this.id, this.data});

  factory BaseIdResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseIdResponseFromJson(json, fromJsonT);
}
