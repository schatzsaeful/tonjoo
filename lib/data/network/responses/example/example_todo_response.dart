import 'package:json_annotation/json_annotation.dart';

part 'example_todo_response.g.dart';

@JsonSerializable()
class ExampleTodoResponse {
  @JsonKey(name: 'user_id')
  int? userId;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'completed')
  bool? completed;

  ExampleTodoResponse({this.userId, this.id, this.title, this.completed});

  factory ExampleTodoResponse.fromJson(Map<String, dynamic> json) =>
      _$ExampleTodoResponseFromJson(json);
}
