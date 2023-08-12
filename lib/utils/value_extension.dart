extension StringExtension on String {
  String? nullIfEmpty() {
    if (isEmpty) return null;
    return this;
  }

  bool isValidEmail() {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }

  bool isCharacterOnly() {
    return RegExp(r"^[a-zA-Z.!#$%&'*+-/=?^_`{|}~@]+(\s[a-zA-Z]+)?$").hasMatch(this);
  }
}

extension IntExtension on int {
  int? nullIfZero() {
    if (this == 0) return null;
    return this;
  }
}

