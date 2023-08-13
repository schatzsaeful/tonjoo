import 'package:either_dart/either.dart';

import '../../../data/repositories/tonjoo_repository.dart';
import '../../mapper/tonjoo_mapper.dart';
import '../../models/common/common_error.dart';
import '../../models/tonjoo/tonjoo_dto.dart';

class GetUserListUseCase {
  final TonjooRepository _repository;

  GetUserListUseCase(this._repository);

  Future<Either<CommonError, List<UserDto>>> execute() {
    return _repository.getUserList().mapRight(
          (responses) => UserMapper.transformToTodoListDto(responses),
        );
  }
}
