import 'package:either_dart/either.dart';

import '../../models/common/common_error.dart';
import '../../../data/repositories/example_repository.dart';
import '../../mapper/example_mapper.dart';
import '../../models/example/todo_dto.dart';

class GetTodoListUseCase {
  final ExampleRepository _repository;

  GetTodoListUseCase(this._repository);

  Future<Either<CommonError, List<ExampleTodoDto>>> execute() {
    return _repository.getTodoList().mapRight(
          (responses) => ExampleMapper.transformToTodoListDto(responses),
        );
  }
}
