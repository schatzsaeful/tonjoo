import 'dart:async';

import 'package:either_dart/either.dart';
import '../../domain/models/common/common_error.dart';
import '../network/responses/example/example_todo_response.dart';

abstract class ExampleRepository {
  Future<Either<CommonError, List<ExampleTodoResponse>>> getTodoList();
}
