import '../../data/network/responses/example/example_todo_response.dart';
import '../models/example/todo_dto.dart';

class ExampleMapper {
  static List<ExampleTodoDto> transformToTodoListDto(
    List<ExampleTodoResponse> responses,
  ) {
    return responses
        .map((response) => ExampleTodoDto(
              userId: response.userId ?? 0,
              id: response.id ?? 0,
              title: response.title ?? '',
              completed: response.completed ?? false,
            ))
        .toList();
  }
}
