import '../entities/users/user_entity.dart';
import 'base_dao.dart';

class UserDao extends BaseDao<UserEntity> {
  static const String name = 'box_users';
  static const String _keyUser = 'user';

  @override
  String boxName() {
    return name;
  }

  Future<UserEntity?> getUser() async {
    return await getValue(_keyUser);
  }

  Future<void> saveUser(UserEntity entity) async {
    await setValue(_keyUser, entity);
  }
}
