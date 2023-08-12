import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../responses/example/example_todo_response.dart';

part 'example_service.g.dart';

@RestApi()
abstract class ExampleService {
  factory ExampleService(Dio dio) => _ExampleService(dio);

  @GET('/todos')
  Future<List<ExampleTodoResponse>> getTodoList();
}
