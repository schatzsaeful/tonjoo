import 'package:tonjoo/data/repositories/tonjoo_repository.dart';
import 'package:tonjoo/utils/widget_util.dart';

import '../../mapper/tonjoo_mapper.dart';
import '../../models/tonjoo/user_dto.dart';

class GetLocalUserUseCase {
  final TonjooRepository _repository;

  GetLocalUserUseCase(this._repository);

  Future<List<UserDto>> execute() {
    try {
      return _repository.getLocalListUser().then(
              (entity) => UserMapper.transformToLocalUserListDto(entity ?? [])
      );
    } catch (e) {
      WidgetUtil.showCommonToast(e.toString());
      return _repository.getLocalListUser().then(
              (entity) => UserMapper.transformToLocalUserListDto(entity ?? [])
      );
    }
  }
}
