import 'package:tonjoo/data/local/db/entities/users/user_entity.dart';
import 'package:tonjoo/data/network/responses/auth/auth_response.dart';
import 'package:tonjoo/domain/models/tonjoo/auth_dto.dart';

import '../../data/network/responses/user/user_response.dart';
import '../models/tonjoo/user_dto.dart';

class UserMapper {
  static List<UserDto> transformToUserListDto(
      List<UserResponse> responses,
      ) {
    return responses.map((response) =>
        UserDto(
          id: response.id ?? '',
          username: response.username ?? '',
          lastName: response.lastName ?? '',
          email: response.email ?? '',
          gender: response.gender ?? '',
          avatar: response.avatar ?? '',
        )
    ).toList();
  }

  static AuthDto transformToAuthDto(
      AuthResponse response,
      ) {
    return AuthDto(
      success: response.success ?? 0,
      token: response.token ?? '',
      userId: response.userId ?? 0,
    );
  }

  static List<UserDto> transformToLocalUserListDto(
      List<UserEntity> responses,
      ) {
    return responses.map((response) =>
        UserDto(
          id: response.id ?? '',
          username: response.username ?? '',
          lastName: response.lastName ?? '',
          email: response.email ?? '',
          gender: response.gender ?? '',
          avatar: response.avatar ?? '',
        )
    ).toList();
  }

  static List<UserEntity> transformToUserListEntity(
      List<UserDto> responses,
      ) {
    return responses.map((response) =>
        UserEntity(
          id: response.id,
          username: response.username,
          lastName: response.lastName,
          email: response.email,
          gender: response.gender,
          avatar: response.avatar,
        )
    ).toList();
  }
}
