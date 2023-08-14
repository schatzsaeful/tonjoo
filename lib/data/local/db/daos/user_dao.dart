import '../entities/users/user_entity.dart';
import 'base_dao.dart';

class UserDao extends BaseDao<List<UserEntity> > {
  static const String name = 'box_users_list';
  static const String _keyUser = 'user_list';

  @override
  String boxName() {
    return name;
  }

  Future<List<UserEntity>?> getUserList() async {
    return await getValue(_keyUser);
  }

  Future<void> saveUserList(List<UserEntity> entity) async {
    await setValue(_keyUser, entity);
  }
}
