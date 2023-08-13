import '../../data/network/responses/tonjoo/user_response.dart';
import '../models/tonjoo/tonjoo_dto.dart';

class UserMapper {
  static List<UserDto> transformToTodoListDto(
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
}
