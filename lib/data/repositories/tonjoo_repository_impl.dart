import 'package:either_dart/either.dart';
import 'package:tonjoo/data/repositories/tonjoo_repository.dart';

import '../../utils/future_util.dart';
import '../../domain/models/common/common_error.dart';
import '../network/responses/tonjoo/user_response.dart';
import '../network/services/tonjoo_service.dart';

class TonjooRepositoryImpl extends TonjooRepository {
  final TonjooService _service;

  TonjooRepositoryImpl(this._service);

  @override
  Future<Either<CommonError, List<UserResponse>>> getUserList() =>
      callOrError(() {
        return _service.getUserList();
      });
}
