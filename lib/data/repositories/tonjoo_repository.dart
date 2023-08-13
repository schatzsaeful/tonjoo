import 'dart:async';

import 'package:either_dart/either.dart';
import '../../domain/models/common/common_error.dart';
import '../network/responses/tonjoo/user_response.dart';

abstract class TonjooRepository {
  Future<Either<CommonError, List<UserResponse>>> getUserList();
}
