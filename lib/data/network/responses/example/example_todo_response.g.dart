// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_todo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleTodoResponse _$ExampleTodoResponseFromJson(Map<String, dynamic> json) =>
    ExampleTodoResponse(
      userId: json['user_id'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$ExampleTodoResponseToJson(
        ExampleTodoResponse instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
