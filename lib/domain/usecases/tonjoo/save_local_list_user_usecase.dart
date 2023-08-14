import 'package:tonjoo/data/repositories/tonjoo_repository.dart';

import '../../mapper/tonjoo_mapper.dart';
import '../../models/tonjoo/user_dto.dart';

class SaveLocalUserUseCase {
  final TonjooRepository _repository;

  SaveLocalUserUseCase(this._repository);

  Future<void> execute(List<UserDto> dto) {
    var entity = UserMapper.transformToUserListEntity(dto ?? []);

    return _repository.saveLocalListUser(entity);
  }
}
