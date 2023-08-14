import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';

import '../requests/auth_request.dart';
import '../responses/auth/auth_response.dart';
import '../responses/user/user_response.dart';

part 'tonjoo_service.g.dart';

@RestApi()
abstract class TonjooService {
  factory TonjooService(Dio dio) => _TonjooService(dio);

  @GET('/users')
  Future<List<UserResponse>> getUserList();

  @POST('/login')
  Future<AuthResponse> postLogin(@Body() AuthRequest request);
}
