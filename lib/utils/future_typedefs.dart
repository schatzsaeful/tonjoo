import 'package:either_dart/either.dart';

import '../domain/models/common/common_error.dart';

typedef FutureOrError<T> = Future<Either<CommonError, T>>;
