import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../responses/tonjoo/user_response.dart';

part 'tonjoo_service.g.dart';

@RestApi()
abstract class TonjooService {
  factory TonjooService(Dio dio) => _TonjooService(dio);

  @GET('/users')
  Future<List<UserResponse>> getUserList();
}
