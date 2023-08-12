import 'package:hive_flutter/hive_flutter.dart';

import 'daos/user_dao.dart';
import 'entities/users/user_entity.dart';

class AppDatabase {
  static Future<void> initAppDatabase() async {
    await Hive.initFlutter();
    _registerAdapters();

    /// Open User boxes
    /// use <dynamic> if it used to store dynamic key value pairs
    await Hive.openLazyBox<UserEntity>(UserDao.name);
  }

  static void _registerAdapters() {
    Hive.registerAdapter(UserEntityAdapter());
  }
}
