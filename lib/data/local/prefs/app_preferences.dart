import 'package:get_storage/get_storage.dart';

import '../../../app_constant.dart';
import '../../../utils/type_defs.dart';

class AppPreferences {
  static StorageFactory get _factory => () => GetStorage(AppConstant.storageKey);

  /// Preferences Keys
  static const String _keyUid = 'uid';

  /// Preferences
  final ReadWriteValue<String> uid = ReadWriteValue(_keyUid, '', _factory);

  /// Stream Value
  void listenUidChange(AppPreferenceListener callback) {
    _factory().listenKey(_keyUid, callback);
  }
}