import 'package:get_storage/get_storage.dart';

import '../../../app_constant.dart';
import '../../../utils/type_defs.dart';

class AppPreferences {
  static StorageFactory get _factory => () => GetStorage(AppConstant.storageKey);

  /// Preferences Keys
  static const String _keyToken = 'token';

  /// Preferences
  final ReadWriteValue<String> token = ReadWriteValue(_keyToken, '', _factory);

  /// Stream Value
  void listenTokenChange(AppPreferenceListener callback) {
    _factory().listenKey(_keyToken, callback);
  }
}