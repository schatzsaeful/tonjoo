import 'package:either_dart/either.dart';

import '../../utils/future_util.dart';
import '../../domain/models/common/common_error.dart';
import '../network/responses/example/example_todo_response.dart';
import '../network/services/example_service.dart';
import 'example_repository.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  final ExampleService _service;

  ExampleRepositoryImpl(this._service);

  @override
  Future<Either<CommonError, List<ExampleTodoResponse>>> getTodoList() =>
      callOrError(() {
        return _service.getTodoList();
      });
}
