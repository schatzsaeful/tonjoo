import 'dart:ui';

import 'package:hive_flutter/adapters.dart';

abstract class BaseDao<T> {
  late final LazyBox<T> _box;

  String boxName();

  BaseDao() {
    _box = Hive.lazyBox<T>(boxName());
  }

  Future<T?> getValue(Object key, {T? defaultValue}) async =>
      await _box.get(key, defaultValue: defaultValue);

  Future<void> setValue(Object key, T value) async =>
      await _box.put(key, value);

  Future<void> deleteValue(Object key) async => await _box.delete(key);

  Future<void> clearAll() async => await _box.clear();

  void listenValueChange(VoidCallback? callback) {
    if (callback != null) {
      _box.listenable().addListener(callback);
    }
  }
}
