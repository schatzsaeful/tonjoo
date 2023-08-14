import 'package:either_dart/either.dart';

import '../../../data/network/requests/auth_request.dart';
import '../../../data/repositories/tonjoo_repository.dart';
import '../../mapper/tonjoo_mapper.dart';
import '../../models/common/common_error.dart';
import '../../models/tonjoo/auth_dto.dart';

class PostLoginUseCase {
  final TonjooRepository _repository;

  PostLoginUseCase(this._repository);

  Future<Either<CommonError, AuthDto>> execute(AuthRequest request) {
    return _repository.postLogin(request).mapRight(
          (responses) => UserMapper.transformToAuthDto(responses),
    );
  }
}
