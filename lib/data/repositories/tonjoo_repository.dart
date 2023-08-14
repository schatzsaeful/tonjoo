import 'dart:async';

import 'package:either_dart/either.dart';
import '../../domain/models/common/common_error.dart';
import '../local/db/entities/users/user_entity.dart';
import '../network/responses/tonjoo/user_response.dart';

abstract class TonjooRepository {
  Future<Either<CommonError, List<UserResponse>>> getUserList();

  Future<void> saveLocalListUser(List<UserEntity> entity);

  Future<List<UserEntity>?> getLocalListUser();
}
