import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tonjoo/utils/nullable_extension.dart';

class WidgetUtil {
  static void showCommonToast(String? message) {
    Fluttertoast.showToast(
      msg: message.orEmpty(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
    );
  }
}
