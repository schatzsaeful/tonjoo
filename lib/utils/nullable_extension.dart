extension NullableString on String? {
  String orEmpty() {
    return this ?? '';
  }

  bool isNullOrEmpty() {
    return this == null || this == '';
  }
}

extension NullableInt on int? {
  int orZero() {
    return this ?? 0;
  }

  bool isNullOrZero() {
    return this == null || this == 0;
  }
}

extension NullableList<T> on List<T>? {
  List<T> orEmpty() {
    return this ?? <T>[];
  }
}

extension NullableBoolean on bool? {
  bool orFalse() {
    return this ?? false;
  }
}

extension ListExt<T> on List<T> {
  T? tryGet(int idx) {
    if (idx < 0 || idx >= length) return null;
    return this[idx];
  }
}
