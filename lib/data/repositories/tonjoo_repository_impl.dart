import 'package:either_dart/either.dart';
import 'package:tonjoo/data/repositories/tonjoo_repository.dart';

import '../../utils/future_util.dart';
import '../../domain/models/common/common_error.dart';
import '../local/db/daos/user_dao.dart';
import '../local/db/entities/users/user_entity.dart';
import '../network/responses/tonjoo/user_response.dart';
import '../network/services/tonjoo_service.dart';

class TonjooRepositoryImpl extends TonjooRepository {
  final TonjooService _service;
  final UserDao _dao;

  TonjooRepositoryImpl(this._service, this._dao);

  @override
  Future<Either<CommonError, List<UserResponse>>> getUserList() =>
      callOrError(() {
        return _service.getUserList();
      });

  @override
  Future<void> saveLocalListUser(List<UserEntity> entity) {
    return _dao.saveUserList(entity);
  }

  @override
  Future<List<UserEntity>?> getLocalListUser() {

    print("afsdqrwe123: getLocalListUser");
    return _dao.getUserList();
  }
}
