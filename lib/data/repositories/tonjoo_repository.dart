import 'dart:async';

import 'package:either_dart/either.dart';
import '../../domain/models/common/common_error.dart';
import '../local/db/entities/users/user_entity.dart';
import '../network/requests/auth_request.dart';
import '../network/responses/auth/auth_response.dart';
import '../network/responses/user/user_response.dart';

abstract class TonjooRepository {
  Future<Either<CommonError, List<UserResponse>>> getUserList();

  Future<Either<CommonError, AuthResponse>> postLogin(AuthRequest request);

  Future<void> saveLocalListUser(List<UserEntity> entity);

  Future<List<UserEntity>?> getLocalListUser();
}
